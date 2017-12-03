
rm -f ~/.my.cnf
ln -s $PWD/my.cnf ~/.my.cnf

rm -f ~/.tmux.conf
ln -s $PWD/tmux.conf ~/.tmux.conf

rm -f ~/.vimrc
ln -s $PWD/vimrc ~/.vimrc

rm -f ~/.zshrc
ln -s $PWD/zshrc ~/.zshrc

rm -rf ~/.pip
mkdir -p ~/.pip
ln -s $PWD/pip.conf ~/.pip/pip.conf

rm -f ~/.config/flake8
mkdir -p ~/.config
ln -s $PWD/flake8 ~/.config/flake8

rm -rf ~/.ptpython
mkdir -p ~/.ptpython
ln -s $PWD/ptpythonrc ~/.ptpython/config.py

git submodule init
git submodule update

# 建立nvim到vim的软连接
rm -rf ~/.config/nvim/autoload
rm -f ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/autoload
ln -s $PWD/vimrc ~/.config/nvim/init.vim
cp $PWD/.vim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim

rm -rf ~/.oh-my-zsh
cp yinwoods-iterm-zsh/yinwoods.zsh-theme oh-my-zsh/themes/
cp -r $PWD/oh-my-zsh ~/.oh-my-zsh
rm -rf ~/.vim
cp -r .vim ~/.vim
