#GOPATHS
set -x GOROOT $HOME/go 
set -x PATH $PATH $GOROOT/bin

alias t "python ~/dotfiles/t/t.py --task-dir ~/Dropbox/tasks --list tasks"
