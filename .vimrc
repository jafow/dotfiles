execute pathogen#infect()
syntax on
if !has('nvim')
	filetype plugin on
	set foldmethod=syntax    "
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
	set noerrorbells         " don"t beep"
	set nocompatible         " dont care "
	set nobackup             " disable backups"
	set clipboard=unnamed    " allow copy to clipboard "
	set noswapfile           " disable backups"
	set relativenumber       " show line nubmer relative to cursor
	" set runtimepath^=~/.vim/bundle/ctrlp.vim
	set rtp+=/usr/local/opt/fzf
	set spell
	set mouse=nicr
	setlocal spell spelllang=en_us
	set expandtab
	set nomodeline           " stops reading beginning and end lines of a file
	set list
	set listchars=trail:.,extends:#,nbsp:. "mark whitespace"
	" set term=screen-256color
endif

" status line fun
" set statusline=%F       "tail of the filename

" " set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
" " set statusline+=%{&ff}] "file format

" set statusline+=\ buffer%n      "buffer Number
" set statusline+=\ %m     "modified flag
" set statusline+=\ %l/%L   "cursor line/total lines

" set statusline+=\ %P    "percent through file
" set statusline=%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%y%=%-16(\ %l,%c-%v\ %)%P
" remappings
inoremap jj <ESC>
inoremap kk <ESC>

" map down and up to up next row and down next row
nnoremap j gj
nnoremap k gk

" show buffer list and navigate to one
nnoremap \b :ls<CR>:buffer<Space>

" vertical resize
nnoremap \vz :vertical<Space>resize<Space>
" Change snipmate trigger to ,Tab
" Makes it compatible with tab completion
imap <leader><tab> <Plug>snipMateNextOrTrigger
smap <leader><tab> <Plug>snipMateNextOrTrigger

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
let g:UltiSnipsSnippetDirectories=$HOME.'/dotfiles/.vim/bundle/snippets/'

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
" function! ClosureIt()
"     " setlocal textwidth=80
"     setlocal colorcolumn=+1
"     " hi ColorColumn  ctermbg=246
"     " hi OverLength   ctermfg=125 ctermbg=250
"     " match OverLength /\%>80v.\+/
" endfunction

" function! KS()
"     " set listchars=tab:  ,trail:.,extends:#,nbsp:. "mark whitespace"
"     " set noexpandtab
"     " let g:syntastic_javascript_checkers = ['jsxhint', 'jscs']
" endfunction
" command! KS call KS()

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
autocmd BufWrite * :call DeleteTrailingWS()
command! DeleteTrailing call DeleteTrailingWS()

augroup JavascriptG
  autocmd!
  autocmd BufRead *.js normal zR
  autocmd BufNewFile,BufReadPost *.js set foldmethod=indent
  autocmd BufNewFile,BufReadPost *.js set foldlevel=2
  autocmd BufNewFile,BufReadPost *.js,*.jsx,*.jade,*.coffee,*.json,*.scss,*.sass,*.style call TwoSpace()
  autocmd BufNewFile,BufReadPost *.jsx let b:syntastic_checkers=['eslint']
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

" Alias sudo overwrite
cnoreabbrev <expr> sudowrite ((getcmdtype() is# ":" && getcmdline() is# "sudowrite")?(":w !sudo tee %"):("sudowrite"))

" tmux clipboard workaround
set clipboard=unnamed

" JSON Syntax settings
let g:vim_json_syntax_concealcursor=""
let g:indentLine_noConcealCursor=""
" commands
" Convert double quotes to single quotes
command! SingleQ %s/"/'/g
command! DoubleQ %s/'/"/g

" set scrollfix
" Keeps cursor in middle of the screen always.
let g:scrollfix=50
let g:fixeof=0

" avoid ugly default difftool colorscheme
if &diff
    colorscheme apprentice
endif
