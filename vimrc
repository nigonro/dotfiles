call plug#begin('~/.vim/plugged')

" Dependencies
Plug 'godlygeek/tabular'           " This must come before plasticboy/vim-markdown
Plug 'tpope/vim-rhubarb'           " Depenency for tpope/fugitive

" General plugins
Plug 'ajh17/VimCompletesMe'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'blueyed/vim-diminactive'
Plug 'jiangmiao/auto-pairs'
Plug 'jlanzarotta/bufexplorer'
Plug 'Yggdroot/indentLine'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'editorconfig/editorconfig-vim'
Plug 'mtth/scratch.vim'

" Language support
Plug 'prabirshrestha/callbag.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
"Plug 'hrsh7th/vim-vsnip'
"Plug 'hrsh7th/vim-vsnip-integ'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'AndrewRadev/splitjoin.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte'
Plug 'cespare/vim-toml'                        " toml syntax highlighting
Plug 'plasticboy/vim-markdown'                 " Markdown syntax highlighting
Plug 'stephpy/vim-yaml'
Plug 'alvan/vim-closetag'
Plug 'mattn/emmet-vim'
Plug 'uarun/vim-protobuf'
Plug 'liuchengxu/graphviz.vim'
Plug 'aklt/plantuml-syntax'
Plug 'leafgarland/typescript-vim'
Plug 'kylef/apiblueprint.vim'
Plug 'rust-lang/rust.vim'
Plug 'hsanson/vim-openapi'
Plug 'freitass/todo.txt-vim'

" Colorschemes
Plug 'altercation/vim-colors-solarized'

call plug#end()

"----------------------------------------------
" General settings
"----------------------------------------------
set laststatus=2
set nocompatible
set autoindent                    " take indent for new line from previous line
set smartindent                   " enable smart indentation
set autoread                      " reload file if the file changes on the disk
set autowriteall                  " write on :quit
set clipboard=unnamedplus
set colorcolumn=81                " highlight the 80th column as an indicator
set cursorline                    " highlight the current line for the cursor
set encoding=UTF-8
set nospell                       " disable spelling
set noswapfile                    " disable swapfile usage
set nowrap
set noerrorbells                  " No bells!
set novisualbell                  " I said, no bells!
set noshowmode
set number                        " show number ruler
set ruler
set formatoptions=tcqronj         " set vims text formatting options
set softtabstop=2
set tabstop=2
set title                         " let vim set the terminal title
set updatetime=100                " redraw the status bar often
set ttyfast
set backspace=indent,eol,start
syntax sync minlines=256
set synmaxcol=300
set re=1
set completeopt=menu,menuone,noinsert,noselect
set completeopt-=preview          " remove the horrendous preview window
set pumheight=10             " Completion window max size

"Enable mouse if possible
if has('mouse')
	set mouse=a
endif

" Allow vim to set a custom font or color for a word
syntax enable
set redrawtime=10000

" Remove trailing white spaces on save
autocmd BufWritePre * :%s/\s\+$//e

au BufEnter * if &buftype == 'terminal' | :startinsert | endif

set wildmenu
set wildignore+=.hg,.git,.svn                    " Version control
set wildignore+=*.aux,*.out,*.toc                " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest " compiled object files
set wildignore+=*.spl                            " compiled spelling word lists
set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.DS_Store                       " OSX bullshit
set wildignore+=*.luac                           " Lua byte code
set wildignore+=migrations                       " Django migrations
set wildignore+=go/pkg                           " Go static files
set wildignore+=go/bin                           " Go bin files
set wildignore+=go/bin-vagrant                   " Go bin-vagrant files
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.orig                           " Merge resolution files

if has('clipboard')
    if has('unnamedplus')          "use + register for copy-paste when available
        set clipboard=unnamed,unnamedplus
    else                           "otherwise try to  use * register
        set clipboard=unnamed
    endif
endif

"----------------------------------------------
" Mappings
"----------------------------------------------
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","

nmap <leader>w :w!<cr>
nmap <leader>wa :wall<cr>
nmap <c-s> :w<CR>
vmap <c-s> <Esc><c-s>gv
imap <c-s> <Esc><c-s>
imap kj <Esc>
noremap j gj
noremap k gk

