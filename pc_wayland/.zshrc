autoload -Uz compinit promptinit up-line-or-beginning-search down-line-or-beginning-search
compinit
promptinit
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

[[ $COLORTERM = *(24bit|truecolor)* ]] || zmodload zsh/nearcolor

#bindkey "\e[1~" beginning-of-line 
#bindkey "\e[4~" end-of-line
#bindkey "\e[3~" delete-char
#bindkey "\e[5~" up-line-or-beginning-search 
#bindkey "\e[6~" down-line-or-beginning-search 

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"      beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"       end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"    overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}" backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"    delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"        up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"      down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"      backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"     forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"    up-line-or-beginning-search
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"  down-line-or-beginning-search
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}" reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget
	function zle_application_mode_start { echoti smkx }
	function zle_application_mode_stop { echoti rmkx }
	add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
	add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi

#Green
PROMPT='%B%(!.%F{196}.%F{#afd700})%n@%m:%f%F{39}%~%b%f%(!.#.$) '

#GruvBox
#PROMPT='%B%(!.%F{196}.%F{#b8bb26})%n@%m:%f%F{#83a598}%~%b%f%(!.#.$) '

HISTFILE=~/.zhistory
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTSIZE=1000
SAVEHIST=1000

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

alias ls='ls --color=auto'
alias ll='ls -l'
alias music='ncmpcpp'
alias setscreen='xrandr --output HDMI2 --set "Broadcast RGB" "Full" --output HDMI2 --auto --right-of HDMI1'
alias setrazer='echo -n -e "\x20\x02\x00" > $(find -L /sys/bus/hid/drivers/razerkbd/0003:1532* -maxdepth 1 -name "matrix_effect_static")'
alias setmonhdmi='ddccontrol -r 0x60 -w 17 dev:/dev/i2c-1'
alias setmondp='ddccontrol -r 0x60 -w 15 dev:/dev/i2c-1'

source ~/.zshrc_priv

