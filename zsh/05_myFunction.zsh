# ==============================#
#             plugins           #
# ==============================#

# ---------------------------------------------------------
# plugin list
# ---------------------------------------------------------
function gitmake() {
    gdev;
    gipull;S
    gicm;
}

function gdevpull() {
	gdev;
	gipull;
	gic;
	gdevme;
}

function dcotall() {
    cot ~/dotfiles/.zshrc
    cot ~/dotfiles/zsh/01_config.zsh
    cot ~/dotfiles/zsh/02_aliases.zsh
    cot ~/dotfiles/zsh/03_setopt.zsh
    cot ~/dotfiles/zsh/04_function.zsh
    cot ~/dotfiles/zsh/05_Myfunction.zsh
}

function runadmin() {
	cd /Users/ibuki/AndroidStudioProjects/PJ/medicolle/management
	echo "run server"
	meke run server
	echo "run server admin"
	make run server admin
	echo "firebase emulators:start"
	firebase emulators:start
	echo ""
	make test data
}




# ---------------------------------------------------------
# OTHERS
# ---------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh