# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="myYs"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
export UPDATE_ZSH_DAYS=7

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
plugins=(git hg tmux catimg nyan zsh-syntax-highlighting colored-man colorize
cp extract fasd gitignore themes adb)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/bin/core_perl:$HOME/.gem/ruby/2.1.0/bin"
export PATH=$PATH:$HOME/.gem/ruby/2.2.0/bin
export PATH=$PATH:$HOME/.cabal/bin
export PATH=$PATH:$HOME/.go/bin
export PATH=$PATH:$HOME/Apps/git-cinnabar
export PATH=/home/mozilla-tpe/.linuxbrew/bin:$PATH
export PATH=/home/mozilla-tpe/.linuxbrew/sbin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# My settings
export PKG_CONFIG_PATH=/usr/lib/x86_64-linux-gnu/pkgconfig
export TERM=xterm-256color
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
export EDITOR=nvim
export HAXE_STD_PATH=/opt/haxe/std	#for haxe
export GCC_COLORS=1
source ~/Programs/emsdk_portable/emsdk_env.sh > /dev/null
#export GOROOT=~/.go

# My startup action
alias grep='grep --color=always'
alias ag='ag --color'
alias packerq='packer --noedit'
alias uz='source ~/.zshrc'
alias cat='ccat'
alias mtr='mtr -t'
alias vim='nvim'
alias vi='nvim'

# My GTD alias
alias addin='task add +in'
alias inbox='task +in'

toilet --metal -f future "Welcom to KK's world"

# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/home/mozilla-tpe/Programs/cocos2d-x-3.8.1/cocos2d-x-3.8.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/home/mozilla-tpe/Programs/cocos2d-x-3.8.1/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/share/ant/bin
export PATH=$ANT_ROOT:$PATH
