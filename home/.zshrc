# shell ########################################################################

  # oh-my-zsh
    ZSH_THEME="kolo"
    plugins=(git)
    source $HOME/.oh-my-zsh/oh-my-zsh.sh

# languages ####################################################################

  # node <- schniz/fnm 
    FNM_PATH=$HOME/.local/share/fnm
    if [ -d "$FNM_PATH" ]; then
      PATH=$PATH:$FNM_PATH
      eval "`fnm env`"
    fi
  
  # global node_modules <- bun
    BUN_PATH=$HOME/.bun
    if [ -d "$BUN_PATH" ]; then
      PATH=$PATH:$BUN_PATH/bin
      [ -s "$BUN_PATH/_bun" ] && source "$BUN_PATH/_bun"
    fi
