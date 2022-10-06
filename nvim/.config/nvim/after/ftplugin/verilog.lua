local nnoremap = require("jombojon.keymap").nnoremap
local inoremap = require("jombojon.keymap").inoremap
local vnoremap = require("jombojon.keymap").vnoremap

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.textwidth=120
vim.opt.commentstring = "// %s"

-- Naviguation
-- inoremap("<<","<=")
-- inoremap(">>","=>")
-- inoremap("::",":=")

-- Special Normal
-- nnoremap("cmp","<cmd>:lua test()<cr>")

-- Insert Mode
-- inoremap("oth","(others => '0')")
-- inoremap("stl","std_logic")
-- inoremap("stv","std_logic_vector")

-- vim.api.nvim_create_autocmd( "BufNewFile",
--   {pattern = {"vhdl"}, callback = function()
--       vim.cmd("echo 'Hello'")
--       -- print("VHDL FILEType")

--       local bufnr = vim.api.nvim_get_current_buf()
--       local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")
--       local fname = vim.fn.expand "%:p:t"
--       print(fname)
--     end
--   }
-- )
