# add user-specific bin to PATH
export PATH=~/bin:$PATH

# add Ruby gems to PATH
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$PATH"

# add Rust cargo binaries to PATH
export PATH=~/.cargo/bin:$PATH

# set default terminal text editor
TE="emacsclient -t -a emacs"
export VISUAL=$TE
export EDITOR=$TE
