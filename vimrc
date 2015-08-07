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
NeoBundle 'chriskempson/base16-vim'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" SYNTAX AND COMPILING/GIT
NeoBundle 'vim-scripts/trailing-whitespace'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'https://github.com/vim-scripts/Tagbar.git'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""" GUIUI
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'https://github.com/itchyny/lightline.vim.git'

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
let g:solarized_termcolors=256


"Base16
"let base16colorspace=256  " Access colors present in 256 colorspace


"LightLine
"let g:lightline = {
"    \ 'colorscheme': 'wombat',
"    \ 'component': {
"    \   'readonly': '%{&readonly?"⭤":""}',
"    \ }
"\ }


"TagBar
nmap <F8> :TagbarToggle<CR>
autocmd VimEnter * nested :call tagbar#autoopen(1) "opens on supported file types


"Indent Guides
set ts=4 sw=4 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
let g:indent_guides_enable_on_vim_startup = 1


set background=dark
colorscheme solarized



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" Filetype specifics/setting fxs
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType python setlocal completefunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags



