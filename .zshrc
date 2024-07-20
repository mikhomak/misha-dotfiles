# vim: set filetype=sh :
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv

#-------- MACHINE
unameOut="$(uname -s)"
case "${unameOut}" in
    Linux*)     machine=Linux;;
    Darwin*)    machine=Mac;;
    CYGWIN*)    machine=Cygwin;;
    MINGW*)     machine=MinGw;;
    MSYS_NT*)   machine=Git;;
    *)          machine="UNKNOWN:${unameOut}"
esac
export MACHINE=$machine
#-------- PLUGINS
source ~/.oh-my-zsh/plugins/git/git.plugin.zsh
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestionso
colored-man-pages
alias-tips
)

#Add this to .zshrc in the begging
ZSH_THEME="powerlevel10k/powerlevel10k"

#--------- VARIABLES
export SSH_DIR="~/.ssh"
export H="$HOME"

#--------- EDITS

alias reload-zsh="source ~/.zshrc"
alias edit-hosts="sudo vi /etc/hosts"

alias edit-zsh="vi $MISHA/.zshrc"
alias edit-p10k="vi $MISHA/.p10k.zsh"
alias edit-vim="vi $MISHA/.vimrc"
alias edit-kitty="vi $MISHA/kitty.config"

#--------- CD
alias cdmisha="cd $MISHA"
alias cdssh="cd $SSH_DIR"
alias cdh="cd $H"
#--------- OTHER
alias cmd="cmd.exe /c "
alias start_ssh_agent="eval `ssh-agent`"
#--------- GIT
alias grbod="gfa; git rebase origin/develop"
alias gdevelop="gfa && gco develop && groh"
alias gast="git add . && git stash"
alias gasco="gast && gfa && gco "
alias gastrohstp="gast && gfa && groh && gstp"
alias gastrbodstp="gast && gfa && grbod && gstp"
alias gastcodrohstpcb="gast && gfa && gco develop && groh && gstp && gcb"
alias grbo="gfa && git rebase --onto "
alias gls="g log --oneline"
alias itsme="ssh-add $SSH_DIR/$SSH_NAME"
alias gacpf="ga . && gc! --no-edit && gpf"
alias gacmsgpf='f(){ga . && gcmsg "$1" && gpf};f'
#--------- JAVA
alias j11="sdk use java 11.0.20-ms; java --version"
alias j17="sdk use java 17.0.8.1-ms; java --version"



if [[ -d /opt/homebrew/opt/powerlevel10k ]]; then
source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  
fi
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [[ -d $H/.oh-my-zsh/custom/themes/powerlevel10k/ ]]; then
source $H/.oh-my-zsh/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
fi

source ~/.bash_profile;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
