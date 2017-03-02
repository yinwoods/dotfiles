# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="honukai"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"


# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-syntax-highlighting)

# User configuration

source $ZSH/oh-my-zsh.sh

#编辑器
export EDITOR=vim
#输入法

#关于历史纪录的配置
#
#历史纪录条目数量
export HISTSIZE=10000

#注销后保存的历史纪录条目数量
export SAVEHIST=10000

# 不记录相同历史命令
export HISTCONTROL=ignoredups

#以下字符视为单词的一部分
WORDCHARS='*?_-[]~=&;!#$%^(){}<>'
#}}}

#自动补全功能 {{{
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


#命令别名 {{{
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls -F --color=auto'
alias ll='ls -al'
alias grep='grep --color=auto'
alias la='ls -a'

alias grep="grep --color=auto"
alias -s py='vim'
alias -s c='vim'
alias -s cpp='vim'
alias -s gz='tar -xzvf'

# zsh开启vimn模式
bindkey -v
# 通过j、k浏览历史记录
bindkey '^R' history-incremental-search-backward

# SET PYTOHNPATH
export PYTHONPATH="${PYTHONPATH}:/home/yinwoods/newsinpalm"

# SET 坚果云 PATH
alias jianguoyun="cd ~/文档/我的坚果云/"

# 确保byobu不影响vim背景色
export TERM="xterm-256color"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
