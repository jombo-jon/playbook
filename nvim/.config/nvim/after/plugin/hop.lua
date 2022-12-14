require'hop'.setup {}

vim.api.nvim_set_keymap('', 'f', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 'F', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>", {})
vim.api.nvim_set_keymap('', 't', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })<cr>", {})
vim.api.nvim_set_keymap('', 'T', "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })<cr>", {})
vim.api.nvim_set_keymap('', 's', "<cmd>lua require'hop'.hint_char2({ multi_windows = true })<cr>", {})

-- vim.api.nvim_set_keymap('', 'S', "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>", {})

-- vim.api.nvim_set_keymap('', '/', "<cmd>lua require'hop'.hint_patterns({ multi_windows = true })<cr>", {})
-- vim.api.nvim_set_keymap('', '<leader>.', "<cmd>lua require'hop'.hint_lines({ multi_windows = true })<cr>", {})
