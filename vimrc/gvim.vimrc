"-------------------------
" gVim
"-------------------------

set gfn=Terminus\ 12

" Скрыть панель в gui версии, меню, левые и правы полосы прокрутки
set guioptions-=T
set guioptions-=L
set guioptions-=r
set guioptions-=m

" Курсору не мигать
set guicursor+=n-v-c:blinkon0

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
"set wildmenu
"set wcm=<Tab>
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.cp866 :e ++enc=cp866<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

exe 'cd '. g:workdir
