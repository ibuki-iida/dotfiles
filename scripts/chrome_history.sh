#!/usr/bin/env bash

# ChromeのDBの内容をcsvで一時保存するパス
PATH_CHROME_HISTORY=/Users/ibuki/Tool/chrome_his/chrome_history.csv

function export_chrome_history() {
    local USER=`whoami`
    # Chromeを開いているとdbがロックされるのでコピーしたものを参照する
    cp ~/Library/Application\ Support/Google/Chrome/Default/History ~/

    local SQL="
    SELECT
        url,
        title,
        DATETIME(last_visit_time / 1000000 + (strftime('%s', '1601-01-01') ), 'unixepoch', '+9 hours') AS date
    FROM
        urls
    GROUP BY
        title
    ORDER BY
        date DESC
    LIMIT
        10000
    ;
    "
    # そのままSQLを流すとエラーが出るので改行を消す
    local SQL=$(echo "${SQL}" | tr '\n' ' ')

    # コマンドで参照できるようにDBの内容をcsvに書き出す
    expect -c "
        spawn sqlite3 /Users/$USER/History
        expect \">\"
        send \".mode csv\r\"
        expect \">\"
        send \".output $PATH_CHROME_HISTORY\r\"
        expect \">\"
        send \"$SQL\r\"
        expect \">\"
    " >/dev/null
}

function show_chrome_history() {
    local filter=${1:-""}
    local chrome_history=$(cat $PATH_CHROME_HISTORY | tr -d '"')

    # 見栄えを良くするためURLは表示しない
    local select_history=$(
        echo "$chrome_history" \
        | grep "$filter" \
        | awk -F ',' '!a[$2]++' \
        | awk -F ',' '{print $3"\t"$2}' \
        | tr -d "\r" \
        | fzf \
        | tr -d "\n"
    )

    # URL取得処理
    if [ -n "$select_history" ]; then
        # URLを取得する際タイトルでgrepするため
        local title=`echo "$select_history" | awk -F '\t' '{print $1}'`
        local url=`echo "$chrome_history" | grep "$title"  | head -n 1 |awk -F ',' '{print $1}'`
        open $url
    fi
}

function show_by_date() {
    local chrome_history=$(cat $PATH_CHROME_HISTORY | tr -d '"')
    # 表示したい日付を選択する
    local select_date=$(
        echo "$chrome_history" \
        | awk -F ',' '{print $3}' \
        | awk -F ' ' '{print $1}' \
        | grep -P '^[0-9]{4}-.*' \
        | sort -ur \
        | tr -d "\r" \
        | xargs -I {} gdate '+%Y-%m-%d (%a)' -d {} \
        | fzf \
        | awk -F '(' '{print $1}'
    )
    show_chrome_history $select_date
}

function main() {
    export_chrome_history
    if [ "$1" = '-d' ]; then
        show_by_date
    else
        show_chrome_history $1
    fi
}
main $1