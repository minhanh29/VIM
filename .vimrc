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
Plug 'xaizek/vim-inccomplete'
Plug 'jiangmiao/auto-pairs'

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

Plug 'samoshkin/vim-mergetool'  " git merge tool
Plug 'captbaritone/better-indent-support-for-php-with-html'  " php and html indentation
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
else
	" molokai theme
	colorscheme molokai
	let g:molokai_original = 1
	let g:rehash256 = 1
endif

if has('gui_macvim')
  " Press Ctrl-Tab to switch between open tabs (like browser tabs) to
  " the right side. Ctrl-Shift-Tab goes the other way.
  noremap <C-Tab> :tabnext<CR>
  noremap <C-S-Tab> :tabprev<CR>
endif


set background=dark
"highlight Pmenu guifg=blue guibg=white ctermfg=blue ctermbg=white
"highlight Normal guibg=#23262b "ctermbg=black
highlight Comment gui=italic


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
"inoremap {<Enter> {<Enter>}<Esc>ko
"inoremap {<Space> {}<Esc>i
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
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"


" Kite
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

" git merge tool
nnoremap <space>dg :diffget<CR>
nnoremap <space>dp :diffput<CR>

" Toggle merge tool
nmap <space>mt <plug>(MergetoolToggle)

"Open base-merged-remote mode
nnoremap <space>mb :call mergetool#toggle_layout('bmr')<CR>
"Open merged-remote mode (merged: ours)
nnoremap <space>mr :call mergetool#toggle_layout('mr')<CR>

nmap <expr> <C-Left> &diff? '<Plug>(MergetoolDiffExchangeLeft)' : '<C-Left>'
nmap <expr> <C-Right> &diff? '<Plug>(MergetoolDiffExchangeRight)' : '<C-Right>'
nmap <expr> <C-Down> &diff? '<Plug>(MergetoolDiffExchangeDown)' : '<C-Down>'
nmap <expr> <C-Up> &diff? '<Plug>(MergetoolDiffExchangeUp)' : '<C-Up>'

" Extension: Diff or merge indicator
function! AirlineDiffmergePart()
  if get(g:, 'mergetool_in_merge_mode', 0)
    return '↸' . s:spc . s:spc
  endif

  if &diff
    return '↹' . s:spc . s:spc
  endif

  return ''
endfunction


" git difftool
if &diff
	autocmd VimEnter * wincmd r
endif

