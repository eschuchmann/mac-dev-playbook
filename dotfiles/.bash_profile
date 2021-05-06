#
# .bash_profile
#
# based on https://github.com/geerlingguy/dotfiles
# @see .inputrc
#

# Nicer prompt.
export PS1="\[\e[0;32m\]\]\[\] \[\e[1;32m\]\]\t \[\e[0;2m\]\]\w \[\e[0m\]\]\[$\] "

# Use colors.
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# Custom $PATH with extra locations.
export PATH=/usr/local/bin:/usr/local/sbin:$HOME/bin:/usr/local/git/bin:$PATH

# Include alias file (if present) containing aliases for ssh, etc.
if [ -f ~/.bash_aliases ]
then
  source ~/.bash_aliases
fi

# Include bashrc file (if present).
if [ -f ~/.bashrc ]
then
  source ~/.bashrc
fi

# Syntax-highlight code for copying and pasting.
# Requires highlight (`brew install highlight`).
function pretty() {
  pbpaste | highlight --syntax=$1 -O rtf | pbcopy
}

# Git aliases.
alias gs='git status'
alias gc='git commit'
alias gcam='git commit -am'
alias gl='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'

# Turn on Git autocomplete.
brew_prefix=`brew --prefix`
if [ -f $brew_prefix/etc/bash_completion ]; then
  . $brew_prefix/etc/bash_completion
fi

# Use nvm.
#export NVM_DIR="$HOME/.nvm"
#. "$brew_prefix/opt/nvm/nvm.sh"

# Use rbenv.
if [ -f /usr/local/bin/rbenv ]; then
  eval "$(rbenv init -)"
fi

function aws_profile() {
  export AWS_PROFILE="$1"
}

# pyenv support
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# conda support
. /usr/local/miniconda2/etc/profile.d/conda.sh

source ~/.ojo_profile

# Setting PATH for Python 3.6
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH
 
## aws gsuite setup
export GOOGLE_USERNAME="eschuchmann@ojolabs.com"
export GOOGLE_IDP_ID="C032y2prw"
export GOOGLE_SP_ID="990755105269"
export DURATION="43200"
alias aws-auth='unset AWS_SECRET_ACCESS_KEY AWS_ACCESS_KEY_ID AWS_PROFILE; aws-google-auth -p aws-tmp; export AWS_PROFILE=aws-tmp'

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"