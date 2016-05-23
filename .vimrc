"My Setting"
syntax on
colorscheme myDarkblue
set noswapfile
set autowrite
set foldmethod=indent
set foldlevelstart=20
set nowrap
set cinoptions=:0,l1,t0,(0,W1s,m1,g0
set t_Co=256
set colorcolumn=81
set cursorline
set tabstop=8
set softtabstop=8
set expandtab

fu! Multiple_cursors_before()
        let s:old_ycm_whitelist = g:ycm_filetype_whitelist
        let g:ycm_filetype_whitelist = {}
endf

fu! Multiple_cursors_after()
        let g:ycm_filetype_whitelist = s:old_ycm_whitelist
endf

autocmd BufNewFile,BufRead,BufEnter *.frag,*.vert,*.fp,*.vp,*.glsl,*.vs,*.fs set syntax=glsl
autocmd FileType mail setl spell fo=wantq1 smc=0
autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd BufNewFile,BufRead,BufEnter *.md setlocal spell textwidth=72 syntax=markdown wrap
autocmd FileType javascript set ai sw=2 ts=2 sta et fo=croql

set listchars=tab:\|\ ,trail:!,extends:>,precedes:<
set list

"My Key Mapping"
noremap <silent><F1> :JSHint moz:true esnext:true<CR>
noremap <F2> :source ~/.vimrc<cr>
noremap <F3> :set number!<cr>
noremap <F4> :NERDTreeToggle<cr>

noremap <F5> :lnext<CR>
noremap <F6> :lprevious<CR>

noremap <F7> gT
noremap <F8> gt
noremap <C-F7> :tabmove -1<cr>
noremap <C-F8> :tabmove +1<cr>

noremap <F9> :TagbarToggle<cr>
noremap <F10> :set list!<cr>

noremap <C-b> :CtrlPBuffer<cr>


"Vundle Pluging"
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required
Bundle 'gmarik/vundle.git'

" My bundles here:
"Bundle 'TagHighlight'
Bundle 'Valloric/YouCompleteMe'
Bundle 'scrooloose/nerdtree.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'guns/xterm-color-table.vim.git'
"Bundle 'Rip-Rip/clang_complete'
Bundle 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'tpope/vim-fugitive.git'
Bundle 'adimit/prolog.vim'
Bundle 'kristijanhusak/vim-multiple-cursors'
"Bundle 'scrooloose/syntastic'
Bundle 'tikhomirov/vim-glsl'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'majutsushi/tagbar'
Bundle 'jdonaldson/vaxe'
Bundle 'sophacles/vim-processing'
Bundle 'octave.vim--'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'kien/ctrlp.vim'
"Bundle 'Shougo/unite.vim'
Bundle 'syntaxudev.vim'
Bundle 'medvid/vim-armasm'
"Bundle 'Shougo/vimproc.vim'
"Bundle 'chrisbra/Replay'
"Bundle 'ervandew/supertab'
Bundle 'nanotech/jellybeans.vim'
Bundle 'pangloss/vim-javascript'
"Bundle 'fholgado/minibufexpl.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'Shutnik/jshint2.vim'
Bundle 'wting/rust.vim'
Bundle 'elzr/vim-json'
Bundle 'airblade/vim-gitgutter'
"Bundle 'jeaye/color_coded'
Bundle 'rdnetto/YCM-Generator'
Bundle 'racer-rust/vim-racer'
Bundle 'cespare/vim-toml'
Bundle 'dracula/vim'
" ...

call vundle#end()
filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.

"MY CHANGE"

"Powerline"
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
"set encoding=utf-8 " Necessary to show Unicode glyphs

let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme = 'solarized256'

let g:cpp_class_scope_highlight = 1

let g:airline_theme ='murmur'
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = '⮀'
"let g:airline#extensions#tabline#left_alt_sep = '⮁'
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
endif
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

let g:syntastic_check_on_open = 1
let g:syntastic_cpp_checkers = ['clang', 'gcc']
let g:syntastic_cpp_include_dirs = ['./', './include/', '../include/', '/usr/include/SDL2/']
let g:syntastic_cpp_check_header = 1
let g:syntastic_cpp_auto_refresh_includes = 1
let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_enable_signs = 1
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'

map <C-]> :YcmCompleter GoToImprecise<CR>
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_key_invoke_completion = '<C-Return>'
let g:ycm_warning_symbol = '>>'
set completeopt=menu

let g:tagbar_autofocus = 1
let g:tagbar_sort = 0

let g:EasyMotion_smartcase = 1
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:ctrlp_by_filename = 1
let g:ctrlp_open_new_file = 't'
let g:ctrlp_regexp = 0
"let g:ctrlp_max_files = 0

" Racer
let g:racer_cmd = "/home/kk/.cargo/bin/racer"
let $RUST_SRC_PATH = "/home/kk/Programs/rust/src"
