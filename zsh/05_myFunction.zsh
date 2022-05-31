# ==============================#
#             plugins           #
# ==============================#

# ---------------------------------------------------------
# plugin list
# ---------------------------------------------------------
function gitmake() {
    gicd;
    gipull;
    gicm;
}

function gidevpull() {
	gicd;
	gipull;
	gicc;
	gideme;
}

function dcotall() {
    cot ~/dotfiles/.zshrc
    cot ~/dotfiles/zsh/01_config.zsh
    cot ~/dotfiles/zsh/02_aliases.zsh
    cot ~/dotfiles/zsh/03_setopt.zsh
    cot ~/dotfiles/zsh/04_function.zsh
    cot ~/dotfiles/zsh/05_Myfunction.zsh
}

function killbra() {
	local KILLBRANCH=`git rev-parse --abbrev-ref HEAD`
	gicd
	git branch -d $KILLBRANCH
	git branch
}


function grev(){
  local PRNUM=$1
  gicb;
  git fetch origin pull/${PRNUM}/head:PR-${PRNUM};
  git checkout PR-${PRNUM};
}

function twdmp(){
	local USID=$1
	alltweets ${USID} > /Users/ibuki/sfiles/twidmp/${USID}_$(date +"%Y%m%d").json
	cd /Users/ibuki/sfiles/twidmp/
}

# ---------------------------------------------------------
# OTHERS
# ---------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh