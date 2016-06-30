LIST OF STEPS TO PREPARE MY HOME DOTFILES
(This worked for Mac OSX)

### Install iTerm2:
if you want to use iterm2 with molokai color scheme:
$ git clone https://github.com/mbadolato/iTerm2-Color-Schemes/tree/master/schemes
Launch iTerm 2.
Type CMD+i (⌘+i)
Navigate to Colors tab
Click on Load Presets
Click on Import
Select the molokai.itermcolors file
Click on Load Presets and choose a color scheme
Change the cursor text and cursor color to red/yellow make it more visible

### Install oh-my-zsh
zsh --version (required 4.3.9 or more recent)
$ sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
to install 'zsh-syntax-highlighting':
$ git clone git://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
remember that 'zsh-syntax-highlighting' must be the last plugin on the list
colorize requires pygmentize:
$ pip install Pygments
edit .zshrc
plugins: git osx sudo brew aws colored-man-pages colorize zsh-syntax-highlighting
theme: obraun

### Configure Vim 
1) install cmake, ctags <-- required for tagbar
$ brew install ctags
$ brew install cmake
$ brew install vim
# be sure to create an alias to avoid to use the native MacVim

# Install VimCat
$ brew install vimpager
In your ~/.zshrc add the following:

export PAGER=/usr/local/bin/vimpager
alias less=$PAGER
alias zless=$PAGER

### This never worked for me
if you need to use tagbar with JS you need jsctags and it require to be installed from npm
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

# Compile color_coded << plugin for vim
https://github.com/jeaye/color_coded

3) install molokai color set
$ git clone https://github.com/tomasr/molokai .vim/colors/
put molokai.vim inside .vim/colors/

4) install correct fonts for bling/vim-airliner
git clone https://github.com/powerline/fonts
cd fonts
./install.sh
Modify iTerm2 configuration to enable new fonts:
Go to profiles -> Default -> Terminal -> Check silence bell
Change the cursor text and cursor color to red/yellow make it more visible
Change the font to 14pt Source Code Pro / Sauce Code.

### Errors
If when using vim you will get the following error:
E484: Can't open file /var/folders/ ...
put as first line in .vimrc the following
set shell=/bin/zsh

If vim should crash due to Python: Caught Deadly Signal ABRT
you can try to launch vim in the following way
$ DYLD_FORCE_FLAT_NAMESPACE=1 vim (if it works create an alias in .zshrc)
alias vi="DYLD_FORCE_FLAT_NAMESPACE=1 vim"

### irssi
If you are presented with an error regarding SSL certs, you are missing the curl-ca-bundle package. You can execute the following script on your host to fix the issue. After running the script close, then re-open irssi

For a Mac, use the following:

#!/bin/bash
# Taken from https://gist.github.com/1stvamp/2158128
mkdir /tmp/curl-ca-bundle
cd /tmp/curl-ca-bundle
wget http://curl.haxx.se/download/curl-7.22.0.tar.bz2
tar jxf curl-7.22.0.tar.bz2
cd curl-7.22.0/lib/
./mk-ca-bundle.pl
if [ ! -d /usr/share/curl/ ]; then
	sudo mkdir -p /usr/share/curl/
else
	sudo mv /usr/share/curl/ca-bundle.crt /usr/share/curl/ca-bundle.crt.original
fi
sudo mv ca-bundle.crt /usr/share/curl/ca-bundle.crt
echo
echo "Done!"
