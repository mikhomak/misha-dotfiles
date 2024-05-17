# vim: set filetype=sh :
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh
source $HOME/.zshenv


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

#--------- EDITS

alias reload-zsh="source ~/.zshrc"
alias edit-hosts="sudo vi /etc/hosts"

alias edit-misha-zsh="vi $MISHA/.zshrc"
alias edit-misha-p10k="vi $MISHA/.p10k_misha.zsh"
alias edit-misha-vim="vi $MISHA/.vimrc"
alias edit-misha-kitty="vi $MISHA/kitty.config"

#--------- CD
alias cdmisha="cd $MISHA"
#--------- OTHER

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

#--------- JAVA
alias j11="sdk use java 11.0.20-ms; java --version"
alias j17="sdk use java 17.0.8.1-ms; java --version"




source /opt/homebrew/opt/powerlevel10k/powerlevel10k.zsh-theme
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ~/.bash_profile;

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
