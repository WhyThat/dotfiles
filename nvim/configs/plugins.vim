if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif"

call plug#begin('~/.local/share/nvim/plugged')

function! PluginLoaded(plugin_name) abort
  return has_key(g:plugs, a:plugin_name) && stridx(&rtp, g:plugs[a:plugin_name].dir)
endfunction


" Linting and Code Formatting
" Syntax Highlighting: {{{

Plug 'tpope/vim-markdown'
Plug 'sheerun/vim-polyglot'
Plug 'andymass/vim-matchup'
"}}}
" Status line
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'romgrk/barbar.nvim'

" Autocompletion & Intellisense: {{{

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim'
" Plug 'SirVer/ultisnips'
Plug 'norcalli/snippets.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)
"
" This variant will set up the mappings only for the *CURRENT* buffer.

" There are only two keybindings specified by the suggested keymappings, which is <C-k> and <C-j>
" They are exactly equivalent to:

" <c-k> will either expand the current snippet at the word or try to jump to
" the next position for the snippet.
inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>

" <c-j> will jump backwards to the previous field.
" If you jump before the first field, it will cancel the snippet.
inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>
" Neovim lsp Plugins
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'rescript-lang/vim-rescript'
Plug 'tjdevries/nlua.nvim'
Plug 'tjdevries/lsp_extensions.nvim'
Plug 'glepnir/lspsaga.nvim'
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'

" }}}


" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'ThePrimeagen/refactoring.nvim'
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

Plug 'luochen1990/rainbow'
Plug 'romgrk/doom-one.vim'
Plug 'TaDaa/vimade'
Plug 'gcmt/taboo.vim'
Plug 'mhinz/vim-startify'
Plug 'norcalli/nvim-colorizer.lua'
" }}}

" Test
" {{{

" Plug 'janko/vim-test'

" }}}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'windwp/nvim-ts-autotag'
Plug 'nvim-treesitter/playground'
Plug 'nkrkv/nvim-treesitter-rescript'
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

Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-dispatch'


Plug 'unblevable/quick-scope'
Plug 'metakirby5/codi.vim'
" }}}
Plug 'wincent/scalpel'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'bagrat/vim-buffet'

Plug 'edluffy/specs.nvim' " animate line when big jump
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
nnoremap <leader>ff :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ layout_config={width=0.65} }))<CR>
nnoremap <Leader>fF :lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap ?? <cmd>lua require('telescope.builtin').live_grep()<CR>
" arte project
nnoremap <leader>fj :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ cwd='/media/disk/home/mathieu/Sources/Arte/js-toolkit', width=0.65 }))<CR>
nnoremap <leader>fr :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ cwd='/media/disk/home/mathieu/Sources/Arte/Replay', width= 0.65 }))<CR>
nnoremap <leader>fd :lua require('telescope.builtin').git_files(require('telescope.themes').get_dropdown({ cwd='/media/disk/home/mathieu/Sources/Arte/ARTE-DesignSystem', width= 0.65  }))<CR>
nnoremap <leader>fn :lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown({}))<CR>
nnoremap <leader>fN :lua require('telescope.builtin').file_browser(require('telescope.themes').get_dropdown({cwd='node_modules'}))<CR>
"
" LSP
nnoremap <leader>ls :lua require('telescope.builtin').lsp_document_symbols(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>lS :lua require('telescope.builtin').lsp_workspace_symbols(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>lr :lua require('telescope.builtin').lsp_reference_symbols(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap <leader>la :lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
nnoremap // :lua require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({ width=0.65 }))<CR>
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
