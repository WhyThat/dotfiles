if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"

call plug#begin('~/.local/share/nvim/plugged')

function! PluginLoaded(plugin_name) abort
  return has_key(g:plugs, a:plugin_name) && stridx(&rtp, g:plugs[a:plugin_name].dir)
endfunction

Plug 'ayu-theme/ayu-vim' " or other package manager
Plug 'rakr/vim-one'

" Linting and Code Formatting
" Syntax Highlighting: {{{

  Plug 'tpope/vim-markdown'
  Plug 'sheerun/vim-polyglot'

"}}}

" Autocompletion & Intellisense: {{{

  " Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Shougo/echodoc.vim'
  Plug 'SirVer/ultisnips'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'


" }}}

" Motions
" {{{

  Plug 'justinmk/vim-sneak'
  Plug 'kshenoy/vim-signature'


" }}}

" Git
" {{{

  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-rhubarb'
  Plug 'mhinz/vim-signify'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'rhysd/git-messenger.vim'
  Plug 'sodapopcan/vim-twiggy'
  Plug 'junegunn/gv.vim'
  Plug 'stsewd/fzf-checkout.vim'
"}}}

" Deal with files
" {{{

  " Plug '~/.fzf'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-vinegar'

" }}}

" Appearance and Themes
" {{{

  Plug 'gruvbox-community/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'miyakogi/conoline.vim'
  Plug 'luochen1990/rainbow'
  Plug 'gcmt/taboo.vim'
  Plug 'TaDaa/vimade'

" }}}

" Test
" {{{

  Plug 'janko/vim-test'

" }}}

" Utilities
" Basics: {{{

  Plug 'preservim/nerdtree'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'ervandew/supertab'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-unimpaired'
  Plug 'szw/vim-maximizer'
  Plug 'AndrewRadev/tagalong.vim'

" }}}
" Manage project: {{{

  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-obsession'
  Plug 'embear/vim-localvimrc'

  " }}}
" Deal with buffer {{{

  Plug 'moll/vim-bbye'
  Plug 'tpope/vim-projectionist'
  Plug 'tpope/vim-dispatch'

  " }}}
  Plug 'wincent/scalpel'
  Plug 'ryanoasis/vim-devicons'
  Plug 'bagrat/vim-buffet'
  Plug 'machakann/vim-highlightedyank'

call plug#end()

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"
