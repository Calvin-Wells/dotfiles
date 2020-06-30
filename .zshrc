### BASICS ###
#Completion options
#zstyle ':completion:*' completer _expand _complete _ignored _approximate
#zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
#zstyle :compinstall filename '/home/calvin/.zshrc'
#
#autoload -Uz compinit
#compinit
autoload -Uz compinit
zstyle ':completion:*' menu select # Use a menu for completion
zstyle ':completion::complete:*' gain-privileges 1 # Autocomplete respects privilege
zmodload zsh/complist
setopt COMPLETE_ALIASES # Complete command line switches for aliases
compinit
_comp_options+=(globdots)		# Include hidden files.
#History
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
#One liners
setopt autocd extendedglob notify
unsetopt beep
bindkey -v
#Colours
export CLICOLOR=1
autoload -U colors && colors
# Colorize commands when possible.
ls -hN --color=auto > /dev/null 2>&1 && alias \
  ls="ls -hN --color=auto --group-directories-first" \
  grep="grep --color=auto" \
  diff="diff --color=auto" \
  ccat="highlight --out-format=ansi"

### VI MODE ###
#Set 1ms timeout for faster mode switching
export KEYTIMEOUT=1
# Fix backspace in vi mode
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
# block cursor for cmd mode, line (beam) otherwise
#  1 -> blinking block
#  2 -> solid block 
#  3 -> blinking underscore
#  4 -> solid underscore
#  5 -> blinking vertical bar
#  6 -> solid vertical bar
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[2 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

### PLUGINS ###
# Using antigen as a plugin manager
source /usr/share/zsh/share/antigen.zsh
# Syntax hilighting
antigen bundle zdharma/fast-syntax-highlighting
# Spaceship prompt options:
# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
SPACESHIP_PROMPT_ORDER=(
  time          # Time stamps section
  user          # Username section
  host          # Hostname section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  golang        # Go section
  rust          # Rust section
  docker        # Docker section
  aws           # Amazon Web Services section
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_PROMPT_DEFAULT_SUFFIX=' '   # space as defeault separator
SPACESHIP_CHAR_SYMBOL='❯'             # pure prompt character
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_USER_SUFFIX=''
SPACESHIP_HOST_PREFIX='@'
SPACESHIP_DIR_PREFIX=''
SPACESHIP_GIT_PREFIX=''
SPACESHIP_USER_SHOW=true              # 'always' if you want username outside of ssh
SPACESHIP_HOST_SHOW=true              # 'always' if you want hostname outside of ssh
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=false
# Actually load spaceship
antigen theme denysdovhan/spaceship-prompt
# Tell antigen we're done
antigen apply
