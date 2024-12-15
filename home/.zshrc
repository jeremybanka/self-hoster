# shell ########################################################################

  # oh-my-zsh
    ZSH_THEME="kolo"
    plugins=(git)
    export ZSH="$HOME/.oh-my-zsh"
    source $ZSH/oh-my-zsh.sh

# languages ####################################################################

  # node <- schniz/fnm 
    FNM_PATH="/root/.local/share/fnm"
    if [ -d "$FNM_PATH" ]; then
      export PATH="/root/.local/share/fnm:$PATH"
      eval "`fnm env`"
    fi
  
  # global node_modules <- bun
    # bun
    PATH=$PATH:$HOME/.bun/bin
    # bun completions
    [ -s "/root/.bun/_bun" ] && source "/root/.bun/_bun"
