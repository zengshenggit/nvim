local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('plugins.config.treesitter')
    end
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = { 'nvim-tree/nvim-web-devicons' },
    tag = 'nightly',
    config = function()
      require('plugins.config.tree')
    end
  }
  use {
    'folke/tokyonight.nvim',
    branch = 'main',
    requires = { 'nvim-lualine/lualine.nvim' },
    config = function()
      require('plugins.config.tokyonight')
    end
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('plugins.config.indent-blankline')
    end
  }
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'voldikss/vim-floaterm',
    config = function()
      require('plugins.config.floaterm')
    end
  }
  use {
    'romgrk/barbar.nvim',
    config = function()
      require('plugins.config.barbar')
    end
  }
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('plugins.config.symbols-outline')
    end
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('plugins.config.gitsigns')
    end
  }
  use {
    'voldikss/vim-translator',
    config = function()
      require('plugins.config.translator')
    end
  }
  use {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup()
    end
  }
  use {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require('mason-lspconfig').setup()
    end
  }
  use {
    'neovim/nvim-lspconfig',
    requires = {
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets',
      'onsails/lspkind.nvim',
      'folke/trouble.nvim',
    },
    config = function()
      require('plugins.config.lspconfig')
    end
  }
  use {
    'simrat39/rust-tools.nvim',
    config = function()
      require('plugins.config.rust-tools')
    end
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end
  }
  use {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup()
    end
  }
  use {
    'NvChad/nvim-colorizer.lua',
    config = function()
      require 'colorizer'.setup()
    end
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = "cd app && npm install",
    setup = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
