#GOPATHS
set -x GOROOT $HOME/go 
set -x TERM $HOME/go 
set -x GOPATH $HOME/code/go
set -x PATH $PATH $GOROOT/bin
set -x PATH $PATH $GOPATH/bin
alias gofmt "go fmt -w"

#TERM variable
set -x TERM screen-256color

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
<<<<<<< HEAD
set -x PATH $PATH ~/camlistore-0.6/bin/
=======
set -x PATH $PATH ~/camlistore-0.7/bin
>>>>>>> c0d5100a0213cd0cc1106a6ec6959cabe0ac983b

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

#ipython notebook
alias ipyNotebook "ipython notebook --notebook-dir=~/Dropbox/Projects/ipythonNotebooks &"

#racer
set -x RUST_SRC_PATH = ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
