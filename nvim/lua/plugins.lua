vim.opt.completeopt = { "menuone", "noselect" }

local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

vim.cmd([[
   augroup packer_user_config
   autocmd!
   autocmd BufWritePost plugins.lua source <afile> | PackerCompile
augroup end
]])

-- ensure that packer is installed
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
   execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
   execute 'packadd packer.nvim'
end

vim.cmd('packadd packer.nvim')
local packer = require'packer'
local util = require'packer.util'

packer.init({
      package_root = util.join_paths(vim.fn.stdpath('data'), 'site', 'pack')
   })

--- startup and add configure plugins
packer.startup(function()
   local use = packer.use

   use 'wbthomason/packer.nvim'
   use 'nvim-lua/plenary.nvim'
   use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = function () require('configs/treesitter') end
   }
   --   -- explorer
   use {
      'kyazdani42/nvim-tree.lua',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function ()
         local map = require('utils').map
         local silent = { silent = true }
         map('n', '<leader>n', [[<cmd>NvimTreeToggle<CR>]], silent)
         map('n', '<leader>?', [[<cmd>NvimTreeFind<CR>]], silent)
      end
   }
   use {
      'glepnir/galaxyline.nvim', branch = 'main',
      requires = {'kyazdani42/nvim-web-devicons'},
      config = function () require('configs/galaxy') end
   }
   --   -- Search
   use {
      {
         'nvim-telescope/telescope.nvim',
         requires = {
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'telescope-frecency.nvim',
            'telescope-fzf-native.nvim',
         },
         wants = {
            'popup.nvim',
            'plenary.nvim',
            'telescope-frecency.nvim',
            'telescope-fzf-native.nvim',
         },
         cmd = 'Telescope',
         module = 'telescope',
         setup = [[ require('configs/telescope_setup') ]],
         config = function () require('configs/telescope') end ,
      },
      {
         'nvim-telescope/telescope-frecency.nvim',
         config = function()
            require"telescope".load_extension("frecency")
         end,
         -- require this to be installed
         -- sudo apt-get install sqlite3 libsqlite3-dev
         requires = { 'tami5/sqlite.lua' } ,
      },
      {
         'nvim-telescope/telescope-fzf-native.nvim',
         run = 'make',
         config = function()
            require"telescope".load_extension("fzf")
         end,
      },
   }
   --
   use 'tpope/vim-markdown'
   use 'sheerun/vim-polyglot'
   use 'andymass/vim-matchup'
   local startedByFirenvim
   if vim.g.started_by_firenvim ~= true then
         startedByFirenvim = false
      else
       startedByFirenvim  = true
    end
   --
   use {
      'romgrk/barbar.nvim',
      config = function () require('configs/barbar') end,
      disable = startedByFirenvim
   }
   --
   --   -- LSP
   use {
      'rescript-lang/vim-rescript',
      {
         'neovim/nvim-lspconfig',
         config=function ()
            require('configs/lsp_setup')
         end
      },
      'tjdevries/lsp_extensions.nvim',
      'glepnir/lspsaga.nvim',
      'onsails/lspkind-nvim',
      'ray-x/lsp_signature.nvim',
   }
   --
   use {
      'edluffy/specs.nvim', --  animate line when big jump
      config = function ()
         require('configs/m_specs')
      end
   }
   --
   use {
      'windwp/nvim-ts-autotag',
      config = function () require('nvim-ts-autotag').setup() end
   }

   use 'L3MON4D3/LuaSnip'
   --
   -- use 'nvim-lua/completion-nvim'
   use 'tjdevries/nlua.nvim'
   use 'kshenoy/vim-signature' -- manage marks
   --
   use 'tpope/vim-fugitive'
   use 'mhinz/vim-signify'
   use 'ludovicchabant/vim-gutentags'
   use 'rhysd/git-messenger.vim'

   -- Theme
   use 'luochen1990/rainbow'
   use 'romgrk/doom-one.vim'
   use 'TaDaa/vimade'
   use 'gcmt/taboo.vim'
   use 'mhinz/vim-startify'

   --   use 'nvim-treesitter/playground'
   --   use 'nkrkv/nvim-treesitter-rescript'
   use 'tpope/vim-repeat'
   use 'tpope/vim-surround'
   use 'tpope/vim-commentary'
   use 'ervandew/supertab'
   use 'AndrewRadev/tagalong.vim'
   use 'airblade/vim-rooter'
   use 'unblevable/quick-scope'
   use 'wincent/scalpel'
   use 'bagrat/vim-buffet'
   use 'machakann/vim-highlightedyank'

   use 'embear/vim-localvimrc'
   use 'tpope/vim-projectionist'
   use 'tpope/vim-dispatch'

   use 'szw/vim-maximizer'

    use {
      "AndrewRadev/splitjoin.vim",
      keys = { "gJ", "gS" },
    }

   --  This is an REPL manager
   use {
      'metakirby5/codi.vim',
      opt = true,
      disable = true
   }
   --   -- Refactoring
   use { 'ThePrimeagen/refactoring.nvim', opt = true }
   -- use nvim in browser
   use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end
   }
   use {
      "hrsh7th/nvim-cmp",
      requires={
         "hrsh7th/cmp-buffer",
         "hrsh7th/cmp-path",
         "hrsh7th/cmp-nvim-lsp",
         'saadparwaiz1/cmp_luasnip'
      }
   }
   --   -- Git enhancement, let's see what is very useful
   -- use 'sodapopcan/vim-twiggy'
   -- use 'junegunn/gv.vim'
   -- use 'stsewd/fzf-checkout.vim'
   -- use 'tpope/vim-rhubarb' -- to facilitate work with github but need
   -- Wants to align object in a way ... don't using it for now
   -- use 'godlygeek/tabular'
end)
