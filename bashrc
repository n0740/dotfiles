# Don't do anything if not running interactively
[ -z "$PS1" ] && return

source ~/.bash/helpers
source ~/.bash/env
source ~/.bash/config
source ~/.bash/aliases
source ~/.bash/completions

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
