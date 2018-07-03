
install_file()
{
    src=`pwd`"/"$1
    des="$HOME/$1"
    if [-e $des ]; then
        mv -f $des $des".bak"
    fi
    rm -f $des
    ln -s $src $des
}

if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    chmod 0700 ~/.ssh
fi

# 配置mycli
install_file .my.cnf
install_file .myclirc
install_file .tmux.conf
install_file .zshrc
install_file .pip
install_file .ptpython
install_file init.vim
install_file .config
install_file .oh-my-zsh
install_file .vim

chmod 0600 ~/.ssh/config
pip3 install ptpython


# neovim 安装vim-plug插件
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim 安装vim-plug插件
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git submodule update --init --recursive

# 安装ycmd
python3 .vim/plugged/YouCompleteMe/install.py --clang-completer
