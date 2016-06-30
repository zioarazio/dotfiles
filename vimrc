set shell=/bin/zsh

set nocompatible              " be iMproved, required
" filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" Colorscheme
Plugin 'flazz/vim-colorschemes', {'name': 'colorschemes'}
" Coloresque
Plugin 'gorodinskiy/vim-coloresque.git', {'name': 'coloresque'}
" Airline & Co.
Plugin 'bling/vim-airline'
Plugin 'paranoida/vim-airlineish'
Plugin 'edkolev/promptline.vim'
Plugin 'edkolev/tmuxline.vim'
" NERDTree
Plugin 'scrooloose/nerdtree'
" Wiki
Plugin 'vimwiki/vimwiki'
" Search plugins
" search filesystem with ctrl+p
Plugin 'ctrlpvim/ctrlp.vim'
" FoldSearch
Plugin 'embear/vim-foldsearch'

" Autocomplete (must be compiled)
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
" Fugitive GIT plugin
Plugin 'tpope/vim-fugitive'
" Tagbar
Plugin 'majutsushi/tagbar'
" Syntastics
Plugin 'scrooloose/syntastic'

" Snippets
" Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" supertab makes YCM compatible with ultisnips
Plugin 'ervandew/supertab'

" General coding helpers
Plugin 'jeaye/color_coded'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'airblade/vim-gitgutter'
" Python plugins
Plugin 'nvie/vim-flake8'
" C/C++/ObjC Plugins
Plugin 'lfilho/cosco.vim' " Add a ; at the end of line by pressing <leader> ;
Plugin 'rhysd/vim-clang-format'
" GoLang plugins
Plugin 'fatih/vim-go'

" Tmux integration plugins
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'christoomey/vim-tmux-runner.git'
Plugin 'christoomey/vim-run-interactive'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

if !has("gui_running")
    set term=xterm
else
    set term=screen
endif
set exrc
set secure

" Leader - ( Spacebar )
let mapleader = " "

" General TAB settings
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set backspace=2   " Backspace deletes like most programs in insert mode
set history=50
set autoread      " Reload files changed outside vim

"Allow usage of mouse in iTerm
set ttyfast
set mouse=a

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Numbers
set number
set numberwidth=5

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Auto resize Vim splits to active split
"set winwidth=84
"set winheight=5
"set winminheight=5
"set winheight=999

" ================ Scrolling ========================

set scrolloff=3         "Start scrolling when we're 8 lines away from margins
set sidescrolloff=8
set sidescroll=1

"Toggle relative numbering, and set to absolute on loss of focus or insert mode
set rnu
function! ToggleNumbersOn()
    set nu!
    set rnu
endfunction
function! ToggleRelativeOn()
    set rnu!
    set nu
endfunction
autocmd FocusLost * call ToggleRelativeOn()
autocmd FocusGained * call ToggleRelativeOn()
autocmd InsertEnter * call ToggleRelativeOn()
autocmd InsertLeave * call ToggleRelativeOn()

" Navigate properly when lines are wrapped
nnoremap j gj
nnoremap k gk

" Use tab to jump between blocks, because it's easier
nnoremap <tab> %
vnoremap <tab> %

" Always use vertical diffs
set diffopt+=vertical

""" SYSTEM CLIPBOARD COPY & PASTE SUPPORT
set pastetoggle=<F2> "F2 before pasting to preserve indentation
"Copy paste to/from clipboard
vnoremap <C-c> "*y
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"
"map <silent><C-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"
" For the Mac
vnoremap <D-c> "*y
map <silent><D-v> :set paste<CR>o<esc>"*]p:set nopaste<cr>"

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

" Set find highlight
set hlsearch
nnoremap <leader>/ :nohlsearch<CR><CR>

""" MORE AWESOME HOTKEYS
"
"
" Run the q macro
nnoremap <leader>q @q
" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" bind \ (backward slash) to grep shortcut
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

"Map Ctrl + S to save in any mode
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>
" Also map leader + s
map <leader>s <C-S>

