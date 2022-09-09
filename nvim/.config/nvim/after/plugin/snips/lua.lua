
local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial

local shortreq = function(args)
  return f(function(arg)
    return arg[1]
  end, {args})
end

ls.add_snippets("lua", {
  -- local {default} require('default')
  s(
    "req" , 
    fmt(
      "local {} = require('{}')", 
      {f(function(i)
        local parts = vim.split(i[1][1],".",true)
        return parts[#parts] or ""
      end, {1}), i(1) }
    )
  ),
  
  s(
    "local" , 
    fmt(
      "local {} = {}", 
      { i(1) , i(0) }
    )
  ),
},
{
  key = "lua",
})
