return{
  -- the colorscheme should be available when starting Neovim
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
  --[[{
    'akinsho/bufferline.nvim',
    opts={
      options={
      mode = "buffers",
      show_buffer_icons=true,
      diagnostics = "nvim_lsp",
      offsets = {{filetype="neo-tree",text="",highlight="Directory", separator=true}},
      separator_style = "slant"
    }}
  },]]--
  {
    'goolord/alpha-nvim',
    config = function()
      require('alpha').setup(require('alpha.themes.startify').config)
    end
  },
    {
    "folke/tokyonight.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd([[colorscheme tokyonight]])
    end,
  },
		{
		  "windwp/nvim-autopairs",
		  event = "InsertEnter",
		  config = true, -- Runs default setup
		},
  -- I have a separate config.mappings file where I require which-key.
  -- With lazy the plugin will be automatically loaded when it is required somewhere
  { "folke/which-key.nvim", lazy = true },

  {
    "nvim-neorg/neorg",
    -- lazy-load on filetype
    ft = "norg",
    -- options for neorg. This will automatically call `require("neorg").setup(opts)`
    opts = {
      load = {
        ["core.defaults"] = {},
      },
    },
  },
  {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {},
  event = { "BufReadPost", "BufNewFile" },
},


  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup()
  end,
  keys = {
    { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle File Explorer" },
  },
},


  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      -- ...
    end,
  },

  -- if some code requires a module from an unloaded plugin, it will be automatically loaded.
  -- So for api plugins like devicons, we can always set lazy=true
  { "nvim-tree/nvim-web-devicons", lazy = true },

  -- you can use the VeryLazy event for things that can
  -- load later and are not important for the initial UI
  { "stevearc/dressing.nvim", event = "VeryLazy" },

  {
    "Wansmer/treesj",
    keys = {
      { "J", "<cmd>TSJToggle<cr>", desc = "Join Toggle" },
    },
    opts = { use_default_keymaps = false, max_join_length = 150 },
  },

  {
    "monaqa/dial.nvim",
    -- lazy-load on keys
    -- mode is `n` by default. For more advanced options, check the section on key mappings
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

  -- local plugins need to be explicitly configured with dir
  --{ dir = "~/projects/secret.nvim" },

  -- you can use a custom url to fetch a plugin
  --{ url = "git@github.com:folke/noice.nvim.git" },

  -- local plugins can also be configured with the dev option.
  -- This will use {config.dev.path}/noice.nvim/ instead of fetching it from GitHub
  -- With the dev option, you can easily switch between the local and installed version of a plugin
  --{ "folke/noice.nvim", dev = true },
}
