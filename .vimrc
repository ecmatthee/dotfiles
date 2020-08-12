
"                         ███████████████████████████
"                         ███████▀▀▀░░░░░░░▀▀▀███████
"                         ████▀░░░░░░░░░░░░░░░░░▀████
"                         ███│░░░░░░░░░░░░░░░░░░░│███
"                         ██▌│░░░░░░░░░░░░░░░░░░░│▐██
"                         ██░└┐░░░░░░░░░░░░░░░░░┌┘░██
"                         ██░░└┐░░░░░░░░░░░░░░░┌┘░░██
"                         ██░░┌┘▄▄▄▄▄░░░░░▄▄▄▄▄└┐░░██
"                         ██▌░│██████▌░░░▐██████│░▐██
"                         ███░│▐███▀▀░░▄░░▀▀███▌│░███
"                         ██▀─┘░░░░░░░▐█▌░░░░░░░└─▀██
"                         ██▄░░░▄▄▄▓░░▀█▀░░▓▄▄▄░░░▄██
"                         ████▄─┘██▌░░░░░░░▐██└─▄████
"                         █████░░▐█─┬┬┬┬┬┬┬─█▌░░█████
"                         ████▌░░░▀┬┼┼┼┼┼┼┼┬▀░░░▐████
"                         █████▄░░░└┴┴┴┴┴┴┴┘░░░▄█████
"                         ███████▄░░░░░░░░░░░▄███████
"                         ██████████▄▄▄▄▄▄▄██████████
"                         ███████████████████████████
"
"   You are about to experience a potent dosage of Vim. Watch your steps.
"
"                ╔══════════════════════════════════════════╗
"                ║           ⎋ HERE BE VIMPIRES ⎋           ║
"                ╚══════════════════════════════════════════╝

"--------------------------------------------------
"Vim System Setup
"--------------------------------------------------

if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif


if has('win32') || has('win64')
    set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after

    if empty(glob('~/.vim/autoload/plug.vim'))
        execute 'silent !curl -fLo' shellescape("%HOMEDRIVE%%HOMEPATH%/.vim/autoload/plug.vim", 1)  '--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
else
    if empty(glob('~/.vim/autoload/plug.vim'))
        silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

"--------------------------------------------------
"Plugins
"--------------------------------------------------

call plug#begin('~/.vim/plugged')

    "UI
        Plug 'https://github.com/gruvbox-community/gruvbox'       "Theme
        Plug 'https://github.com/mhinz/vim-startify'              "Title Screen
        Plug 'https://github.com/bling/vim-bufferline'            "Bufferline

    "Coding
        Plug 'https://github.com/sheerun/vim-polyglot'            "Language Support
        Plug 'https://github.com/dense-analysis/ale'              "Syntax Checking

    "Language Support
        Plug 'https://github.com/dhruvasagar/vim-table-mode'      "Markdown Table Controls
        Plug 'https://github.com/tmzlogin/vim-markdown-toc'       "Markdown Table-of-Contents Generate

    "Editor Improvement
        Plug 'https://github.com/nathanaelkane/vim-indent-guides' "Indent Highlight
        Plug 'https://github.com/jiangmiao/auto-pairs'            "Auto closing bracket
        Plug 'https://github.com/tpope/vim-surround'              "Bracket/Quote/Tag Manipulation
        Plug 'https://github.com/godlygeek/tabular'               "Tab Control
        Plug 'https://github.com/tpope/vim-commentary/'           "Commenting Utilities
        Plug 'https://github.com/pbrisbin/vim-mkdir'              "Auto creates non-existing directories when saving
        Plug 'https://github.com/tpope/vim-fugitive'              "Git Integration
        Plug 'https://github.com/junegunn/fzf'                   "Fuzzy Finder
        Plug 'https://github.com/junegunn/fzf.vim'               "Fuzzy Finder Integration

    "Bonus Features
        Plug 'https://github.com/scrooloose/nerdtree'             "File Tree Manager
        Plug 'https://github.com/ivalkeen/nerdtree-execute'       "Enhances NERDTree -> provides ability to execute files
        Plug 'https://github.com/mbbill/undotree'                 "Visual Undo Tree
        Plug 'https://github.com/ryanoasis/vim-devicons'          "Added Glypths to vim
        Plug 'https://github.com/junegunn/goyo.vim'               "No distraction mode
        Plug 'https://github.com/junegunn/limelight.vim'          "Focus Mode
        Plug 'https://github.com/antoyo/vim-licenses'             "License Header Support

