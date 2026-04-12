return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    opts = {
      servers = {
        lua_ls = {},
        emmet_language_server = {},
        cssls = {},
        tailwindcss = {},
        vtsls = {},
        vue_language_server = {},
      },
    },
  },
}
