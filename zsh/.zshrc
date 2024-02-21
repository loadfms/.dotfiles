export TERM="xterm-256color"
export GOPATH="$HOME/go"
export ZSH="$HOME/.oh-my-zsh"
export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export EDITOR="nvim"
export HISTCONTROL=ignoreboth
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

KUBECONFIG=~/.kube/config

###############################################################
# => Startx
###############################################################
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && uname | rg -q "Linux"; then
    if ! startx; then
        echo "Error occurred while running startx"
    fi
fi

###############################################################
# => Theme
###############################################################
# symbol
symbol(){
    echo "%{$fg[white]%}%{$reset_color%}"
}

# current directory, one level deep
directory() {
   echo "%B%{$fg[yellow]%}%1~%{$reset_color%}%b"
}

# returns  if there are errors, nothing otherwise
return_status() {
   echo "%{$fg[red]%}%(?..)%{$reset_color%}"
}

git_info(){
    echo "%B%{$fg[cyan]%}$(git_prompt_info)%{$reset_color%}%b"
}

PROMPT='
$(directory) $(git_info)
%B󰅂%b '

# Add extra space between symbol in Linux
if uname | rg -q "Linux"; then
    PROMPT='
$(directory) $(git_info)
%B󰅂%b '
fi

###############################################################
# => Plugins
###############################################################
plugins=(git)

ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f" || \
        print -P "%F{160}▓▒░ The clone has failed.%f"
fi
source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#source <(kubectl completion zsh)

zplugin light zdharma-continuum/fast-syntax-highlighting
zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
zplugin light agkozak/zsh-z

###############################################################
# => Git
###############################################################
ZSH_THEME_GIT_PROMPT_PREFIX="on  "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" "
ZSH_THEME_GIT_PROMPT_CLEAN=""

###############################################################
# => Fzf
###############################################################
export FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow -g '!{.git,node_modules,package-lock.json}/*' 2> /dev/null"
export FZF_DEFAULT_OPTS="--height 96% --reverse --preview 'cat {}'"

###############################################################
# => Aliases
###############################################################
alias git-oops="git commit --amend --no-edit"
alias git-clean-branches="git branch --merged | grep -v \* | xargs git branch -D; git remote prune origin;"
alias git-undo="git reset HEAD~1 --soft"
alias git-lastag="git describe --abbrev=0 --tags"
alias vim=nvim
alias cpf="curl https://www.4devs.com.br/ferramentas_online.php --data-raw 'acao=gerar_cpf&pontuacao=S&cpf_estado=' -s | cut -d '%' -f 1 | pbcopy -selection clipboard"
alias dotsync="sh ~/.dotfiles/scripts/revive-packages.sh && git -C ~/.dotfiles add . && git -C ~/.dotfiles commit -m 'feat: update' && git -C ~/.dotfiles push origin main"
alias ls="eza --icons -ll --sort=type --header"
alias ps="procs"
alias mypr="sh ~/.dotfiles/scripts/myprs.sh"
alias rgf='rg --files --no-ignore | rg -i '
alias tmux='tmux attach -t TMUX || tmux new -s TMUX'
alias dockerstart='sudo systemctl start docker.service'
alias prj='list_projects'
alias audio-handsfree='pacmd set-card-profile bluez_card.CC_98_8B_F5_5C_13 handsfree_head_unit'
alias audio-quality='pacmd set-card-profile bluez_card.CC_98_8B_F5_5C_13 a2dp_sink'
alias wifi-status="nmcli dev wifi list | awk '/\*/{if (NR!=1) {print \$3 \$4 \" - \" \$10}}'"
alias mini-chrome="google-chrome-stable --new-window --app="
alias cgpt='git commit -m "$(commitgpt)"'

list_projects() {
  local dir
  dir=$(find ~/workspace -maxdepth 1 -type d -exec basename {} \; | rg -v workspace | fzf +m) && cd "$HOME/workspace/$dir"
}

if uname | rg -q "Linux"; then
    alias cpf="curl https://www.4devs.com.br/ferramentas_online.php --data-raw 'acao=gerar_cpf&pontuacao=S&cpf_estado=' -s | cut -d '%' -f 1 | xclip -selection clipboard"
fi

pokemon-colorscripts -r 1 --no-title

# pnpm
export PNPM_HOME="/home/load/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
