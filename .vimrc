execute pathogen#infect()
" original syntax setting
" syntax on
" try slm syntax highlighting syntax setting
syntax enable
filetype off
" try slm syntax highlighng filetyp setting
filetype plugin indent on
"set foldmethod=syntax"
set nowrap               " don"t wrap lines
set tabstop=4            " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode

set encoding=utf-8
set ambiwidth = "single"
set autoindent           " always set autoindenting on
set copyindent           " copy the previous indentation on autoindenting
set rnu                  " always show line numbers
set number               " hybrid mode numbers
set synmaxcol=512        " prevent long lines from hanging vim
set shiftwidth=4         " number of spaces to use for autoindenting
set shiftround           " use multiple of shiftwidth when indenting with "<" and ">""
set showmatch            " set show matching parenthesis
set ignorecase           " ignore case when searching
set smartcase            " ignore case if search pattern is all lowercase, case-sensitive otherwise set smarttab             " insert tabs on the start of a line according to shiftwidth, not tabstop
set hlsearch             " highlight search terms
set incsearch            " show search matches as you type"
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal"s title
set visualbell           " don"t beep
set noerrorbells         " don"t beep"
set nocompatible         " dont care "
set nobackup             " disable backups"
set clipboard=unnamed    " allow copy to clipboard "
set noswapfile           " disable backups"
set relativenumber       " show line nubmer relative to cursor
set runtimepath^=~/.vim/bundle/ctrlp.vim
set spell
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set mouse=nicr
setlocal spell spelllang=en_us
set expandtab
set nomodeline           " stops reading beginning and end lines of a file
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:. "mark whitespace"
set term=screen-256color

" Leader Key to ","
let mapleader=","

" remappings
inoremap jj <ESC>
inoremap kk <ESC>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
  let @/ = ''
  if exists('#auto_highlight')
    au! auto_highlight
    augroup! auto_highlight
    setl updatetime=4000
    echo 'Highlight current word: off'
    return 0
  else
    augroup auto_highlight
      au!
      au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
    augroup end
    setl updatetime=500
    echo 'Highlight current word: ON'
    return 1
  endif
endfunction

" ,ev to edit vim, ,sv to source vim
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

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

" make Q save and quite
" nnoremap <silent> Q ZZ

" remap ; to ; to save a button press
nnoremap ; :

" show buffer list and navigate to one
nnoremap ,b :ls<CR>:buffer<Space>

" vertical resize
nnoremap ,vz :vertical<Space>resize<Space>
" Change snipmate trigger to ,Tab
" Makes it compatible with tab completion
imap <leader><tab> <Plug>snipMateNextOrTrigger
smap <leader><tab> <Plug>snipMateNextOrTrigger

" Turns on plugins
filetype plugin on

"Turns on automatic indent from plugins
filetype indent on
" Change defualt tex output to PDF
let g:Tex_DefaultTargetFormat="pdf"
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
let g:Tex_ViewRule_pdf="preview"
set grepprg=grep\ -nH\ $*

" Support all colors
se t_Co=16

" Solarized Settings
set background=dark
" This Sets Solarized theme values in VIM
"let g:solarized_termtrans=1
let g:solarized_termcolors=256
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"

"Set vim Colorscheme
colorscheme solarized

" Toggle Solarized background
" call togglebg#map("<F5>")

" Syntastic Settings
let g:syntastic_mode_map={"mode": "active","active_filetypes": ["vim"],"passive_filetypes": []}"
let g:syntastic_check_on_open = 1 " Checks file when loaded into buffer
let g:syntastic_error_symbol="✗"
let g:syntastic_warning_symbol="W"
let g:jshint_highlight_color ="Red"
let g:syntastic_html_checkers = ['tidy']
let g:syntastic_html_tidy_ignore_errors = [" proprietary attribute \"ng-"]"]
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jscs_args = '--esprima=esprima-fb --esnext'

" UltiSnips!
let g:UltiSnipsSnippetDirectories=$HOME.'/dotfiles/bundle/my-snips/'

" Overwrite Netrw default cwd to track to dir current open dir
let g:netrw_keepdir=0

" Set tabs to two spaces
function! TwoSpace()
  setlocal shiftwidth=2
  setlocal tabstop=2
  setlocal sts=2
  setlocal expandtab
endfunction

