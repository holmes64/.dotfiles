require('packer').startup { 
  function()
    use 'wbthomason/packer.nvim'

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        require('nvim-treesitter.install').update({ with_sync = true })
      end,
    }
  
    use {
      'rmehri01/onenord.nvim',
      config = function() require 'extensions.onenord' end,
    }
  
    use {
      'nvim-lualine/lualine.nvim',
      config = function() require 'extensions.lualine' end,
      after = 'onenord.nvim',
      requires = {
        'nvim-tree/nvim-web-devicons', 'rmehri01/onenord.nvim', 'lewis6991/gitsigns.nvim',
        'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic',
      },
    }

    use {
      'kevinhwang91/nvim-hlslens',
      config = function() require 'extensions.nvim-hlslens' end,
    }
  
    use {
      'lewis6991/gitsigns.nvim',
      config = function() require 'extensions.gitsigns' end,
    }

    use {
      'petertriho/nvim-scrollbar',
      config = function() require 'extensions.nvim-scrollbar' end,
      requires = {
        'kevinhwang91/nvim-hlslens', 'lewis6991/gitsigns.nvim',
      },
    }

    use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    config = function() require 'extensions.telescope' end,
    requires = {
      'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim',
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
      {
        'prochri/telescope-all-recent.nvim',
        config = function() require('telescope-all-recent').setup {} end,
        after = 'telescope.nvim',
        requires = 'kkharji/sqlite.lua',
      }
      },
    }

    use {
      'nvim-tree/nvim-tree.lua',
      config = function() require 'extensions.nvim-tree' end,
      requires = { 'nvim-tree/nvim-web-devicons', 'nvim-telescope/telescope.nvim'},
    }

    use {
      'neovim/nvim-lspconfig',
      config = function() require 'extensions.nvim-lspconfig' end,
    }

    use {
      'williamboman/mason.nvim',
      config = function() require 'extensions.mason' end,
      requires = {
       'williamboman/mason-lspconfig.nvim',
      }
    }

    use {
      'SmiteshP/nvim-navic',
      config = function() require 'extensions.nvim-navic' end,
      requires = 'neovim/nvim-lspconfig',
    }

    use {
      "SmiteshP/nvim-navbuddy",
      config = function() require 'extensions.nvim-navbuddy' end,
      requires = {
        'neovim/nvim-lspconfig', 'SmiteshP/nvim-navic', 'MunifTanjim/nui.nvim',
        'numToStr/Comment.nvim', 'nvim-telescope/telescope.nvim',
      },
    }

    use {
      'hrsh7th/nvim-cmp',
      config = function() require 'extensions.nvim-cmp' end,
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-path',
        'onsails/lspkind-nvim',
        {
          'L3MON4D3/LuaSnip',
          tag = "v1.*",
          config = function() require 'extensions.luasnip' end,
          requires = { 'saadparwaiz1/cmp_luasnip', 'rafamadriz/friendly-snippets' },
         }
      },
    }

    use {
      'j-hui/fidget.nvim',
      config = function() require 'extensions.fidget' end,
      requires = 'neovim/nvim-lspconfig',
    }

    use {
      'folke/trouble.nvim',
       config = function() require 'extensions.trouble' end,
      requires = 'nvim-tree/nvim-web-devicons',
    }

  end,
  config = {
    display = {
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    }
  }
}

