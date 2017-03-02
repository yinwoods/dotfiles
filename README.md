#常用的配置文件

该目录下包含一下文件/文件夹：

- .oh-my-zsh

- .zshrc

- .vimrc

使用：

### clone配置文件

`git clone https://github.com/yinwoods/frequently-used-configuration.git`

#### 安装zsh

`sudo apt install zsh`

#### 查看已安装shell

`cat /etc/shells`

#### 切换当前shell为zsh，需重启后生效

`chsh -s /bin/zsh `

#### 拷贝oh-my-zsh到home目录

`cp -r oh-my-zsh ~/.oh-my-zsh`


### 安装vim8.0

#### 克隆vim8.0源码

`git clone https://github.com/vim/vim`

#### 编译安装vim8.0

```

cd vim

./configure --with-features=huge \
            --enable-multibyte \
            --enable-rubyinterp \
            --enable-pythoninterp \
            --with-python-config-dir=/usr/lib/python2.7/config-i386-linux-gnu \
            --enable-python3interp \ 
            --with-python3-config-dir=/usr/lib/python3.5/config-3.5m-i386-linux-gnu \ 
            --enable-gui=gtk2  \ 
            --enable-cscope \ 
            --prefix=/usr

make

sudo make install

```

### 安装 vim 并发插件管理器 Plug

`curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`

### 安装 vimrc 中的插件

`vim ~/.vimrc`

### 在 .vimrc 编辑页面中执行

`:PlugInstall`

### linux 下安装 YaHei Consolas Hybrid 字体

```SHELL
sudo mkdir -p /usr/share/fonts/vista

sudo cp YaHei\ Consolas\ Hybrid.ttf /usr/share/fonts/vista/

sudo chmod 644 /usr/share/fonts/vista/*.ttf

cd /usr/share/fonts/vista

sudo mkfontscale && sudo mkfontdir && sudo fc-cache -fv
```

### 在软件中心安装 Ubuntu Tweak 并通过该软件设置字体为 YaHei Consolas Hybrid
