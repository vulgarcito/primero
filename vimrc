set number 
"set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set tabstop=4
"set cindent
set sw=2
set relativenumber
set ai
set smartindent
set termwinsize=10x138
set cursorline
set laststatus=2
set undofile
set noswapfile
"set cursorcolumn
syntax on
set termguicolors
set background=dark

call plug#begin('~/.vim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/youcompleteme'
Plug 'vim-python/python-syntax'
Plug 'bling/vim-airline'
Plug 'levelone/tequila-sunrise.vim'
Plug 'franbach/miramare'
Plug 'rhysd/vim-color-spring-night'
Plug 'benburrill/potato-colors'
Plug 'Chiel92/vim-autoformat'
Plug 'sts10/vim-pink-moon'
Plug 'kamykn/dark-theme.vim'
Plug 'vim-airline/vim-airline-themes'
Plug 'arzg/vim-corvine'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-scripts/c.vim'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'bfrg/vim-cpp-modern'
Plug 'cormacrelf/vim-colors-github'
call plug#end()


"NerdTree
"let NERDTreeQuitOnOpen=1
"let g:Tlist_WinWidth=30
"let g:NERDTreeWinPos="right"
"let g:NERDTreeWinSize=30
"autocmd VimEnter * NERDTree
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

colorscheme potato 

"IDE Python
let g:python_highlight_all = 1
let g:python_version_2=0
let b:python_version_2=0
let g:python_highlight_builtis=1
let g:python_highlight_builtin_objs=1
let g:python_highlight_builtin_types=1
let g:python_highlight_builtin_funcs=1
"g:python_highlight_builtin_funcs_kwarg
let g:python_highlight_exceptions=1
let g:python_highlight_string_formatting=1
let g:python_highlight_string_format=1
let g:python_highlight_string_templates=1
let g:python_highlight_indent_errors=1
let g:python_highlight_space_errors=1
let g:python_highlight_doctests=1
let g:python_highlight_func_calls=1
let g:python_highlight_class_vars=1
let g:python_highlight_operators=1
let g:python_highlight_all=1

"###
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"autocmd Filetype cpp nmap <F9> :SCCompileAF -std=c++11<CR>
"autocmd Filetype cpp nmap <F10> :SCCompileRunAF -std=c++11<CR>

"Ultisnip
let g:UltiSnipsExpandTrigger="<c-z>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-m>"
let g:UltiSnipsEditSplit="vertical"
"let g:clang_snippets=1
"let g:clang_snippets_engine='ultisnips'
"let g:clang_use_library=1
"let g:clang_library_path="/usr/lib"
"let g:clang_periodic_quickfix=1
"let g:clang_complete_auto=1
"let g:clang_conceal_snippets=1
"let g:clang_snippets_engine='clan_complete'
"let g:clang_complete_copen=1
"set completeopt=longest,menuone,preview

"CLang
"let g:clang_c_options='-std=gnu11'
"let g:clang_cpp_options='-std=c++11 -stdlib=libc++'


"Airline
let g:airline_powerline_fonts=1
let g:cpp_class_scope_highlight=1
let g:cpp_experimental_template_highlight=1
let g:airline_theme='spring_night'
let base16colorspace=256

"Devicons
let g:WebDevIconsUnicodeDecorateFolderNodes = 1

"nmap para generar atajos | Ejemplo: nmap <Leader>w :w<CR>
let mapleader="-"
nmap <Leader>s <Plug>(easymotion-s2)
nmap <C-t> :NERDTreeFind<CR>
nmap <F7> :below terminal<CR>
imap <F8> <ESC>HdGi
imap <F9> <ESC>:w<CR>
imap <F2> <ESC>:w<CR>i
nmap <F5> :Autoformat<CR>
imap <Leader>. <ESC>A 
imap <Leader>, <ESC>$i
imap <F3> <ESC>:%!astyle -A2<CR>
imap ññ <ESC>li 

"Compile
map <F10> <ESC>:call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc

"Syntax C (++)
" Disable function highlighting (affects both C and C++ files)
let g:cpp_no_function_highlight = 0

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1 

" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1
