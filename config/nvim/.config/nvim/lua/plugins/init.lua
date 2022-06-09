-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Plugin manager: packer.nvim
-- url: https://github.com/wbthomason/packer.nvim

-- For information about installed plugins see the README:
-- neovim-lua/README.md
-- https://github.com/brainfucksec/neovim-lua#readme


-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer_init.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Install plugins
return packer.startup(function(use)
  -- Add you plugins here:
  use 'wbthomason/packer.nvim' -- packer can manage itself

  -- File explorer
  use 'kyazdani42/nvim-tree.lua'

  -- Indent line
  use 'lukas-reineke/indent-blankline.nvim'

  -- Autopair
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Tag viewer
  -- use 'preservim/tagbar'

  -- Treesitter interface
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  -- Color schemes
  use 'EdenEast/nightfox.nvim'

  -- LSP
  use {

    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp').setup()
    end,
  }

  -- Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-nvim-lsp', -- nvim-cmp source for nvim-lsp
      'onsails/lspkind.nvim', -- pictograms for nvim-lsp
      'hrsh7th/cmp-buffer',   -- nvim-cmp support for buffer words
      'hrsh7th/cmp-path',     --nvim-cmp support for fs paths
      'hrsh7th/cmp-cmdline',  --nvim-cmp support for vim's cmdline
      'dcampos/cmp-snippy',   -- snippy integration for nvim-cmp
      'dcampos/nvim-snippy',  -- snippy
    },
    config = function()
      require('config.cmp').setup()
    end,
  }

  -- git labels
  use {
    'lewis6991/gitsigns.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Dashboard (start screen)
  use {
    'goolord/alpha-nvim',
    requires = { 'kyazdani42/nvim-web-devicons' },
  }

  -- WhichKey
  use {
     "folke/which-key.nvim",
     config = function()
       require("config.whichkey").setup()
     end,
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup {
          pickers = {
            find_files = {
              find_command = { "fd", "--type", "f", "--strip-cwd-prefix", "--hidden" }
            },
          }
      }
    end
  }

  -- Neogit
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

  -- Status Line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end
  }


  use {
    'echasnovski/mini.nvim',
    branch = 'stable',
    config = function()
      -- Surround
      require('mini.surround').setup {
        mappings = {
          add = 'ca', -- Add surrounding
          delete = 'cd', -- Delete surrounding
          replace = 'cs', -- Replace surrounding
        },
      }
      -- Trailing Whitespace
      require('mini.trailspace').setup {
        trim = true
      }
      -- Comments
      require('mini.comment').setup {
        mappings = {
          comment = '<leader>c',
          comment_line = '<leader>cc'
        }
      }
    end
  }

  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- https://github.com/folke/trouble.nvim#setup
      }
    end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
