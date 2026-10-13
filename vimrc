set nocompatible
set encoding=utf-8
set termguicolors
syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', {'do': { -> fzf#install() }}
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'justinmk/vim-sneak'
Plug 'airblade/vim-gitgutter'
Plug 'catppuccin/vim', {'as': 'catppuccin'}   " tema oficial con todos los grupos de color
Plug 'liuchengxu/vim-which-key'               " al pulsar la coma muestra un menú con todos tus atajos
Plug 'mhinz/vim-startify'                     " pantalla de inicio con archivos recientes
Plug 'jiangmiao/auto-pairs'                   " autocierre de paréntesis que sí "salta" el cierre
Plug 'mbbill/undotree'                        " historial visual de cambios (:UndotreeToggle)
call plug#end()

set number
set norelativenumber
set nocursorcolumn
set nocursorline
set mouse=a
set hidden
set autoread
set showmatch
set scrolloff=5
set sidescrolloff=5
set signcolumn=yes
set wildmenu
set wildmode=longest:full,full
set splitright
set splitbelow
set backspace=indent,eol,start
set completeopt=menuone,noselect
set updatetime=300
set path+=**

set incsearch
set hlsearch
set ignorecase
set smartcase

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set smartindent

autocmd FileType * setlocal formatoptions-=cro

set list
set listchars=tab:▸\ ,trail:·,extends:›,precedes:‹

set foldmethod=indent
set foldlevel=99
set foldenable

if has('clipboard')
    set clipboard=unnamedplus
endif

if !isdirectory($HOME . '/.vim/undo')
    call mkdir($HOME . '/.vim/undo', 'p')
endif
set undofile
set undodir=~/.vim/undo

set background=dark

highlight Normal       guifg=#CDD6F4 guibg=#1E1E2E
highlight NonText      guifg=#45475A
highlight EndOfBuffer  guifg=#45475A
highlight LineNr       guifg=#6C7086
highlight CursorLine   guibg=#292A3D
highlight CursorLineNr guifg=#CBA6F7 gui=bold
highlight Visual       guibg=#45475A
highlight Search       guifg=#1E1E2E guibg=#F9E2AF
highlight IncSearch    guifg=#1E1E2E guibg=#FAB387 gui=bold
highlight Cursor       guifg=#1E1E2E guibg=#F5E0DC
highlight MatchParen   guifg=#F9E2AF guibg=#45475A gui=bold

highlight Comment      guifg=#7F849C gui=italic
highlight String       guifg=#A6E3A1
highlight Constant     guifg=#FAB387
highlight Number       guifg=#FAB387
highlight Boolean      guifg=#FAB387
highlight Identifier   guifg=#89B4FA
highlight Function     guifg=#89B4FA gui=bold
highlight Statement    guifg=#CBA6F7
highlight Conditional  guifg=#CBA6F7
highlight Repeat       guifg=#CBA6F7
highlight Operator     guifg=#89DCEB
highlight PreProc      guifg=#F5C2E7
highlight Type         guifg=#F9E2AF
highlight Special      guifg=#F2CDCD
highlight Todo         guifg=#1E1E2E guibg=#F9E2AF gui=bold

highlight Error        guifg=#F38BA8 gui=bold
highlight WarningMsg   guifg=#FAB387 gui=bold
highlight ErrorMsg     guifg=#F38BA8 guibg=#1E1E2E gui=bold

highlight VertSplit    guifg=#45475A guibg=#1E1E2E
highlight WinSeparator guifg=#45475A guibg=#1E1E2E
highlight StatusLine   guifg=#CDD6F4 guibg=#313244 gui=NONE
highlight StatusLineNC guifg=#7F849C guibg=#181825 gui=NONE
highlight User1        guifg=#1E1E2E guibg=#CBA6F7 gui=bold
highlight User2        guifg=#1E1E2E guibg=#89B4FA gui=bold

highlight Directory    guifg=#89B4FA gui=bold
highlight netrwDir     guifg=#89B4FA gui=bold
highlight netrwClassify guifg=#CBA6F7
highlight netrwPlain   guifg=#CDD6F4

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 0
let g:netrw_winsize = 30
let g:netrw_list_hide = '^\.,\~$'
let g:netrw_hide = 1

