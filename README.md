This worked for Mac OSX:

# install cmake, ctags
$ brew install ctags
$ brew install cmake

# install .vim/ and .vimrc
$ git clone https://github.com/dowhile0/dotvim
$ cd dotvim
$ git submodule init
$ git submodule update
$ vim +PluginInstall +qall
$ cd bundle
$ cd YouCompleteMe
$ ./install.py --clang-completer

# install molokai color set
# put molokai.vim inside .vim/colors/
$ git clone https://github.com/tomasr/molokai

# if when using vim you will get the following error:
# E484: Can't open file /var/folders/ ...
# put as first line in .vimrc the following
# set shell=/bin/bash