call plug#end()

"--------------------------------------------------
"Vim Settings
"--------------------------------------------------

"Necessity
    set nocompatible
    filetype plugin indent on
    syntax enable
    set mouse=a      "Enable Mouse in terminal

    set t_Co=256

"Hybrid Numbering
    set number
    set relativenumber

"UI improvements
    set cursorline

    set textwidth=0
    set wrapmargin=0
    set wrap
    set linebreak

    set showbreak=+++
    set showmatch
    set visualbell

"GUI Edit
    set guioptions-=m       "Menu bar
    set guioptions-=T       "Toolbar
    set guioptions+=r       "Right-hand scroll bar
    set guioptions-=L       "Left-hand scroll bar

"Search Improvement
    set hlsearch
    set incsearch
    set smartcase
    set ignorecase

"Indent & Tabs
    set expandtab
    set autoindent
    set tabstop=8
    set softtabstop=4
    set shiftwidth=4

"Enable folding
    set foldmethod=indent
    set foldlevelstart=10
    set foldnestmax=10
    set nofoldenable
    set foldlevel=2

"Utilities
    set nospell

    set wildmenu
    set wildmode=longest,list:longest
    set complete-=i
    set completeopt=longest,menuone

    set ruler
    set backspace=indent,eol,start

    set complete-=i

    set nrformats-=octal

    set scrolloff=1
    set sidescrolloff=4
    set display+=lastline

    set encoding=utf-8
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    set formatoptions+=j        "Delete comment character when joining commented lines

    set autoread

    set undolevels=1000
    set undoreload=10000
    set history=1000
    set tabpagemax=50

    set updatetime=1000

"Viminfo | Auto Backup | Persistent Undo | Swap File Management | Sessions
    "Create Drirectories
        if !isdirectory($HOME."/.vim/.cache")
            call mkdir($HOME."/.vim/.cache", "", 0700)
        endif

        if !isdirectory($HOME."/.vim/.cache/.undo")
            call mkdir($HOME."/.vim/.cache/.undo", "", 0700)
        endif

        if !isdirectory($HOME."/.vim/.cache/.backup")
            call mkdir($HOME."/.vim/.cache/.backup", "", 0700)
        endif

        if !isdirectory($HOME."/.vim/.cache/.swp")
            call mkdir($HOME."/.vim/.cache/.swp", "", 0700)
        endif

        let sSession = "/.vim/.cache/sessions"
        let sSessionStartify = "~" . sSession
        if !isdirectory($HOME.sSession)
            call mkdir($HOME.sSession, "", 0700)        "Remember to update vim startify
        endif

    "VimInfo
        set viminfo=<800,'25,/50,:100,@100,h,c,f0,s100,n~/.vim/.cache/.viminfo
        "set viminfo+=%                                 "Save/restore buffer list
        "set viminfo+=<800                              "Amount of lines saved each register
        "set viminfo+='25                               "Amount of files for which marks are saved
        "set viminfo+=/50                               "Amount of search history saved
        "set viminfo+=:100                              "Amount of command-line history saved
        "set viminfo+=@100                              "Amount of input-line history saved
        "set viminfo+=h                                 "Disable 'hlsearch' saving to viminfo
        "set viminfo+=c                                 "Rewrites Viminfo encoding if necessary
        "set viminfo+=f0                                "File marks 0-9,A-Z 0=NOT stored
        "set viminfo+=s100                              "Maximum size of registers loaded (in Kbyte) (default is s10)
        "set viminfo+=n~/.vim/.cache/.viminfo           "viminfo file path

    "Location of directories
        set backupdir=~/.vim/.cache/.backup//
        set undodir=~/.vim/.cache/.undo//
        set directory=~/.vim/.cache/.swp//

    "Turn on necessary option
        set backup
        set undofile
        set swapfile

    "Make backup before overwriting the current buffer
        set writebackup

    "Overwrite the original backup file
        set backupcopy=yes

    "Meaningful backup name, ex: filename@2015-04-05.14:59
        au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

"--------------------------------------------------
"Autocmd
"--------------------------------------------------

augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <F9> :! python %<cr>
    autocmd FileType python setlocal commentstring=#\ %s
augroup END

autocmd BufWritePre * %s/\s\+$//e       "Trim whitespace on save

"--------------------------------------------------
"UI
"--------------------------------------------------

