local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local d = ls.dynamic_node
local c = ls.choice_node
local f = ls.function_node
local i = ls.insert_node
local sn = ls.snippet_node

local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
local p = require("luasnip.extras").partial

local same = function(args)
  return f(function(arg)
    return arg[1]
  end, {args})
end

local shortreq = function(args)
  return f(function(arg)
    return arg[1]
  end, {args})
end

local paddtext = function(position)
  -- local fname = i .. string(" ",20 - #i);
  return d(position, function()
    local nodes = {}
    table.insert(nodes, i(1, "SignalName"))
    local fname = nodes[1][1] .. string.rep('.',5)
    return sn(nil, t(fname))
  end, {})
end

local filename = function(_,snip) 
      local file = snip.env.TM_FILENAME 
      return file:match("(.*).v")
end 

-- ------------ SNIPPETS --------------
ls.add_snippets("verilog", {
  -- Conditions 
  -- ------------------------------------
  s({trig = "if", regTrig = true}, 
  fmt([[
if ({}) begin
end
]],{ 
    i(0),
  })
  ),
  s({trig = "ife", regTrig = true}, 
  fmt([[
if ({}) begin
end else begin
end
]],{ 
    i(0),
  })
  ),
  s({trig = "case ([%a%d_-]+)", regTrig = true}, 
  fmt([[case ({}) begin
  {}
  default : 
endcase]], {
    d(1,function(args, snip) return sn(1, t(snip.captures[1])) end),
    i(0)
  })
  ),
  s({trig = "wh", regTrig = true}, 
  fmt([[
{} : begin
end
]],{ 
    i(0),
  })
  ),
  -- Variables,
  -- ------------------------------------
  s({trig = "p ([%a%d_-]+)", regTrig = true}, 
    d(1,function(args, snip) 
      local line = "localparam" .. snip.captures[1].. "" .. string.rep(" ",10 - #snip.captures[1])
      return sn(1, t(line))
    end),
    i(0)
  ),
  -- Specific,
  -- ------------------------------------
},
{
  key = "verilog",
})
