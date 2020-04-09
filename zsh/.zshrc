export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.rbenv/bin:$PATH"

# tmux
export TERM="xterm-256color"

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"
POWERLEVEL9K_DATE_FORMAT=%D{%m/%d/%y}
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs rbenv)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(time date)

ZSH_THEME="powerlevel9k/powerlevel9k"

plugins=(git)

source $ZSH/oh-my-zsh.sh

eval "$(rbenv init -)"

alias s="bundle exec rails s"
alias c="bundle exec rails c"
alias zedit="vim ~/.zshrc"
alias zload="source ~/.zshrc"

# Open my tmux setup in a maximized termnal
alias tinit="gnome-terminal --maximize -- /bin/sh -c '~/init-tmux.sh; exec $SHELL'; exit"

# Close tmux sessions
alias x="pkill -f tmux"
