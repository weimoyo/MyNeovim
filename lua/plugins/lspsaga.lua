-- plugins/lspsaga.lua
return {
  "nvimdev/lspsaga.nvim",
  event = "LspAttach",
  config = function()
    -- 配置 lspsaga
    require("lspsaga").setup({
      -- 这里可以根据需要进行配置
      ui = {
        border = "single",
      },
      outline = {
        layout = "float",
        max_height = 0.6,
        left_width = 0.2,
      },
    })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter", -- 可选
    "nvim-tree/nvim-web-devicons", -- 可选
  },
}
