#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
alias ssh="TERM=rxvt-unicode ssh"
source /etc/profile.d/vte.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
