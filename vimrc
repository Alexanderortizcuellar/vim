set nocompatible
set number
colorscheme retrobox
filetype off
"set foldmethod=indent
autocmd BufRead * normal zR
"au BufWrite *.py :Autoformat
"au BufWrite *.py :Isort
"au BufWrite *.py :botright term python %
filetype plugin indent on
set wildmenu
set hlsearch
set showcmd
set laststatus=2
set linebreak
set wrap!
set display+=lastline
set cursorline
filetype plugin indent on
au BufRead *.v set filetype=vlang
let mapleader = " "
set notimeout

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	"Plugin 'ycm-core/YouCompleteMe'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'rafamadriz/friendly-snippets'
	Plugin 'tpope/vim-commentary'
	Plugin 'neoclide/coc.nvim'
	Plugin 'preservim/nerdtree'
	Plugin 'jiangmiao/auto-pairs'
	Plugin  'tpope/vim-unimpaired'
	Plugin 'vim-autoformat/vim-autoformat'
	"Plugin 'phpactor/phpactor'
	"Plugin 'fisadev/vim-isort'
	"Plugin 'ervandew/supertab'
	Plugin 'mattn/emmet-vim'
	Plugin 'rafi/awesome-vim-colorschemes'
	Plugin 'vim-python/python-syntax'
	Plugin 'fatih/vim-go'
	Plugin 'maxmellon/vim-jsx-pretty'
	Plugin 'mlaursen/vim-react-snippets'
	"Plugin 'natebosch/vim-lsc'
	Plugin 'bfrg/vim-cpp-modern'
	"Plugin 'natebosch/vim-lsc-dart'
	"Plugin 'sillybun/vim-repl'
	"Plugin 'Exafunction/codeium.vim'
	"Plugin 'kurkale6ka/vim-chess'
	"Plugin 'python-mode/python-mode'
	"Plugin 'tpope/vim-dadbod'
	"Plugin 'tpope/vim-fugitive'
	Plugin 'dart-lang/dart-vim-plugin'
	Plugin 'pangloss/vim-javascript'
	Plugin 'uiiaoo/java-syntax.vim'
	"Plugin 'ap/vim-css-color'
	"Plugin 'dense-analysis/ale'
	"Plugin 'prabirshrestha/vim-lsp'
	"Plugin 'mattn/vim-lsp-settings'
	"Plugin 'prabirshrestha/asyncomplete.vim'
	"Plugin 'prabirshrestha/asyncomplete-lsp.vim'
	Plugin 'zakuro9715/vim-vtools'
	Plugin 'zah/nim.vim'
	let g:go_highlight_function_calls = 1
	let g:go_highlight_operators = 1
	let g:go_highlight_functions = 1
	let g:go_highlight_function_parameters = 1
	let g:go_highlight_function_calls = 1
	let g:go_highlight_types = 1
	let g:go_highlight_fields = 0
	let g:go_highlight_variable_declarations = 1
	let g:go_highlight_variable_assignments = 1
	let g:go_highlight_extra_types = 1
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="horizontal"
	let g:autoformat_autoindent = 0
	let g:autoformat_retab = 1
	let g:python_highlight_all = 1
	let g:ale_completion_enabled = 1
	let g:repl_program = {
	\    'python':'ipython',
	\}
	"imap <C-l> <Plug>(coc-snippets-expand)
	autocmd CursorHold * silent call CocActionAsync('highlight')
	"au BufWrite *.py :Autoformat
call vundle#end()

colorscheme sonokai
"colorscheme gruvbox
"colorscheme OceanicNext
"colorscheme habamax
"colorscheme happy_hacking
"colorscheme materialbox
"colorscheme minimalist 

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" nmap <silent> gs :call CocAction('jumpDefinition', 'split')<CR>
" nmap <silent> gd :call CocAction('jumpDefinition', 'vsplit')<CR>
" nmap <silent> gt :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>f :call CocActionAsync('format')<CR>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()



function! CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
