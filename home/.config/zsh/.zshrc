# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=$XDG_CONFIG_HOME/log/zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# enable typo correction
setopt correct

# enable auto suggestion
source $XDG_CONFIG_HOME/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=7"
bindkey '^J' autosuggest-accept

# homeshick
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

# terminal setting
case "${TERM}" in
linux)
    #export LANG=C
    ;;
fbterm)
	echo -en "\e]P7c5c8c6" # 文字色を白にする 
	;;
xterm)
    #export LANG=ja_JP.UTF-8
    ;;
esac


# aliases
source $XDG_CONFIG_HOME/zsh/aliases.zsh

# fzf
[ -f $XDG_CONFIG_HOME/fzf/fzf.zsh ] && source $XDG_CONFIG_HOME/fzf/fzf.zsh

# w3m
source $XDG_CONFIG_HOME/zsh/w3m.zsh

# fbterm
alias fbterm='TERM=fbterm fbterm'

# anyenv
eval "$(anyenv init -)"

# read local settings
[ -f $XDG_CONFIG_HOME/zsh/local.zsh ] && source $XDG_CONFIG_HOME/zsh/local.zsh

