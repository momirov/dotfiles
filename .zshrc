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

# MGM-Hurry shell alias
mgm-hurry() { pushd /home/vladimir/Projects/crypto/mgm/Freqtrade-MGM &> /dev/null; python3 -m pipenv run python3 ./mgm-hurry $@; popd &> /dev/null; }

eval "$(fnm env --use-on-cd)"

alias squire-connect="openvpn3 session-start --config ~/Downloads/office-linux_vladm@getsquire_com@getsquire.openvpn.com_\[Frankfurt\].ovpn"
alias squire-disconnect="openvpn3 session-manage --config ~/Downloads/office-linux_vladm@getsquire_com@getsquire.openvpn.com_\[Frankfurt\].ovpn --disconnect"
alias squire-restart="openvpn3 session-manage --config ~/Downloads/office-linux_vladm@getsquire_com@getsquire.openvpn.com_\[Frankfurt\].ovpn --restart"
