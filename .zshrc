# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


limit coredumpsize 0

#
### prezto
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
### zplug
#
if [[ -s "$HOME/.zplug/init.zsh" ]]; then
  source "$HOME/.zplug/init.zsh"
fi

#
### Zsh plugins
#
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "mollifier/anyframe"
zplug "romkatv/powerlevel10k", as:theme, depth:1
zplug "greymd/docker-zsh-completion"
zplug "zsh-users/zsh-autosuggestions"

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
### Interactive filtering
#
# check install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

#
### Autoloadings
#
autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit -u
autoload -Uz vcs_info
autoload -Uz ls-abbrev
autoload -Uz promptinit
promptinit
prompt powerlevel10k

#
### General setting
#

# Display completion list
setopt auto_list

setopt auto_pushd

setopt auto_menu

setopt hist_ignore_dups

setopt hist_ignore_dups

setopt hist_reduce_blanks

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
### Export ###################################################################

# ls color settting
export CLICOLOR=true
export LSCOLORS='exfxcxdxbxGxDxabagacad'
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

# History
export HISTFILE=~/.zsh_history
export HISTSIZE=1000
export SAVEHIST=1000000
export EDITOR=vim

# g++
# not use default mac clang
# I use gcc
export PATH="/usr/local/bin:$PATH"

#
### Alias
#
alias vi='vim'
alias la='ls -a'
alias ll='ls -l'
alias lt='ls -l -a -t'
alias bu='brew update'
alias bd='brew doctor'
alias python='python3'

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


######################################################

## sudo用のpathを設定
typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=({/usr/local,/usr,}/sbin(N-/))

# setting about zsh-completions
fpath=(/usr/local/share/zsh-completions $fpath)

######################################################
# vscode alias
code() {VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $*}

#####################################################
# Related Docker
source <(kubectl completion zsh)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
