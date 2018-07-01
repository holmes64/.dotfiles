
limit coredumpsize 0
#
### zplug ####################################################################
#
source ~/.zplug/init.zsh

### define plugins
zplug 'zsh-users/zsh-completions'
zplug 'zsh-users/zsh-syntax-highlighting', defer:3
zplug 'mollifier/anyframe'

# Interactive filtering
zplug 'peco/peco', as:command, from:gh-r, rename-to:peco
zplug 'junegunn/fzf-bin', as:command, from:gh-r, rename-to:fzf

# check install
if ! zplug check --verbose; then
  printf 'Install? [y/N]: '
  if read -q; then
    echo; zplug install
  fi
fi

zplug load --verbose

#
### prezto ###################################################################
#
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

#
### Autoloadings ###############################################################
#
autoload -Uz add-zsh-hook
autoload -Uz compinit && compinit -u
autoload -Uz vcs_info
autoload -Uz ls-abbrev
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

#
### Alias ####################################################################
#
alias vi='vim'
alias la='ls -a'
alias ll='ls -l'
alias lt='ls -l -a -t'
alias bu='brew update'
alias bd='brew doctor'

# git
alias gitst='git status'

#
### Completion #################################################################
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
