rm -f ~/.my.cnf
ln -s my.cnf ~/.my.cnf

rm -f ~/.tmux.conf
ln -s tmux.conf ~/.tmux.conf

rm -f ~/.vimrc
ln -s vimrc ~/.vimrc

rm -f ~/.zshrc
ln -s zshrc ~/.zshrc

rm -rf ~/.pip
mkdir -p ~/.pip
ln -s pip.conf ~/.pip/pip.conf

rm -f ~/.config/flake8
mkdir -p ~/.config
ln -s flake8 ~/.config/flake8

rm -rf ~/.ptpython
mkdir -p ~/.ptpython
ln -s ptpythonrc ~/.ptpython/config.py

git submodule init
git submodule update

# 建立nvim到vim的软连接
rm -rf ~/.config/nvim/autoload
rm -f ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/autoload
ln -s vimrc ~/.config/nvim/init.vim
cp ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim

rm -rf ~/.oh-my-zsh
cp yinwoods-iterm-zsh/yinwoods.zsh-theme oh-my-zsh/themes/
cp -r oh-my-zsh ~/.oh-my-zsh
rm -rf ~/.vim
cp -r .vim ~/.vim
