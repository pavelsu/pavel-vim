"------------------------
" Базовые настройки
"-------------------------

" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
set nocompatible

" Убираем приверствие
set shortmess+=I

" Цветовая схема
"colorscheme xoria256
colorscheme molokai

" Включаем нумерацию строк
set nu
set numberwidth=6

" Подствечивать редактируемую строку в режиме вставки
"autocmd InsertLeave * se nocul
"autocmd InsertEnter * se cul

" Включить автоотступы
set autoindent
set nosmartindent

" Включаем "умные" отспупы ( например, автоотступ после {)
"set smartindent
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set expandtab
set shiftround

" Включить игнорирование регистра при поиске
set ignorecase

" Умный поиск. То есть если запрос поиска содержит только маленькие буквы -
" будет поиска с игнорированием регистра. Если хоть одна буква будет большая -
" поиск будет с учетом регистра. Опция для включения/выключения:
set smartcase

" Кодировка текста по умолчанию
set termencoding=utf-8
set encoding=utf-8
set fileencoding=utf-8

" Последовательность выбора кодировок при открытии файлов
set fencs=utf-8,cp1251,koi8-r,ucs-2,cp866

" Линия по 80 символу
autocmd BufEnter,BufWritePost ?* setlocal colorcolumn=81
"set colorcolumn=81

" Подчеркивание
autocmd BufEnter,BufWritePost ?* setlocal cul

" Заставляем BackSpace работать как x, т.е. удалять предыдущий символ
set backspace=indent,eol,start whichwrap+=<,>,[,]

" Копирование в обычный виндовы буфер, и вставка тоже из него
" (актуально для OS Windows)
" set clipboard=unnamed

" Показывать положение курсора всё время.
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Фолдинг по отсупам
"set foldmethod=manual

" Поиск по набору текста (очень полезная функция)
set incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
" set nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана,
" чтобы подняться в режиме редактирования
set scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана,
" чтобы опуститься в режиме редактирования
set scrolloff=7

" Не изменять размеры окон при открытии/закрытии новго окна
set noequalalways

" Выключаем надоедливый звонок
set novisualbell
set t_vb=

" Поддержка мыши
set mouse=a
set mousemodel=popup

" Разрешить визуальное выделение мышью
set mouse=nvir

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и
" тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
set hidden

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" Влючить подстветку синтаксиса
syntax on

" allow to use backspace instead of "x"
"set backspace=indent,eol,start whichwrap+=<,>,[,]

" Формат строки состояния
set statusline=%<%f%h%m%r\ %b\ %{&encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

"Вырубаем .swp и ~ (резервные) файлы
set nobackup
set noswapfile

" Отслеживать изменения файлов
set autoread

" Хранить больше истории команд ...
" ... и правок
set history=128
set undolevels=2048

" Сохранение undo после закрытия файла
set undofile
set undodir=~/.vim/undo/

" Запомнить позицию курсора и фолдинг
set viewoptions=cursor,folds
autocmd BufWinLeave * if expand("%") != "" | mkview | endif
autocmd BufWinEnter * if expand("%") != "" | loadview | endif

" Fix <Enter> for comment
set fo+=cr

" Подсветка: пробелов в перемешку с табами, табов и пробелов
" в конце строки, пробела с между табами
highlight ExtraWhitespace ctermbg=166 guibg=#d75f00
autocmd BufEnter,BufWritePost ?* syn match ExtraWhitespace /\s\+$/ containedin=ALL
autocmd BufEnter,BufWritePost ?* syn match ExtraWhitespace /\v\t+[ ]+/ containedin=ALL
autocmd BufEnter,BufWritePost ?* syn match ExtraWhitespace /\v[ ]+\t+/ containedin=ALL

" Сортировка css свойств
" noremap <silent><leader>ss <esc>vi{:!sort<cr>:echo "Свойства css отсортированы!"<cr>

" Автоматическое открытие NERDTree
let NERDTreeChDirMode=2

" Indexer
let g:indexer_disableCtagsWarning=1
let g:indexer_lookForProjectDir=0
let g:indexer_ctagsJustAppendTagsAtFileSave=1
let g:indexer_indexerListFilename=$HOME."/.vim/indexer_files"
let g:indexer_tagsDirname=$HOME."/.vim/tags"
let g:indexer_ctagsCommandLineOptions="-h '.php' -R --totals=yes --tag-relative=yes --PHP-kinds=+cf --regex-PHP='/abstract class ([^ ]*)/\1/c/' --regex-PHP='/interface ([^ ]*)/\1/c/' --regex-PHP='/(public |static |abstract |protected |private )+function ([^ (]*)/\2/f/' --exclude='*cache*'"

" Ctrl-пробел - автодоплнение
imap <C-Space> <C-X><C-O>

" Чтоб не хватал первый попавшийся
set completeopt=longest,menuone,preview

" Автодополнение по tab
let g:SuperTabDefaultCompletionType = "<c-x><c-n>"
let g:SuperTabContextDefaultCompletionType="<c-x><c-n>"

" Автоматически открывать и закрывать окно предпросмотра
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
au CursorMovedI,InsertLeave * silent! pclose

" jQuery
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery

" Автоматические сохранять сесси
let g:session_autosave="yes"

" Ack for Debian / Ubuntu +  --ignore-case
let g:ackprg="ack-grep -H --nocolor --nogroup --column  --ignore-case"

" Автодополнение html
let g:sparkupExecuteMapping = '<c-d>'
