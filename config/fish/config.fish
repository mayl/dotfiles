#GOPATHS
set -x GOROOT $HOME/go 
set -x PATH $PATH $GOROOT/bin
alias gofmt "go fmt -w"

#setup t
alias t "python ~/dotfiles/t/t.py --task-dir ~/Dropbox/tasks --list tasks"

#mindmaps
function mm
	freemind ~/Dropbox/mindmaps/Larry.mm &
end

#redshift
alias rs "gtk-redshift -l 38.731950:-77.182701 &"

#setup peat
set -x PATH $PATH ~/dotfiles/peat

#arduino Burner
alias arduinoburner "python ~/code/python/ArduinoBurner/ArduinoBurner.py"