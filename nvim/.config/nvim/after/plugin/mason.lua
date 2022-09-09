require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = { "sumneko_lua", "rust_analyzer" }
})

require("lspconfig").sumneko_lua.setup {}
require("lspconfig").rust_analyzer.setup {}
require("lspconfig").clangd.setup {}

-- vim.g['LanguageClient_serverCommands']= {
--     'vhdl' = ['vhdl-tool','server']
-- }
-- if not require'lspconfig.configs'.hdl_checker then
--   require'lspconfig.configs'.hdl_checker = {
--     default_config = {
--     cmd = {"hdl_checker", "--lsp", };
--     filetypes = {"vhdl", "verilog", "systemverilog"};
--       root_dir = function(fname)
--         -- will look for the .hdl_checker.config file in parent directory, a
--         -- .git directory, or else use the current directory, in that order.
--         local util = require'lspconfig'.util
--         return util.root_pattern('.hdl_checker.config')(fname) or util.find_git_ancestor(fname) or util.path.dirname(fname)
--       end;
--       settings = {};
--     };
--   }
-- end

-- require'lspconfig'.vhdl_tool.setup{}
