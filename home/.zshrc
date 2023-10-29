# Source Prezto zshrc.
source "$HOME/.zprezto/runcoms/zshrc"

. ~/.shell/aliases

alias picard='sudo docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):$(pwd) -v ~/.circleci/:/root/.circleci --workdir $(pwd) circleci/picard picard'

export DEFAULT_USER="ben"

PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# heroku autocomplete setup
HEROKU_AC_ZSH_SETUP_PATH=/home/ben/.cache/heroku/autocomplete/zsh_setup && test -f $HEROKU_AC_ZSH_SETUP_PATH && source $HEROKU_AC_ZSH_SETUP_PATH;