set nocompatible
set number
colorscheme retrobox
filetype off
set foldmethod=indent
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
set display+=lastline
set cursorline
function! Exec()
	let w = win_getid()
	:only
	:w
	:botright term go run %
	:res -10
	call win_gotoid(w)
endfunction

function! RunPython()
	let w = win_getid()
	:only
	:w
	:botright term python %
	:res -10
	call win_gotoid(w)
endfunction


autocmd FileType python nnoremap <buffer> & :call RunPython() <CR>
autocmd FileType go  nnoremap <buffer> & :call Exec() <CR>


set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	"Plugin 'ycm-core/YouCompleteMe'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'neoclide/coc.nvim'
	Plugin 'preservim/nerdtree'
	Plugin 'jiangmiao/auto-pairs'
	Plugin  'tpope/vim-unimpaired'
	Plugin 'vim-autoformat/vim-autoformat'
	"Plugin 'fisadev/vim-isort'
	"Plugin 'ervandew/supertab'
	Plugin 'mattn/emmet-vim'
	Plugin 'rafi/awesome-vim-colorschemes'
	Plugin 'vim-python/python-syntax'
	Plugin 'fatih/vim-go'
	Plugin 'maxmellon/vim-jsx-pretty'
	Plugin 'mlaursen/vim-react-snippets'
	Plugin 'natebosch/vim-lsc'
	Plugin 'nateboshch/vim-lsc-dart'

	"Plugin 'Exafunction/codeium.vim'
	"Plugin 'kurkale6ka/vim-chess'
	"Plugin 'python-mode/python-mode'
	"Plugin 'tpope/vim-dadbod'
	"Plugin 'tpope/vim-fugitive'
	"Plugin 'dart-lang/dart-vim-plugin'
	"Plugin 'ap/vim-css-color'
	"Plugin 'dense-analysis/ale'
	"Plugin 'prabirshrestha/vim-lsp'
	"Plugin 'mattn/vim-lsp-settings'
	"Plugin 'prabirshrestha/asyncomplete.vim'
	"Plugin 'prabirshrestha/asyncomplete-lsp.vim'
	"Plugin  'cheap-glitch/vim-v'
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="horizontal"
	let g:autoformat_autoindent = 0
	let g:autoformat_retab = 1
	let g:python_highlight_all = 1
	let g:ale_completion_enabled = 1
	"imap <C-l> <Plug>(coc-snippets-expand)
	autocmd CursorHold * silent call CocActionAsync('highlight')
	"au BufWrite *.py :Autoformat
call vundle#end()

"colorscheme sonokai
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
