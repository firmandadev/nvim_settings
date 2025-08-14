return{
  {
    "neovim/nvim-lspconfig", -- LSP configuration
    dependencies = {
      "williamboman/mason.nvim", -- Optional: LSP installer
      "williamboman/mason-lspconfig.nvim",
    },
  },
  {
    "hrsh7th/nvim-cmp", -- Completion engine
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
      "hrsh7th/cmp-buffer", -- Buffer completions
      "hrsh7th/cmp-path", -- Path completions
      "L3MON4D3/LuaSnip", -- Snippet engine
      "saadparwaiz1/cmp_luasnip", -- Snippet source
      "rafamadriz/friendly-snippets", -- Predefined snippets
      "onsails/lspkind.nvim", -- VSCode-like icons
    },
  },
  {
    "nvim-treesitter/nvim-treesitter", -- Better syntax highlighting
    build = ":TSUpdate",
  },
}
