"THEME
set t_Co=256
set background=dark        " adapt colors for background
colorscheme molokai    " use this color scheme
syntax on

"CHANGE MAPLEADER
let mapleader=","

"STATUS LINE
se laststatus=2
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [%p%%]\ [LEN=%L]
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"PERSONAL PREFERENCES
set nocompatible "better usability
set number "show the line numbers
set tabstop=2 "number of spaces a TAB counts as
set shiftwidth=2 "number of spaced to use for indenting
set softtabstop=2 "number of spaces tab counts for while in edit mode
set expandtab
set autoindent "copy indent from current line when starting a new line (when using o or O)
set smartindent "smart code indenting like after a { or [
set nowrap
set title "set the title of the window to the current file
set ruler "show line and curosr position
set ttyfast "faster terminal interactions
set showcmd 
set showmode "always show the file tabs at the top
set vb t_vb= "use flash instead of beep
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set cul " highlight the current line
set wildmode=longest:full 
set wildmenu "better command line completion in vim

"PLUGINS
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" CUSTOM MAPPINGS
noremap <leader>W :w !sudo tee %<CR>
"nmap <silent> <c-n> :NERDTreeToggle<CR>

" Toggle show tabs and trailing spaces (,c)
set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
set fcs=fold:-
nnoremap <silent> <leader>c :set nolist!<CR>

" GUI OPTIONS
if has("gui_running")
    set guifont=Monaco:h16  " use this font 
    set lines=50       " height = 50 lines
    set columns=120        " width = 100 columns
    set background=dark   " adapt colors for background
    set selectmode=mouse,key,cmd
		set guioptions-=T
endif