augroup MiNetrwBorrar
    autocmd!
    autocmd FileType netrw nmap <buffer> <leader>r D
augroup END

function! MiModo()
    let l:modo = mode()
    if l:modo ==# 'n'
        return ' NORMAL '
    elseif l:modo ==# 'i'
        return ' INSERT '
    elseif l:modo ==# 'v' || l:modo ==# 'V' || l:modo ==# "\<C-v>"
        return ' VISUAL '
    elseif l:modo ==# 'R'
        return ' REPLACE '
    elseif l:modo ==# 'c'
        return ' COMMAND '
    else
        return ' VIM '
    endif
endfunction

set laststatus=2
set statusline=
set statusline+=%#User1#
set statusline+=%{MiModo()}
set statusline+=%#StatusLine#
set statusline+=\ %y
set statusline+=\ %f
set statusline+=\ %m%r
set statusline+=%=
set statusline+=%#User2#
set statusline+=\ Línea:%l/%L
set statusline+=\ Col:%c
set statusline+=\ %p%%\

let mapleader = ","

nnoremap <leader>e :Lexplore<CR>
nnoremap <leader>q :close<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>d yyp

nnoremap <M-Left>  :vertical resize -5<CR>
nnoremap <M-Right> :vertical resize +5<CR>
nnoremap <M-Up>    :resize +2<CR>
nnoremap <M-Down>  :resize -2<CR>

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <leader>b :ls<CR>:buffer<Space>
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>

vnoremap < <gv
vnoremap > >gv

nnoremap <A-j> :move .+1<CR>==
nnoremap <A-k> :move .-2<CR>==
vnoremap <A-j> :move '>+1<CR>gv=gv
vnoremap <A-k> :move '<-2<CR>gv=gv

nnoremap <leader>z za
nnoremap <leader>zo zR
nnoremap <leader>zc zM

inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>

autocmd BufWritePre * if &filetype !=# 'markdown' | %s/\s\+$//e | endif

let g:mi_plantillas = {
    \ 'py':  ['def main():', '    print("Hola, mundo")', '', '', 'if __name__ == "__main__":', '    main()'],
    \ 'sh':  ['#!/usr/bin/env bash', ''],
    \ 'c':   ['#include <stdio.h>', '', 'int main(void) {', '    printf("Hola, mundo\n");', '    return 0;', '}'],
    \ 'cpp': ['#include <iostream>', '', 'int main() {', '    std::cout << "Hola, mundo" << std::endl;', '    return 0;', '}'],
    \ 'js':  ['console.log("Hola, mundo");'],
    \ 'lua': ['print("Hola, mundo")'],
    \ }

let g:mi_alias = {
    \ 'python': 'py', 'c++': 'cpp', 'cc': 'cpp',
    \ 'bash': 'sh', 'javascript': 'js',
    \ }

function! MiNuevoArchivo()
    let l:ruta = input('Nombre del archivo (ej: hola.py): ', '', 'file')
    if empty(l:ruta)
        return
    endif

    if fnamemodify(l:ruta, ':e') ==# ''
        let l:lang = tolower(input('Lenguaje (py, c, cpp, js, sh, lua): '))
        if empty(l:lang)
            return
        endif
        let l:lang = get(g:mi_alias, l:lang, l:lang)
        let l:ruta = l:ruta . '.' . l:lang
    endif

    let l:dir = fnamemodify(l:ruta, ':h')
    if l:dir !=# '.' && !isdirectory(l:dir)
        call mkdir(l:dir, 'p')
    endif

    let l:existe = filereadable(l:ruta)
    execute 'edit ' . fnameescape(l:ruta)

    let l:ext = fnamemodify(l:ruta, ':e')
    if !l:existe && has_key(g:mi_plantillas, l:ext)
        call setline(1, g:mi_plantillas[l:ext])
        normal! G
    endif
endfunction

function! MiBuscarArchivo()
    let l:ruta = input('Abrir archivo: ', '', 'file')
    if !empty(l:ruta)
        execute 'edit ' . fnameescape(l:ruta)
    endif
endfunction

nnoremap <leader>f :call MiBuscarArchivo()<CR>
nnoremap <leader>n :call MiNuevoArchivo()<CR>

