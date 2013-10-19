#GOPATHS
set -x GOROOT $HOME/go 
set -x GOPATH $HOME/code/go
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin
alias gofmt "go fmt -w"

#stats godoc server up in background and displays a reminder
function godoc_web
	echo "open localhost:6060"
	godoc -http=:6060 &
end


#use trash instead of rm
alias rm "trash"

#setup t
alias t "python ~/dotfiles/t/t.py --task-dir ~/Dropbox/tasks --list tasks"

#mindmaps
function mm
	freemind ~/Dropbox/mindmaps/Larry.mm &
end

#redshift
function rs
	gtk-redshift -l 38.731950:-77.182701 &
end

#setup peat
set -x PATH $PATH ~/dotfiles/peat

#arduino Burner
alias arduinoburner "python ~/code/python/ArduinoBurner/ArduinoBurner.py"

#unison
alias unison "sudo unison-gtk"

#ack
alias ack "ack-grep"

#camlistore
set -x PATH $PATH ~/camlistore-0.4/bin/

#antares
set -x ANTARES_INSTALL_DIR ~/code/c/antares

#i3 mute
function muteToggle
	if pacmd list-sinks | grep "muted: yes"
		pactl set-sink-mute 1 0
		echo "Muted"
	else
		pactl set-sink-mute 1 1
		echo "Not Muted"
	end
end

#scanner
set -x SANE_DEFAULT_DEVICE "brother4:bus9;dev1"
