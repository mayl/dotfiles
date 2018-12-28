#TERM variable
set -xg TERM screen-256color

#use trash instead of rm
alias rm "trash"

#mindmaps
function mm
	freemind ~/Dropbox/mindmaps/Larry.mm &
end

#redshift
function rs
	gtk-redshift -l 38.731950:-77.182701 &
end

#fuzzy jobs
source ~/.config/omf/ffg.fish
#alias ffg "fg %(jobs | hs | cut -f1)"

##fuzzy background
#alias fbg "bg %(jobs | hs | cut -f1)"

#ipython notebook
alias ipyNotebook "ipython notebook --notebook-dir=~/Dropbox/Projects/ipythonNotebooks &"

#rust
if test -d ~/.cargo/
    set -xg PATH $PATH ~/.cargo/bin
end

#local (why do I have to do this??)
set -xg PATH $PATH ~/.local/bin
