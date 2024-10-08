# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="yinwoods"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration
source $ZSH/oh-my-zsh.sh


#编辑器
export EDITOR=vim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

#关于历史纪录的配置
#
#历史纪录条目数量
export HISTSIZE=10000

#注销后保存的历史纪录条目数量
export SAVEHIST=10000

# 不记录相同历史命令
setopt HIST_IGNORE_DUPS

#禁用 core dumps
limit coredumpsize 0

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
#}}}

#自动补全功能
setopt AUTO_LIST
setopt AUTO_MENU

#自动补全选项
zstyle ':completion:*' verbose yes
zstyle ':completion:*' menu select
zstyle ':completion:*:*:default' force-list always
zstyle ':completion:*' select-prompt '%SSelect:  lines: %L  matches: %M  [%p]'

zstyle ':completion:*:match:*' original only
zstyle ':completion::prefix-1:*' completer _complete
zstyle ':completion:predict:*' completer _complete
zstyle ':completion:incremental:*' completer _complete _correct
zstyle ':completion:*' completer _complete _prefix _correct _prefix _match _approximate

#路径补全
zstyle ':completion:*' expand 'yes'
zstyle ':completion:*' squeeze-shlashes 'yes'
zstyle ':completion::complete:*' '\\'

#彩色补全菜单
export ZLSCOLORS="${LS_COLORS}"
zmodload zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#修正大小写
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'

#命令别名
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F'
alias ll='ls -al'
alias la='ls -a'
alias diff='difft'
alias grep="grep --color=auto"
alias -s py='vim'
alias -s c='vim'
alias -s cpp='vim'
alias -s gz='tar -xzvf'
alias v=nvim
alias vi=nvim
alias vim=nvim
alias sv='vim -u ~/.SpaceVim/vimrc'
alias copy="pbcopy"
alias paste="pbpaste"
alias lg='lazygit'
alias time='gtime'
# 设置mysql使用mycli
# 设置psql使用pgcli
alias mysql="mycli"
alias psql="pgcli"

# 一键恢复工作环境
alias work="tmux -CC attach || tmux -CC"

# 设置docker-compose docker-machine简称
alias d-c='docker-compose'
alias d-m='docker-machine'

# 设置ipython为ptpython
alias ipython=ptpython
alias ipython3=ptpython3
alias mvn3.2=/usr/local/Cellar/maven@3.2/3.2.5_1/bin/mvn

alias kc=kubectl
alias ls=eza
alias grep=rg
alias help=tldr
alias e=exit

alias pts="cd $HOME/dev/java/pts/"
alias ahas="cd $HOME/dev/java/ahas/"
alias dev="cd $HOME/dev/"
alias amazon="cd $HOME/dev/java/amazon/"
alias mw="cd $HOME/dev/java/mw/"
alias sre="cd $HOME/dev/java/sre/"
alias ai="cd $HOME/dev/java/ai/"
alias apsara="cd $HOME/dev/java/apsara/"

#漂亮又实用的命令高亮界面
setopt extended_glob
 TOKENS_FOLLOWED_BY_COMMANDS=('|' '||' ';' '&' '&&' 'sudo' 'do' 'time' 'strace')

 recolor-cmd() {
     region_highlight=()
     colorize=true
     start_pos=0
     for arg in ${(z)BUFFER}; do
         ((start_pos+=${#BUFFER[$start_pos+1,-1]}-${#${BUFFER[$start_pos+1,-1]## #}}))
         ((end_pos=$start_pos+${#arg}))
         if $colorize; then
             colorize=false
             res=$(LC_ALL=C builtin type $arg 2>/dev/null)
             case $res in
                 *'reserved word'*)   style="fg=magenta,bold";;
                 *'alias for'*)       style="fg=cyan,bold";;
                 *'shell builtin'*)   style="fg=yellow,bold";;
                 *'shell function'*)  style='fg=green,bold';;
                 *"$arg is"*)
                     [[ $arg = 'sudo' ]] && style="fg=red,bold" || style="fg=blue,bold";;
                 *)                   style='none,bold';;
             esac
             region_highlight+=("$start_pos $end_pos $style")
         fi
         [[ ${${TOKENS_FOLLOWED_BY_COMMANDS[(r)${arg//|/\|}]}:+yes} = 'yes' ]] && colorize=true
         start_pos=$end_pos
     done
 }
check-cmd-self-insert() { zle .self-insert && recolor-cmd }
check-cmd-backward-delete-char() { zle .backward-delete-char && recolor-cmd }

zle -N self-insert check-cmd-self-insert
zle -N backward-delete-char check-cmd-backward-delete-char


# zsh开启vimn模式
bindkey -v
# 通过j、k浏览历史记录
bindkey '^R' history-incremental-search-backward
# esc+v 使用vim编辑当前命令
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# 确保byobu不影响vim背景色
export TERM="xterm-256color"

# 配置rust cargo路径
export PATH="$HOME/.cargo/bin:$PATH"

# 优先使用/usr/local/bin目录
export PATH="/usr/local/bin:HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:/Users/yinwoods/Library/Python/3.7/bin:$PATH"

# 设置python的默认交互为ptpython
export PYTHONSTARTUP="$HOME/.ptpython/config.py"


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# 激活本地python
source $HOME/dev/python/bin/activate
export GOPATH="$HOME/dev/go"
export GOBIN="$(go env GOPATH)/bin"
# turn off go module
export GO111MODULE=on
export GOPROXY=https://goproxy.cn
export PATH="$(go env GOBIN):$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8


# 使用pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
# eval "$(pyenv init -)"

# datetime 转 unixtime
function datetime() {
    var="$@"
    date -j -f "%Y-%m-%d %H:%M:%S" $var +%s
}

function sshct() {
    var="$@"
    ssh chengtao.yct@${var}
}

function sshama() {
    var="$@"
    ssh -i ~/.ssh/amazon/amazon_test.pem -o StrictHostKeychecking=no -o UserKnownHostsFile=/dev/null root@${var}
}

# lima path
export PATH=/usr/local/Cellar/lima-0.12.0-Darwin-x86_64/bin:$PATH

# graalvm path
# export PATH=/Library/Java/JavaVirtualMachines/graalvm-ce-java11-22.0.0.2/Contents/Home/bin:$PATH

# java
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_201.jdk/Contents/Home
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-11.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-21.0.2.jdk/Contents/Home
# export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-21.jdk/Contents/Home
# export JAVA_HOME=/Users/yinwoods/Library/Java/JavaVirtualMachines/openjdk-17.0.2/Contents/Home

# homebrew 加速
export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.ustc.edu.cn/brew.git"
export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.ustc.edu.cn/homebrew-core.git"
export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles"
export HOMEBREW_API_DOMAIN="https://mirrors.ustc.edu.cn/homebrew-bottles/api"

# sudoedit
export SUDO_EDITOR="nvim"
alias "sudoedit"='function _sudoedit(){sudo -e "$1";};_sudoedit'

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# use starship
eval "$(starship init zsh)"

# trace starship
# export STARSHIP_LOG=trace starship timings

# Created by `pipx` on 2024-04-15 04:12:16
export PATH="$PATH:/Users/yinwoods/.local/bin"
