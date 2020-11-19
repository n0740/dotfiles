# Don't do anything if not running interactively
[ -z "$PS1" ] && return

# zmodload zsh/zprof
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # common-aliases
    osx
    docker
    docker-compose
)

source $ZSH/oh-my-zsh.sh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
fi

# You may also need to force rebuild `zcompdump`:
# rm -f ~/.zcompdump; compinit

# Additionally, if you receive "zsh compinit: insecure directories" warnings when attempting
# to load these completions, you may need to run this:
# chmod go-w '/usr/local/share'

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# If you receive "highlighters directory not found" error message,
# you may need to add the following to your .zshenv:
# export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters


function load_dotfiles() {
    source ~/.bash/helpers
    source ~/.bash/env
    source ~/.bash/aliases
    source ~/.bash/osx.aliases
    source ~/.zsh/completions
    __source_if_exists ~/.localrc
}


function greet() {
    local greeting=$*

    # if which archey > /dev/null 2>&1; then
    #     archey --offline
    #     date
    # else
        if which cowsay > /dev/null 2>&1; then
            echo -en $greeting | cowsay
        else
            echo -en $greeting
        fi
    # fi
    echo
}


ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[red]%} {"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[red]%}}%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[yellow]%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

# PROMPT='%F{240}%* %B%F{yellow}%1~%f%b%(1j.%F{cyan} %j%f.)%(?..%F{red} ?%?)%f %# '
# PROMPT="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ ) "
# PROMPT+='%F{240}%* %B%F{yellow}%1~%f%b$(git_prompt_info)%(1j.%F{cyan} %j%f.) %# '
PROMPT='%F{240}%*$(git_prompt_info) %B%F{yellow}%1~%f%b'
PROMPT+='%(1j.%F{cyan} %j%f.)'
PROMPT+=" %(?:%{$fg_bold[green]%}%#:%{$fg_bold[red]%}%#) "


# RPROMPT=''

load_dotfiles
greet "Hi $USER!\n\n\nIt's $(date '+%H:%M, %Y.%m.%d') now"
# zprof

