# 常用的配置文件

![dotfiles-bg.jpg](https://gist.githubusercontent.com/yinwoods/4f8362faeb0a4a1f32fa8d3c97c7d24e/raw/a8a0cd7c1f068254669ff88064a3a1fcfbfb161e/dotfiles-bg.jpg<Paste>)

该目录下包含一下文件/文件夹：

* .oh-my-zsh
* .zshrc
* .vimrc
* .tmux.conf
* .pip.conf
* init.sh
* .my.cnf

会为以下软件配置：

* zsh
* vim/nvim
* tmux
* pip
* mycli

使用：

### clone配置文件

`git clone https://github.com/yinwoods/dotfiles.git`

### 傻瓜式安装

`bash init.sh`

#### 安装zsh

`brew install zsh`

#### 切换当前shell为zsh，需重启后生效

`chsh -s /bin/zsh `

### 安装neovim

For Mac

```Shell
brew install neovim/neovim/neovim
```

For Ubuntu

```Shell
sudo apt install software-properties-common
sudo apt install python-software-properties
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install neovim
sudo apt install python-dev python-pip python3-dev python3-pip
```
