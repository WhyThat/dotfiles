-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/mathieu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/mathieu/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/mathieu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/mathieu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/mathieu/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs/barbar\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/barbar.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/cmp_luasnip"
  },
  ["doom-one.vim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/doom-one.vim"
  },
  firenvim = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/firenvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs/galaxy\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["git-messenger.vim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/git-messenger.vim"
  },
  ["lsp_extensions.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lsp_signature.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs/lsp_setup\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n°\1\0\0\b\0\t\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0\26<cmd>NvimTreeFind<CR>\14<leader>?\28<cmd>NvimTreeToggle<CR>\14<leader>n\6n\1\0\1\vsilent\2\bmap\nutils\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs/treesitter\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["quick-scope"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/quick-scope"
  },
  rainbow = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/rainbow"
  },
  ["refactoring.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/opt/refactoring.nvim"
  },
  scalpel = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/scalpel"
  },
  ["specs.nvim"] = {
    config = { "\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20configs/m_specs\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/specs.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gJ" }, { "", "gS" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/opt/splitjoin.vim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/sqlite.lua"
  },
  supertab = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/supertab"
  },
  ["taboo.vim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/taboo.vim"
  },
  ["tagalong.vim"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/tagalong.vim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs/telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    wants = { "popup.nvim", "plenary.nvim", "telescope-frecency.nvim", "telescope-fzf-native.nvim" }
  },
  ["vim-buffet"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-buffet"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-dispatch"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-dispatch"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-gutentags"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-gutentags"
  },
  ["vim-highlightedyank"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-highlightedyank"
  },
  ["vim-localvimrc"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-localvimrc"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-matchup"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-matchup"
  },
  ["vim-maximizer"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-maximizer"
  },
  ["vim-polyglot"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-polyglot"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-rescript"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-rescript"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-rooter"
  },
  ["vim-signature"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-signature"
  },
  ["vim-signify"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-signify"
  },
  ["vim-startify"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-startify"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  vimade = {
    loaded = true,
    path = "/home/mathieu/.local/share/nvim/site/pack/packer/start/vimade"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^telescope"] = "telescope.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
 require('configs/telescope_setup') 
time([[Setup for telescope.nvim]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs/galaxy\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n1\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\22configs/lsp_setup\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n°\1\0\0\b\0\t\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\1\3\0\18\2\0\0'\4\4\0'\5\5\0'\6\6\0\18\a\1\0B\2\5\1\18\2\0\0'\4\4\0'\5\a\0'\6\b\0\18\a\1\0B\2\5\1K\0\1\0\26<cmd>NvimTreeFind<CR>\14<leader>?\28<cmd>NvimTreeToggle<CR>\14<leader>n\6n\1\0\1\vsilent\2\bmap\nutils\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: nvim-ts-autotag
time([[Config for nvim-ts-autotag]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")
time([[Config for nvim-ts-autotag]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23configs/treesitter\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\2\n.\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\19configs/barbar\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: specs.nvim
time([[Config for specs.nvim]], true)
try_loadstring("\27LJ\2\n/\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\20configs/m_specs\frequire\0", "config", "specs.nvim")
time([[Config for specs.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
