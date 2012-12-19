# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git github mercurial python pip debian)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

setopt No_Beep

export PATH=$PATH:~/sat/bin

# gopaths 
export GOROOT=~/go
export GOPATH=$GOROOT:~/code/go
export GOBIN=$GOROOT/bin
export GOARCH=386
export GOOS=linux
export PATH=$PATH:$GOROOT/bin
export GOMAXPROCS=2

#fasd
export PATH=$PATH:$HOME/dotfiles/fasd
eval "$(fasd --init posix-alias zsh-hook zsh-ccomp zsh-ccomp-install zsh-wcomp zsh-wcomp-install)"
alias v="f -e gvim"
alias m="f -e mplayer"
alias o="a -e xdg-open"

# overwrite original source with gofmt
alias gofmt="gofmt -w"

#setup t
alias t="python ~/dotfiles/t/t.py --task-dir ~/Dropbox/tasks --list tasks"

#deal with dumbass vim bug
#alias gvim="gvim -f"
alias nautilus="nautilus ."
#other aliases
alias open="xdg-open"
alias mm="freemind ~/Dropbox/Mindmaps/Larry.mm &"
