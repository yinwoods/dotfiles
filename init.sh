
# 配置mycli
rm -f $HOME/.my.cnf
rm -f $HOME/.myclirc
ln -s $PWD/.my.cnf $HOME/.my.cnf
ln -s $PWD/.myclirc $HOME/.myclirc

rm -f $HOME/.tmux.conf
ln -s $PWD/.tmux.conf $HOME/.tmux.conf

rm -f $HOME/.zshrc
ln -s $PWD/.zshrc $HOME/.zshrc

rm -rf $HOME/.pip
ln -s $PWD/.pip $HOME/.pip

rm -rf $HOME/.ptpython
ln -s $PWD/.ptpython $HOME/.ptpython

rm -f $HOME/.vimrc
ln -s $PWD/.config/nvim/init.vim $HOME/.vimrc

# neovim 安装vim-plug插件
curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# vim 安装vim-plug插件
curl -fLo $HOME/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s $PWD/.config $HOME/.config

rm -rf $HOME/.oh-my-zsh
ln -s $PWD/.oh-my-zsh $HOME/.oh-my-zsh

rm -rf $HOME/.vim
ln -s $PWD/.vim $HOME/.vim
git submodule update --init --recursive
git submodule update

# 安装ycmd
python3 .vim/plugged/YouCompleteMe/install.py --clang-completer
