# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="ys"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=3

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git hg tmux catimg colored-man colorize cp
         extract fasd gitignore zsh_reload rustup themes
         zsh-autosuggestions yarn zsh_reload stack
         )

source $ZSH/oh-my-zsh.sh

# External plugings
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

fpath+="~/.zfunc"
compinit

# My startup action
alias grep='grep --color=always'
alias ag='ag --color'
alias packerq='packer --noedit'
alias ez='vim ~/.zshrc'
alias mtr='mtr -t'
alias vim='nvim'
alias vi='nvim'
alias ec='emacsclient -a emacs -n -c'
alias nyancha='mocha --reporter nyan'

# exa aliases
if which exa >> /dev/null; then
    alias ls='exa'
    alias l='exa -lhgua'
    alias la='exa -lhgua'
    alias ll='exa -lhgu'
fi

rustToggleBt() {
    if [ "$RUST_BACKTRACE" -eq "1" ]; then
        export RUST_BACKTRACE=0
        echo "rust backtrace is [off]"
    else
        export RUST_BACKTRACE=1
        echo "rust backtrace is [on]"
    fi
}

export MYVIMRC=~/.vimrc

# GAMES
alias iidx="$HOME/Programs/angolmois/normal.sh"

# dpi
export GDK_DPI_SCALE=1.2

# Welcom message
toilet --metal -f future -t "Welcom to KK's world"
fortune -s | cowsay
