if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting

    # Aliases
    alias sound="GDK_BACKEND=x11 pavucontrol"
    alias record='wf-recorder -f /tmp/tmp.mkv && ffmpeg -y -i /tmp/tmp.mkv -c:v libx264 ~/Videos/recording_(date +%Y%m%d_%H%M%S).mp4 && rm /tmp/tmp.mkv'
    alias f="fastfetch"
    alias fishreload="source ~/.config/fish/config.fish"
    alias clock="tty-clock -c -C7 -s"
    alias cls="clear"
    alias ll="ls -lh --color=auto"
    alias ..="cd .."
    alias ...="cd ../.."
    alias ....="cd ../../.."
    alias home="cd ~"
    alias docs="cd ~/documents"
    alias dl="cd ~/downloads"
    alias gs="git status"
    alias ga="git1 add"
    alias gc="git commit -m"
    alias gp="git push"
    alias please="sudo"
    alias lelouch_britanskiy_povelevayet="sudo"
    alias pls="sudo"
    alias ssh="TERM=xterm-256color command ssh"

    # fastfetch в зависимости от терминала
    if set -q KITTY_WINDOW_ID
        fastfetch --logo ~/pics/torfinFaceFastfetch.png --logo-type kitty
    else
        # Маленький PNG, либо уменьшенный прямой вывод
        fastfetch
    end
end