" Quickly close windows
nnoremap <leader>x :x<cr>
nnoremap <leader>X :q!<cr>

" zoom a vim pane, <C-w>= to re-balance
nnoremap <leader>- :wincmd _<cr>:wincmd \|<cr>
nnoremap <leader>= :wincmd =<cr>

" resize panes
nnoremap <silent> <Right> :vertical resize +2<cr>
nnoremap <silent> <Left> :vertical resize -2<cr>
nnoremap <silent> <Up> :resize +2<cr>
nnoremap <silent> <Down> :resize -2<cr>

inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Switch between buffers
nnoremap <leader>1 :buffer 1<cr>
nnoremap <leader>2 :buffer 2<cr>
nnoremap <leader>3 :buffer 3<cr>
nnoremap <leader>4 :buffer 4<cr>
nnoremap <leader>5 :buffer 5<cr>
nnoremap <leader>6 :buffer 6<cr>
nnoremap <leader>7 :buffer 7<cr>
nnoremap <leader>8 :buffer 8<cr>
nnoremap <leader>9 :buffer 9<cr>

" AUTOCOMMANDS - Do stuff

" Save whenever switching windows or leaving vim. This is useful when running
" the tests inside vim without having to save all files first.
au FocusLost,WinLeave * :silent! wa

" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

"update dir to current file
autocmd BufEnter * silent! cd %:p:h

" Colorscheme
set t_Co=256
colorscheme molokai

" Airline & Co.
" Enable statusbar (AirLine)
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#left_sep = ' ' 
let g:airline#extensions#tabline#left_alt_sep = '|' 

let g:airline_powerline_fonts = 1 

set laststatus=2
"let g:airline_theme = 'airlineish'
"let g:airline_theme = 'bubblegum'
let g:airline_theme = 'dark'
let g:airline_powerline_fonts = 1 
" Show buffer number
let g:airline#extensions#tabline#buffer_nr_show = 1
" Enable Syntastic
" let g:airline#extensions#syntastic = 1
" Enable fugitive branch
let g:airline#extensions#branch#enable = 1

" Syntastics
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Disable syntastic (enable on a per filetype basis)
let g:syntastic_check_on_open = 0
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_wq = 0
"
" let g:syntastic_python_python_exec = '/usr/bin/python3'
" let g:syntastic_python_checkers = ['flake8', 'python']

" Allow moving around between Tmux windows
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1
"
"Open a tmux pane with Node
"nnoremap <leader>node :VtrOpenRunner {'orientation': 'h', 'percentage': 50, 'cmd': 'node'}<cr>

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_working_path_mode = 'r'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Set ultisnips triggers
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
"let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
"let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
"let g:SuperTabDefaultCompletionType = '<C-n>'

" YouCompleteMe options

let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:Show_diagnostics_ui = 1 "default 1

" "will put icons in Vim's gutter on lines that have a diagnostic set.
" "Turning this off will also turn off the YcmErrorLine and YcmWarningLine
" "highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 1
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 1 "default 0
let g:ycm_path_to_python_interpreter = '/usr/bin/python'

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info


let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1


let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

" " Set Warning/Error lines background
hi YcmErrorLine guibg=#3f0000
hi YcmWarningLine guibg=#3f3f00


nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>


" Configure NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Configure Tagbar
map <C-t> :TagbarToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:Tagbar") && b:Tagbar == "primary") | q | endif

" Cursor color
"Set default font in mac vim and gvim
set guifont=Meslo\ LG\ S\ DZ\ for\ Powerline:h14
set cursorline
set cursorcolumn
hi CursorLine   cterm=NONE ctermbg=235 ctermfg=white guibg=NONE guifg=NONE gui=underline term=underline
hi CursorColumn cterm=NONE ctermbg=235 ctermfg=white guifg=NONE
set encoding=utf8
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=grey

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

" Fix background color for molokai colorscheme
if colors_name == "molokai"
    hi Normal ctermbg=black guibg=black
endif

" If in TMUX open a shell below
nnoremap <leader>sh :VtrOpenRunner {'orientation': 'v', 'percentage': 20}<cr>

