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

if test -d ~/.fzf/ 
    set -xg PATH $PATH ~/.fzf/bin
end

#get pip install -U binaries into path
set -xg PATH $PATH ~/.local/bin

if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end
