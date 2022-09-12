
-- print("Set")

vim.opt.relativenumber = true
vim.opt.nu = true

vim.opt.errorbells = false

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.showtabline = 4
vim.opt.swapfile = false
vim.opt.termguicolors = true

vim.g.mapleader =","

-- i sometimes use the mouse to scroll through a buffer
vim.cmd [[set mouse=a]]

-- vim.opt.listchars = {eol = '↵', tab = '▸\\'}   
-- vim.opt.list = true
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
vim.opt.listchars:append "eol:↴"

--require("indent_blankline").setup {
--    space_char_blankline = " ",
--    show_current_context = true,
--    show_current_context_start = true,
--}
