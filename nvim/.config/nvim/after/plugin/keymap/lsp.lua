
local nnoremap = require("jombojon.keymap").nnoremap

local silent = { silent = true }

nnoremap("gd", "<cmd>lua vim.lsp.buf_definition()<cr>", silent)
nnoremap("gD", "<cmd>lua vim.lsp.type_definition()<cr>", silent)
