This worked for Mac OSX:

1) install cmake, ctags
$ brew install ctags
$ brew install cmake
$ brew install vim
# be sure to create an alias to avoid to use the native MacVim

1a) if you need to use tagbar with JS you need jsctags and it require to be installed from npm
$ brew install npm
$ npm install -g git+https://github.com/ramitos/jsctags.git

2) install .vim/ and .vimrc
$ git clone https://github.com/dowhile0/dotvim
$ cd dotvim
$ git submodule init
$ git submodule update
$ vim +PluginInstall +qall
$ cd bundle
$ cd YouCompleteMe
$ ./install.py --clang-completer

3) install molokai color set
$ git clone https://github.com/tomasr/molokai
put molokai.vim inside .vim/colors/

4) if when using vim you will get the following error:
E484: Can't open file /var/folders/ ...
put as first line in .vimrc the following
set shell=/bin/bash

5) if you want to use iterm2 with molokai color scheme:
$ git clone https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes
Launch iTerm 2.
Type CMD+i (⌘+i)
Navigate to Colors tab
Click on Load Presets
Click on Import
Select the molokai.itermcolors file
Click on Load Presets and choose a color scheme

6) If vim should crash due to Python: Caught Deadly Signal ABRT
you can try to launch vim in the following way
$ DYLD_FORCE_FLAT_NAMESPACE=1 vim
or create an alias in .bashrc
alias vi='DYLD_FORCE_FLAT_NAMESPACE=1 vim'
