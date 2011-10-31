" Paths
let $VIMDIR = $HOME.'/.vim'
let $WORKDIR = $HOME.'/workspace'
if has("gui_running")
    let $CURDIR = $WORKDIR
    exe 'cd '. $WORKDIR
else
    let $CURDIR = getcwd()
endif

" Pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Includes
source $VIMDIR/vimrc/basic.vimrc
source $VIMDIR/vimrc/key.vimrc
source $VIMDIR/vimrc/php-doc.vim

if has("gui_running")
    source $VIMDIR/vimrc/gvim.vimrc
else
    source $VIMDIR/vimrc/vim.vimrc
endif

