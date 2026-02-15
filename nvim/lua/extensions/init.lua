
local plugins = {
    {
      'nvim-treesitter/nvim-treesitter',
      build = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
    },
  
    {
      'rmehri01/onenord.nvim',
      lazy = true,
      priority = 1000,
      config = function() require 'extensions.onenord' end,
    },
  
    {
      'nvim-lualine/lualine.nvim',
      config = function() require 'extensions.lualine' end,
      after = 'onenord.nvim',
      dependencies = {
        'nvim-tree/nvim-web-devicons', 'rmehri01/onenord.nvim', 'lewis6991/gitsigns.nvim',
        'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic',
      },
    },

    {
      'kevinhwang91/nvim-hlslens',
      config = function() require 'extensions.nvim-hlslens' end,
    },
  
    {
      'lewis6991/gitsigns.nvim',
      config = function() require 'extensions.gitsigns' end,
    },

    {
      'petertriho/nvim-scrollbar',
      config = function() require 'extensions.nvim-scrollbar' end,
      dependencies = {
        'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim',
      },
    },

    {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function() require 'extensions.telescope' end,
    dependencies = {
      'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      {
        'prochri/telescope-all-recent.nvim',
        config = function() require('telescope-all-recent').setup {} end,
        dependencies = {
          'nvim-telescope/telescope.nvim',
          'kkharji/sqlite.lua',
        },
      }
      },
    },

    {
      'nvim-tree/nvim-tree.lua',
      config = function() require 'extensions.nvim-tree' end,
      dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim'},
    },

    {
      'neovim/nvim-lspconfig',
      config = function() require 'extensions.nvim-lspconfig' end,
    },

    {
      'williamboman/mason.nvim',
      config = function() require 'extensions.mason' end,
      dependencies = {
       'williamboman/mason-lspconfig.nvim',
      }
    },

    {
      'SmiteshP/nvim-navic',
      config = function() require 'extensions.nvim-navic' end,
      requires = 'neovim/nvim-lspconfig',
    },

    {
      "SmiteshP/nvim-navbuddy",
      config = function() require 'extensions.nvim-navbuddy' end,
      dependencies = {
        'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim',
        'numToStr/Comment.nvim', 'nvim-telescope/telescope.nvim',
      },
    },

    {
      'hrsh7th/nvim-cmp',
      config = function() require 'extensions.nvim-cmp' end,
      dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
        
      },
    },

    {
       'L3MON4D3/LuaSnip',
       config = function() require 'extensions.luasnip' end,
       dependencies = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
    },

    {
      'j-hui/fidget.nvim',
      config = function() require 'extensions.fidget' end,
      requires = 'neovim/nvim-lspconfig',
    },

    {
      'folke/trouble.nvim',
       config = function() require 'extensions.trouble' end,
      requires = 'nvim-tree/nvim-web-devicons',
    },

    {
      'rcarriga/nvim-notify',
      config = function() require 'extensions.nvim-notify' end,
    },

    {
      'nvimtools/none-ls.nvim',
      dependencies = 'nvim-lua/plenary.nvim',
      config = true,
    },

    {
      'jay-babu/mason-null-ls.nvim',
      event = { 'BufReadPre', 'BufNewFile' },
      dependencies = {
        'williamboman/mason.nvim',
        'nvimtools/none-ls.nvim',
      },
      opts = {
        handlers = {}
      },
    },

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}

local opts = {
  checker = {
    enabled = true,
  },
  performance = {
    rtp = {
      disabled_plugins = {
        'gzip',
        'matchit',
        --'matchparen',
        --'netrwPlugin',
        'tarPlugin',
        'tohtml',
        'tutor',
        'zipPlugin',
      },
    },
  },
}

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
vim.opt.termguicolors = true
vim.api.nvim_set_option_value('termguicolors', true, {})

require('lazy').setup(plugins, opts)

