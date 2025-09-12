return{
  --Syntax Highlighting and Code Parser
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
      ensure_installed = {
        "javascript",
        "lua",
        "python",
        "html",
        "css",
        "bash",
        "json"
      },
      ignore_install = { "typescript"},
    },
    config = function(_,opts)
    require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
  },
  -- lazy.nvim
  {
    'akinsho/git-conflict.nvim',
    version = '*',
    config = function()
      require('git-conflict').setup({
        default_mappings = true,
        default_commands = true,
        disable_diagnostics = false,
        list_opener = 'copen',
        highlights = {
          incoming = 'DiffAdd',
          current = 'DiffText',
        }
      })
    end
  },
  {
    --Monokai color scheme
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup()
      vim.cmd.colorscheme("monokai-pro")
    end,
  },
  {
    --Dashboard for neovim
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },
  {
    --Tokyonight color scheme
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
  {
    --automatically closes pairs
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },
  {
    "nvim-neorg/neorg",
    ft = "norg",
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    },
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = false })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },
  {
    --Vertical Line
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    event = { "BufReadPost", "BufNewFile" },
  },
  {
    --Analyze startup time
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    --Icons
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup{
        default = true,
      }
    end,
  },
  {
    --Nvim Tree
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup{
      }
    end;
  },
  {
    --Code completion
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
  },
  { 
    "stevearc/dressing.nvim", 
    event = "VeryLazy" },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "monaqa/dial.nvim",
    keys = { "<C-a>", { "<C-x>", mode = "n" } },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies={'nvim-tree/nvim-web-devicons'},
    opts={
      options={
        globalstatus = false,
        tabline = {
          lualine_a = {'search'},
          lualine_b = {'filename'},
          lualine_c = {
            'filetype','diff','diagnostics',
          },
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {'progress'}
        },
        sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        }
      }
    }
  },
}
