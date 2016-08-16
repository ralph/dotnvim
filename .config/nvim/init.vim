if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
end

if has('nvim')
  Plug 'Shougo/deoplete.nvim'
  Plug 'kassio/neoterm'
else
  Plug 'Shougo/neocomplete.vim'
  Plug 'Shougo/vimshell'
  Plug 'jgdavey/vim-turbux'
  Plug 'tpope/vim-dispatch'
end

Plug 'Shougo/unite.vim'
if system('uname') =~ 'Darwin'
  Plug 'Shougo/vimproc.vim', { 'do': 'make -f make_mac.mak' }
else
 Plug 'Shougo/vimproc.vim', { 'do': 'make' }
endif
Plug 'airblade/vim-gitgutter'
Plug 'altercation/vim-colors-solarized'
Plug 'ap/vim-css-color'
Plug 'benekastah/neomake'
Plug 'cespare/vim-toml'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'elixir-lang/vim-elixir'
Plug 'elzr/vim-json'
Plug 'flazz/vim-colorschemes'
Plug 'groenewege/vim-less'
Plug 'kana/vim-textobj-user'
Plug 'majutsushi/tagbar'
Plug 'mtth/scratch.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree' | Plug 'EvanDotPro/nerdtree-chmod' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'stephpy/vim-yaml'
" Plug 'ternjs/tern_for_vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-ruby/vim-ruby'
if system('uname') =~ 'Darwin'
  Plug 'zerowidth/vim-copy-as-rtf'
endif
call plug#end()











"" General settings
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set laststatus=2                " Always show the statusline
set hidden                      " Maintain scroll position (don't close buffer)
runtime macros/matchit.vim      " Needed for Ruby block selection support: https://github.com/nelstrom/vim-textobj-rubyblock
set autoread

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Color scheme
let &t_Co=256
let g:solarized_termcolors = &t_Co
let g:solarized_termtrans = 1
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
set background=light
silent! colorscheme solarized

"" Line numbering, cursor
set relativenumber                " Show relative line numbers.
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.

"" NERDTree
let NERDTreeHijackNetrw=1
map <c-n> :NERDTreeFind<cr>

"" Pane switching shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w :vsplit<cr>  " Split pane vertically
set splitbelow
set splitright

"" Modern command line
cnoremap <C-a>  <Home>
cnoremap <C-b>  <Left>
cnoremap <C-f>  <Right>
cnoremap <C-d>  <Delete>
cnoremap <M-b>  <S-Left>
cnoremap <M-f>  <S-Right>
cnoremap <M-d>  <S-right><Delete>
cnoremap <Esc>b <S-Left>
cnoremap <Esc>f <S-Right>
cnoremap <Esc>d <S-right><Delete>
cnoremap <C-g>  <C-c>

"" Buffer shortcuts
nmap <C-e> :e#<CR>

"" Wild stuff
set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.
set wildignore+=node_modules,dist,vendor,log,tmp,*.swp,gems,.bundle,Gemfile.lock,.gem,.rvmrc,.gitignore,.DS_Store,data\/mongodb,tags

" double percentage sign in command mode is expanded
" to directory of current file - http://vimcasts.org/e/14
cnoremap %% <C-R>=expand('%:h').'/'<cr>

"" Trailing whitespace
highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/
function! s:CleanTrailingWhitespace()
  :%s/\s\+$//g
endfunction
command! CleanTrailingWhitespace call s:CleanTrailingWhitespace()

"" Puma restarts
function! s:PumaRestart()
  :call system('pumactl restart -S tmp/puma_state')
endfunction
command! PumaRestart call s:PumaRestart()


"" Misc shortcuts
nnoremap <leader><space> :nohl<cr>      " un-highlight search results
" nnoremap <leader><space> :let @/ = ""<cr>      " un-highlight search results
map <F5> :let @*=expand("%")<cr> " Copy file path to clipboard
map <F6> :let @*=expand("%:p")<cr> " Copy file path to clipboard
map <leader>jt <Esc>:%!json_xs -f json -t json-pretty<CR> " sudo cpan JSON::XS


" ctrlp
map <c-b> :CtrlPBuffer<cr>


" dispatch
map <leader>c :Copen<cr>


