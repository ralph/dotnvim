if has('nvim')
  call plug#begin('~/.config/nvim/plugged')
else
  call plug#begin('~/.vim/plugged')
end

Plug 'sheerun/vim-polyglot' | Plug 'godlygeek/tabular' | Plug 'mhartington/nvim-typescript', { 'do': 'sh install.sh' }
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/denite.nvim'
Plug 'Shougo/unite.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'
Plug 'christoomey/vim-tmux-navigator'
Plug 'dyng/ctrlsf.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jparise/vim-graphql'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock'
Plug 'lifepillar/vim-solarized8'
Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'mmorearty/elixir-ctags'
Plug 'mtth/scratch.vim'
Plug 'mzlogin/vim-markdown-toc'
Plug 'neoclide/coc.nvim', { 'branch': 'release' } | Plug 'neoclide/coc-denite'
Plug 'rlue/vim-fold-rspec'
Plug 'scrooloose/nerdtree' | Plug 'EvanDotPro/nerdtree-chmod' | Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'slashmili/alchemist.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-fugitive' | Plug 'shumphrey/fugitive-gitlab.vim'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes' | Plug 'edkolev/tmuxline.vim'

Plug 'ryanoasis/vim-devicons'

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

"" Allow local config files: https://medium.com/@dnrvs/per-project-settings-in-nvim-fc8c8877d970
set exrc
set secure

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
set termguicolors
set background=light " or dark
" let g:solarized_termtrans = 1
let g:solarized_term_italics = 1
silent! colorscheme solarized8_high

"" Line numbering, cursor
set relativenumber                " Show relative line numbers.
set ruler                         " Show cursor position.
set scrolloff=3                   " Show 3 lines of context around the cursor.

"" NERDTree
let NERDTreeHijackNetrw = 1
let NERDTreeMinimalUI = 1
map <c-n> :NERDTreeFind<cr>
" let NERDTreeShowHidden=1

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
" map <c-b> :CtrlPBuffer<cr>


" dispatch
map <leader>c :Copen<cr>


" Alchemist
let g:alchemist_tag_disable = 1


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

set foldmethod=syntax
set foldlevelstart=10
let ruby_fold=1

" Neomake
" if has('nvim')
"   autocmd! BufWritePost * Neomake
  " let g:neomake_javascript_enabled_makers = ['prettier-eslint']
  " let g:neomake_vue_enabled_makers = ['prettier-eslint']
  " let g:neomake_javascript_eslint_args = ['-f', 'compact', '--fix']
  " au User NeomakeFinished checktime
  " let g:neomake_elixir_enabled_makers = ['elixir', 'credo']
  " let g:neomake_elixir_elixir_maker = {
  "     \ 'exe': 'elixirc',
  "     \ }
  " let g:neomake_elixir_elixir_maker = {
  "     \ 'exe': 'elixirc',
  "     \ 'args': [
  "       \ '--ignore-module-conflict', '--warnings-as-errors',
  "       \ '--app', 'mix', '--app', 'ex_unit',
  "       \ '-o', '$TMPDIR', '%:p'
  "     \ ],
  "     \ 'errorformat':
  "         \ '%E** %s %f:%l: %m,' .
  "         \ '%W%f:%l'
  "     \ }
" end


" let g:LanguageClient_serverCommands = {
"     \ 'reason': ['/Users/ralph/Documents/work/reason-language-server/reason-language-server.exe']
"     \ }


" NeoFormat
" let g:neoformat_enabled_vue = ['prettier-eslint']
" let g:neoformat_enabled_javascript = ['prettier-eslint']
" let g:neoformat_run_all_formatters = 1
" augroup fmt
"   autocmd!
"   autocmd BufWritePre *.js undojoin | Neoformat
"   autocmd BufWritePre *.ts undojoin | Neoformat
"   autocmd BufWritePre *.vue undojoin | Neoformat
"   autocmd BufWritePre *.ex undojoin | Neoformat
"   autocmd BufWritePre *.exs undojoin | Neoformat
" augroup END

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\   'javascript': ['prettier_eslint'],
\   'typescript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\}
let g:ale_fix_on_save = 1

" CTags
let g:gutentags_cache_dir = '~/.tags_cache'

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
  " let g:deoplete#disable_auto_complete = 1
  inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : deoplete#mappings#manual_complete()

  function! s:check_back_space() abort "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
  endfunction"}}}
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

  if !exists('g:neocomplete#force_omni_input_patterns')
    let g:neocomplete#force_omni_input_patterns = {}
  endif
  let g:neocomplete#force_omni_input_patterns.typescript = '[^. *\t]\.\w*\|\h\w*::'

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
endif


let g:jsx_ext_required = 0

let g:vmt_list_item_char = "-"
let g:vmt_dont_insert_fence = 1


function! s:goyo_enter()
  " silent !tmux set status off
  " silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
endfunction

function! s:goyo_leave()
  " silent !tmux set status on
  " silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

let g:elm_format_autosave = 1

let g:fugitive_gitlab_domains = ['git.cardelmar.info']

iab teh the
iab retrun return


" https://github.com/neoclide/coc.nvim
" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.

xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <tab> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <S-TAB> <Plug>(coc-range-select-backword)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" end coc.nvim


"Custom COC
" let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>


" FZF
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
nnoremap <C-p> :FZF<CR>
nnoremap <C-b> :Buffers<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}
