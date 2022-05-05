" turn off Vi compatibility to enable Vim features. should be done by default,
" but better safe than sorry
set nocompatible

"####################### Vi Compatible (~/.exrc) #######################

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" activate line numbers
set number

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

" set tabs to 4 wide. changes the display width of the tab character
set tabstop=4

"------------------------------------------------------------------------------

" sets tab insertions to 4 width. changes the number of tabs/spaces added when
" the tab key is pressed during text editing operations
set softtabstop=4

" changes the amount of spaces text is shifted with '<<' and '>>' operations 
set shiftwidth=4

" replace tabs with spaces automatically
set expandtab

" enable smart auto indenting when starting a new line
set smartindent

" let vim automatically use the proper indent plugin. fixes comment
" indentation issue with python
filetype indent on

" Handled differences between tabstop and shiftwidth if necessary
set smarttab

" enough for line numbers + gutter within 80 standard
set textwidth=80

" disable relative line numbers, remove no to sample it
set norelativenumber

if v:version >= 800
  " stop vim from silently messing with files that it shouldn't
  set nofixendofline

  " better ascii friendly listchars
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

  " Disable automatic folding
  set foldmethod=manual
  set nofoldenable
endif

" mark trailing spaces as errors
if has("match")
  match ErrorMsg '\s\+$'
endif

" enable icon
set icon

" highlight search hits
set hlsearch
set incsearch
set linebreak

" avoid most of the 'Hit Enter ...' message
set shortmess=aoOtTI

" start at last place you were editing
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" wrap around when searching
set wrapscan

" command history
set history=100

" needed by plugins
if has("syntax")
  syntax enable
endif

" faster scrolling
set ttyfast

" allow sensing the filetype
filetype plugin on

" Edit/Reload vimr configuration file
nnoremap confe :e $HOME/.vimrc<CR>
nnoremap confr :source $HOME/.vimrc<CR>

" only load plugins if Plug detected
if filereadable(expand("~/.vim/autoload/plug.vim"))
    call plug#begin('~/.local/share/vim/plugins')
    " PLUGINS GO HERE
    call plug#end()
endif

" better command-line completion
set wildmenu

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
    set termguicolors
endif

" high contrast 
set background=dark
