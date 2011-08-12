"PATHOGEN
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
"set undodir=~/.vim/undo

"THEME
set t_Co=256
set background=dark        " adapt colors for background
colorscheme molokai    " use this color scheme
syntax on

" MAKE IT EASIER TO SCROLL THROUOGH THEMES
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

"ENABLE FILETYPE PLUGINS
filetype plugin on

"ENCODING
set encoding=utf-8

"USE SHIFT FOR TEXT SELECTION
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set guioptions-=T
    colorscheme neopro
endif

"CHANGE MAPLEADER
let mapleader=","

"PERSONAL PREFERENCES
set nocompatible "add more awesomeness
set cul " highlight the current line
set number "show the line numbers
set nowrap "don't wrap long lines
set title "set the title of the window to the current file
set ruler "show line and curosr position
set ttyfast "faster terminal interactions
set showmode "always show the file tabs at the top
set vb t_vb= "use flash instead of beep
set history=1000 " Increase history from 20 default to 1000
"SEARCHING
set incsearch " Highlight dynamically as pattern is typed.
set wrapscan " Searches wrap around end of file
"STATUS LINE
se laststatus=2
se statusline=""
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%p%%]\ [LEN=%L]
set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
set statusline+=[SYNGROUP=%{synIDattr(synID(line('.'),col('.'),1),'name')}]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"TABS & INDENTS
set tabstop=2 "number of spaces a TAB counts as
set shiftwidth=2 "number of spaced to use for indenting
set softtabstop=2 "number of spaces tab counts for while in edit mode
set expandtab
set autoindent "copy indent from current line when starting a new line (when using o or O)
set smartindent "smart code indenting like after a { or [
set backspace=2
"CODE FOLDING
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"ENABLE OMNICOMPLETE
set ofu=syntaxcomplete#Complete
"COMMAND LINE COMPLETION
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildmode=longest:full
set wildmenu "better command line completion in vim
set wildignore+=.swf,*.pdf,*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js,smarty/**,vendor/**,node_libraries/**,.git,.hg,.svn,.sass-cache,log,tmp,build,**/ckeditor/**,**/ckfinder/**

"HIGHLIGHT POTENTIALLY UNWANTED WHITESPACE
highlight BadWhitespace term=standout ctermbg=red guibg=red
match BadWhitespace /[^* \t]\zs\s\+$\| \+\ze\t/

"PLUGINS SETTINGS
let g:syntastic_enable_signs=1 "need to enable signs flag for vim when compiling
"let g:syntastic_auto_loc_list=1 "show syntax errors by default on file open

"CUSTOM MAPPINGS
noremap <leader>W :w !sudo tee %<CR>
nmap <leader>n :NERDTreeToggle<CR>

map <leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
map <leader>et :e ~/.vim/bundle/vim-neopro/colors/neopro.vim " edit the neopro theme
map <leader>so :source ~/.vimrc<cr> " update the system settings from my vimrc fil
map <leader>E :Errors<cr> " update the system settings from my vimrc fil

" INDENT ENTIRE BLOCK
nnoremap <leader>] >i{<CR>
nnoremap <leader>[ <i{<CR>

"TOGGLE RELATIVE AND ABSOLUTE LINE NUMBERING
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <C-L> :call g:ToggleNuMode()<cr>

"FASTER SPLIT RESIZING (+,-)
if bufwinnr(1)
  map = <C-W>+
  map - <C-W>-
  map _ <C-W><
  map + <C-W>>
endif

" Better split switching (Ctrl-j, Ctrl-k)
map <C-j> <C-W>j
map <C-k> <C-W>k

" Unimpaired configuration
" Bubble single lines
"nmap <C-Up> [e
"nmap <C-Down> ]e
" Bubble multiple lines
"vmap <C-Up> [egv
"vmap <C-Down> ]egv


" REMAP KEYS FOR AUTO-COMPLETION, DISABLE ARROW KEYS
"inoremap <expr>  <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
"inoremap <expr>  <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
"inoremap <expr>  <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
"inoremap <expr>  <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
"inoremap <Left>  <Left>
"inoremap <Right> <Right>

"TOGGLE SHOW TABS AND TRAILING SPACES (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>i :set nolist!<CR>

"EASILY ESCAPE OR UNESCAPE HTML
function! HtmlEscape()
  silent s/&/\&amp;/eg
  silent s/</\&lt;/eg
  silent s/>/\&gt;/eg
endfunction

function! HtmlUnEscape()
  silent s/&lt;/</eg
  silent s/&gt;/>/eg
  silent s/&amp;/\&/eg
endfunction

map <silent> <c-h> :call HtmlEscape()<CR>
map <silent> <c-u> :call HtmlUnEscape()<CR>

" AUTOCOMPLETE FOR COMMON FILES
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate


" ON VIMRC SAVE, UPDATE ALL VIM INSTANCES TO USE THE NEW CONFIG FILE
function! UpdateVimRC()
  for server in split(serverlist())
    call remote_send(server, '<Esc>:source $HOME/.vimrc<CR>')
  endfor
endfunction
"autocmd! bufwritepost .vimrc call UpdateVimRC()
autocmd! bufwritepost vimrc source ~/.vimrc

" COMMAND T
let g:CommandTMaxHeight = 15
noremap <leader>f :CommandTFlush<cr>

" TAGLIST CONFIG FOR JAVASCRIPT
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if exists('*HexHighlight()')
  nmap <leader>c :call HexHighlight()<Return>
endif

