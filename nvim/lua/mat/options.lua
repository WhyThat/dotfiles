vim.g.mapleader = " "

vim.opt.list = true
vim.opt.listchars = {
  eol = nil, --'↴',
  tab = '» ',
  extends = '›',
  precedes = '‹',
  trail = '•',
}

vim.opt.fillchars = {
  eob = '~',
  foldopen = '▾',
  foldsep = '│',
  foldclose = '▸',
  msgsep = ' ',
}

vim.opt.clipboard = 'unnamedplus'

vim.opt.inccommand = 'nosplit' -- incremental live completion
vim.opt.number = true
vim.opt.hidden = true
vim.opt.mouse = 'a'
vim.opt.mousefocus = true

vim.opt.swapfile = false

vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.encoding = 'utf-8'
vim.opt.clipboard = 'unnamedplus'
vim.opt.pumheight = 15
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.wildignorecase = true
vim.opt.wildignore = vim.opt.wildignore
  + {
    '*.aux',
    '*.out',
    '*.toc',
    '*.o',
    '*.obj',
    '*.dll',
    '*.jar',
    '*.pyc',
    '*.rbc',
    '*.class',
    '*.gif',
    '*.ico',
    '*.jpg',
    '*.jpeg',
    '*.png',
    '*.avi',
    '*.wav',
    '*.*~',
    '*~ ',
    '*.swp',
    '.lock',
    '.DS_Store',
    'tags.lock',
  }

vim.opt.showmode = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 3




