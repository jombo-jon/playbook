-- autocommands
-- https://dev.to/voyeg3r/writing-useful-lua-functions-to-my-neovim-14ki

-- ------- Description -------
-- Autocmd for filetype specific and then trigger and if else function inside to set according to what kind of type we
-- want to build ex: pkg.vhd or simple.vhd file

-- function file_exists()

--   local name = url:match("")

--   local f = io.open(
-- end
-- local au = require('au')

-- vim.nvimapi.nvim_create_autocmd( "BufNewFile",
--   {pattern = {"vhdl"}, callback = function()
--       print("VHDL FILEType")
--     end
--   }
-- )
local ft = {"*.vhd","*.vhdl","todo.md"}

local autocmds = {
  VhdlGrp = {
    -- Reload vim config automatically
    -- {"BufNewFile","*pkg.vhd", "0r /home/johe/.config/nvim/template/package.vhd"};
    {"BufNewFile","*.vhd", "0r /home/johe/.config/nvim/template/template.vhd"};
    {"BufNewFile","*.vhdl", "0r /home/johe/.config/nvim/template/template.vhd"};
  };
}

local templates = {
  VHDL = {
    -- Reload vim config automatically
    {"pkg.vhd", "/home/johe/.config/nvim/template/package.vhd"};
    {".vhd", "/home/johe/.config/nvim/template/template.vhd"};
    {".vhdl", "/home/johe/.config/nvim/template/template.vhd"};
  };
}

function nvim_create_augroups(definitions)
  for group_name, definition in pairs(definitions) do
    vim.api.nvim_command('augroup '..group_name)
    vim.api.nvim_command('autocmd!')
    for _, def in ipairs(definition) do
      -- print(vim.inspect(def))
      print(vim.inspect(def[2]))

      -- 
      -- local command = table.concat(vim.tbl_flatten{'autocmd', def}, ' ')
      -- vim.api.nvim_command(command)
      -- vim.api.nvim_create_autocmd( def[1], {pattern = def[2], command = def[3]})
      vim.api.nvim_create_autocmd( def[1], {pattern = def[2], callback = render })
    end
    vim.api.nvim_command('augroup END')
  end
end


function render()
  local default = true
  local data = {
    file = vim.fn.expand("<afile>"),
  }
  for group_name, definition in pairs(templates) do

    for _, def in ipairs(definition) do
      local pat = "%g+"..def[1]
      print(data.file.. " --- " .. pat)
      if string.match(data.file,pat) then
        default = false
        local buf = vim.api.nvim_get_current_buf()
        -- vim.api.nvim_out_write("-- New File --\n")
        vim.api.nvim_buf_set_lines(buf,0,-1,strict_indexing,{"--New File --", "-- M"})
        break
      end
    end
  end

  if default then
    print("Default")
  end


end

-- vim.api.nvim_create_autocmd( "BufNewFile", {pattern = ".vhd", callback = render })
nvim_create_augroups(autocmds)
-- autocommands END
