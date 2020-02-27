call plug#begin(stdpath('data') . '/plugged')
Plug 'ctrlpvim/ctrlp.vim'
Plug 'iCyMind/NeoSolarized'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-sleuth'
Plug 'rust-lang/rust.vim'
call plug#end()

set termguicolors
set background=dark
colorscheme NeoSolarized

" Don't write garbage files
set nobackup
set nowritebackup
set noswapfile

" Visual whitespace
set listchars=tab:>~,trail:~

" Auto-source updates to this file
autocmd bufwritepost .vimrc source $MYVIMRC

" CtrlP
let g:ctrlp_map = '<c-t>'
if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
endif

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

" Format Rust code on save
let g:rustfmt_autosave = 1
