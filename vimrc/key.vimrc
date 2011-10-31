"-------------------------
" Горячие клавиш
"-------------------------

" C-a доавить строчку после курсора
map <C-a> :call append(line('.'), [''])<cr>
imap <C-a> <esc>:call append(line('.'), [''])<cr>i

" Поиск и замена слова под курсором
nmap ; :%s/\<<c-r>=expand("<cword>")<cr>\>/<c-r>=expand("<cword>")<cr>
nmap \ /<c-r>=expand("<cword>")<cr>

" Проверка орфографии
set spelllang=ru,en
set nospell
syntax spell toplevel
"map <F3> :set spell!<CR><bar>:echo "Spell check: " .strpart("OFFON", 3 * &spell, 3)<CR>
map <F3> :set spell!<CR>
imap <F3> :set spell!<CR>i
vmap <F3> :set spell!<CR>v

" F2 - быстрое сохранение
nmap <F2> :w<cr>
vmap <F2> <esc>:w<cr>v
imap <F2> <esc>:w<cr>i

" F4 - просмотр ошибок
let s:vim_msg_state = 0
function Vim_msg_toogle()
	if s:vim_msg_state==0
		let s:vim_msg_state=1
		botright copen
	else
		let s:vim_msg_state=0
		cclose
	endif
endfunction

nmap <F4> :call Vim_msg_toogle()<cr>
vmap <F4> <esc>:call Vim_msg_toogle()<cr>
imap <F4> <esc>:call Vim_msg_toogle()<cr>

" Не переходить по энтеру на окно редактора
au BufWinEnter quickfix nmap <buffer> <cr> <cr><esc>:wincmd b<cr>

" F5 - просмотр списка буферов
nmap <F5> <Esc>:BufExplorer<cr>
vmap <F5> <esc>:BufExplorer<cr>
imap <F5> <esc><esc>:BufExplorer<cr>

" F6 - предыдущий буфер
map <F6> :bp<cr>
vmap <F6> <esc>:bp<cr>i
imap <F6> <esc>:bp<cr>i

" F7 - следующий буфер
map <F7> :bn<cr>
vmap <F7> <esc>:bn<cr>i
imap <F7> <esc>:bn<cr>i

" F8 - список закладок
map <F8> :MarksBrowser<cr>
vmap <F8> <esc>:MarksBrowser<cr>
imap <F8> <esc>:MarksBrowser<cr>

" F9 - "make" команда
function Vim_msg_show()
	let s:vim_msg_state=1
	botright copen
endfunction

map <F9> :make!<cr><cr>:call Vim_msg_show()<cr>
vmap <F9> <esc>:make!<cr><cr>:call Vim_msg_show()<cr>
imap <F9> <esc>:make!<cr><cr>:call Vim_msg_show()<cr>

" F10 - удалить буфер
map <F10> :bd<cr>
vmap <F10> <esc>:bd<cr>
imap <F10> <esc>:bd<cr>

" F11 - показать окно Taglist, спарва
map <F11> :TlistToggle<cr>
vmap <F11> <esc>:TlistToggle<cr>
imap <F11> <esc>:TlistToggle<cr>
let Tlist_Use_Right_Window = 1

" F12 - обозреватель файлов
map <F12> :exe 'NERDTreeToggle ' .g:workdir<cr>
vmap <F12> <esc>:exe 'NERDTreeToggle'. g:workdir<cr>
imap <F12> <esc>:exe 'NERDTreeToggle'. g:workdir<cr>

" Gundo
nmap <c-z> :GundoToggle<cr>
vmap <c-z> <esc>:GundoToggle<cr>
imap <c-z> <esc>:GundoToggle<cr>

" < & > - делаем отступы для блоков
vmap < <gv
vmap > >gv

" Выключаем ненавистный режим замены
imap <Ins> <Esc>i

