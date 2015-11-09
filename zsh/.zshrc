# Plugins
source ~/zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen apply

# Aliases
## General
alias nemo='nemo --no-desktop'
alias ls='ls --color=auto'
alias targz='tar -zxvf'
alias tarbz2='tar -jxvf'
## Dev
alias dev='./dev.sh'
alias build='./build.sh'
alias b=build
alias run='./run.sh'
alias r=run
alias debug='./debug.sh'
alias d=debug
## Windows
alias AMDCompressCLI='wine ~/.wine/drive_c/Program\ Files\ \(x86\)/AMD/AMDCompress/CLI/AMDCompressCLI.exe'

autoload -U compinit promptinit colors
compinit
promptinit
colors
PROMPT="%{$fg[red]%} » %{$reset_color%}"
RPROMPT="%B%{$fg[yellow]%}%~%{$reset_color%}"

# Change cursor color based on vi mode
# http://ivyl.0xcafe.eu/2013/02/03/refining-zsh/#vi_mode_status_indicator
# {
    # urxvt also accepts #RRGGBB
    INSERT_COLOR="7" # white
    COMMAND_COLOR="1" # red

    set_cursor_color() {
        if [[ $TERM = "linux" ]]; then
            # nothing
        elif [[ $TMUX != '' ]]; then
            printf '\033Ptmux;\033\033]12;%b\007\033\\' "$1"
        else
            echo -ne "\033]12;$1\007"
        fi
    }

    zle-keymap-select () {
        if [ $KEYMAP = vicmd ]; then
            set_cursor_color $COMMAND_COLOR
        else
            set_cursor_color $INSERT_COLOR
        fi
    }

    zle-line-finish () {
        set_cursor_color $INSERT_COLOR
    }

    zle-line-init () {
        zle -K viins
        set_cursor_color $INSERT_COLOR
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
    zle -N zle-line-finish
# }

# Functions
bk () {
    cp $1 $1.bak
}

# Disable Ctrl-S and Ctrl-Q
stty -ixon

# Vim mode
bindkey -v
bindkey '^?' backward-delete-char
export KEYTIMEOUT=1

# Make CapsLock = Escape
setxkbmap -option 'caps:ctrl_modifier'
xcape -e 'Caps_Lock=Escape'

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/pirro/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
