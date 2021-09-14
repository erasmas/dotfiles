## Environment Variables

set -gx TERM xterm-256color

set -gx PATH ~/bin ~/.cargo/bin ~/.emacs.d/bin ~/go/bin ~/.dotnet/tools $PATH

# set -l TE "emacs -nw"
set -L TE "nvim"
set -gx VISUAL $TE
set -gx EDITOR $TE

## Aliases

# shortcut for terminal emacs
alias e $TE

# shortcut for terminal emacs with sudo
alias E "env SUDO_EDITOR=\"emacs -nw\" sudoedit"

alias top-10-size "du -hcx --max-depth=1 | sort -rh | head -10"

alias stream-mpd "mpv -idle --cache=no http://localhost:8000"

alias cached-writes "rg -e Dirty: -e Writeback: /proc/meminfo"

alias tf "terraform"

## vi mode

fish_vi_key_bindings 2>/dev/null

set fish_cursor_default block
set fish_cursor_insert line
set fish_cursor_replace_one underscore
set fish_cursor_visual block

function fish_default_mode_prompt
    # NOOP to disable mode indicator
end

## fzf

set -U FZF_LEGACY_KEYBINDINGS 0
set -gx FZF_DEFAULT_OPTS '--color fg:#D8DEE9,bg:#2E3440,hl:#A3BE8C,fg+:#D8DEE9,bg+:#434C5E,hl+:#A3BE8C --color pointer:#BF616A,info:#4C566A,spinner:#4C566A,header:#4C566A,prompt:#81A1C1,marker:#EBCB8B'

## direnv integration

direnv hook fish | source

## zoxide integration

zoxide init fish | source


## Prompt

set fish_greeting

set pure_username_color $fish_color_user
set pure_host_color $fish_color_host

set pure_user_host_location 1
