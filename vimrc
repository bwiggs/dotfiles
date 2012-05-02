"PATHOGEN
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

" Local dirs
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
"set undodir=~/.vim/undo

" map leader
let mapleader=","

" theme
colorscheme default    " use this color scheme for terminals
syntax on
set background=dark        " adapt colors for background
"set t_Co=256


" macvim: shift aarow select
if has("gui_macvim")
    let macvim_hig_shift_movement = 1
endif

" Pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv
set selectmode=

" MAKE IT EASIER TO SCROLL THROUOGH THEMES
map <silent><F3> :NEXTCOLOR<cr>
map <silent><F2> :PREVCOLOR<cr>

"ENABLE FILETYPE PLUGINS
filetype plugin on
filetype plugin indent on    " enable loading indent file for filetype

"ENCODING
set encoding=utf-8

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
set hlsearch "highlight all matched terms
set wrapscan " Searches wrap around end of file
"
" Press Space to turn off highlighting and clear any message already displayed.
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

"STATUS LINE
se laststatus=2
se statusline=""

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%p%%]\ [LEN=%L]
set statusline+=%F%m%r%h%w
set statusline+=%20.20{'tabstop='.&tabstop}
"set statusline+=%{fugitive#statusline()}
set statusline+=%=[SYNGROUP=%{synIDattr(synID(line('.'),col('.'),1),'name')}]\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ 
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%#warningmsg#
set statusline+=%*

"TABS & INDENTS
set tabstop=2 "number of spaces a TAB counts as
set shiftwidth=2 "number of spaced to use for indenting
set softtabstop=2 "number of spaces tab counts for while in edit mode
set noexpandtab
set autoindent "copy indent from current line when starting a new line (when using o or O)
set smartindent "smart code indenting like after a { or [
set backspace=2

"CODE FOLDING
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default

"ENABLE OMNICOMPLETE
set ofu=syntaxcomplete#Complete
set completeopt=menuone,longest,preview

"COMMAND LINE COMPLETION
set wildchar=<TAB> " Character for CLI expansion (TAB-completion).
set wildmode=longest:full
set wildmenu "better command line completion in vim
set wildignore+=.swf,*.pdf,*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js,smarty/**,vendor/**,node_libraries/**,.git,.hg,.svn,.sass-cache,log,tmp,build,**/ckeditor/**,**/ckfinder/**

" highlight end of line whitespace
"highlight BadWhitespace term=standout ctermbg=red guibg=red
"match BadWhitespace /[^* \t]\zs\s\+$\| \+\ze\t/

" switch between light and dark background
map <leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" syntastic
"let g:syntastic_enable_signs=1 "need to enable signs flag for vim when compiling
"let g:syntastic_auto_loc_list=1 "show syntax errors by default on file open

" pyflakes
"let g:pyflakes_use_quickfix = 0

" supertab
let g:SuperTabDefaultCompletionType = "context"

" custom mappings
noremap <leader>W :w !sudo tee %<CR>
"map <leader>v :sp ~/.vimrc<cr> " edit my .vimrc file in a split
map <leader>e :e ~/.vimrc<cr>      " edit my .vimrc file
"map <leader>eg :e ~/.gvimrc<cr>      " edit my .vimrc file
"map <leader>so :source ~/.vimrc<cr> " update the system settings from my vimrc file

" show errors in the current file
map <leader>E :Errors<cr> 

"au FileType xml exe ":silent 1,$!xmllint --format --recover - 2>/dev/null"

" nerdtree
let NERDTreeIgnore = ['\.pyc$']
nmap <leader>n :NERDTreeToggle<CR> 

" make green, test runner
"map <leader>m :call MakeGreen()<cr> " change from <Leader>t to <Leader>]

" tasklist
map <leader>td <Plug>TaskList

" vim-ack
nmap <leader>a <Esc>:Ack!

" indent entire block
"nnoremap <leader>] >i{<CR>
"nnoremap <leader>[ <i{<CR>

" toogle line number type
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc
nnoremap <leader>l :call g:ToggleNuMode()<cr>

"nnoremap <leader>w :set list!<cr>

" faster window resizing
if bufwinnr(1)
  map = <C-W>+
  map - <C-W>-
  map _ <C-W><
  map + <C-W>>
endif

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

" highlight content that is too long
"highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
"match OverLength /\%>80v.\+/

" escape html block
"function! HtmlEscape()
"  silent s/&/\&amp;/eg
"  silent s/</\&lt;/eg
"  silent s/>/\&gt;/eg
"endfunction

"function! HtmlUnEscape()
"  silent s/&lt;/</eg
"  silent s/&gt;/>/eg
"  silent s/&amp;/\&/eg
"endfunction

"map <silent> <c-h> :call HtmlEscape()<CR>
"map <silent> <c-u> :call HtmlUnEscape()<CR>

" autocomplete for file types
autocmd BufNewFile,BufRead *.py compiler nose
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete tabstop=8 expandtab shiftwidth=4 softtabstop=4 colorcolumn=79
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType python set ft=python.django " For SnipMate
autocmd FileType html set ft=htmldjango.html " For SnipMate

" tagbar plugin
let g:tagbar_usearrows = 1
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'
nnoremap <leader>o :TagbarToggle<CR>

nnoremap <leader>r :reg<CR>

" ON VIMRC SAVE, UPDATE ALL VIM INSTANCES TO USE THE NEW CONFIG FILE
"function! UpdateVimRC()
  "for server in split(serverlist())
    "call remote_send(server, '<Esc>:source $HOME/.vimrc<CR>')
  "endfor
"endfunction
""autocmd! bufwritepost .vimrc call UpdateVimRC()
"autocmd! bufwritepost vimrc source ~/.vimrc

" commandt
let g:CommandTMaxHeight = 15
"noremap <leader>f :CommandTFlush<cr>


" javascript tag list configuration for syntax
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function'

" Python PEP8 validation
let g:pep8_map='<leader>8'

" Show syntax highlighting groups for word under cursor
"nmap <C-S-P> :call <SID>SynStack()<CR>
"function! <SID>SynStack()
"  if !exists("*synstack")
"    return
"  endif
"  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
"endfunc

" highlight all hex colors with value
if exists('*HexHighlight()')
  nmap <leader>c :call HexHighlight()<Return>
endif


nnoremap <leader>cc :ConqueTermSplit bash -l<CR>

" Highlight word at cursor without changing position
"nnoremap <leader>h *<C-O>
" Highlight word at cursor and then Ack it.
"nnoremap <leader>H *<C-O>:AckFromSearch!<CR>

nmap <D-/> <leader>ci <CR>
vmap <D-/> <leader>ci <CR>
imap <D-/> <C-O><leader>ci


