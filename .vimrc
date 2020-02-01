set nocp
execute pathogen#infect()
syntax on
filetype off
set foldmethod=syntax"
set nowrap               " don"t wrap lines
set tabstop=4            " a tab is four spaces

set clipboard=unnamed
set encoding=utf-8
set autoindent           " always set autoindenting on
setlocal spell spelllang=en_us
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set incsearch            " show search matches as you type"
set history=1000         " remember more commands and search history
set nocompatible         " dont care "
set mouse=nicr
set term=screen-256color
set wildignore=*.swp,*.bak,*.pyc,*.class
set hlsearch             " highlight search terms

set pastetoggle=<f10>
set ambiwidth = "single"
set copyindent           " copy the previous indentation on autoindenting
set rnu                  " always show line numbers
set number               " hybrid mode numbers
set synmaxcol=512        " prevent long lines from hanging vim
set shiftwidth=4         " number of spaces to use for autoindenting
set shiftround           " use multiple of shiftwidth when indenting with "<" and ">""
set showmatch            " set show matching parenthesis
set ignorecase           " ignore case when searching
set smartcase            " ignore case if search pattern is all lowercase, case-sensitive otherwise set smarttab             " insert tabs on the start of a line according to shiftwidth, not tabstop
set undolevels=1000      " use many muchos levels of undo
set title                " change the terminal"s title
set noerrorbells         " don"t beep"
set nobackup             " disable backups"
set noswapfile           " disable backups"
set relativenumber       " show line nubmer relative to cursor
set spell
set expandtab
set background=light

" add fzf to runtimepath
set rtp+=~/.fzf

" leader
let mapleader="s"
" status line fun
set statusline+=\ buffer%n      "buffer Number
set statusline+=\ %m     "modified flag
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y%=%-16(\ %l,%c-%v\ %)%P

" map down and up to up next row and down next row
nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Easy Tab navigation
nnoremap th :tabfirst<CR>
nnoremap tj :tabnext<CR>
nnoremap tk :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>:NERDTree<CR>
nnoremap tm :tabm<Space>
nnoremap td :tabclose<CR>

" show buffer list and navigate to one
nnoremap ,b :ls<CR>:buffer<Space>

" Change snipmate trigger to ,Tab
" Makes it compatible with tab completion
imap <leader><tab> <Plug>snipMateNextOrTrigger
smap <leader><tab> <Plug>snipMateNextOrTrigger

" abbreviate common typos
iabbrev thsi this
iabbrev poupup popup

" Turns on plugins
filetype plugin on

"Turns on automatic indent from plugins
filetype indent on

" Support all colors
se t_Co=16

" colorscheme Settings
set background=dark

"Set vim Colorscheme
colorscheme lucius

" UltiSnips!
let g:UltiSnipsSnippetDirectories=$HOME.'/dotfiles/.vim/bundle/snippets/'

" Overwrite Netrw default cwd to track to dir current open dir
let g:netrw_keepdir=0

" Rust
" set foldlevel
let g:rust_fold = 1
" fmt on save
let g:rustfmt_autosave = 0

let g:rust_conceal = 1


" Set tabs to two spaces
function! TwoSpace()
  setlocal shiftwidth=2
  setlocal tabstop=2
  setlocal sts=2
  setlocal expandtab
endfunction

function! KS()
    set listchars=tab:  ,trail:.,extends:#,nbsp:. "mark whitespace"
    set noexpandtab
    let g:syntastic_javascript_checkers = ['jsxhint', 'jscs']
endfunction
command! KS call KS()

" Ignore camelCase words when spell checking
fun! IgnoreCamelCaseSpell()
  syn match CamelCase /\<[A-Z][a-z]\+[A-Z].\{-}\>/ contains=@NoSpell transparent
  syn cluster Spell add=CamelCase
endfun

function! WrapIt()
  setlocal wrap
  setlocal linebreak
  setlocal textwidth=0
  setlocal wrapmargin=0
  setlocal textwidth=80
endfunction

" make yaml files always use 2 spaces
fun! Yaml()
  setlocal ts=2
  setlocal sw=2
endf

augroup Text
  autocmd!
  autocmd BufNewFile,BufReadPost *.md,*.markdown call WrapIt()
augroup END

autocmd BufRead,BufNewFile * :call IgnoreCamelCaseSpell()

" Delete trailing white space on write
func! DeleteTrailingWS()
exe "normal mz"
%s/\s\+$//ge
exe "normal `z"
endfunc
" autocmd BufWrite * :call DeleteTrailingWS()
command! DeleteTrailing call DeleteTrailingWS()

augroup JavscriptG
  autocmd!
  autocmd BufRead *.js normal zR
  autocmd BufNewFile,BufReadPost *.js,*.jsx,*.jade,*.coffee,*.json,*.scss,*.sass,*.styl call TwoSpace()
  autocmd BufNewFile,BufReadPost *.jshintrc set filetype=json
  autocmd BufNewFile,BufReadPost *.jscsrc set filetype=json
  autocmd BufNewFile,BufReadPost *.eslintrc set filetype=json
  autocmd BufNewFile,BufReadPost *.json set filetype=json
  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable "Auto collapse by indentation"
augroup END

augroup Snips
  autocmd!
  autocmd BufNewFile,BufReadPost *.snippets setlocal noet ci pi sts=0 sw=4 ts=4 listchars-=tab:>. listchars=tab:\|\ "
  autocmd BufNewFile,BufReadPost *.snippets hi SpecialKey ctermbg=NONE ctermfg=gray
augroup END

" Keeps fugitive buffers from getting out of hand
autocmd BufReadPost fugitive://* set bufhidden=delete

" Ale use eslint only for *.js files
let g:ale_linters = {'javascript': ['eslint']}

" JSON Syntax settings
let g:vim_json_syntax_concealcursor=""
let g:indentLine_noConcealCursor=""
" commands
" Convert double quotes to single quotes
command! SingleQ %s/"/'/g
command! DoubleQ %s/'/"/g

" close tab
command! Qt tabclose
function! ConvertSpace()
  set ts=4 sts=4 noet
  retab!
  set ts=2 sts=2 et
  retab
endfunction
command! TabSpaceConvert call ConvertSpace()

" set scrollfix
" Keeps cursor in middle of the screen always.
let g:scrollfix=50
let g:fixeof=0

" Nginx
au BufRead,BufNew *.nginx.conf set filetype=nginx

" avoid ugly default difftool colorscheme
if &diff
    colorscheme apprentice
endif

" vim 8.0 load all packages in ~/.vim/pack/git-plugins
packloadall
" generate helptags
silent! helptags ALL
