set number
set tabstop=2
set shiftwidth=2
set clipboard+=unnamed
set noswapfile
set smartindent
set termguicolors

let g:mapleader = " "

set signcolumn=yes

const s:denops_src = '~/.cache/dpp/repos/github.com/vim-denops/denops.vim'
const s:denops_hello = '~/.cache/dpp/repos/github.com/vim-denops/denops-helloworld.vim'

execute 'set runtimepath+=' .. s:denops_src
execute 'set runtimepath+=' .. s:denops_hello

const s:dpp_src = "~/.cache/dpp/repos/github.com/Shougo/dpp.vim"
const s:dpp_installer = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-installer"
const s:dpp_toml = "~/.cache/dpp/repos/github.com/Shougo/dpp-ext-toml"
const s:dpp_git = "~/.cache/dpp/repos/github.com/Shougo/dpp-protocol-git"

execute 'set runtimepath+=' .. s:dpp_src
execute 'set runtimepath+=' .. s:dpp_installer
execute 'set runtimepath+=' .. s:dpp_toml
execute 'set runtimepath+=' .. s:dpp_git

const s:dpp_base = '~/.cache/dpp/'
const s:dpp_ts_config = '~/.config/vim/dpp.ts'

if s:dpp_base->dpp#min#load_state()
	autocmd User DenopsReady
	\	: echohl WarningMsg
	\	| echomsg 'dpp load_state() is failed'
	\	| echohl NONE
	\	| call dpp#make_state(s:dpp_base, s:dpp_ts_config)
endif

autocmd User Dpp:makeStatePost
	\	: echohl WarningMsg
	\	| echomsg 'dpp make_state() is done'
	\	| echohl NONE

if has('syntax')
	syntax on
	set regexpengine=0
endif


