-- Require
-- 
local nnoremap = require("jombojon.keymap").nnoremap
local inoremap = require("jombojon.keymap").inoremap
-- Neovim (options)

-- nnoremap('hi',function()
--   local pos = vim.api.nvim_win_get_cursor(0)[2]
--   local line = vim.api.nvim_get_current_line()
--   local nline = line:sub(0, pos) .. 'hello' .. line:sub(pos + 1)
--   vim.api.nvim_set_current_line(nline)
-- end)
-- Function 
-- local function hello() 
--     return "Hello World"
-- end

function insert_text(text)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. text .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

-- vim.api.nvim_create_autocmd("BufEnter", {
--     pattern = {"c", "h"},
--     callback = function()
--		local data = {
--			buf = vim.fn.expand("<abuf>"),
--			file = vim.fn.expand("<afile>"),
--			match = vim.fn.expand("<amatch>"),
--		}
		
--		-- inoremap('bj',vim.cmd('insert bonjour'))
--		nnoremap('hello',':lua insert_text("hello bonjour")<cr>')

--		vim.api.nvim_set_keymap("i","hi","<cmd>lua hello()<cr>",{} )

--		-- vim.keymap.set("n", "hello", function()
--		-- print "hello world"
--		-- end, { desc = "my hello world" })   
-- end,
-- })
vim.api.nvim_create_autocmd(
  "FileType",
  { pattern = { "c", "h"},
  -- command = [[inoremap hi :lua insert_text("hello bonjour")<CR>]] }
  -- command = [[imap <silent> hi <C-R>=<cmd>lua insert_text("bonjour")<CR>]]
  -- command = ("hi",insert_text("bonjour"))
})
