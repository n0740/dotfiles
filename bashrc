# Don't do anything if not running interactively
[ -z "$PS1" ] && return

function load_dotfiles() {
    source ~/.bash/helpers
    source ~/.bash/env
    source ~/.bash/config
    source ~/.bash/aliases
    source ~/.bash/osx.aliases
    source ~/.bash/completions

    # Use .localrc for settings specific to one system
    __source_if_exists ~/.localrc
}


function greet() {
    local greeting=$*

    if which archey > /dev/null 2>&1; then
        archey --offline
        date
    else
        if which cowsay > /dev/null 2>&1; then
            echo -en $greeting | cowsay
        else
            echo -en $greeting
        fi
    fi
    echo
}


load_dotfiles
greet "Hi from $(hostname)!\n\n$(date)"
