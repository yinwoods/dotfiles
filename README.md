#常用的配置文件

该目录下包含一下文件/文件夹：

- .oh-my-zsh

- .zshrc

- .vimrc

使用：

`sudo apt install zsh`

# 查看已安装shell

`cat /etc/shells`

# clone配置文件

`sudo clone https://github.com/yinwoods/frequently-used-configuration.git`

# 切换当前shell为zsh，需重启后生效

`chsh -s /bin/zsh `

# 安装vim

`sudo apt install vim`

# 安装 vim 插件管理器

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

# 安装 vimrc 中的插件

`vim ~/.vimrc`

# 在 .vimrc 编辑页面中执行

`:PluginInstall`

# linux 下安装 YaHei Consolas Hybrid 字体

```SHELL
sudo mkdir -p /usr/share/fonts/vista

sudo cp YaHei\ Consolas\ Hybrid.ttf /usr/share/fonts/vista/

sudo chmod 644 /usr/share/fonts/vista/*.ttf

cd /usr/share/fonts/vista

sudo mkfontscale && sudo mkfontdir && sudo fc-cache -fv
```

# 在软件中心安装 Ubuntu Tweak 并通过该软件设置字体为 YaHei Consolas Hybrid