function! MiGuardar()
    if expand('%') ==# ''
        let l:ruta = input('Guardar como: ', '', 'file')
        if empty(l:ruta)
            return
        endif
        execute 'saveas ' . fnameescape(l:ruta)
    else
        write
    endif
endfunction

nnoremap <leader>w :call MiGuardar()<CR>
nnoremap <C-s> :call MiGuardar()<CR>
inoremap <C-s> <Esc>:call MiGuardar()<CR>

let g:mi_runners = {
    \ 'python':     'python3 %s',
    \ 'sh':         'bash %s',
    \ 'javascript': 'node %s',
    \ 'lua':        'lua %s',
    \ 'c':          'gcc %s -o /tmp/mi_a.out && /tmp/mi_a.out',
    \ 'cpp':        'g++ %s -o /tmp/mi_a.out && /tmp/mi_a.out',
    \ }

let g:mi_ultimo_cmd = ''
let g:mi_ultimo_dir = ''
let g:mi_terminal_bufnr = -1

function! MiEjecutar()
    if &buftype ==# ''
        if expand('%') ==# ''
            call MiGuardar()
            if expand('%') ==# ''
                return
            endif
        endif
        update

        if !has_key(g:mi_runners, &filetype)
            echohl WarningMsg
            echo 'No hay ejecutor para el tipo: "' . &filetype . '"'
            echohl None
            return
        endif

        let g:mi_ultimo_cmd = printf(g:mi_runners[&filetype], shellescape(expand('%:p')))
        let g:mi_ultimo_dir = expand('%:p:h')
    endif

    if empty(g:mi_ultimo_cmd)
        echo 'Abre un archivo ejecutable antes de pulsar F5.'
        return
    endif

    if g:mi_terminal_bufnr > 0 && bufexists(g:mi_terminal_bufnr)
                \ && getbufvar(g:mi_terminal_bufnr, '&buftype') ==# 'terminal'
        if bufwinid(g:mi_terminal_bufnr) == -1
            botright 10split
            execute 'buffer ' . g:mi_terminal_bufnr
            wincmd p
        endif
    else
        let l:prev = win_getid()
        botright 10new
        call term_start(['bash'], {'curwin': 1, 'cwd': g:mi_ultimo_dir})
        let g:mi_terminal_bufnr = bufnr('%')
        call win_gotoid(l:prev)
    endif

    call term_sendkeys(g:mi_terminal_bufnr,
                \ 'clear; cd ' . shellescape(g:mi_ultimo_dir)
                \ . ' && ' . g:mi_ultimo_cmd . "\n")
endfunction

function! MiCerrarResultado()
    if g:mi_terminal_bufnr > 0 && bufexists(g:mi_terminal_bufnr)
        execute 'bwipeout! ' . g:mi_terminal_bufnr
    endif
    let g:mi_terminal_bufnr = -1
endfunction

nnoremap <F5> :call MiEjecutar()<CR>
inoremap <F5> <Esc>:call MiEjecutar()<CR>
nnoremap <F6> :call MiCerrarResultado()<CR>
tnoremap <F6> <C-\><C-n>:call MiCerrarResultado()<CR>
tnoremap <Esc> <C-\><C-n>

function! MiBuscarProyecto()
    let l:texto = input('Buscar en el proyecto: ')
    if empty(l:texto)
        return
    endif

    execute 'silent! vimgrep /' . escape(l:texto, '/') . '/gj **/*'

    if len(getqflist()) > 0
        copen
        echo 'Resultados de búsqueda: ' . len(getqflist())
    else
        echo 'No se encontraron coincidencias.'
    endif
endfunction

nnoremap <leader>/ :call MiBuscarProyecto()<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprevious<CR>
nnoremap <leader>o :copen<CR>
nnoremap <leader>c :cclose<CR>

