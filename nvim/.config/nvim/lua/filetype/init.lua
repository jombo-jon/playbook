-- Require
--
local function push(buf,map)

    for lhs, rhs in pairs(map) do
    vim.keymap.set(rhs[1],lhs,rhs[2],{buffer = buf})
    end
end

function insert(string)
  local pos = vim.api.nvim_win_get_cursor(0)[2]
  local line = vim.api.nvim_get_current_line()
  local nline = line:sub(0, pos) .. string .. line:sub(pos + 1)
  vim.api.nvim_set_current_line(nline)
end

function bind(op, outer_opts)
    outer_opts = outer_opts or {noremap = true}
    return function(lhs, rhs, opts)
        opts = vim.tbl_extend("force",
            outer_opts,
            opts or {}
        )
        vim.keymap.set(op, lhs, rhs, opts)
    end
end

vim.api.nvim_create_autocmd("BufEnter", {

-- vim.api.nvim_create_autocmd("Filetype", {
    pattern = "*",
    callback = function()
    local data = {
      buf = vim.fn.expand("<abuf>"),
      file = vim.fn.expand("<afile>"),
      match = vim.fn.expand("<amatch>"),
    }

    local ft = vim.api.nvim_buf_get_option(tonumber(data.buf),"ft")

    local table = {}
    if ft == "c" then
        
        -- vim.cmd("set noexpandtab")
        -- vim.cmd(":retab!")
        -- vim.cmd("set expandtab")
        -- vim.cmd(":retab!")
        -- vim.cmd(":w") 

        -- print("Filetype : " .. ft)
        push(tonumber(data.buf),require('filetype.c'))

    elseif ft == "lua" then

        -- vim.cmd("set noexpandtab")
        -- vim.cmd(":retab!")
        -- vim.cmd("set expandtab")
        -- vim.cmd(":retab!")
        -- vim.cmd(":w") 

        -- print("Filetype : " .. ft)
        push(tonumber(data.buf),require('filetype.lua'))

    else
        -- print("Other Filetype")


    end

     end,
})

      
    
--    nnoremap('hello',':lua insert_text("hello bonjour")<cr>')

--    vim.api.nvim_set_keymap("i","hi","<cmd>lua hello()<cr>",{} )

--    -- vim.keymap.set("n", "hello", function()
--    -- print "hello world"
--    -- end, { desc = "my hello world" })   
-- end,
-- })
-- vim.api.nvim_create_autocmd(
--   "FileType",
--   { pattern = { "c", "h"},
  -- command = [[inoremap hi :lua insert_text("hello bonjour")<CR>]] }
  -- command = [[imap <silent> hi <C-R>=<cmd>lua insert_text("bonjour")<CR>]]
  -- command = ("hi",insert_text("bonjour"))
--vim.api.nvim_create_autocmd("Filetype", {
--    pattern = {"c", "h"},
--    callback = function()

--    local data = {
--      buf = vim.fn.expand("<abuf>"),
--      file = vim.fn.expand("<afile>"),
--      match = vim.fn.expand("<amatch>"),
--    }

--    print("C Filtype")  
--    inoremap('bj',vim.cmd('insert bonjour'))
--    nnoremap('hello',':lua insert_text("hello bonjour")<cr>')
--     end,

      
    
----    nnoremap('hello',':lua insert_text("hello bonjour")<cr>')

----    vim.api.nvim_set_keymap("i","hi","<cmd>lua hello()<cr>",{} )

----    -- vim.keymap.set("n", "hello", function()
----    -- print "hello world"
----    -- end, { desc = "my hello world" })   
---- end,
---- })
---- vim.api.nvim_create_autocmd(
----   "FileType",
----   { pattern = { "c", "h"},
--  -- command = [[inoremap hi :lua insert_text("hello bonjour")<CR>]] }
--  -- command = [[imap <silent> hi <C-R>=<cmd>lua insert_text("bonjour")<CR>]]
--  -- command = ("hi",insert_text("bonjour"))
--})
