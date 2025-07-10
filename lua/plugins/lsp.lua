return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enable = true },
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              hint = { enable = true },
            },
          },
        },
        ["rust_analyzer"] = {
          settings = {
            cargo = { allFeatures = true },
          },
        },
      },
    },
  },
  {
    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup({})
    end,
  },
}