function! MiDashboard()
    setlocal buftype=nofile bufhidden=wipe noswapfile nobuflisted
    setlocal nonumber norelativenumber nocursorline nolist

    let l:lineas = [
        \ '',
        \ '        __     ___           ',
        \ '        \ \   / (_)_ __ ___  ',
        \ '         \ \ / /| | ''_ ` _ \ ',
        \ '          \ V / | | | | | | |',
        \ '           \_/  |_|_| |_| |_|',
        \ '',
        \ '          MI VIM PERSONAL',
        \ '',
        \ '   e  - Explorador de archivos',
        \ '   n  - Nuevo archivo (pide nombre y detecta el lenguaje)',
        \ '   f  - Abrir archivo por ruta',
        \ '   h  - Ayuda de Vim',
        \ '   q  - Salir',
        \ ''
        \ ]
    call setline(1, l:lineas)
    setlocal nomodifiable

    nnoremap <silent><buffer> e :Lexplore<CR>
    nnoremap <silent><buffer> n :call MiNuevoArchivo()<CR>
    nnoremap <silent><buffer> f :call MiBuscarArchivo()<CR>
    nnoremap <silent><buffer> h :help index<CR>
    nnoremap <silent><buffer> q :qa<CR>
endfunction

augroup MiDashboardInicio
    autocmd!
    autocmd VimEnter * if argc() == 0 && line2byte('$') == -1 | call MiDashboard() | endif
augroup END

command! MiEditorInfo
    \ echo 'Vim: ' . v:version
    \ | echo 'Configuracion: ' . $MYVIMRC
    \ | echo 'Archivo: ' . expand('%:p')
    \ | echo 'Tipo de archivo: ' . &filetyp



if has('mouse_sgr')
    set ttymouse=sgr
endif

highlight MiScrollTrack guifg=#45475A guibg=#1E1E2E
highlight MiScrollThumb guifg=#CBA6F7 guibg=#1E1E2E

if has('popupwin') && has('textprop')
    if empty(prop_type_get('MiThumbProp'))
        call prop_type_add('MiThumbProp', {'highlight': 'MiScrollThumb'})
    endif
endif

let g:mi_sb_activo = 1
let g:mi_sb_popup = -1
let g:mi_sb_drag = 0
let g:mi_sb_top = 0
let g:mi_sb_win = 0

function! MiScrollbarCerrar()
    if g:mi_sb_popup > 0
        call popup_close(g:mi_sb_popup)
    endif
    let g:mi_sb_popup = -1
endfunction

function! MiScrollbarActualizar(...)
    let l:h = winheight(0)
    let l:total = line('$')

    if !g:mi_sb_activo || &buftype !=# '' || l:h < 3 || l:total <= l:h
        call MiScrollbarCerrar()
        return
    endif

    let l:thumb = max([1, l:h * l:h / l:total])
    let l:rango = l:total - l:h
    let l:pos = (line('w0') - 1) * (l:h - l:thumb) / l:rango
    let l:pos = max([0, min([l:pos, l:h - l:thumb])])

    let l:texto = []
    for l:i in range(l:h)
        if l:i >= l:pos && l:i < l:pos + l:thumb
            call add(l:texto, {'text': '█', 'props': [
                        \ {'col': 1, 'length': strlen('█'), 'type': 'MiThumbProp'}]})
        else
            call add(l:texto, {'text': '│'})
        endif
    endfor

    " Posicion: ultima columna de la ventana actual
    let l:sp = win_screenpos(0)
    let l:opts = {
                \ 'line': l:sp[0],
                \ 'col': l:sp[1] + winwidth(0) - 1,
                \ 'minwidth': 1, 'maxwidth': 1,
                \ 'minheight': l:h, 'maxheight': l:h,
                \ }
    let g:mi_sb_top = l:sp[0]
    let g:mi_sb_win = win_getid()

    if g:mi_sb_popup > 0 && !empty(popup_getpos(g:mi_sb_popup))
        call popup_setoptions(g:mi_sb_popup, l:opts)
        call popup_settext(g:mi_sb_popup, l:texto)
    else
        let g:mi_sb_popup = popup_create(l:texto, extend(l:opts, {
                    \ 'highlight': 'MiScrollTrack',
                    \ 'zindex': 40,
                    \ 'wrap': 0,
                    \ 'filter': 'MiScrollbarFiltro',
                    \ 'filtermode': 'n',
                    \ }))
    endif
endfunction

