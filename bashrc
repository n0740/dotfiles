# Don't do anything if not running interactively
[ -z "$PS1" ] && return

function load_dotfiles() {
    source "$HOME/.bash/helpers"
    source "$HOME/.bash/env"
    source "$HOME/.bash/config"
    source "$HOME/.bash/aliases"
    source "$HOME/.bash/osx.aliases"
    source "$HOME/.bash/completions"
    source "$HOME/.cargo/env"

    # Use .localrc for settings specific to one system
    __source_if_exists "$HOME/.localrc"
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
