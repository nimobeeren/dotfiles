# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/nimo/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install

# Path to oh-my-zsh installation
ZSH=$HOME/.oh-my-zsh

# oh-my-zsh plugins
plugins=(git)

# Expose secrets
source $HOME/.secrets

# Add Ruby gems to path
# PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"

# Add global yarn binaries to path
export PATH="$HOME/.yarn/bin:$PATH"

# Enable color support of ls and grep
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Key bindings
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
bindkey "^H" backward-delete-word

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias sudo='sudo '
alias unyarn='rm -rf node_modules yarn.lock'
alias ys='yarn && yarn start'
alias yd='yarn && yarn dev'
alias yt='yarn test --watch'

# Customize prompt
PROMPT="%B%F{red}%n@%M%f:%F{cyan}%~%f%b%(!.#.$) "

# Set default editor
export VISUAL=nano
export EDITOR=nano

# Load oh-my-zsh
ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh
