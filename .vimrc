" Vundle
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-sleuth'
Plugin 'rust-lang/rust.vim'

call vundle#end()
filetype plugin indent on
" Vundle end

" Solarized
syntax enable
set background=dark
colorscheme solarized

" Don't write garbage files
set nobackup
set nowritebackup
set noswapfile

" Visual whitespace
set listchars=tab:>∙,trail:∙

" Auto-source updates to this file
autocmd bufwritepost .vimrc source $MYVIMRC

" Map CtrlP plugin to Ctrl-T
let g:ctrlp_map = '<c-t>'

" Force the habit
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Don't screw up code pasting
set pastetoggle=<F5>