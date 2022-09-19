
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

local has_value = function(value)
  print(value)
    if value == "oth" then
      return ":= (others => '0');"
    elseif value == "0th" then
      return ":= (others => '0');"
    elseif value == "1th" then
      return ":= (others => '1');"
    elseif value == " " then
      return ";"
    elseif value ~= nil then
      return ":= " .. value .. ";"
    else
      return ";"
    end
end 
-- ------------ SNIPPETS --------------
ls.add_snippets("vhdl", {
  s(
    "cst" , 
    fmt([[constant C_{}{} : {} := {};]],{ 
      i(1, "CST_NAME"),
      f(function(name)
        local fname = string.rep(" ",10 - #name[1])
        return fname
      end, {1}),
      c(2, {
        i(1, "CstType"),
        t("time"),
        t("std_logic"),
        fmt([[ std_logic_vector({}{}{})]], {
          i(1,"MAX"),
          c(2, {t(' downto '),t(' upto ')}),
          i(3,"0")
        }),
      }),
      i(3,"DefaultValue"),
    })
  ), 
  -- C_{UPPER} : 
  s({trig = "cst (%w+)", regTrig = true}, 
    fmt([[{}{}]],{ 
  	  d(1,function(args, snip) 
        local line = "constant C_" .. string.upper(snip.captures[1]) .. string.rep(" ",10 - #snip.captures[1]) .. ": "
        return sn(1, t(line))
  		end),
      i(2),
    })
  ),
  -- Math Type
  s({trig = "real (%w+)", regTrig = true}, 
    fmt([[{}{}]],{ 
  	  d(1,function(args, snip) 
        local line = "real := " .. string.upper(snip.captures[1]) .. " ;"
        return sn(1, t(line))
  		end),
      i(2),
    })
  ),
  s({trig = "int (%w+)", regTrig = true}, 
    fmt([[{}{}]],{ 
  	  d(1,function(args, snip) 
        local line = "integer := " .. string.upper(snip.captures[1]) .. " ;"
        return sn(1, t(line))
  		end),
      i(2),
    })
  ),
  -- s(
  --   "out" , 
  --   fmt([[{}{} : out {}{}]],{ 
  --     i(1, "OutPort"),
  --     f(function(name)
  --       local fname = "_o" .. string.rep(" ",10 - #name[1])
  --       return fname
  --     end, {1}),
  --     c(2, {
  --       t("std_logic"),
  --       fmt([[ std_logic_vector({}{}{})]], {
  --         i(1,"MAX"),
  --         c(2, {t(' downto '),t(' upto ')}),
  --         i(3,"0")
  --       }),
  --     }),
  --     c(3, {
  --       t(""),
  --       t(";"),
  --     }),
  --   })
  -- ), 
  -- s(
  --   "in" , 
  --   fmt([[{}{} : in {}{}]],{ 
  --     i(1, "InPort"),
  --     f(function(name)
  --       local fname = "_i" .. string.rep(" ",10 - #name[1])
  --       return fname
  --     end, {1}),
  --     -- f(function(_,snip)
  --     --   -- local fname = snip.captures[1] .. string.rep(" ",20 - #snip.captures[1])
  --     --   local fname = snip.captures[1] .. "voilalalala"
  --     --   return t(fname)
  --     --   end, {1}),
  --     -- d(1, function(idx)
  --     --   local fname = idx[1] .. string(" ",20 - #idx[1])
  --     --   return sn(nil, {i(1, fname)})
  --     --   end,
  --     c(2, {
  --       t("std_logic"),
  --       fmt([[ std_logic_vector({}{}{})]], {
  --         i(1,"MAX"),
  --         c(2, {t(' downto '),t(' upto ')}),
  --         i(3,"0")
  --       }),
  --     }),
  --     c(3, {
  --       t(""),
  --       t(";"),
  --     }),
  --   })
  -- ), 
  -- {}_x : in
  s({trig = "in (%w+)", regTrig = true}, 
    fmt([[{}{}
{}]],{ 
  	  d(1,function(args, snip) 
        local line = snip.captures[1].. "_i" .. string.rep(" ",10 - #snip.captures[1]) .. ": in  "
        return sn(1, t(line))
  		end),
      i(2,"std_logic;"),
      i(3)
    })
  ),
  -- {}_x : out
  s({trig = "out (%w+)", regTrig = true}, 
    fmt([[{}{}
{}]],{ 
  	  d(1,function(args, snip) 
        local line = snip.captures[1].. "_0" .. string.rep(" ",10 - #snip.captures[1]) .. ": out "
        return sn(1, t(line))
  		end),
      i(2,"std_logic;"),
      i(3)
    })
  ),
  -- signal s_{} : {} :=
  s({trig = "s (%w+)", regTrig = true}, 
    fmt([[signal s_{} {}]],{ 
  	  d(1,function(args, snip) 
        local line = snip.captures[1] .. string.rep(" ",10 - #snip.captures[1]) .. ": "
        return sn(1, t(line))
  		end),
      i(2),
    })
  ),
  -- std_logic
  s({trig = "slz", regTrig = true}, 
    fmt([[{}
{}
]],{ 
  	  t("std_logic := '0'"),
      i(2)
    })
  ),
  s({trig = "sl(.*)", regTrig = true}, 
    fmt([[{}
{}
]],{ 
  	  d(1,function(_, snip) 
        local val = has_value(snip.captures[1])
        return sn(1, t("std_logic " .. val))
  		end),
      i(2)
    })
  ),
  -- std_logic_vector({} {} {})
  s({trig = "svz (.+) (%d+)", regTrig = true}, 
    fmt([[{}
{}
]],{ 
  	  d(1,function(_, snip) 
        return sn(1, t("std_logic_vector( " .. snip.captures[1] .. " downto " .. snip.captures[2] .." ) := (others => '0');"))
  		end),
      i(2)
    })
  ),
  -- s(
  --   "ent" , 
  --   fmt("\nentity {} is\n\t{}\n\t{}\nend {};\n", {
  --       i(0) ,
  --       c(1,{
  --         fmt("\n\tGeneric (\n\t\t{}\t\n);", {
  --           i(0) ,
  --         }),
  --         t(""),
  --       }),
  --       fmt("\n\tPort (\n\t\t{}\t\n);", {
  --         i(0) ,
  --       }),
  --       rep(1),
  --     })
  -- ), 
  -- s(
  --   "port" , 
  --   fmt("\n\tPort(\n\t\t{}\t\n);", {
  --       i(0) ,
  --   })
  -- ), 
},
{
  key = "vhdl",
})