noremap <Tab> ^==<Esc>

" Creating splits
nnoremap vv :vsplit<cr>
nnoremap vs :split<cr>

" Closing splits
nnoremap <leader>q :close<cr>

" Closing buffer
nnoremap <leader>bd :bd<cr>

nnoremap <leader>rc :source $MYVIMRC<cr>

" Clear search highlights
map <leader><space> :nohlsearch<cr>

" These mappings will make it so that going to the next one in a search will
" center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Toggle background with <leader>bg
map <leader>bg :let &background = (&background == "dark"? "light" : "dark")<cr>

" Disable arrow keys
" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

augroup qf
    autocmd!
    autocmd FileType qf set nobuflisted
augroup END

" Fix some common typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Qa! qa!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall
cnoreabbrev Qa qa
map q: :q

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" -----------------
" folding
" -----------------
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=syntax | endif
augroup END

set foldenable
set foldlevelstart=10

inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

"----------------------------------------------
" Colors
"----------------------------------------------
if &term =~ '256color'
	 "disable Background Color Erase (BCE) so that color schemes
	 "render properly when inside 256-color tmux and GNU screen.
	 "see also http://sunaku.github.io/vim-256color-bce.html
	set t_ut=
endif

set t_Co=256
"set background=light
colorscheme solarized
let g:lightline = { 'colorscheme': 'solarized' }

"" Override the search highlight color with a combination that is easier to
"" read. The default PaperColor is dark green backgroun with black foreground.
""
"" Reference:
"" - http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"highlight Search guibg=DeepPink4 guifg=White ctermbg=53 ctermfg=White

"highlight TermCursor ctermfg=red guifg=red
"highlight Search ctermfg=red guifg=red ctermbg=black guibg=black
"highlight SignColumn ctermbg=black

"----------------------------------------------
" Searching
"----------------------------------------------
set incsearch                     " move to match as you type the search query
set hlsearch                      " disable search result highlighting
set ignorecase
set smartcase

if has('nvim')
    set inccommand=split          " enables interactive search and replace
endif

"----------------------------------------------
" Splits
"----------------------------------------------
" Create horizontal splits below the current window
set splitright

" put quickfix window always to the bottom
augroup quickfix
    autocmd!
    autocmd FileType qf wincmd J
    autocmd FileType qf setlocal wrap
augroup END

autocmd BufWritePost *.uml :make

"----------------------------------------------
Plug 'junegunn/fzf.vim'
"----------------------------------------------
nnoremap <leader>ff :Files<CR>
let g:fzf_preview_window = ''
let g:fzf_layout         = { 'down': '~20%' }

"----------------------------------------------
" Plugin: Yggdroot/indentLine
"----------------------------------------------
let g:indentLine_color_term = 252
let g:indentLine_char = '|'

"----------------------------------------------
" Plugin: blueyed/vim-diminactive
"----------------------------------------------
let g:diminactive_use_colorcolumn = 1

"----------------------------------------------
" Plugin: itchyny/lightline.vim
"----------------------------------------------
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\ },
\ 'component_type': {
\   'readonly': 'error',
\ },
\ 'component_function': {
\   'filename': 'LightLineFilename'
\ }
\ }

function! LightLineFilename()
  return expand('%')
endfunction

"----------------------------------------------
" Plugin: christoomey/vim-tmux-navigator
"----------------------------------------------
" tmux will send xterm-style keys when its xterm-keys option is on.
if &term =~ '^screen'
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Tmux vim integration
let g:tmux_navigator_no_mappings = 1
let g:tmux_navigator_save_on_switch = 1

" Move between splits with ctrl+h,j,k,l
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

inoremap <silent> <c-h> <esc>:TmuxNavigateLeft<cr>
inoremap <silent> <c-j> <esc>:TmuxNavigateDown<cr>
inoremap <silent> <c-k> <esc>:TmuxNavigateUp<cr>
inoremap <silent> <c-l> <esc>:TmuxNavigateRight<cr>
inoremap <silent> <c-\> <esc>:TmuxNavigatePrevious<cr>

