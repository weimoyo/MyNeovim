return {
  "code-biscuits/nvim-biscuits",

  dependencies = { "nvim-treesitter/nvim-treesitter" },

  opts = {
    -- 只在当前光标行显示提示，可以使界面更清爽
    cursor_line_only = true,
    -- 提示的最大长度（字符数）
    max_length = 25,
    -- 提示距离代码块开头的最小行数，小于这个距离则不显示
    min_distance = 5,
    -- 提示的前缀图标
    prefix_string = " ",
  },

  -- 插件的快捷键配置
  keys = {
    {
      -- 设置一个你喜欢的快捷键来“启用/附加”biscuits
      -- <leader>bb 是一个不错的选择 (b for biscuits)
      "<leader>cb",
      -- 这个函数会为当前文件启用 nvim-biscuits
      -- 这是 README 中推荐的懒加载方式
      function()
        require("nvim-biscuits").BufferAttach()
      end,
      mode = "n", -- 只在普通模式下生效
      desc = "在当前buffer打开Biscuits", -- 快捷键描述
    },
  },
}
