#常用的配置文件

该目录下包含一下文件/文件夹：

- .oh-my-zsh
- .zshrc
- .vimrc
- .tmux.conf

- .my.cnf
- .eslintrc.json
- .htmlhintrc

使用：

建立各个dotfiles的软连接到用户主目录
`bash bootstrap`

### clone配置文件

`git clone https://github.com/yinwoods/dotfiles.git`

#### 安装zsh

`sudo apt install zsh`

#### 查看已安装shell

`cat /etc/shells`

#### 切换当前shell为zsh，需重启后生效

`chsh -s /bin/zsh `


#### 使用colorls

参考[链接🔗](https://github.com/athityakumar/colorls#usage)

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

### 安装 vim 并发插件管理器 Plug

```sh
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

### 安装 vimrc 中的插件

`vim ~/.vimrc`

### 在 .vimrc 编辑页面中执行

`:PlugInstall`

### linux 下安装 YaHei Consolas Hybrid 字体

```sh
sudo mkdir -p /usr/share/fonts/vista

sudo cp YaHei\ Consolas\ Hybrid.ttf /usr/share/fonts/vista/

sudo chmod 644 /usr/share/fonts/vista/*.ttf

cd /usr/share/fonts/vista

sudo mkfontscale && sudo mkfontdir && sudo fc-cache -fv
```

### 在软件中心安装 Ubuntu Tweak 并通过该软件设置字体为 YaHei Consolas Hybrid