" Saltar a la linea que corresponde a la posicion del mouse
function! MiScrollbarIr()
    if g:mi_sb_popup < 0 || empty(popup_getpos(g:mi_sb_popup))
        return
    endif
    let l:mp = getmousepos()
    let l:h = popup_getpos(g:mi_sb_popup).height
    let l:fila = max([0, min([l:mp.screenrow - g:mi_sb_top, l:h - 1])])
    let l:total = line('$', g:mi_sb_win)
    let l:n = 1 + l:fila * (l:total - 1) / max([1, l:h - 1])

    call win_execute(g:mi_sb_win, 'call cursor(' . l:n . ', 1) | normal! zz')
    call MiScrollbarActualizar()
    redraw
endfunction

" Captura clic
function! MiScrollbarFiltro(winid, key)
    if a:key ==# "\<LeftMouse>"
        if getmousepos().winid == a:winid
            let g:mi_sb_drag = 1
            call MiScrollbarIr()
            return 1
        endif
    elseif a:key ==# "\<LeftDrag>" && g:mi_sb_drag
        call MiScrollbarIr()
        return 1
    elseif a:key ==# "\<LeftRelease>" && g:mi_sb_drag
        let g:mi_sb_drag = 0
        return 1
    endif
    return 0
endfunction

augroup MiScrollbar
    autocmd!
    autocmd VimEnter,CursorMoved,CursorMovedI,TextChanged,TextChangedI,WinScrolled,WinEnter,BufEnter,BufWinEnter,VimResized,FocusGained *
                \ call MiScrollbarActualizar()
augroup END

" ,s muestra u oculta la barra
function! MiScrollbarToggle()
    let g:mi_sb_activo = !g:mi_sb_activo
    call MiScrollbarActualizar()
endfunction
nnoremap <leader>s :call MiScrollbarToggle()<CR>

nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Rg<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>/ :Rg<CR>

" --- sneak ---
let g:sneak#label = 1

" --- gitgutter ---
set signcolumn=yes

" --- coc: extensiones que se instalan solas ---
let g:coc_global_extensions = ['coc-pyright', 'coc-clangd', 'coc-tsserver', 'coc-sh', 'coc-json']

