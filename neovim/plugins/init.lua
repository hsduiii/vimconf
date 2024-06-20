return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "v-analyzer",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "v",
      },
    },
  },
  {
    "nvim-tree/nvim-web-devicons",
    opts = {
      override = {
        v = {
          icon = "",
          color = "#3e5a7f",
          cterm_color = "24",
          name = "Vlang",
        },
        vsh = {
          icon = "",
          color = "#3e5a7f",
          cterm_color = "24",
          name = "Vlang",
        },
      },
    },
  },
}
