call plug#begin()
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'scrooloose/nerdtree'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'christoomey/vim-tmux-navigator'
Plug 'agude/vim-eldar'

Plug 'lyuts/vim-rtags'

Plug 'sheerun/vim-polyglot'

Plug 'morhetz/gruvbox'

Plug 'vim-airline/vim-airline'
"Plug 'jaxbot/semantic-highlight.vim'

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
call plug#end()


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

" Disable function highlighting (affects both C and C++ files)
let g:cpp_no_function_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" Enable highlighting of named requirements (C++20 library concepts)
let g:cpp_named_requirements_highlight = 1
let c_no_curly_error = 1

" Java
let java_highlight_functions = 1

" molokai theme
"let g:molokai_original = 1
let g:rehash256 = 1


syntax on

set smarttab
set cindent
set tabstop=4
set relativenumber
set noswapfile
set incsearch

set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points
set guifont=Monaco:h12


colorscheme molokai
set background=dark
highlight Pmenu guifg=blue guibg=white
highlight Normal guibg=black

" remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e
highlight ExtraWhitespace ctermbg=black guibg=black 
match ExtraWhitespace /\s\+$/

inoremap {<Enter> {<CR>}<Esc>ko
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

"autocmd BufRead,TextChangedI *.java :SemanticHighlight

"open nerd tree
nnoremap <space>pv :vs<bar>:Ex<CR>