-- if vim.g.snippets ~= "luasnip" or not pcall(require, "luasnip") then
--   print("LuaSnip Not Loaded")
--   return
-- else
--   print("LuaSnip")
-- end
local ls = require("luasnip")
local types = require("luasnip.util.types")

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,

  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",

  -- Autosnippets:
  enable_autosnippets = true,

  -- Crazy highlights!!
  -- #vid3
  -- ext_opts = nil,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = { { " « ", "NonTest" } },
      },
    },
  },
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
-- vim.keymap.set({ "i", "s" }, ".k", function()
vim.keymap.set({ "i", "s" }, "<C-k>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
-- vim.keymap.set({ "i", "s" }, ".j", function()
vim.keymap.set({ "i", "s" }, "<C-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
-- vim.keymap.set("i", ".l", function()
vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)


-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")

-- --------- SNIPPET TIME!!! -----------------------

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

ls.add_snippets("all", {
	-- Very long example for a java class.
    s("date" ,  f(function() return os.date "%m %B %Y" end )),
    s("daydate" ,  f(function() return os.date "%A, %m %B %Y" end )),
    s("time" ,  f(function() return os.date "%H:%M" end )),
    s("longdata" ,  f(function() return os.date "%A, %m %B %Y (%H:%M)"end ))
}, {
	key = "all",
})