"----------------------------------------------
" Plugin: 'majutsushi/tagbar'
"----------------------------------------------
" Add shortcut for toggling the tag bar
nnoremap <leader>tb :TagbarToggle<cr>

" Language: Go
" Tagbar configuration for Golang
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

"----------------------------------------------
" Plugin: plasticboy/vim-markdown
"----------------------------------------------
" Disable folding
let g:vim_markdown_folding_disabled = 1

" Auto shrink the TOC, so that it won't take up 50% of the screen
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0

"----------------------------------------------
" Plugin: scrooloose/nerdtree
"----------------------------------------------
nnoremap <leader>n :NERDTreeToggle<cr>
nnoremap <F2> :NERDTreeToggle<cr>
"noremap <leader>f :NERDTreeFind<cr>

let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" Files to ignore
let NERDTreeIgnore = [
    \ '\~$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '^node_modules$',
    \ '^.ropeproject$',
    \ '^__pycache__$'
\]

" Close vim if NERDTree is the only opened window.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Show hidden files by default.
let NERDTreeShowHidden = 1

" Allow NERDTree to change session root.
let g:NERDTreeChDirMode = 2

"----------------------------------------------
" Plugin: sebdah/vim-delve
"----------------------------------------------
" Set the Delve backend.
let g:delve_backend = "native"

"----------------------------------------------
" Plugin: Raimondi/delimitMate
"----------------------------------------------
let g:delimitMate_expand_cr = 2
let g:delimitMate_expand_inside_quotes = 1
let g:delimitMate_jump_expansion = 0
let g:delimitMate_excluded_regions = 0

"let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:delimitMate_smart_quotes = 1
"let g:delimitMate_expand_inside_quotes = 0
"let g:delimitMate_jump_expansion = 1
let g:delimitMate_smart_matchpairs = '^\%(\w\|\$\)'
let g:delimitMate_excluded_ft = "html"

imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

"----------------------------------------------
" Plugin: fatih/vim-go
"----------------------------------------------
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>v  <Plug>(go-vet)

"----------------------------------------------
" Plugin: hrsh7th/vim-vsnip
"----------------------------------------------
imap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : pumvisible() ? "\<C-n>" : "\<Tab>"
smap <expr> <Tab> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : pumvisible() ? "\<C-n>" : "\<Tab>"
imap <expr> <S-Tab> vsnip#available(1) ? '<Plug>(vsnip-jump-prev)' : pumvisible() ? "\<C-p>" : "\<S-Tab>"
smap <expr> <S-Tab> vsnip#available(1) ? '<Plug>(vsnip-jump-prev)' : pumvisible() ? "\<C-p>" : "\<S-Tab>"

"----------------------------------------------
" Plugin: prabirshrestha/asyncomplete.vim
"----------------------------------------------
inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() : "\<CR>"
inoremap <expr> <C-y> pumvisible() ? asyncomplete#close_popup() : "\<C-y>"
inoremap <expr> <C-e> pumvisible() ? asyncomplete#cancel_popup() : "\<C-e>"

autocmd! CompleteDone * if !pumvisible() | pclose | endif

"----------------------------------------------
" Plugin: prabirshrestha/vim-lsp
"----------------------------------------------
function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes

  if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> gr <plug>(lsp-references)
  nmap <buffer> gi <plug>(lsp-implementation)
  nmap <buffer> gt <plug>(lsp-type-definition)
  nmap <buffer> <leader>rn <plug>(lsp-rename)
  nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
  nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
  nmap <buffer> K <plug>(lsp-hover)
  nmap <buffer> D <plug>(lsp-document-diagnostics)

  nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
  nnoremap <buffer> gS :<C-u>LspWorkspaceSymbol<CR>
  nnoremap <buffer> gQ :<C-u>LspDocumentFormat<CR>
  vnoremap <buffer> gQ :LspDocumentRangeFormat<CR>
  nnoremap <buffer> <leader>ca :LspCodeAction<CR>
  xnoremap <buffer> <leader>ca :LspCodeAction<CR>
  autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
