" Each section of my config has been separated out into subsections in ./configs/
filetype off " required  Prevents potential side-effects from system ftdetects scripts

augroup vimrc "Ensure all autocommands are cleared
  autocmd!
augroup END

"-----------------------------------------------------------------------
"Leader bindings
"-----------------------------------------------------------------------
nnoremap <Space> <Nop>
let g:mapleader = " "

" WARNING: Hard coding the location of my dotfiles is brittle
let g:dotfiles = strlen($DOTFILES) ? $DOTFILES : '~/dotfiles'
let g:vim_dir = g:dotfiles . '/nvim'
"-----------------------------------------------------------------------
" Essential Settings - Taken care of by Vim Plug
"-----------------------------------------------------------------------
filetype plugin indent on
set termguicolors     " enable true colors support
" ----------------------------------------------------------------------
" Plugin Configurations
" ----------------------------------------------------------------------
runtime configs/general.vim
runtime configs/mapping.vim
runtime templates/template.vim

lua require("plugins")
lua require("mat/theme")
lua require("keybinding")
lua require("global")

set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']

nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>
let g:tagalong_additional_filetypes = ['rescript']
imap <silent><script><expr> <C-G> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

command ToggleTheme lua require'mat.theme'.toggle()
command SetLightTheme lua require'mat.theme'.setLight()
command SetDarkTheme lua require'mat.theme'.setDark()
command ToggleNumber call ToggleNumber()
