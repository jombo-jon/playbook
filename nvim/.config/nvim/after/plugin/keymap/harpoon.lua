local nnoremap = require("jombojon.keymap").nnoremap

local silent = { silent = true }

-- Remap
nnoremap("<leader>a", function() require("harpoon.mark").add_file() end, silent)
-- nnoremap("<leader>ha>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<C-H>>", function() require("harpoon.ui").toggle_quick_menu() end, silent)
nnoremap("<C-L>>", function() require("harpoon.ui").toggle_quick_menu() end, silent)

nnoremap("<C-J>", function() require("harpoon.ui").nav_next() end, silent)
nnoremap("<C-S-k>", function() require("harpoon.ui").nav_prev() end, silent)

nnoremap("<leader>j", function() require("harpoon.ui").nav_next() end, silent)
nnoremap("<leader>k", function() require("harpoon.ui").nav_prev() end, silent)
-- nnoremap("<leader>k", function() require("harpoon.ui").nav_file(2) end, silent)
-- nnoremap("<leader>l", function() require("harpoon.ui").nav_file(3) end, silent)
nnoremap("<leader>l", function() require("harpoon.ui").toggle_quick_menu() end, silent)
-- nnoremap("<leader>;", function() require("harpoon.ui").nav_file(4) end, silent)
