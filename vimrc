set viminfo+=n~/.vim/viminfo "SETTING UP



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" RANDOM
" how syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Non Plug-in Settings
syntax enable
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set number
filetype on



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NEOBUNDLE
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
    if &compatible
       set nocompatible
    endif
    " Required:
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Required:
NeoBundleFetch 'Shougo/neobundle.vim' "NEOBUNDLE HANDLE NEOBUNDLE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" COLORS
NeoBundle 'https://github.com/altercation/solarized.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" SYNTAX AND COMPILING/GIT
NeoBundle 'vim-scripts/trailing-whitespace'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'https://github.com/vim-scripts/Tagbar.git'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" GUIUI
NeoBundle 'bling/vim-airline'
NeoBundle 'airblade/vim-gitgutter'
"NeoBundle 'edkolev/promptline.vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" BIGGER SHIT
NeoBundle 'Valloric/YouCompleteMe'
"{
"\    'build' : {
"\        'unix': './install.sh --clang-completer --omnisharp-completer --system-libclang',
"\        'osx': './install.sh',
"\    },
"\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" NEOBUNDLE SETTINGS
"let g:neobundle#install_process_timeout = 1500
call neobundle#end()

" Required:
filetype plugin indent on
NeoBundleCheck " If there are uninstalled bundles found on startup, this will conveniently prompt you to install them.

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""  PLUGIN SETTINGS
"Solarized
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized


"AirLine
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#whitespace#enabled = 1
"let g:airline#extensions#hunks#enabled = 1
"let g:airline#extensions#tagbar#enabled = 1
"let g:airline#extensions#csv#enabled = 1
"let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
"let g:airline#extensions#eclim#enabled = 1
"let g:airline#extensions#promptline#enabled = 1
"let g:airline#extensions#promptline#snapshot_file = $HOME.'/.bash/themes/airline.sh'


"Promptline
"let g:promptline_preset = 'full'
"let g:promptline_preset = {
"    \'a': [ promptline#slices#host(), promptline#slices#user(), promptline#slices#python_virtualenv() ],
"    \'b': [ promptline#slices#cwd() ],
"    \'c' : [ promptline#slices#vcs_branch(), '$(git rev-parse --short HEAD 2>/dev/null)' ],"
"    \'warn' : [ promptline#slices#last_exit_code(), promptline#slices#battery() ]
"}

"TagBar
nmap <F8> :TagbarToggle<CR>
autocmd VimEnter * nested :call tagbar#autoopen(1) "opens on supported file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Filetype specifics/setting fxs
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal completefunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



