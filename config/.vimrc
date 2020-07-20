call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'OmniSharp/omnisharp-vim'
Plug 'xavierd/clang_complete'	

Plug 'nvie/vim-flake8'	" for python
Plug 'dense-analysis/ale'

Plug 'ervandew/supertab'

Plug 'lyuts/vim-rtags'
Plug 'sheerun/vim-polyglot'
"Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }  "Usage:  :Prettier

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
call plug#end()

if executable('rg')
    let g:rg_derive_root='true'
endif


" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1


syntax on

set smarttab
set cindent
set tabstop=4
set number
set relativenumber
set noswapfile
set incsearch
set mouse=a


set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points
set guifont=Hack\ Nerd\ Font:h13
set encoding=UTF-8
let g:airline_powerline_fonts = 1


if has('gui_running')
	set termguicolors
	"let ayucolor="light"  " for light version of theme
	let ayucolor="mirage" " for mirage version of theme
	"let ayucolor="dark"   " for dark version of theme
	colorscheme ayu
else
	" molokai theme
	colorscheme molokai
	let g:molokai_original = 1
	let g:rehash256 = 1
endif


set background=dark
"highlight Pmenu guifg=blue guibg=white ctermfg=blue ctermbg=white
"highlight Normal guibg=#23262b "ctermbg=black


" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1


" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1
let c_no_curly_error = 1


" Java
let java_highlight_functions = 1
let java_highlight_all = 1
let java_highlight_java = 1
let java_highlight_java_lang = 1
let java_highlight_debug = 1


" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
highlight ExtraWhitespace ctermbg=NONE guibg=#1B1D1E
match ExtraWhitespace /\s\+$/


" mapping
inoremap {<Enter> {<Enter>}<Esc>ko
inoremap {<Space> {}<Esc>i
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>


" switch between absolute and relative number
nnoremap <Space>na :set norelativenumber<Enter>
nnoremap <Space>nr :set relativenumber<Enter>


"open nerd tree
nnoremap <space>pv :vs<bar>:Ex<CR>
nnoremap <space>nt :NERDTree<CR>


"copy and paste to clipboard
vnoremap <C-c> "*y :let @+=@*<CR>


"super tab
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Kite
autocmd FileType python let b:coc_suggest_disable = 1
set completeopt-=preview   " do not show the preview window
set completeopt+=menuone   " show the popup menu even when there is only 1 match
set completeopt+=noinsert  " don't insert any text until user chooses a match
set completeopt-=longest   " don't insert the longest common text


" Omnicomplete for C#
let g:OmniSharp_server_use_mono = 1

" clang complete for C++
 let g:clang_library_path='/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'

" language server for javascript
let g:LanguageClient_serverCommands = {
    \ 'javascript': ['javascript-typescript-stdio']
    \ }

