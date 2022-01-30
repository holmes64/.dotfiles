
#
### oh-my-zsh
#

# Path to your oh-my-zsh installation.
export ZSH="/Users/takuya/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZLE_RPROMPT_INDENT=1 
ZSH_THEME="powerlevel10k/powerlevel10k"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git web-search fzf zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

#
#### powerlevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

limit coredumpsize 0

#
## peco
# ⌃ r で peco で history 検索
function peco-history-selection() {
    BUFFER=`history -n 1 | tail -r  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

#
### Autoloadings
#
# setting about zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  autoload -Uz compinit && compinit
fi

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
autoload -Uz ls-abbrev

#
### General setting
#

# Alias
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias la="ls -al"
alias ll="ls -l"
alias bu="brew update"
alias bd="brew doctor"
alias python="python3"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"

# Display completion list
setopt auto_list
setopt auto_pushd
setopt auto_menu
setopt hist_ignore_dups
setopt share_history
setopt hist_reduce_blanks
setopt inc_append_history

# Disable beep
setopt no_beep
setopt no_hist_beep
setopt no_list_beep

# Complete afterwards = (ex. option=value)
setopt magic_equal_subst

# Notify immediately the state change of the background process
setopt notify

# Make Japanese filename displayable
setopt print_eight_bit

# Display status when exit status if other than 0
setopt print_exit_value

# Enable display of the VCS informaiton
setopt prompt_subst

# Don't add duplicate directories to the stack
setopt pushd_ignore_dups

# Confirm before "rm *"
setopt rm_star_wait

# Delete the right prompt after executing the command
setopt transient_rprompt

#
### Export 
#

# ls color settting
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000
export EDITOR=vim

#
### Completion
#
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' use-cache true
zstyle ':completion:*' verbose yes
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:options' description 'yes'


## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path

#
### Other
#

# Kubernetes 
source <(kubectl completion zsh)

# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# switch arm64 and x86_64
if (( $+commands[arch] )); then
	alias x64='exec arch -arch x86_64 "$SHELL"'
	alias a64='exec arch -arch arm64e "$SHELL"'
fi

# anyenv 
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
