-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- telescope file explorer
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  
  -- flow colorscheme
  use {
	  "0xstepit/flow.nvim",
	  lazy = false,
	  priority = 1000,
	  config = function()
		  require("flow").setup{}
		  vim.cmd "colorscheme flow"
	  end,
	  opts = {
		  -- Your configuration options here.
	  },
  }

  -- treesitter
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  
  -- harpoon
  use "nvim-lua/plenary.nvim" -- don't forget to add this one if you don't have it yet!
  use {
	  "ThePrimeagen/harpoon",
	  branch = "harpoon2",
	  requires = { {"nvim-lua/plenary.nvim"} }
  }

  -- undotree
  use "mbbill/undotree"

  -- fugitive
  use "tpope/vim-fugitive"

  -- LSP Zero requuired packages
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
  use {
	  'williamboman/mason.nvim',
	  run = function() pcall(vim.cmd, 'MasonUpdate') end -- Automatically update Mason packages
  }
  use 'williamboman/mason-lspconfig.nvim' -- Mason LSP configuration
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  requires = {
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},
	  }
  }
end)
