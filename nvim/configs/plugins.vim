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
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'rescript-lang/vim-rescript'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'glepnir/lspsaga.nvim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}}


" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
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
Plug 'kevinhwang91/rnvimr'

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

Plug 'mbbill/undotree'
nnoremap <F5> :UndotreeToggle<CR>
if has("persistent_undo")
    set undodir="/home/mathieu/.undodir"
    set undofile
endif

call plug#end()

let g:buffet_powerline_separators = 1
let g:buffet_tab_icon = "\uf00a"
let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

lua << EOF
local actions = require('telescope.actions')
local theme = require('telescope.themes').get_dropdown
require('telescope').setup {
  defaults = {
    file_sorter = require('telescope.sorters').get_fzy_sorter,
    prompt_prefix = ' >',
    color_devicons = true,

    file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    set_env = { ['COLORTERM'] = 'truecolor' },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_to_qflist,
      },
    }
  },
  extensions = {
      fzy_native = {
          override_generic_sorter = false,
          override_file_sorter = true,
      }
  }
}

EOF
" lua require('telescope').setup({defaults = { file_sorter = require('telescope.sorters').get_fzy_sorter }})

" Built-in
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>ff :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <Leader>fF :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep(require('telescope.themes').get_dropdown({ width=0.65 }))<cr>
" arte project
nnoremap <leader>fj :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ cwd='/media/disk/home/mathieu/Sources/Arte/js-toolkit', width=0.65 }))<CR>
nnoremap <leader>fr :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ cwd='/media/disk/home/mathieu/Sources/Arte/Replay', width= 0.65 }))<CR>
nnoremap <leader>fd :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ cwd='/media/disk/home/mathieu/Sources/Arte/ARTE-DesignSystem', width= 0.65  }))<CR>
" nnoremap <leader>fn :lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown({}))<CR>
" nnoremap <leader>fN :lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown({cwd='node_modules'}))<CR>
"
" LSP
nnoremap <leader>ls :lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>lS :lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>lr :lua require('telescope.builtin').lsp_reference_symbols(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>la :lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap // :lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