endfunction

augroup configure_lsp
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

"----------------------------------------------
" Language: Go
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

au FileType gotplhtml set noexpandtab
au FileType gotplhtml set shiftwidth=4
au FileType gotplhtml set softtabstop=4
au FileType gotplhtml set tabstop=4

"----------------------------------------------
" Language: Bash
"----------------------------------------------
au FileType sh set noexpandtab
au FileType sh set shiftwidth=2
au FileType sh set softtabstop=2
au FileType sh set tabstop=2

"----------------------------------------------
" Language: C++
"----------------------------------------------
au FileType cpp set shiftwidth=4
au FileType cpp set softtabstop=4
au FileType cpp set tabstop=4

augroup project
  autocmd!
  autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2

"----------------------------------------------
" Language: gitcommit
"----------------------------------------------
au FileType gitcommit setlocal spell
au FileType gitcommit setlocal textwidth=80

"----------------------------------------------
" Language: gitconfig
"----------------------------------------------
au FileType gitconfig set noexpandtab
au FileType gitconfig set shiftwidth=2
au FileType gitconfig set softtabstop=2
au FileType gitconfig set tabstop=2

"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set noexpandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au FileType javascript set shiftwidth=2
au FileType javascript set softtabstop=2
au FileType javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au Filetype json :IndentLinesDisable
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2

"----------------------------------------------
" Language: LESS
"----------------------------------------------
au FileType less set shiftwidth=2
au FileType less set softtabstop=2
au FileType less set tabstop=2

"----------------------------------------------
" Language: Make
"----------------------------------------------
au FileType make set noexpandtab
au FileType make set shiftwidth=2
au FileType make set softtabstop=2
au FileType make set tabstop=2

"----------------------------------------------
" Language: Markdown
"----------------------------------------------
au FileType markdown setlocal spell
au FileType markdown set shiftwidth=4
au FileType markdown set softtabstop=4
au FileType markdown set tabstop=4
au FileType markdown set syntax=markdown

"----------------------------------------------
" Language: PlantUML
"----------------------------------------------
au FileType plantuml set shiftwidth=2
au FileType plantuml set softtabstop=2
au FileType plantuml set tabstop=2

"----------------------------------------------
" Language: Protobuf
"----------------------------------------------
au FileType proto set shiftwidth=2
au FileType proto set softtabstop=2
au FileType proto set tabstop=2

"----------------------------------------------
" Language: Python
"----------------------------------------------
au FileType python set shiftwidth=4
au FileType python set softtabstop=4
au FileType python set tabstop=4

"----------------------------------------------
" Language: SQL
"----------------------------------------------
au FileType sql set shiftwidth=2
au FileType sql set softtabstop=2
au FileType sql set tabstop=2

"----------------------------------------------
" Language: Thrift
"----------------------------------------------
au FileType thrift set shiftwidth=2
au FileType thrift set softtabstop=2
au FileType thrift set tabstop=2

"----------------------------------------------
" Language: TOML
"----------------------------------------------
au FileType toml set shiftwidth=2
au FileType toml set softtabstop=2
au FileType toml set tabstop=2

"----------------------------------------------
" Language: TypeScript
"----------------------------------------------
au FileType typescript set shiftwidth=2
au FileType typescript set softtabstop=2
au FileType typescript set tabstop=2

"----------------------------------------------
" Language: Svelte
"----------------------------------------------
au FileType svelte set noexpandtab
au FileType svelte set shiftwidth=2
au FileType svelte set softtabstop=2
au FileType svelte set tabstop=2

"----------------------------------------------
" Language: Vader
"----------------------------------------------
au FileType vader set shiftwidth=2
au FileType vader set softtabstop=2
au FileType vader set tabstop=2

"----------------------------------------------
" Language: vimscript
"----------------------------------------------
au FileType vim set shiftwidth=4
au FileType vim set softtabstop=4
au FileType vim set tabstop=4

"----------------------------------------------
" Language: YAML
"----------------------------------------------
au FileType yaml set shiftwidth=2
au FileType yaml set softtabstop=2
au FileType yaml set tabstop=2
