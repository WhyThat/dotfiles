POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
# Path to your oh-my-zsh installation.
ZSH_PATH="/home/mathieu/zsh"
export ZSH="$ZSH_PATH/oh-my-zsh"

source $ZSH_PATH/antigen.zsh
source $ZSH/oh-my-zsh.sh
source $ZSH_PATH/plugins.zsh
source $ZSH_PATH/theme.zsh
source $ZSH_PATH/aliases.sh
source $ZSH_PATH/env.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# fnm
export PATH=/home/mathieu/.fnm:/home/mathieu/rls-linux:$PATH
eval "`fnm env --multi`"

# opam configuration
test -r /home/mathieu/.opam/opam-init/init.zsh && . /home/mathieu/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

setopt extended_glob
setopt ksh_glob

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/mathieu/.sdkman"
[[ -s "/home/mathieu/.sdkman/bin/sdkman-init.sh" ]] && source "/home/mathieu/.sdkman/bin/sdkman-init.sh"

bindkey -v
