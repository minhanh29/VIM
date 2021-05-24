call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'christoomey/vim-tmux-navigator'
Plug 'jremmen/vim-ripgrep'
Plug 'jiangmiao/auto-pairs'

Plug 'nvie/vim-flake8'	" for python

Plug 'ervandew/supertab'

Plug 'sheerun/vim-polyglot'
Plug 'ayu-theme/ayu-vim'
Plug 'tomasr/molokai'

Plug 'vim-airline/vim-airline'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }  "Usage:  :Prettier

Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

Plug 'captbaritone/better-indent-support-for-php-with-html'  " php and html indentation

Plug 'unblevable/quick-scope'  " highlight the first character
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'  " vertical line indentation
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

set autoread
set smarttab
set cindent
set tabstop=4
set shiftwidth=4
set number
set relativenumber
set noswapfile
set incsearch
set mouse=a
set guicursor=n-v-c-i:block-Cursor
"set fullscreen


set wrap       "Wrap lines
set linebreak    "Wrap lines at convenient points
set guifont=SpaceMono\ Nerd\ Font:h12
set encoding=UTF-8
let g:airline_powerline_fonts = 1


if has('gui_running')
	set termguicolors
	"let ayucolor="light"  " for light version of theme
	let ayucolor="mirage" " for mirage version of theme
	"let ayucolor="dark"   " for dark version of theme
	colorscheme ayu
	" set transparency=2
	" highlight Normal guibg=black ctermbg=black
else
	" molokai theme
	colorscheme molokai
	"highlight Pmenu ctermfg=blue ctermbg=white
	"highlight Normal guibg=black ctermbg=black
	let g:molokai_original = 1
	let g:rehash256 = 1
endif


set background=dark
highlight Comment gui=italic


" Java
let java_highlight_functions = 1
let java_highlight_all = 1
let java_highlight_java = 1
let java_highlight_java_lang = 1
let java_highlight_debug = 1


" remove trailing spaces
fun! StripTrailingWhitespace()
    " Only strip if the b:noStripeWhitespace variable isn't set
    if exists('b:noStripWhitespace')
        return
    endif
    %s/\s\+$//e
endfun

autocmd BufWritePre * call StripTrailingWhitespace()
autocmd BufNewFile,BufRead *.md set filetype=markdown
autocmd FileType markdown let b:noStripWhitespace=1

highlight ExtraWhitespace ctermbg=NONE guibg=#1B1D1E
match ExtraWhitespace /\s\+$/


nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>


" switch between absolute and relative number
nnoremap <Space>na :set norelativenumber<Enter>
nnoremap <Space>nr :set relativenumber<Enter>


"open nerd tree
nnoremap <space>pv :vs<bar>:Ex<CR>
nnoremap <space>nt :NERDTree<CR>

" keep the selection when indenting
vnoremap > >gv
vnoremap < <gv

"copy and paste to clipboard
vnoremap <C-c> "+y
vnoremap <C-v> "+gP
vnoremap <C-x> "+x



"super tab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#eb4034' gui=bold ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#00fff7' gui=bold ctermfg=81 cterm=underline

" indent line
let g:indentLine_enabled = 1
set conceallevel=1
let g:indentLine_conceallevel=1

" compile c/c++ program
nnoremap <f6> <esc>:!gcc -o %:r %:t<enter>
nnoremap <f7> <esc>:!g++ -std=c++14 -o %:r %:t<enter>
" run c/c++
nnoremap <f8> <esc>:!./%:r<enter>

" compile java program
nnoremap <f3> <esc>:!javac %:t<enter>
" run java
nnoremap <f4> <esc>:!java %:r<enter>

" run python
nnoremap <f1> <esc>:!python3 %:t<enter>

let g:coc_force_debug = 1

" go to definition
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nnoremap gd :call <SID>GoToDefinition()<CR>
