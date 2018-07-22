call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'elzr/vim-json', {'for' : 'json'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'mattn/emmet-vim'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'stephpy/vim-yaml'
Plug 'Yggdroot/indentLine'
Plug 'blueyed/vim-diminactive'
Plug 'godlygeek/tabular'
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'luan/vim-concourse'
Plug 'cespare/vim-toml'
Plug 'dart-lang/dart-vim-plugin'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
Plug 'SirVer/ultisnips'
Plug 'altercation/vim-colors-solarized'
Plug 'jlanzarotta/bufexplorer'
Plug 'christoomey/vim-tmux-navigator'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'flowtype/vim-flow'
Plug 'wannesm/wmgraphviz.vim'
Plug 'Raimondi/delimitMate'

call plug#end()

" -----------------
" general
" -----------------
set nocompatible
set noerrorbells
set backspace=indent,eol,start
set showcmd
syntax on
filetype off
filetype plugin indent on
set encoding=utf-8
set noswapfile
set nobackup
set autowrite
set autoread
set fileformats=unix,dos,mac
set splitbelow
set splitright
set nocursorcolumn
set pumheight=10
set ttyfast
set laststatus=2
set autoindent
set backspace=indent,eol,start
set incsearch
set hlsearch
set ignorecase
set smartcase
set number
"set relativenumber
set ruler
set noshowmatch
set noshowmode
set cursorline
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
set lazyredraw
set showmatch
set nowrap
set colorcolumn=120
set hidden
set gcr=n:blinkon0

if has('mouse')
  set mouse=a
endif

syntax sync minlines=256
set synmaxcol=300
set re=1

if has('clipboard')
    if has('unnamedplus')          "use + register for copy-paste when available
        set clipboard=unnamed,unnamedplus
    else                           "otherwise try to  use * register
        set clipboard=unnamed
    endif
endif

" change cursor between NORMAL and INSERT
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" -----------------
" tabs
" -----------------
set tabstop=4
"set expandtab
set softtabstop=4
set shiftwidth=4
"retab
set autoindent
set backspace=indent,eol,start
noremap <Tab> ^==<Esc>
set shiftround

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

" -----------------
" code complete
" -----------------
set ofu=syntaxcomplete#Complete
set complete=.,w,b,u,t
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" -----------------
" color
" -----------------
syntax enable
set t_Co=256

"let g:rehash256 = 1
"set background=dark
"let g:molokai_original = 1
"colorscheme molokai
colorscheme solarized
"highlight ColorColumn ctermbg=236

" -----------------
" filetypes
" -----------------
autocmd BufNewFile,BufRead *.js,*.jsx setlocal noet ts=2 sts=2 sw=2
autocmd BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.ino setlocal noet ts=4 sw=4 sts=4
autocmd BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.md setlocal noet ts=4 sw=4
autocmd BufNewFile,BufRead *.vim setlocal et sw=2 ts=2

" -----------------
" buffer navigation
" -----------------
nnoremap <S-left> :bnext<CR>
nnoremap <S-right> :bprev<CR>
nnoremap <leader>o :only<CR>
nnoremap <leader>m :bd<CR>

" Switch between the last two files
nnoremap <leader><leader> <C-^>

" -----------------
"  mappings
" -----------------
nnoremap <CR> :w<CR>
imap kj <Esc>
nmap <space> <C-d>
nmap <S-space> <C-u>

let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
let g:maplocalleader = ","

" Some useful quickfix shortcuts for quickfix
"map <C-n> :cn<CR>
"map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

" put quickfix window always to the bottom
autocmd FileType qf wincmd J
augroup quickfix
    autocmd!
    autocmd FileType qf setlocal wrap
augroup END

" Fast saving
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

" Center the screen
"nnoremap <space> zz

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Source the current Vim file
nnoremap <leader>pr :Runtime<CR>

" Close all but the current one
nnoremap <leader>o :only<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Faster split
noremap vv <C-W>v
noremap vs <C-W>s

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
noremap j gj
noremap k gk

" Source (reload configuration)
nnoremap <silent> <F5> :source $MYVIMRC<CR>

nnoremap <F6> :setlocal spell! spell?<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Same when moving up and down
noremap <C-d> <C-d>zz
noremap <C-u> <C-u>zz

" Remap H and L (top, bottom of screen to left and right end of line)
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L g_

" -----------------
"  plugins
" -----------------

"  diminactive
let g:diminactive_use_colorcolumn = 1

"  vim-go
" -----------------
let g:go_fmt_fail_silently = 1
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_term_enabled = 1
let g:go_snippet_engine = "neosnippet"
let g:go_highlight_space_tab_error = 0
let g:go_highlight_array_whitespace_error = 0
let g:go_highlight_trailing_whitespace_error = 0
let g:go_highlight_extra_types = 0
let g:go_highlight_operators = 0
let g:go_highlight_build_constraints = 1

augroup go
  autocmd!

  autocmd FileType go nmap <silent> <localleader>v <Plug>(go-def-vertical)
  autocmd FileType go nmap <silent> <localleader>s <Plug>(go-def-split)

  autocmd FileType go nmap <silent> <localleader>x <Plug>(go-doc-vertical)

  autocmd FileType go nmap <silent> <localleader>i <Plug>(go-info)
  autocmd FileType go nmap <silent> <localleader>l <Plug>(go-metalinter)

  autocmd FileType go nmap <silent> <localleader>b :<C-u>call <SID>build_go_files()<CR>
  autocmd FileType go nmap <silent> <localleader>t  <Plug>(go-test)
  autocmd FileType go nmap <silent> <localleader>r  <Plug>(go-run)
  autocmd FileType go nmap <silent> <localleader>e  <Plug>(go-install)

  autocmd FileType go nmap <silent> <localleader>c <Plug>(go-coverage-toggle)

  " I like these more!
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" NERDTree
" -----------------
" For toggling
noremap <Leader>n :NERDTreeToggle<cr>
noremap <Leader>f :NERDTreeFind<cr>
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1

" better whitespaces
" -----------------
autocmd BufEnter * EnableStripWhitespaceOnSave

" Tagbar
" -----------------
nmap <F8> :TagbarToggle<CR>

" vim-json
" -----------------
let g:vim_json_syntax_conceal = 0

" deoplete
" -----------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#ignore_sources = {}
let g:deoplete#ignore_sources._ = ['member', 'tag']
let g:deoplete#sources#go#align_class = 1
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
set completeopt+=noselect

" Use partial fuzzy matches like YouCompleteMe
call deoplete#custom#source('_', 'matchers', ['matcher_fuzzy', 'matcher_length'])
call deoplete#custom#source('_', 'converters', ['converter_auto_paren'])
call deoplete#custom#source('_', 'disabled_syntaxes', ['Comment', 'String'])

" <CR>: If popup menu visible, expand snippet or close popup with selection,
"       Otherwise, check if within empty pair and use delimitMate.
inoremap <silent><expr><CR> pumvisible() ?
  \ (neosnippet#expandable() ? neosnippet#mappings#expand_impl() : deoplete#close_popup())
  \ : (delimitMate#WithinEmptyPair() ? "\<C-R>=delimitMate#ExpandReturn()\<CR>" : "\<CR>")

" <Tab> completion:
" 1. If popup menu is visible, select and insert next item
" 2. Otherwise, if within a snippet, jump to next input
" 3. Otherwise, if preceding chars are whitespace, insert tab char
" 4. Otherwise, start manual autocomplete
imap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

smap <silent><expr><Tab> pumvisible() ? "\<Down>"
	\ : (neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)"
	\ : (<SID>is_whitespace() ? "\<Tab>"
	\ : deoplete#manual_complete()))

inoremap <expr><S-Tab>  pumvisible() ? "\<Up>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Lightline
" -----------------
let g:lightline = {
\ 'colorscheme': 'solarized',
\ 'active': {
\   'left': [['mode', 'paste'], ['filename', 'modified']],
\   'right': [['lineinfo'], ['percent'], ['readonly', 'linter_warnings', 'linter_errors', 'linter_ok']]
\ },
\ 'component_expand': {
\   'linter_warnings': 'LightlineLinterWarnings',
\   'linter_errors': 'LightlineLinterErrors',
\   'linter_ok': 'LightlineLinterOK'
\ },
\ 'component_type': {
\   'readonly': 'error',
\   'linter_warnings': 'warning',
\   'linter_errors': 'error'
\ },
\ }

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ◆', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:counts.total == 0 ? '✓ ' : ''
endfunction

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
  if exists('#lightline')
    call lightline#update()
  end
endfunction

" ALE
" -----------------
let g:ale_sign_warning = '▲'
let g:ale_sign_error = '✗'
highlight link ALEWarningSign String
highlight link ALEErrorSign Title
let g:ale_lint_on_text_changed = "never"
let g:ale_lint_on_enter = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 0
let g:ale_keep_list_window_open = 0

" ultisnips
" -----------------
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/snippets']

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction


if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"

" rust
" -----------------
let g:rustfmt_autosave = 1

" jsx
" -----------------
let g:jsx_ext_required = 0
