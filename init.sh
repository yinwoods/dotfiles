ln -s .eslintrc.js ~/.eslintrc.js
ln -s .htmlhintrc ~/.htmlhintrc
ln -s .my.cnf ~/.my.cnf
ln -s .tmux.conf ~/.tmux.conf
ln -s .vimrc ~/.vimrc
ln -s .zshrc ~/.zshrc
ln -s flake8 ~/.config/flake8

mkdir -p ~/.ptpython
ln -s .ptpythonrc ~/.ptpython/config.py

git submodule init
git submodule update

# 建立nvim到vim的软连接
mkdir -p ~/.config/nvim/autoload
ln -s ~/.vimrc ~/.config/nvim/init.vim
ln -s ~/.vim/autoload/plug.vim ~/.config/nvim/autoload/plug.vim

cp yinwoods-iterm-zsh/yinwoods.zsh-theme oh-my-zsh/themes/
cp -r oh-my-zsh ~/.oh-my-zsh
cp -r .vim ~/.vim
