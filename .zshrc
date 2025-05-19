# vim: set filetype=sh :
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
if [[ -d $ZSH ]]; then
	source $ZSH/oh-my-zsh.sh
	source $ZSH/plugins/git/git.plugin.zsh
fi
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
plugins=(
git
zsh-syntax-highlighting
zsh-autosuggestions
colored-terminalman-pages
alias-tips
)

#Add this to .zshrc in the begging
ZSH_THEME="powerlevel10k/powerlevel10k"


#--------- Other
export XDG_CONFIG_HOME="$HOME/.config"
#--------- VARIABLES
export SSH_DIR="~/.ssh"
export H="$HOME"
export DOW="$H/Downloads"
export WORK="$H/work"
export PROJECTS="$H/projects"
export HBP="hybris/bin/platform"
export MISHA_NIX="$MISHA/linux/nix"
export GIT_EDITOR=vim
export MISHA_OBSIDIAN="$PROJECTS/misha-obsidian/"
#--------- EDITS

alias reload-zsh="source ~/.zshrc"
alias edit-hosts="sudo vim /etc/hosts"

alias edit-zsh="vim $MISHA/.zshrc"
alias edit-p10k="vim $MISHA/.p10k.zsh"
alias edit-vim="vim $MISHA/.vimrc"
alias edit-kitty="vim $MISHA/kitty.config"

#--------- CD
alias cdmisha="cd $MISHA"
alias cdssh="cd $SSH_DIR"
alias cdh="cd $H"
alias cddow="cd $DOW"
alias cdwork="cd $WORK"
alias cdp="cd $PROJECTS"
alias cdhbp="cd $HBP" 
alias cdnix="cd $MISHA_NIX"
alias cdobsidian="cd $MISHA_OBSIDIAN"

#--------- OTHER
alias cmd="cmd.exe /c "
alias copy_glazewm="sudo cp -r $MISHA/windows/glazewm/config.yaml $WINDOWS/.glzr/glazewm/config.yaml"
alias copy_zebar="sudo cp -r $MISHA/windows/zebar/* $WINDOWS/.glzr/zebar/starter"
alias copy_win_config="copy_glazewm && copy_zebar"
alias start_ssh_agent="eval `ssh-agent`"
alias clip="xclip -sel c < "

#--------- VIM
alias vi="nvim -u ~/.vimrc"
alias vim="nvim -u ~/.vimrc"

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


#-------- Werk
alias aca="ant clean all"
alias acai="aca initialize"
alias hd="./hybrisserver.sh debug"
alias acahd="aca && hd"
alias acaihd="acai && hd"

#-------- LINUX
alias audio_mixer="alsamixer -V -h"

#-------- Power level 10k
if [[ -d $HOMEBREW_PREFIX/share/powerlevel10k ]]; then
source $HOMEBREW_PREFIX/share/powerlevel10k/powerlevel10k.zsh-theme 
  export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  
fi

#--- Linux
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


if [[ -d $H/.oh-my-zsh/custom/themes/powerlevel10k/ ]]; then
	source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
fi


if [[ -d /usr/share/zsh-theme-powerlevel10k/ ]]; then
	source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi

#--------Other
if [[ -f $HOME/.bash_profile ]]; then
	source ~/.bash_profile;
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
[ -z "$SSH_AUTH_SOCK" ] && eval "$(ssh-agent -s)"
