# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# and ignore same sucessive entries
export HISTCONTROL=ignoreboth
# set editor
export EDITOR=nvim
alias vim=nvim

# make bash autocomplete with up arrow
bind '"\e[A":history-search-backward'
bind '"\e[B":history-search-forward'

# make tab cycle through commands instead of listing
bind '"\t":menu-complete'

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc)
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# quick git overview (requires git alias l for pretty logs)
alias gh='git status && git l && echo -e "\n"'

# git prompt
function git_ps1_fast() {
  local dir="$PWD"
  local git_dir
 
  until [[ -z "$dir" ]]; do
    git_dir="$dir/.git"
    if [[ -d "$git_dir" ]]; then
      echo "`git rev-parse --abbrev-ref HEAD` "
      return
    fi
 
    dir="${dir%/*}"
  done
}
PS1='\w $(git_ps1_fast)\$ '

# Ruby
eval "$(rbenv init -)"

# Dalia specific stuff
eval "$($HOME/.dalek/bin/dalek init -)"
# LM staging
#export LATANA_METRICS_API_ENDPOINT="https://latanametrics.staging.daliaresearch.com"
#export LATANA_METRICS_AUTH_TOKEN="piCajx4VQkEryhfzOEIaZCzWXzJF4DTVYMl99PoLLNI="
# LM production
export LATANA_METRICS_API_ENDPOINT="https://metrics.latana.com"
export LATANA_METRICS_AUTH_TOKEN="e//uJdx7IZpgHQvxgq19Figp6y3SBLNPIu1COpOBwmA="
alias lm="$HOME/Projects/lm/target/release/lm"

# added by travis gem
[ -f /Users/joe.corcoran/.travis/travis.sh ] && source /Users/joe.corcoran/.travis/travis.sh
