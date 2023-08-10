"                       OPTIONS

set nocompatible
filetype plugin indent on           "   filetype, plugin, indent auto-detect

"   UI
hi Visual ctermfg=black ctermfg=grey

"   ERGONOMIC
set ignorecase smartcase            "   ignore case except if uppercase used
set listchars=tab:>\ ,trail:-       "   strings to use for :list command
set nowrap                          "   disable screen line wrapping
set ruler                           "   cursor pos%[y:x] in statusline
set showcmd                         "   cursor pos%[y:x] in statusline
set shortmess-=S                    "   displays [x/y] for search pattern occurences
set wildmenu                        "   displays possible completion matches

"   INDENTATION
set autoindent                      "   auto indent
set expandtab                       "   insert spaces instead tab
set shiftround                      "   indent to the nearest tab mark
set shiftwidth=4 tabstop=4          "   shift and tab width in spaces

"   PERFORMANCE
set lazyredraw                      "   increase macro fluidity
set ttimeoutlen=0                   "   mapping and keycode delays (fix esc)
set updatetime=100                  "   gitgutter update faster

"   SECURITY
set belloff=all                     "   no more ring the bell
set history=9999                    "   extends cmdline history
set nomodeline secure               "   disables shell access / modelines
if empty(glob($DOTVIM . "/.swp"))
    exec 'silent !mkdir $DOTVIM/.swp'
endif
set directory=$DOTVIM/.swap//,/tmp//    "   undo files directory
if empty(glob($DOTVIM . "/.undo"))
    exec 'silent !mkdir $DOTVIM/.undo'
endif
set undodir=$DOTVIM/.undo/,/tmp//               "   undo files directory
set undofile                                    "   enable undofiles
set viminfo+='100,<50,s10,h,n$DOTVIM/.viminfo   "   viminfo location

"                       FUNCTIONS
command W :execute ':silent w !sudo tee % > /dev/null' | :edit!

"                       MAPPINGS
nn sf :fin<Space>
nn se :e *
nn sp :b#<CR>
nn sb :ls<CR>:b<Space>
nn sd :bn\|bd#<CR>
no sw  :write<CR>
no SW  :write !sudo tee %<CR>
no sq  :quit<CR>

nn scv :e ~/.vimrc<CR>gi<Esc>
nn scz :e ~/.zshrc<CR>gi<Esc>
nn sct :e ~/.tmux.conf<CR>gi<Esc>

"   cursorcolumn
nn glcc :set cursorcolumn!<CR>
"   LCD
nn glcd :cd %:h<CR>
"   cursorline
nn glcl :set cursorline!<CR>
"   hlsearch
nn glhl :set hlsearch!<CR>
"   list
nn glli :set list!<CR>
"   source vimrc
nn glso :silent write\|source $MYVIMRC\|e<CR>zR
"   spell
nn glsp :set spell!<CR>
"   virtual edit
nn glve :if &virtualedit == "" <BAR> set virtualedit=all <BAR>
"   resolve symlink
nn <silent> glsl :exec 'file ' . fnameescape(resolve(expand('%:p')))<CR>:lc %:h<CR>

no <Space>w <C-W>
nn <Space>wE :resize <C-R>=&lines * 0.66<CR><CR>
nn <Space>we :vertical resize <C-R>=&columns * 0.66<CR><CR>

no x            <nop>
no s            <nop>
no X            <nop>
nn S            <nop>
nn Q            <nop>
