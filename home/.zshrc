# Source Prezto zshrc.
source "$HOME/.zprezto/runcoms/zshrc"

. ~/.shell/aliases

alias picard='sudo docker run -it --rm -v /var/run/docker.sock:/var/run/docker.sock -v $(pwd):$(pwd) -v ~/.circleci/:/root/.circleci --workdir $(pwd) circleci/picard picard'

export DEFAULT_USER="ben"

PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
