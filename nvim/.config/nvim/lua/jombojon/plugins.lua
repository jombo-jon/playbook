--local settings = require("user-conf")
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

-- returns the require for use in `config` parameter of packer's use
-- expects the name of the config file
local function get_config(name)
  return string.format('require("config/%s")', name)
end

-- bootstrap packer if not installed
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    "git",
    "clone",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer...")
  vim.api.nvim_command("packadd packer.nvim")
end

-- initialize and configure packer
local packer = require("packer")

packer.init({
  enable = true, -- enable profiling via :PackerCompile profile=true
  threshold = 0, -- the amount in ms that a plugins load time must be over for it to be included in the profile
  max_jobs = 20, -- Limit the number of simultaneous jobs. nil means no limit. Set to 20 in order to prevent PackerSync form being "stuck" -> https://github.com/wbthomason/packer.nvim/issues/746
  -- Have packer use a popup window
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "rounded" })
    end,
  },
})

packer.startup(function(use)
  -- actual plugins list
  use("wbthomason/packer.nvim")
  -- Nvim Tree
  -- use {
  --     'kyazdani42/nvim-tree.lua',
  --     requires = {
  --         'kyazdani42/nvim-web-devicons',
  --     }
  -- }
  -- use 'kyazdani42/nvim-web-devicons'
  
  -- Telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-lua/popup.nvim")
  use("nvim-telescope/telescope.nvim")
  use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })
  
  -- Harpoon
  use("ThePrimeagen/harpoon")
  
  -- Common Tool for neovim
  use("tpope/vim-commentary")
  use('lukas-reineke/indent-blankline.nvim') 
  
  -- ColorScheme
  use("gruvbox-community/gruvbox")
  
  -- LSP Completion
  use {'hrsh7th/nvim-cmp',}
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-nvim-lua")
  use("hrsh7th/cmp-nvim-lsp")
  use("saadparwaiz1/cmp_luasnip")
  
  use( 'onsails/lspkind-nvim')

  -- Hop
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
    end
  }

  -- Mason -- NEW LSP Installaler
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  use {'autozimu/LanguageClient-neovim',
    branch = 'next',
    run = 'bash install.sh'
  }
  -- use("williamboman/mason.nvim")
  use { "nvim-telescope/telescope-file-browser.nvim" }
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})
  
end)