" Редко когда надо [ без пары =)
imap [ []<LEFT>
" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

"Навигация по окнам
map <C-Left> <C-W><Left>
imap <C-Left> <esc><C-W><Left>
map <C-Right> <C-W><Right>
imap <C-Right> <esc><C-W><Right>
map <C-Up> <C-W><Up>
imap <C-Up> <esc><C-W><Up>
map <C-Down> <C-W><Down>
imap <C-Down> <esc><C-W><Down>

" Изменение размеров
map <S-C-Left> <C-W><
map <S-C-Right> <C-W>>
map <S-C-Up> <C-W>-
map <S-C-Down> <C-W>+

" Новая вкладка Ctrl-T
"map <c-t> :tabnew<cr>
"nmap <c-t> :tabnew<cr>
"imap <c-t> <esc>:tabnew<cr>i

" Предыдущая вкладка Shift+Tab
"map <s-tab> :tabp<cr>
"nmap <s-tab> :tabp<cr>
"imap <s-tab> <esc>:tabp<cr>i

" Следующая вкладка Сtrl+Tab
"map <c-tab> :tabn<cr>
"nmap <c-tab> :tabn<cr>
"imap <c-tab> <esc>:tabn<cr>i

" Перемещение закладок по Alt+СтрелкаВлево и Alt+СтрелкаВправо
"nnoremap <silent> <a-left> :execute 'silent! tabmove ' . (tabpagenr()-2)<cr>
"nnoremap <silent> <a-right> :execute 'silent! tabmove ' . tabpagenr()<cr>

" Копирование и вставка в глобальный клипбоард
vmap <c-insert> "+yv
nmap <s-insert> "+gP
imap <s-insert> <c-r>+
vmap <c-c> "+yv
nmap <c-v> "+gP
imap <c-v> <c-r>+

" Переназначение Home
inoremap <home> <esc>^i
inoremap <s-home> <esc>0i
nnoremap <home> ^
nnoremap <s-home> 0

" phpDoc
inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR>v

" Прорисовать табы
nmap <c-i> :IndentGuidesToggle<cr>
vmap <c-i> <esc>:IndentGuidesToggle<cr>v
imap <c-i> <esc>:IndentGuidesToggle<cr>i

" Развертывание html
let g:sparkupExecuteMapping = '<c-d>'

" Ctrl-пробел - автодоплнение
imap <C-Space> <C-X><C-O>

" Автодополнение по tab
autocmd BufEnter,BufWritePost * let g:SuperTabDefaultCompletionType="<c-x><c-o>"
autocmd BufEnter,BufWritePost *php let g:SuperTabDefaultCompletionType="<c-x><c-n>"

" Сортировка css свойств
nmap <c-o> :g#\({\n\)\@<=#.,/}/sort<cr>
vmap <c-o> <esc>:g#\({\n\)\@<=#.,/}/sort<cr>v
imap <c-o> <esc>:g#\({\n\)\@<=#.,/}/sort<cr>i

" С-q - выход из Vim
map <C-Q> <Esc>:qa<cr>

"-------------------------
" Горячие клавивши на русском
"-------------------------
map ё `
map й q
map ц w
map у e
map к r
map е t
map н y
map г u
map ш i
map щ o
map з p
map х [
map ъ ]
map ф a
map ы s
map в d
map а f
map п g
map р h
map о j
map л k
map д l
map ж ;
map э '
map я z
map ч x
map с c
map м v
map и b
map т n
map ь m
map б ,
map ю .
map . /

map Ё ~
map Й Q
map Ц W
map У E
map К R
map Е T
map Н Y
map Г U
map Ш I
map Щ O
map З P
map Х {
map Ъ }
map Ф A
map Ы S
map В D
map А F
map П G
map Р H
map О J
map Л K
map Д L
map Ж :
map Э "
map Я Z
map Ч X
map С C
map М V
map И B
map Т N
map Ь M
map Б <
map Ю >
map , ?

cmap цй wq