" Terminal
if has('nvim')
  let g:neoterm_shell = "zsh"

  nnoremap <silent> <f10> :TREPLSendFile<cr>
  nnoremap <silent> <f9> :TREPLSend<cr>
  vnoremap <silent> <f9> :TREPLSend<cr>

  nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
  nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
  nnoremap <silent> <leader>rc :call neoterm#test#run('current')<cr>
  nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>

  " hide/close all terminals
  nnoremap <silent> <leader>th :call neoterm#close_all()<cr>
  " clear terminal
  nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
  " kills the current job (send a <c-c>)
  nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
end


" Tagbar
nnoremap <leader>tb :Tagbar<cr>


" ctrlsf
let g:ctrlsf_position = 'bottom'
nmap     <C-F>f <Plug>CtrlSFPrompt
vmap     <C-F>f <Plug>CtrlSFVwordPath
vmap     <C-F>F <Plug>CtrlSFVwordExec
nmap     <C-F>n <Plug>CtrlSFCwordPath
nmap     <C-F>p <Plug>CtrlSFPwordPath
nnoremap <C-F>o :CtrlSFOpen<CR>
nnoremap <C-F>t :CtrlSFToggle<CR>
inoremap <C-F>t <Esc>:CtrlSFToggle<CR>


"" Fugitive stuff
autocmd BufReadPost fugitive://* set bufhidden=delete
autocmd User fugitive
  \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
  \   nnoremap <buffer> .. :edit %:h<CR> |
  \ endif
autocmd Filetype gitcommit setlocal spell textwidth=72
let g:fugitive_github_domains = ['source.xing.com']

autocmd User Rails Rnavcommand fabricator spec/fabricators -suffix=_fabricator.rb -default=model()
autocmd User Rails Rnavcommand serializer app/serializers -suffix=_serializer.rb -default=model()

set foldmethod=syntax
set foldlevelstart=10
let ruby_fold=1

" Neomake
if has('nvim')
  autocmd! BufWritePost * Neomake
end

" Airline
let g:airline#extensions#branch#enabled=1
let g:airline_detect_iminsert=1
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
function! AgsStatus(...)
  if &filetype == 'agsv'
    let w:airline_section_c = '%{ags#get_status_string()}'
  endif
endfunction
silent! call airline#add_statusline_func('AgsStatus')

cnoreabbrev <expr> W ((getcmdtype() is# ':' && getcmdline() is# 'W')?('w'):('W'))
cnoreabbrev <expr> Wa ((getcmdtype() is# ':' && getcmdline() is# 'Wa')?('wa'):('Wa'))


if has('nvim')
  let g:deoplete#enable_at_startup = 1
else
  " neocomplete
  " Disable AutoComplPop.
  let g:acp_enableAtStartup = 0
  " Use neocomplete.
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_smart_case = 1
  let g:neocomplete#enable_camel_case = 1
  let g:neocomplete#enable_underbar_case = 1
  let g:neocomplete#enable_auto_delimiter = 1
  let g:neocomplete#max_list = 10
  let g:neocomplete#force_overwrite_completefunc = 1
  let g:neocomplete#sources#syntax#min_keyword_length = 3
  " Enable omni completion.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
end


" Unite
let g:unite_source_history_yank_enable = 1
nnoremap <c-y> :Unite history/yank<cr>
nnoremap <space>/ :Unite grep:.<cr>
" nnoremap <C-[> :Unite -start-insert file_rec/async
if executable('ag') " Use ag for search
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif


" Save your backups to a less annoying place than the current directory.
" If you have .vim-backup in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/backup or . if all else fails.
if isdirectory($HOME . '/.vimtmp/backup') == 0
  :silent !mkdir -p ~/.vimtmp/backup >/dev/null 2>&1
endif
set backupdir-=.
set backupdir+=.
set backupdir-=~/
set backupdir^=~/.vimtmp/backup/
set backupdir^=./.vim-backup/
set backup

" Save your swp files to a less annoying place than the current directory.
" If you have .vim-swap in the current directory, it'll use that.
" Otherwise it saves it to ~/.vim/swap, ~/tmp or .
if isdirectory($HOME . '/.vimtmp/swap') == 0
  :silent !mkdir -p ~/.vimtmp/swap >/dev/null 2>&1
endif
set directory=./.vim-swap//
set directory+=~/.vimtmp/swap//
set directory+=~/tmp//
set directory+=.

" Enable tmux mouse scrolling in vim
set mouse=a

" Fix ctrl-h
if has('nvim')
  nmap <bs> :<c-u>TmuxNavigateLeft<cr>
endif

" Other nvim features
" if exists(':tnoremap')
if has('nvim')
  tnoremap <Esc> <C-\><C-n>
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
endif
