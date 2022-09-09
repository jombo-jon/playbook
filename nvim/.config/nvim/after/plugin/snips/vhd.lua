
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


-- Highlight on yank

-- ------------ NewFile --------------

-- ------------ SNIPPETS --------------
ls.add_snippets("vhdl", {

  -- s(
  --   "jkl" , 
  --     { t{"voila","voila2"},
  --       d(1,function(idx)
  --         print(type(idx[1]))
  --         local fname = idx[1] .. string.rep(".",5)
  --         return sn(nil,i(1,fname))
  --     end),
  --     i(2) 
  --   }
  -- ),
  -- local {default} require('default')
  s(
    "out" , 
    fmt([[{}{} : out {}{}]],{ 
      i(1, "OutPort"),
      f(function(name)
        local fname = "_o" .. string.rep(" ",10 - #name[1])
        return fname
      end, {1}),
      -- f(function(_,snip)
      --   -- local fname = snip.captures[1] .. string.rep(" ",20 - #snip.captures[1])
      --   local fname = snip.captures[1] .. "voilalalala"
      --   return t(fname)
      --   end, {1}),
      -- d(1, function(idx)
      --   local fname = idx[1] .. string(" ",20 - #idx[1])
      --   return sn(nil, {i(1, fname)})
      --   end,
      c(2, {
        t("std_logic"),
        fmt([[ std_logic_vector({}{}{})]], {
          i(1,"MAX"),
          c(2, {t(' downto '),t(' upto ')}),
          i(3,"0")
        }),
      }),
      c(3, {
        t(""),
        t(";"),
      }),
    })
  ), 
  s(
    "in" , 
    fmt([[{}{} : in {}{}]],{ 
      i(1, "InPort"),
      f(function(name)
        local fname = "_i" .. string.rep(" ",10 - #name[1])
        return fname
      end, {1}),
      -- f(function(_,snip)
      --   -- local fname = snip.captures[1] .. string.rep(" ",20 - #snip.captures[1])
      --   local fname = snip.captures[1] .. "voilalalala"
      --   return t(fname)
      --   end, {1}),
      -- d(1, function(idx)
      --   local fname = idx[1] .. string(" ",20 - #idx[1])
      --   return sn(nil, {i(1, fname)})
      --   end,
      c(2, {
        t("std_logic"),
        fmt([[ std_logic_vector({}{}{})]], {
          i(1,"MAX"),
          c(2, {t(' downto '),t(' upto ')}),
          i(3,"0")
        }),
      }),
      c(3, {
        t(""),
        t(";"),
      }),
    })
  ), 
  s(
    "sig" , 
    fmt([[signal {}{} : {}{}]],{ 
      i(1, "SigName"),
      f(function(name)
        print(#name[1][1])
        local fname = "_s" .. string.rep(" ",15 - #name[1][1])
        return fname
      end, {1}),
      c(2, {
        t("std_logic"),
        fmt([[ std_logic_vector({}{}{})]], {
          i(1,"MAX"),
          c(2, {t(' downto '),t(' upto ')}),
          i(3,"0")
        }),
      }),
      c(3, {
        t(";"),
        fmt([[ := {};]], {
          i(1,"(others => '0')"),
        }),
      }),
    })
  ), 

  s(
    "ent" , 
    fmt("\nentity {} is\n\t{}\n\t{}\nend {};\n", {
        i(0) ,
        c(1,{
          fmt("\n\tGeneric (\n\t\t{}\t\n);", {
            i(0) ,
          }),
          t(""),
        }),
        fmt("\n\tPort (\n\t\t{}\t\n);", {
          i(0) ,
        }),
        rep(1),
      })
  ), 
  s(
    "port" , 
    fmt("\n\tPort(\n\t\t{}\t\n);", {
        i(0) ,
    })
  ), 
},
{
  key = "vhdl",
})