"Startify Title Screen
    let g:startify_session_dir = sSessionStartify

    let g:startify_lists = [
    \ { 'type': 'files',     'header': ['   Recent']            },
    "\ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    "\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

    let g:startify_commands = [
    \ {'i': ['Intro', ':intro']},
    \ {'U': ['Help Uganda', ':help uganda']},
    \ {'H': ['Vim Reference', 'h ref']},
    \ {'I': ['Vim Version Info', ':version']},
    \ {'C': ['Vimrc', ':e $MYVIMRC']},
    \ ]

    let g:startify_files_number = 10            "Number of files in recent
    let g:startify_update_oldfiles = 1          "Update files in recent while vim exists
    let g:startify_fortune_use_unicode = 1      "Use unicode on title screen
    let g:startify_padding_left = 3             "Total spaces for left padding
    let g:startify_enable_special = 1           "Show <empty buffer> and <quit>
    let g:startify_skiplist_server = [ ]        "Do not create startify buffer if Vim is a server instance

    let g:startify_session_autoload = 0         "Disable autoloading of sessions
    let g:startify_session_persistance = 0      "No autosaving of sessions
    let g:startify_session_delete_buffers = 0   "Deletes unsaved buffers when loading/closing sessions
    let g:startify_session_number = 999         "Number of sessions shown in startify buffer
    let g:startify_session_sort = 0             "Sorts sessions alphabetically (0) or by modified date (1)


    let g:Header = [
    \"                     .                         ",
    \"    ############## .... ##############         ",
    \"    ##############......##############         ",
    \"      ##########..........##########           ",
    \"      ##########........##########             ",
    \"      ##########.......##########              ",
    \"      ##########.....##########..              ",
    \"      ##########....##########.....            ",
    \"    ..##########..##########.........          ",
    \"  ....##########.#########.............        ",
    \"    ..#################.(O)..........          ",
    \"      ################.............            ",
    \"      ##############..0000.$$$$$$$$$$          ",
    \"      ############....00...$$..$$  $$          ",
    \"      ##########.....00...$$..$$  $$           ",
    \"      ########.....0000..$$$ $$$ $$$           ",
    \"      ######    .........                      ",
    \"                  .....                        ",
    \"                   .                           ",
    \"                                               ",
    \"Vim is charityware. Please support ICCF Holland",
    \"         and their efforts in Uganda.          ",
    \"                                               ",
    \]

    let g:Footer = [
    \"                                             ",
    \"                     .                       ",
    \"                     -`                      ",
    \"                    .o+`                     ",
    \"                   `ooo/                     ",
    \"                  `+oooo:                    ",
    \"                 `+oooooo:                   ",
    \"                 -+oooooo+:                  ",
    \"               `/:-:++oooo+:                 ",
    \"              `/++++/+++++++:                ",
    \"             `/++++++++++++++:               ",
    \"            `/+++ooooooooooooo/`             ",
    \"           ./ooosssso++osssssso+`            ",
    \"          .oossssso-````/ossssss+`           ",
    \"         -osssssso.      :ssssssso.          ",
    \"        :osssssss/        osssso+++.         ",
    \"       /ossssssss/        +ssssooo/-         ",
    \"     `/ossssso+/:-        -:/+osssso+-       ",
    \"    `+sso+:-`                 `.-/+oso:      ",
    \"   `++:.                           `-/+/     ",
    \"   .`                                 `/     ",
    \"                                             ",
    \"                 Arch Linux                  ",
    \"                     --                      ",
    \"            Keep It Simple Stupid            ",
    \]


    let g:startify_custom_header = 'startify#center(g:Header) + startify#center(startify#fortune#boxed())'
    let g:startify_custom_footer = 'startify#center(g:Footer)'

"Theme and Statusline
    fun! Custom_Colours()
        hi  User1   ctermbg=072     ctermfg=015     guibg=#5faf87   guifg=#ffffff
        hi  User2   ctermbg=238     ctermfg=015     guibg=#444444   guifg=#ffffff
        hi  User3   ctermbg=063     ctermfg=015     guibg=#5f5fff   guifg=#ffffff
        hi  User4   ctermbg=240     ctermfg=247     guibg=#585858   guifg=#9e9e9e
        hi  User5   ctermbg=244     ctermfg=238     guibg=#808080   guifg=#444444
        hi  User6   ctermbg=166     ctermfg=015     guibg=#d75f00   guifg=#ffffff
        hi  User7   ctermbg=000     ctermfg=000     guibg=#000000   guifg=#000000
        hi  User8   ctermbg=000     ctermfg=000     guibg=#000000   guifg=#000000
        hi  User9   ctermbg=000     ctermfg=000     guibg=#000000   guifg=#000000
    endfunction

    fun! Default_GUI()
        set background=dark
        let g:gruvbox_contrast_dark = 'hard'
        colorscheme gruvbox

        set guifont=DejaVuSansMono\ Nerd\ Font\ Mono\ 10
        set laststatus=2

        hi StartifyHeader ctermfg=036    guifg=#00af87
        hi StartifyFooter ctermfg=032    guifg=#0087d7

        call Custom_Colours()

        let g:currentmode={
            \ 'n'      : 'N',
            \ 'no'     : 'N·Operator Pending',
            \ 'v'      : 'V',
            \ 'V'      : 'V·Line',
            \ ''     : 'V·Block',
            \ 's'      : 'Select',
            \ 'S'      : 'S·Line',
            \ ''     : 'S·Block',
            \ 'i'      : 'I',
            \ 'R'      : 'R',
            \ 'Rv'     : 'V·Replace',
            \ 'c'      : 'Command',
            \ 'cv'     : 'Vim Ex',
            \ 'ce'     : 'Ex',
            \ 'r'      : 'Prompt',
            \ 'rm'     : 'More',
            \ 'r?'     : 'Confirm',
            \ '!'      : 'Shell',
            \ 't'      : 'Terminal'
        \}

        "Automatically change the statusline color depending on mode
        function! ChangeStatuslineColor()
            if (mode() =~# '\v(n|no)')
                exe 'hi! StatusLine ctermfg=008 guifg=#808080'
            elseif (mode() =~# '\v(v|V|)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
                exe 'hi! StatusLine ctermfg=005 guifg=#800080'
            elseif (mode() ==# 'i')
                exe 'hi! StatusLine ctermfg=004 guifg=#4CBED5'
            elseif (mode() ==# 'R')
                exe 'hi! StatusLine ctermfg=203 guifg=#de6d77'
            else
                exe 'hi! StatusLine ctermfg=184 guifg=#F5F544'
            endif
            return ''
        endfunction

        "Find out current buffer's size and output it.
        function! FileSize()
            let bytes = getfsize(expand('%:p'))
            if (bytes >= 1024)
                let kbytes = bytes / 1024
            endif
            if (exists('kbytes') && kbytes >= 1024)
                let mbytes = kbytes / 1024
            endif
            if bytes <= 0
                return '0'
            endif
            if (exists('mbytes'))
                return mbytes . 'MB'
            elseif (exists('kbytes'))
                return kbytes . 'KB'
            else
                return bytes . 'B'
            endif
        endfunction

        "Adds 'no ft' functionality to '%y' command
            function! FileType()
                if (&filetype=='')
                    return 'no ft'
                else
                    return &filetype
                endif
            endfunction

        set statusline=                                         "Clears statusline
        set statusline+=%{ChangeStatuslineColor()}              "Changing the statusline color
        set statusline+=%0*\ %{toupper(g:currentmode[mode()])}  "Current mode
        set statusline+=\ %1*                                   "Colour
        set statusline+=\ %<                                    "Cut off
        set statusline+=%t                                      "Tail of file
        set statusline+=%m                                      "Modified flag
        set statusline+=%h                                      "Help file flag
        set statusline+=%r                                      "Read-only flag
        set statusline+=%w                                      "Preview window flag
        set statusline+=\ %6*                                   "Colour
        set statusline+=%{FugitiveStatusline()}                 "Git Branch
        set statusline+=\ %2*                                   "Colour

        set statusline+=\ %=                                    "Swap Sides

        set statusline+=\ %3*                                   "Colour
        set statusline+=\ %{&ff}                                "File encoding
        set statusline+=\|%{strlen(&fenc)?&fenc:'none'}         "File format
        set statusline+=\|%{FileType()}                         "Filetype
        set statusline+=\|%{FileSize()}                         "Size of file
        set statusline+=\ %4*                                   "Colour
        set statusline+=\ [chr:%b]                              "Value of char
        set statusline+=\ %5*                                   "Colour
        set statusline+=[col:%c]                                "Current Collum
        set statusline+=[%l/%L]                                 "Current Line/Total Lines
        set statusline+=\ %P                                    "Precentage through file
        set statusline+=\ "                                     "End

        "Bufferline
            let g:bufferline_echo = 1                   "Active
            let g:bufferline_active_buffer_left = '['   "Seperator Left
            let g:bufferline_active_buffer_right= ']'   "Seperator Right
            let g:bufferline_modified = '+'             "Symbol for modification
            let g:bufferline_show_bufnr = 0             "Show buffer numbers
            let g:bufferline_fname_mod = ':t'           "Filename of buffer

    set showcmd     "Show Leader Command in buffer

endfunction

call Default_GUI()

command! -nargs=* DefaultGUI call Default_GUI()

"----------------------------
"Plugin Settings
"----------------------------

"vim-licenses
	let g:licenses_copyright_holders_name = 'Matthee, Ebert <ebert.matthee@tuta,io>'
	let g:licenses_authors_name = 'Matthee, Ebert <ebert.matthee@tuta.io>'


"Indent Highlight
	let g:indent_guides_enable_on_vim_startup = 1                                       "Enable on startup
	let g:indent_guides_indent_levels = 30                                              "Max indent guide level
	let g:indent_guides_auto_colors = 1                                                 "Auto chooses colors based on theme
	let g:indent_guides_color_change_percent = 10                                       "Percentage increase/decrease in shade
	let g:indent_guides_guide_size = 1                                                  "Width of guides (0 = shiftwidth)
	let g:indent_guides_start_level = 1                                                 "Indent level which guides are activated
	let g:indent_guides_space_guides = 1                                                "Considers spaces as indention
	let g:indent_guides_space_guides = 1                                                "Considers tabs as indention
	let g:indent_guides_soft_pattern = ' '                                              "Pattern for soft indention
	let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'newtr', 'startify']   "Excluded file types

"Table Mode
	let g:table_mode_corner='|' "Markdown Style

" UndoTree Setup
	" Window layout
	" style 1
	" +----------+------------------------+
	" |          |                        |
	" |          |                        |
	" | undotree |                        |
	" |          |                        |
	" |          |                        |
	" +----------+                        |
	" |          |                        |
	" |   diff   |                        |
	" |          |                        |
	" +----------+------------------------+
	" Style 2
	" +----------+------------------------+
	" |          |                        |
	" |          |                        |
	" | undotree |                        |
	" |          |                        |
	" |          |                        |
	" +----------+------------------------+
	" |                                   |
	" |   diff                            |
	" |                                   |
	" +-----------------------------------+
	" Style 3
	" +------------------------+----------+
	" |                        |          |
	" |                        |          |
	" |                        | undotree |
	" |                        |          |
	" |                        |          |
	" |                        +----------+
	" |                        |          |
	" |                        |   diff   |
	" |                        |          |
	" +------------------------+----------+
	" Style 4
	" +-----------------------++----------+
	" |                        |          |
	" |                        |          |
	" |                        | undotree |
	" |                        |          |
	" |                        |          |
	" +------------------------+----------+
	" |                                   |
	" |                            diff   |
	" |                                   |
	" +-----------------------------------+

	if !exists('g:undotree_WindowLayout')
	    let g:undotree_WindowLayout = 3
	endif

	let g:undotree_ShortIndicators = 0          "e.g. using 'd' instead of 'days' to save some space.
	let g:undotree_SplitWidth = 30
	let g:undotree_DiffpanelHeight = 10
	let g:undotree_DiffAutoOpen = 1             "Auto open diff window
	let g:undotree_SetFocusWhenToggle = 0       "Set focus on open
	let g:undotree_TreeNodeShape = '*'          "tree node shape.
	let g:undotree_DiffCommand = "diff"
	let g:undotree_RelativeTimestamp = 1
	let g:undotree_HighlightChangedText = 1
	let g:undotree_HighlightChangedWithSign = 1 "Highlight changed text using signs in the gutter

	"Highlight linked syntax type.
	let g:undotree_HighlightSyntaxAdd = "DiffAdd"
	let g:undotree_HighlightSyntaxChange = "DiffChange"
	let g:undotree_HighlightSyntaxDel = "DiffDelete"

	let g:undotree_HelpLine = 0 "Show help line

"Nerdtree
	let NERDTreeAutoCenter = 1
	let NERDTreeCenterThreshold = 3
	let NERDTreeCaseSensitiveSort = 0
	let NERDTreeNaturalSort = 1
	let NERDTreeUseTCD = 0
	let NERDTreeChDirMode = 0
	let NERDTreeHighlightCursorline = 1
	let NERDTreeHijackNetrw = 1
	let NERDTreeIgnore=[]
	let NERDTreeRespectWildIgnore = 0

	if !isdirectory($HOME."/.vim/.cache/.NERDTree")
		call mkdir($HOME."/.vim/.cache/.NERDTree", "", 0700)
	endif

	let NERDTreeBookmarksFile = $HOME."/.vim/.cache/.NERDTree/.NERDTreeBookmarks"
	let NERDTreeBookmarksSort = 1
	let NERDTreeMarkBookmarks = 1
	let NERDTreeMouseMode = 1
	let NERDTreeQuitOnOpen = 0
	let NERDTreeShowBookmarks = 0
	let NERDTreeShowFiles = 1
	let NERDTreeShowHidden = 1
	let NERDTreeShowLineNumbers = 0
	let NERDTreeSortOrder = ['\/$', '*', '\.vim', '\.swp$', '\.bak$', '\~$']
	let NERDTreeStatusLine = "%{exists('b:NERDTree')?b:NERDTree.root.path.str():''}"
	let NERDTreeWinPos = "left"
	let NERDTreeWinSize = 31
	let NERDTreeMinimalUI = 0
	let NERDTreeMinimalMenu = 0
	let NERDTreeCascadeSingleChildDir = 1
	let NERDTreeCascadeOpenSingleChildDir = 1
	let NERDTreeAutoDeleteBuffer = 0
	let NERDTreeCreatePrefix = "silent"
	let NERDTreeDirArrowExpandable="+"
	let NERDTreeDirArrowCollapsible = "~"

"Limelight
	autocmd! User GoyoEnter Limelight
	autocmd! User GoyoLeave Limelight!

"----------------------------
"Custom Functions
"----------------------------

"----------------------------
"Keybinds
"----------------------------
let mapleader = "\ "
"Following Keys used by plugins (not user defined):
	"<Leader>ig -> Toggle indent guides
	"<M-p> -> Toggle auto-pairs

"Function Keys
	"nnoremap <F1> :help"System defined
	"inoremap <F1>

	set pastetoggle=<F2>                    " Switch to paste mode
	"inoremap <F2>

	nnoremap <F3> :NERDTreeToggle<CR>       " Toggle NERDTree
	"inoremap <F3>

	nnoremap <F4> :UndotreeToggle<cr>       " Toggle Undo History
	"inoremap <F4>

	"nnoremap <F5>
	"inoremap <F5>

	"nnoremap <F6>
	"inoremap <F6>

	"nnoremap <F7>
	"inoremap <F7>

	"nnoremap <F8>
	"inoremap <F8>

	"nnoremap <F9> "Reserved For Compilers (see augroups)
	"inoremap <F9>

	"nnoremap <F10>
	"inoremap <F10>

	nnoremap <F11> i<C-R>=strftime("%d/%m/%Y %a %T %z (%Z)")<CR><Esc>  "Timestamp
	inoremap <F11> <C-R>=strftime("%d/%m/%Y %a %T %z (%Z)")<CR>

	"nnoremap <F12>
	"inoremap <F12>


"Alt Combos
    map <Esc>i <A-i>
    map <Esc>g <A-g>
    nnoremap <A-i> :IndentGuidesToggle<cr>  " Toggle Indent Highlight
    nnoremap <A-g> :Goyo<cr>                " Toggle WriterMode

    " nnoremap <M-G> :DefaultGUI<cr>          " Load Default GUI
    " nnoremap <M-T> :retab<cr>               " Converts Pre-existing Tabs to Vimrc Rules
    " nnoremap <M-W> :WordProcessor<cr>       " Toggle Word Processor
    " nnoremap <M-Y> :vsp $MYVIMRC<CR>        " Open my vimrc file in vertical tab
    " nnoremap <M-Z> :source $MYVIMRC<CR>     " Reload my vimrc file


nnoremap <space> za                         " Fold Code

"Better Buffer Movement: CTRL + Direction
    map <C-j> <C-W>j
    map <C-k> <C-W>k
    map <C-h> <C-W>h
    map <C-l> <C-W>l

" Following keys are used by TMUX
    " map <M-j> <C-W>j
    " map <M-k> <C-W>k
    " map <M-h> <C-W>h
    " map <M-l> <C-W>l

"Disable arrow movement, resize splits instead.
    nnoremap <Up>    :resize +2<CR>
    nnoremap <Down>  :resize -2<CR>
    nnoremap <Left>  :vertical resize +2<CR>
    nnoremap <Right> :vertical resize -2<CR>

"Move Lines
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv
