filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

let g:workdir = $HOME.'/workspace'
source ~/.vim/vimrc/basic.vimrc
source ~/.vim/vimrc/key.vimrc
source ~/.vim/vimrc/php-doc.vim

if has("gui_running")
    source ~/.vim/vimrc/gvim.vimrc
else
    source ~/.vim/vimrc/vim.vimrc
endif

