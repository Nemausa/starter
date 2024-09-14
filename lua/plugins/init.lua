return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = {"BufReadPost", "BufNewFile"},
    configs = function()
      require "configs.treesitter"
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        automatic_installation = true,
      })
    end
  },
  'Nemausa/friendly-snippets',
  'mfussenegger/nvim-dap',
  'mfussenegger/nvim-dap-python',
  'rcarriga/nvim-dap-ui',
  'theHamsta/nvim-dap-virtual-text',
  'nvim-neotest/nvim-nio',
  {
    'vim-scripts/a.vim',
    event = "BufRead",
  },
  {
    "sindrets/diffview.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles" },
    config = function()
      require('diffview').setup {
      }
    end,
  },
  {
    "ellisonleao/carbon-now.nvim",
    lazy = true,
    cmd = "CarbonNow",
    ---@param opts cn.ConfigSchema
    opts = { [[ your custom config here ]] }
  },
  {
    'iamcco/markdown-preview.nvim',
    event = "BufRead",
    run = 'cd app && npm install',
    config = function()
      vim.g.mkdp_auto_start = 0  -- Do not auto start preview
      vim.g.mkdp_auto_close = 1  -- Auto close preview when you exit Neovim
      vim.g.mkdp_refresh_slow = 1  -- Auto-refresh on save
    end
  },
}
