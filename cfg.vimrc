" Paths
let $VCFG = $HOME.'/.vim'
let g:workdir = $HOME.'/workspace'

" Pathogen
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Includes
source $VCFG/vimrc/basic.vimrc
source $VCFG/vimrc/key.vimrc
source $VCFG/vimrc/php-doc.vim

if has("gui_running")
    source $VCFG/vimrc/gvim.vimrc
else
    source $VCFG/vimrc/vim.vimrc
endif

