# shell ########################################################################

  # oh-my-zsh
    ZSH_THEME="kolo"
    plugins=(git)
    source ${HOME}/.oh-my-zsh/oh-my-zsh.sh

# applications #################################################################

  # system
    PATH="$PATH:/usr/local/bin"
  
# languages ####################################################################

  # node <- schniz/fnm 
    eval "$(fnm env --use-on-cd)"
  
  # global node_modules <- bun
    PATH="$PATH:$HOME/.bun/bin"