" Tab confirma la sugerencia del autocompletado
function! MiCheckBackSpace() abort
    let l:col = col('.') - 1
    return !l:col || getline('.')[l:col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ coc#pum#visible() ? coc#pum#confirm() :
            \ MiCheckBackSpace() ? "\<Tab>" :
            \ coc#refresh()

" Navegar por el codigo
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> K :call CocActionAsync('doHover')<CR>

" Renombrar variable en todo el archivo
nmap <leader>rn <Plug>(coc-rename)

highlight MiTabSel   guifg=#1E1E2E guibg=#CBA6F7 gui=bold
highlight MiTabFill  guifg=#7F849C guibg=#181825 gui=NONE
highlight MiTabFondo guifg=#181825 guibg=#181825 gui=NONE

function! MiTabClick(minwid, clicks, button, modifiers)
    execute 'buffer ' . a:minwid
endfunction

function! MiTabline()
    let l:s = ''
    for l:b in getbufinfo({'buflisted': 1})
        if getbufvar(l:b.bufnr, '&buftype') ==# 'terminal'
            continue
        endif
        let l:nombre = fnamemodify(l:b.name, ':t')
        if empty(l:nombre)
            let l:nombre = '[Sin nombre]'
        endif
        let l:mod = l:b.changed ? ' +' : ''
        let l:hl = l:b.bufnr == bufnr('%') ? '%#MiTabSel#' : '%#MiTabFill#'
        let l:s .= '%' . l:b.bufnr . '@MiTabClick@' . l:hl
                    \ . ' ' . l:nombre . l:mod . ' %X'
    endfor
    return l:s . '%#MiTabFondo#'
endfunction

set showtabline=2
set tabline=%!MiTabline()

" ,x cierra el buffer actual sin cerrar la ventana
nnoremap <leader>x :bdelete<CR>

" --- Cursor distinto según el modo (barra en insertar, subrayado en reemplazar) ---
let &t_SI = "\e[6 q"
let &t_SR = "\e[4 q"
let &t_EI = "\e[2 q"

" --- Guías de indentación ---
set listchars+=leadmultispace:▏\ \ \
highlight Whitespace guifg=#313244
highlight SpecialKey guifg=#313244

" --- Línea guía a los 100 caracteres ---
set colorcolumn=100
highlight ColorColumn guibg=#262637

" --- Menú emergente de autocompletado con tu paleta ---
highlight Pmenu      guifg=#CDD6F4 guibg=#313244
highlight PmenuSel   guifg=#1E1E2E guibg=#CBA6F7 gui=bold
highlight PmenuSbar  guibg=#45475A
highlight PmenuThumb guibg=#CBA6F7

" --- Limpieza visual ---
set noshowmode                      " la barra de estado ya muestra el modo
set fillchars=vert:│,eob:\          " quita los ~ del final y mejora los separadores
set belloff=all                     " sin pitidos
set pumheight=12
set lazyredraw
" ----------------------------------------------------------
" 16. ATAJOS ESTILO EDITOR NORMAL (Ctrl+C / Z / A / X / V / Y)
" ----------------------------------------------------------

" Ctrl+C: copiar la seleccion (modo visual)
vnoremap <C-c> y

" Ctrl+X: cortar la seleccion (modo visual)
vnoremap <C-x> d

" Ctrl+V: pegar en modo insertar y en la linea de comandos
inoremap <C-v> <C-r><C-o>"
cnoremap <C-v> <C-r>"

" Ctrl+Z: deshacer (en vez de suspender Vim)
nnoremap <C-z> u
inoremap <C-z> <C-o>u
vnoremap <C-z> <Esc>u

" Ctrl+Y: rehacer (si hay menu de autocompletado, conserva su funcion)
nnoremap <C-y> <C-r>
inoremap <expr> <C-y> pumvisible() ? "\<C-y>" : "\<C-o>\<C-r>"

" Ctrl+A: seleccionar todo el archivo
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG

" Funciones originales desplazadas
nnoremap <leader>+ <C-a>
nnoremap <leader>- <C-x>
nnoremap <leader>v <C-v>
" ----------------------------------------------------------
" 16. ATAJOS ESTILO EDITOR NORMAL (Ctrl+C / Z / A / X / V / Y)
" ----------------------------------------------------------

" Ctrl+C: copiar la seleccion (modo visual)
vnoremap <C-c> y

" Ctrl+X: cortar la seleccion (modo visual)
vnoremap <C-x> d

" Ctrl+V: pegar en modo insertar y en la linea de comandos
inoremap <C-v> <C-r><C-o>"
cnoremap <C-v> <C-r>"

" Ctrl+Z: deshacer (en vez de suspender Vim)
nnoremap <C-z> u
inoremap <C-z> <C-o>u
vnoremap <C-z> <Esc>u

" Ctrl+Y: rehacer (si hay menu de autocompletado, conserva su funcion)
nnoremap <C-y> <C-r>
inoremap <expr> <C-y> pumvisible() ? "\<C-y>" : "\<C-o>\<C-r>"

" Ctrl+A: seleccionar todo el archivo
nnoremap <C-a> ggVG
inoremap <C-a> <Esc>ggVG
vnoremap <C-a> <Esc>ggVG

" Funciones originales desplazadas
nnoremap <leader>+ <C-a>
nnoremap <leader>- <C-x>
nnoremap <leader>v <C-v>

" ----------------------------------------------------------
" 17. SELECCIONAR CON SHIFT + FLECHAS
" ----------------------------------------------------------

" Shift + flecha inicia la seleccion; una flecha sin Shift la termina
set keymodel=startsel,stopsel
set selectmode=

" Codigos de teclas Shift+flecha para terminales tipo xterm
if !has('gui_running')
    execute "set <S-Up>=\e[1;2A"
    execute "set <S-Down>=\e[1;2B"
    execute "set <S-Right>=\e[1;2C"
    execute "set <S-Left>=\e[1;2D"
    execute "set <S-Home>=\e[1;2H"
    execute "set <S-End>=\e[1;2F"
endif

" Que funcione tambien en modo insertar
inoremap <S-Up>    <C-o>v<Up>
inoremap <S-Down>  <C-o>v<Down>
inoremap <S-Left>  <C-o>v<Left>
inoremap <S-Right> <C-o>v<Right>
inoremap <S-Home>  <C-o>v<Home>
inoremap <S-End>   <C-o>v<End>
