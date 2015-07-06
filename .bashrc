# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# and ignore same sucessive entries
export HISTCONTROL=ignoreboth

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

# chruby
source /usr/local/opt/chruby/share/chruby/chruby.sh
source /usr/local/opt/chruby/share/chruby/auto.sh