" Set bar at max width in accordance with Google style guide
" aka Closure linter
function! ClosureIt()
    " setlocal textwidth=80
    setlocal colorcolumn=+1
    " hi ColorColumn  ctermbg=246
    " hi OverLength   ctermfg=125 ctermbg=250
    " match OverLength /\%>80v.\+/
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
  autocmd BufNewFile,BufReadPost *.js,*.jsx call ClosureIt()
  autocmd BufNewFile,BufReadPost *.jsx let b:syntastic_checkers=['eslint']
  autocmd BufNewFile,BufReadPost *.jshintrc set filetype=json
  autocmd BufNewFile,BufReadPost *.jscsrc set filetype=json
  autocmd BufNewFile,BufReadPost *.eslintrc set filetype=json
  autocmd BufNewFile,BufReadPost *.json set filetype=json
  autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable "Auto collapse by indentation"
augroup END

" Parentheses colours using Solarized
let g:rbpt_colorpairs = [
  \ [ '13', '#6c71c4'],
  \ [ '5',  '#d33682'],
  \ [ '1',  '#dc322f'],
  \ [ '9',  '#cb4b16'],
  \ [ '3',  '#b58900'],
  \ [ '2',  '#859900'],
  \ [ '6',  '#2aa198'],
  \ [ '4',  '#268bd2'],
  \ ]


"folding is disabled by default but can be quickly toggled per-file by hitting zi"
augroup XmlG
  autocmd!
  " Remove whitespace markers in htmlxml
  autocmd filetype html,xml set listchars-=tab:>.
  " Set WSDL files using XML filetype
  autocmd BufNewFile,BufRead *.wsdl setlocal ft=xml
augroup END

augroup Snips
  autocmd!
  autocmd BufNewFile,BufReadPost *.snippets setlocal noet ci pi sts=0 sw=4 ts=4 listchars-=tab:>. listchars=tab:\|\ "
  autocmd BufNewFile,BufReadPost *.snippets hi SpecialKey ctermbg=NONE ctermfg=gray
augroup END

" NERDTree show hidden files
let NERDTreeShowHidden=1
" Let NERDTree autoopen when vim is opened with no files

" NERDTree Commenter Defaults
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

augroup StartIt
  autocmd!
  autocmd BufNewFile,BufReadPost *.vimrc call TwoSpace()

  autocmd FocusLost * set nornu
  autocmd FocusGained * set rnu

  autocmd InsertEnter * set nornu
  autocmd InsertLeave * set rnu
augroup END

" Keeps fugitive buffers from getting out of hand
autocmd BufReadPost fugitive://* set bufhidden=delete

" Alias :UndotreeToggle to ent
cnoreabbrev <expr> ents ((getcmdtype() is# ":" && getcmdline() is# "ents")?("UndotreeToggle"):("ents"))

" Alias Helptags to rbHelp, This makes way more sense to me and will be
" easier to remember
cnoreabbrev <expr> rbHelp ((getcmdtype() is# ":" && getcmdline() is# "rbHelp")?("Helptags"):("rbHelp"))

" Alias sudo overwrite
cnoreabbrev <expr> sudowrite ((getcmdtype() is# ":" && getcmdline() is# "sudowrite")?(":w !sudo tee %"):("sudowrite"))

" easymotion mappings
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotnion-t2)

" easyMotion search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" Search in line
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)


" Vim Airline
set laststatus=2
set ttimeoutlen=50
" Auto Display all buffers
"let g:airline_left_sep = '>'
"let g:airline_right_sep = '<'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline_theme="badwolf"
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators=0

let g:tmuxline_preset={
    \ 'a': '#S',
    \ 'b': '#W',
    \ 'c': '#H',
    \ 'win': '#I #W',
    \ 'cwin': '#I #W',
    \ 'x': '%a',
    \ 'y': '#W %R',
    \ 'z': '#H',
    \ 'options':{'status-justify' : 'left'}}

let g:tmuxline_separators = {
    \ 'left' : '▶',
    \ 'left_alt': '>',
    \ 'right' : '◀',
    \ 'right_alt' : '<',
    \ 'space' : ' '}
" tmux clipboard workaround
set clipboard=unnamed

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

function! RotateWindowsFunc()
  wincmd H
endfunction
command! RotateWindow call RotateWindowsFunc()

" set scrollfix
" Keeps cursor in middle of the screen always.
let g:scrollfix=50
let g:fixeof=0

" ELM Bindings
nnoremap <leader>el :ElmEvalLine<CR>
vnoremap <leader>es :<C-u>ElmEvalSelection<CR>
nnoremap <leader>em :ElmMakeCurrentFile<CR>

" Nginx
au BufRead,BufNew *.nginx.conf set filetype=nginx

" avoid ugly default difftool colorscheme
if &diff
    colorscheme apprentice
endif
