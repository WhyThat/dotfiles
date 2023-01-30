-- Filetype options
vim.filetype.add {
  filename = {
    ['.env.preprod'] = 'shell',
    ['env.prod'] = 'shell',
    ['env.*'] = 'shell',
  },
  extension = {
    eslintrc = 'json',
    scm = 'scheme',
    prettierrc = 'json',
    conf = 'conf',
    mdx = 'markdown',
    re = 'reason',
    rei = 'reason',
  },
}
