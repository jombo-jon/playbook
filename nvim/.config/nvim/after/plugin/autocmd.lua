

local ft = {"*.vhd","*.vhdl","*.md","*.py"}


local templates = {
  vhdl = {
    {"Package", "/home/johe/.config/nvim/template/package.vhd"},
    {"default.vhd", "/home/johe/.config/nvim/template/template.vhd"},
    {".vhdl", "/home/johe/.config/nvim/template/template.vhd"},
  };
  markdown ={
    {"todo.md", "/home/johe/.config/nvim/template/todo.md"},
    {"notebook.md", "/home/johe/.config/nvim/template/template.md"},
    {"qa.md", "/home/johe/.config/nvim/template/qa.md"},
    {"meeting.md", "/home/johe/.config/nvim/template/meeting.md"},
    {"default.md", "/home/johe/.config/nvim/template/template.md"},
  };
  python = {
    {"default.py", "/home/johe/.config/nvim/template/template.py"},
  }
}

function nvim_create_autocmd(definitions)
  for k, v in ipairs(definitions) do
    -- print(v)
    vim.api.nvim_create_autocmd( "BufNewFile", {pattern = v, callback = render })
  end
end

function lines_from(file)
  local lines = {}
  for line in io.lines(file) do 
    lines[#lines + 1] = line
  end
  return lines
end


function pattern_from(lines)
  local pat = {}

  for _,line in pairs(lines) do
    i, j = string.find(line, "{[%g%s]+}")
    if i and j then
      p = string.sub(line,i,j)

      if p == "{User}" then
        pat[p] = os.getenv("USER")
      elseif p == "{Date}" then
        pat[p] = os.date ("%A, %m %B %Y (%H:%M)")
      elseif p == "{File}" then
        pat[p] = vim.fn.expand("<afile>")
      elseif not pat[p] then 
        pat[p] = ''
      end
    end
  end

  return pat
end


local function get_keys(t)
  local keys={}
  for _, def in ipairs(t) do
    table.insert(keys, def[1])
  end
  return keys
end


function render()
  local default = true
  local data = {
    file = vim.fn.expand("<afile>"),
    match = vim.fn.expand("<amatch>"),
  }

  for group_name, definition in pairs(templates) do

    if group_name == vim.o.filetype then
      -- Select A template ?
      local selection  = nil
      vim.ui.select(get_keys(definition),
        {prompt = "Select a template :"},
        function(input) selection = input end
      )

      -- Retrieve the template from all the def
      local file = nil
      for _, def in ipairs(definition) do
        if selection == def[1] then
          file = def[2]
          break
        end
      end
      print("File: " ..file)

      local buf = vim.api.nvim_get_current_buf()
      local lines = lines_from(file)

      -- Iterate over the lines and search for {%g+}
      local patterns = pattern_from(lines)

      -- Query User for Information
      for k,v in pairs(patterns) do
        if v == '' then
          txt = "Enter " .. k .. ": "
          vim.ui.input(
            { prompt = txt},
            function(input) patterns[k] = input or '' end
          )
        end
      end

      -- Populate File with Information
      for p,v in pairs(patterns) do
        for i,line in pairs(lines) do
          if string.match(line,p) then
            s = string.gsub(line,p,v)
            lines[i] = s
          else
          end
        end
      end
      
      vim.api.nvim_buf_set_lines(buf,-1,-1,strict_indexing,lines)

      -- Template Found so break out!
      default = false
      break
    end

  end

  if default then
    print("Default")
  end

end

nvim_create_autocmd(ft)
