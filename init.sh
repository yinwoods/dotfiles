
install_file()
{
    src=`pwd`"/"$1
    des="$HOME/$2"
    if [ -e $des ]; then
        mv -f $des $des".bak"
    fi
    rm -f $des
    ln -s $src $des
}

if [ ! -d ~/.ssh ]; then
    mkdir ~/.ssh
    chmod 0700 ~/.ssh
fi

# install prog
curl -sL git.io/vXTo7 | bash
# install neovim
curl -sL git.io/vXToq | bash

# 配置mycli
install_file .my.cnf .my.cnf
install_file .myclirc .myclirc
install_file .tmux.conf .tmux.conf
install_file .zshrc .zshrc
install_file .pip .pip
install_file .ptpython .ptpython
install_file init.vim .config/nvim/init.vim
install_file after .config/nvim/after
install_file .config .config
install_file .oh-my-zsh .oh-my-zsh
install_file .vim .vim
install_file .gitconfig .gitconfig

chmod 0600 ~/.ssh/config
pip3 install ptpython


# neovim 安装vim-plug插件
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim 安装vim-plug插件
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

cd $HOME/.vim/plugged/YouCompleteMe && git submodule update --init --recursive && python3 install.py --clang-completer
