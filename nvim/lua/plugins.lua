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
local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

vim.cmd("packadd packer.nvim")
local packer = require("packer")
local util = require("packer.util")

packer.init({
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack"),
})

local ui = function(use)
    use({
        "hoob3rt/lualine.nvim",
        requires = {
            { "kyazdani42/nvim-web-devicons", opt = true },
        },
    })
    use("luochen1990/rainbow")
    use("folke/tokyonight.nvim")
    use("TaDaa/vimade")
    use("gcmt/taboo.vim")
    use("mhinz/vim-startify")
    use({
        "romgrk/barbar.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        config = function()
            require("configs/barbar")
        end,
    })
    use({
        "folke/twilight.nvim",
        config = function()
            require("twilight").setup({
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            })
        end,
    })
end

local treesitter = function(use)
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        config = function()
            require("configs/treesitter")
        end,
        requires = {
            "mizlan/iswap.nvim",
            "nvim-treesitter/playground",
            "nvim-treesitter/nvim-treesitter-textobjects",
            "windwp/nvim-ts-autotag",
            "code-biscuits/nvim-biscuits",
            "andymass/vim-matchup",
            'David-Kunz/markid',
        },
    })

    use("nkrkv/nvim-treesitter-rescript")
    -- use("/media/disk/home/mathieu/plugins/nvim-treesitter-rescript")
end

local telescope = function(use)
    use({
        {
            "nvim-telescope/telescope.nvim",
            requires = {
                "benfowler/telescope-luasnip.nvim",
                "nvim-lua/popup.nvim",
                "nvim-lua/plenary.nvim",
                "telescope-frecency.nvim",
                "telescope-fzf-native.nvim",
            },
            wants = {
                "popup.nvim",
                "plenary.nvim",
                "telescope-frecency.nvim",
                "telescope-fzf-native.nvim",
            },
            module = "telescope",
            setup = [[ require('configs/telescope_setup') ]],
            config = function()
                require("configs/telescope")
            end,
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            config = function()
                require("telescope").load_extension("frecency")
            end,
            -- require this to be installed
            -- sudo apt-get install sqlite3 libsqlite3-dev
            requires = { "tami5/sqlite.lua" },
        },
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            run = "make",
            config = function()
                require("telescope").load_extension("fzf")
            end,
        },
    })
end

local intellisense = function(use)
    use("jose-elias-alvarez/nvim-lsp-ts-utils")
    use("nvim-lua/lsp_extensions.nvim")
    -- use("github/copilot.vim")
    use("sheerun/vim-polyglot")
    use("L3MON4D3/LuaSnip")
    use({
        "rescript-lang/vim-rescript",
        "SmiteshP/nvim-navic",
        "simrat39/rust-tools.nvim",
        {
            "neovim/nvim-lspconfig",
            config = function()
                require("configs/lsp_setup")
            end,
        },
        "nvim-lua/lsp-status.nvim",
        "onsails/lspkind-nvim",
        -- {
        --     "ray-x/lsp_signature.nvim",
        --     config = function()
        --         require("lsp_signature").setup()
        --     end,
        -- },
    })
    use({
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            print("copilot")
            require("copilot").setup()
            require("copilot_cmp").setup()
        end,
        requires = "zbirenbaum/copilot-cmp",
    })

    use("tpope/vim-markdown")
    -- use({
    --     "zbirenbaum/copilot-cmp",
    --     after = { "copilot.lua" },
    --     config = function()
    --         print("copilot-cmp")
    --         require("copilot_cmp").setup()
    --     end,
    -- })
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            -- "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lsp",
            "saadparwaiz1/cmp_luasnip",
        },
    })

    use("AndrewRadev/tagalong.vim")
    use({
        "lvimuser/lsp-inlayhints.nvim",
        config = function()
            require("lsp-inlayhints").setup()
        end,
    })
end

local vim_plugin_utilities = function(use)
    use("wbthomason/packer.nvim")
    use("nvim-lua/plenary.nvim")
    use({
        "tpope/vim-scriptease",
        cmd = {
            "Messages", --view messages in quickfix list
            "Verbose", -- view verbose output in preview window.
            "Time", -- measure how long it takes to run some stuff.
        },
    })
end

local motion = function(use)
    use("unblevable/quick-scope")
end

local git = function(use)
    use("tpope/vim-fugitive")
    use("rhysd/git-messenger.vim")
    use("mhinz/vim-signify")
    use("sindrets/diffview.nvim")
end

local project = function(use)
    use("embear/vim-localvimrc")
    use("tpope/vim-projectionist")
end
--- startup and add configure plugins
packer.startup(function()
    local use = packer.use

    use("kyazdani42/nvim-web-devicons")
    use("ckipp01/stylua-nvim")
    vim_plugin_utilities(use)
    ui(use)
    treesitter(use)
    telescope(use)
    intellisense(use)
    git(use)
    motion(use)
    project(use)

    -- use({
    --     "nvim-orgmode/orgmode",
    --     config = function()
    --         require("orgmode").setup({
    --             org_agenda_skip_deadline_if_done = true,
    --             org_agenda_files = {
    --                 "~/orgmode/agenda/*",
    --                 "~/orgmode/todo/**/*",
    --             },
    --             org_default_notes_file = "~/orgmode/refile.org",
    --             org_agenda_templates = {
    --                 t = { description = "Task", template = "* TODO %?\n%u" },
    --                 j = {
    --                     description = "Jira",
    --                     template = "%(return require('mat.org').createJiraTask())",
    --                     target = "~/orgmode/todo/arte/jira.org",
    --                 },
    --             },
    --         })
    --     end,
    -- })
    --   -- explorer
    use({
        "kyazdani42/nvim-tree.lua",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("nvim-tree").setup({})
            local map = require("utils").map
            local silent = { silent = true }
            map("n", "<leader>n", [[<cmd>NvimTreeToggle<CR>]], silent)
            map("n", "<leader>?", [[<cmd>NvimTreeFindFile<CR>]], silent)
        end,
    })
    use({
        "edluffy/specs.nvim", --  animate line when big jump
        config = function()
            require("configs/m_specs")
        end,
    })
    --

    --
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("mat.autopairs")
        end,
    })
    use("tjdevries/nlua.nvim")
    use("kshenoy/vim-signature") -- manage marks
    --

    use("tpope/vim-repeat")
    use("tpope/vim-surround")
    -- use 'tpope/vim-commentary'
    use({
        "numToStr/Comment.nvim",
        config = function()
            require("Comment").setup()
        end,
    })

    local ft = require("Comment.ft")
    ft.rescript = { "// %s", "/* %s */" }

    use("ervandew/supertab")
    use("airblade/vim-rooter")
    use("wincent/scalpel")
    use("machakann/vim-highlightedyank")

    use("szw/vim-maximizer")

    use("ThePrimeagen/harpoon")

    use({
        "AndrewRadev/splitjoin.vim",
        keys = { "gJ", "gS" },
    })
end)
