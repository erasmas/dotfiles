## Environment Variables

set -gx TERM xterm-256color

set -gx PATH ~/bin ~/.cargo/bin (ruby -e 'puts Gem.user_dir')/bin $PATH

set -l TE "emacsclient -c -t -a vim"
set -gx VISUAL $TE
set -gx EDITOR $TE

set -gx SBT_OPTS "-Xms512M -Xmx1536M -Xss1M -XX:+CMSClassUnloadingEnabled"

set -gx BOOT_JVM_OPTIONS "-Xmx2g -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -XX:+UseConcMarkSweepGC -XX:+CMSClassUnloadingEnabled -Xverify:none"

set -gx WORKON_HOME ~/.virtualenvs
eval (python -m virtualfish compat_aliases)

set -gx CARGO_HOME ~/.cargo

set -gx LD_LIBRARY_PATH "$LD_LIBRARY_PATH:/opt/cuda/lib64"
set -gx CUDA_HOME /opt/cuda/

## Aliases

# shortcut for terminal emacs
alias e $TE

# shortcut for terminal emacs with sudo
alias E "SUDO_EDITOR=\"emacsclient -c -t -a vim\" sudoedit"

alias top-10-size "du -hcx --max-depth=1 | sort -rh | head -10"

alias stream-mpd "mpv -idle --cache=no http://localhost:8000"

## vi mode

fish_vi_key_bindings

set fish_cursor_default     block
set fish_cursor_insert      line
set fish_cursor_replace_one underscore
set fish_cursor_visual      block

function fish_default_mode_prompt
  # NOOP to disable mode indicator
end

## fzf

set -U FZF_LEGACY_KEYBINDINGS 0

## Color Theme

# Nord colors are taken from the https://github.com/arcticicestudio/nord/issues/102

set nord0 2e3440
set nord1 3b4252
set nord2 434c5e
set nord3 4c566a
set nord4 d8dee9
set nord5 e5e9f0
set nord6 eceff4
set nord7 8fbcbb
set nord8 88c0d0
set nord9 81a1c1
set nord10 5e81ac
set nord11 bf616a
set nord12 d08770
set nord13 ebcb8b
set nord14 a3be8c
set nord15 b48ead

set fish_color_normal $nord4
set fish_color_command $nord9
set fish_color_quote $nord14
set fish_color_redirection $nord9
set fish_color_end $nord6
set fish_color_error $nord11
set fish_color_param $nord4
set fish_color_comment $nord3
set fish_color_match $nord8
set fish_color_search_match $nord8
set fish_color_operator $nord9
set fish_color_escape $nord13
set fish_color_cwd $nord8
set fish_color_autosuggestion $nord6
set fish_color_user $nord15
set fish_color_host $nord13
set fish_color_cancel $nord15
set fish_pager_color_prefix $nord13
set fish_pager_color_completion $nord6
set fish_pager_color_description $nord10
set fish_pager_color_progress $nord12
set fish_pager_color_secondary $nord1

set pure_color_blue (set_color $nord8)
set pure_color_cyan (set_color $nord7)
set pure_color_gray (set_color $nord15)
set pure_color_green (set_color $nord14)
set pure_color_normal (set_color $nord4)
set pure_color_red (set_color $nord11)
set pure_color_yellow (set_color $nord13)

## Prompt

set pure_symbol_prompt "⇒"

set pure_username_color $fish_color_user
set pure_host_color $fish_color_host

set pure_user_host_location 1