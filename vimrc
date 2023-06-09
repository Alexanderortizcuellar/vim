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
	:only
	:botright term go run %
	:res -10
endfunction

au BufWrite *.go call Exec()

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
	Plugin 'VundleVim/Vundle.vim'
	Plugin 'ycm-core/YouCompleteMe'
	Plugin 'SirVer/ultisnips'
	Plugin 'honza/vim-snippets'
	Plugin 'neoclide/coc.nvim'
	Plugin 'preservim/nerdtree'
	Plugin 'jiangmiao/auto-pairs'
	Plugin  'tpope/vim-unimpaired'
	Plugin 'vim-autoformat/vim-autoformat'
	Plugin 'fisadev/vim-isort'
	"Plugin 'ervandew/supertab'
	Plugin 'rafi/awesome-vim-colorschemes'
	Plugin 'vim-python/python-syntax'
	"Plugin 'python-mode/python-mode'
	Plugin 'tpope/vim-dadbod'
	Plugin 'tpope/vim-fugitive'
	Plugin 'dart-lang/dart-vim-plugin'
	"Plugin 'ap/vim-css-color'
	"Plugin 'dense-analysis/ale'
	let g:UltiSnipsExpandTrigger="<c-j>"
	let g:UltiSnipsJumpForwardTrigger="<c-b>"
	let g:UltiSnipsJumpBackwardTrigger="<c-z>"
	let g:UltiSnipsEditSplit="horizontal"
	let g:autoformat_autoindent = 0
	let g:autoformat_retab = 1
	let g:python_highlight_all = 1
	let g:ale_completion_enabled = 1
	imap <C-l> <Plug>(coc-snippets-expand)
	"au BufWrite *.py :Autoformat
call vundle#end()
