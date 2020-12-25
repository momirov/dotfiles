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
export LIBVA_DRIVER_NAME=vdpau
export VDPAU_DRIVER=r600
PATH="/usr/local/heroku/bin:$PATH"
PATH="/home/vladimir/.local/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
