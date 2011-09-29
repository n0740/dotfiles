# Don't do anything if not running interactively
[ -z "$PS1" ] && return

function load_dotfiles() {
    source ~/.bash/helpers
    source ~/.bash/env
    source ~/.bash/config
    source ~/.bash/aliases
    source ~/.bash/completions

    # Use .localrc for settings specific to one system
    __source_if_exists "$HOME/.localrc"
}

load_dotfiles
