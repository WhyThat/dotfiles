if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"

call plug#begin('~/.local/share/nvim/plugged')

" Linting and Code Formatting
" Syntax Highlighting: {{{

  Plug 'tpope/vim-markdown'
  Plug 'sheerun/vim-polyglot'

"}}}
" Lint: {{{

  Plug 'w0rp/ale'
  Plug 'Yggdroot/indentLine'

" }}}
" Autocompletion & Intellisense: {{{

  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'Shougo/echodoc.vim'
  Plug 'SirVer/ultisnips'

" }}}

" Motions
" {{{

  Plug 'justinmk/vim-sneak'
  Plug 'kshenoy/vim-signature'

" }}}

" Git
" {{{

  Plug 'tpope/vim-fugitive'
  Plug 'mhinz/vim-signify'
  Plug 'ludovicchabant/vim-gutentags'
  Plug 'rhysd/git-messenger.vim'

"}}}

" Deal with files
" {{{

  Plug '~/.fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-vinegar'

" }}}

" Appearance and Themes
" {{{

  Plug 'gruvbox-community/gruvbox'
  Plug 'vim-airline/vim-airline'
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

  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'ervandew/supertab'
  Plug 'godlygeek/tabular'
  Plug 'tpope/vim-unimpaired'
  Plug 'szw/vim-maximizer'

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

call plug#end()
