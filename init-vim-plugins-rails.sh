#!/bin/bash
sudo apt-get -y install unzip
mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
echo "execute pathogen#infect()" >> ~/.vimrc
echo "syntax on" >> ~/.vimrc
echo "filetype plugin indent on" >> ~/.vimrc
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-scriptease.git
git clone git://github.com/vim-ruby/vim-ruby.git
git clone git://github.com/tpope/vim-rake.git
git clone git://github.com/tpope/vim-rails.git
git clone git://github.com/tpope/vim-bundler.git
git clone git://github.com/scrooloose/nerdtree.git
git clone git://github.com/tpope/vim-abolish.git
git clone git://github.com/tpope/vim-sensible.git
wget -O ~/dbext_1800.zip http://www.vim.org/scripts/download_script.php?src_id=19052
unzip -o ~/dbext_1800.zip -d ~/.vim
echo "TO DO : run vim, then execute \":Helptags\""
