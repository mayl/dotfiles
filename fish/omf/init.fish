#TERM variable
set -xg TERM screen-256color

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

#arduino Burner
alias arduinoburner "python ~/code/python/ArduinoBurner/ArduinoBurner.py"

#unison
alias unison "sudo unison-gtk"

#ack
alias ack "ack-grep"

#fuzzy foreground
alias ffg "fg %(jobs | hs | cut -f1)"

#fuzzy background
alias fbg "bg %(jobs | hs | cut -f1)"

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
set -xg SANE_DEFAULT_DEVICE "brother4:bus9;dev1"

#ipython notebook
alias ipyNotebook "ipython notebook --notebook-dir=~/Dropbox/Projects/ipythonNotebooks &"

#rust
if test -d ~/.cargo/
    set -xg PATH $PATH ~/.cargo/bin
end

#racer
set -xg RUST_SRC_PATH ~/.rustup/toolchains/stable-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/src
