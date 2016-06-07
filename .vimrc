"My Setting"

syntax on
colorscheme myDarkblue

set clipboard+=unnamedplus "Share clipboard between X11 and vim
set foldmethod=syntax
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
set listchars=tab:\|\ ,trail:!,extends:>,precedes:<
set list

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

"My command
com! EditRc tabnew ~/.vimrc
com! Uz source ~/.vimrc

"My Key Mapping"
noremap <silent><F1> :JSHint moz:true esnext:true<CR>
noremap <F2> :source ~/.vimrc<cr>
noremap <F3> :set number!<cr>
noremap <F4> :NERDTreeToggle<cr>

noremap <F5> :lnext<CR>
noremap <F6> :lprevious<CR>

noremap <F7> gT
noremap <F8> gt
noremap <S-F7> :tabmove -1<cr>
noremap <S-F8> :tabmove +1<cr>

noremap <F9> :TagbarToggle<cr>
noremap <F10> :set list!<cr>

noremap <C-b> :CtrlPBuffer<cr>

" Plugs
call plug#begin('~/.vim/plugged')

Plug 'Valloric/YouCompleteMe'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'guns/xterm-color-table.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'adimit/prolog.vim'
Plug 'kristijanhusak/vim-multiple-cursors'
Plug 'scrooloose/syntastic'
Plug 'tikhomirov/vim-glsl'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'majutsushi/tagbar'
Plug 'jdonaldson/vaxe'
Plug 'sophacles/vim-processing'
Plug 'octave.vim--'
Plug 'Lokaltog/vim-easymotion'
Plug 'kien/ctrlp.vim'
"Plug 'Shougo/unite.vim'
Plug 'syntaxudev.vim'
Plug 'medvid/vim-armasm'
"Plug 'Shougo/vimproc.vim'
"Plug 'chrisbra/Replay'
"Plug 'ervandew/supertab'
Plug 'nanotech/jellybeans.vim'
Plug 'pangloss/vim-javascript'
"Plug 'fholgado/minibufexpl.vim'
Plug 'marijnh/tern_for_vim'
Plug 'Shutnik/jshint2.vim'
Plug 'rust-lang/rust.vim'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
"Plug 'jeaye/color_coded'
Plug 'rdnetto/YCM-Generator'
Plug 'racer-rust/vim-racer'
Plug 'cespare/vim-toml'
Plug 'mxw/vim-jsx'

call plug#end()

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
"let g:syntastic_cpp_checkers = ['clang', 'gcc']
"let g:syntastic_cpp_include_dirs = ['./', './include/', '../include/', '/usr/include/SDL2/']
"let g:syntastic_cpp_check_header = 1
"let g:syntastic_cpp_auto_refresh_includes = 1
"let g:syntastic_cpp_remove_include_errors = 1
let g:syntastic_enable_signs = 1
"let g:syntastic_cpp_compiler = 'clang++'
"let g:syntastic_cpp_compiler_options = '-std=c++11 -stdlib=libstdc++'
"set error or warning signs
let g:syntastic_javascript_checkers = ['eslint']
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

" JSX syntax
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Rust.vim
let g:rustfmt_fail_silently = 1
let g:rustfmt_autosave = 1
