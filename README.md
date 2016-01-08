This worked for Mac OSX:

1) install cmake, ctags
brew install ctags
brew install cmake

2) install .vim/ and .vimrc
git clone https://github.com/dowhile0/dotvim
cd dotvim
git submodule init
git submodule update
vim +PluginInstall +qall
cd bundle
cd YouCompleteMe
./install.py --clang-completer

3) install molokai color set
put molokai.vim inside .vim/colors/

git clone https://github.com/tomasr/molokai

4) if when using vim you will get the following error:
E484: Can't open file /var/folders/ ...
put as first line in .vimrc the following
set shell=/bin/bash
