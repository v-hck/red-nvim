vim.deprecate = function(...) end
vim.opt.termguicolors = true
require("lazy.loader")
require('kernel.configs')
require("kernel.auto_funcs")
require('kernel.mappings')

