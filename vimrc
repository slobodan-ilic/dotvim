" Allow project specific .vimrc files
set exrc
set secure

execute pathogen#infect()
syntax on
filetype plugin indent on

autocmd VimEnter * silent exec "! echo -ne '\e[1 q'"
autocmd VimLeave * silent exec "! echo -ne '\e[5 q'" 
autocmd FileType javascript setlocal softtabstop=2 shiftwidth=2 smarttab

set encoding=utf8
set mouse=nicr

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '\.swp$', '\venv*$', '\.egg-info$']
let NERDTreeShowLineNumbers = 1
autocmd FileType nerdtree setlocal relativenumber
" let g:NERDTreeDirArrowExpandable = '+'
" let g:NERDTreeDirArrowCollapsible = '~'

set number relativenumber
:map <C-j> :%!python -m json.tool<Enter>
set clipboard=unnamed

nmap ,n :NERDTreeFind<CR>
nmap ,m :NERDTreeToggle<CR>
set hlsearch

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

autocmd BufRead,BufNewFile *.py setlocal cursorline cursorcolumn colorcolumn=89
autocmd BufRead,BufNewFile *.py hi ColorColumn ctermbg=grey
set wildmenu
set wildmode=full

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_checkers = ['flake8', 'pylint']

set dip+=vertical
set statusline=%<%f\ %h%m%r%{FugitiveStatusline()}%=%-14.(%l,%c%V%)\ %P

" black
autocmd BufWritePre *.py execute ':Black'

" ctrlp
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|pyC)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
