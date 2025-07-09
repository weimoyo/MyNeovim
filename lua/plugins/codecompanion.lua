return {
  "olimorris/codecompanion.nvim",
  opts = {
    -- 直接告诉所有策略去使用原生的 'deepseek' 适配器
    strategies = {
      chat = {
        adapter = "deepseek",
        -- 你可以为特定策略指定模型，'deepseek-chat' 更适合聊天
        model = "deepseek-chat",
      },
      inline = {
        adapter = "deepseek",
        -- 'deepseek-coder' 更适合代码生成和编辑
        model = "deepseek-coder",
      },
      edit = {
        adapter = "deepseek",
        model = "deepseek-coder",
      },
      generate = {
        adapter = "deepseek",
        model = "deepseek-coder",
      },
      fix = {
        adapter = "deepseek",
        model = "deepseek-coder",
      },
      test = {
        adapter = "deepseek",
        model = "deepseek-coder",
      },
    },

    -- (可选) 如果你想为 deepseek 适配器设置一个全局默认模型
    -- 你可以添加 adapters 配置块，但这通常不是必需的
    adapters = {
      deepseek = function()
        return require("codecompanion.adapters").extend("deepseek", {
          -- 在这里设置所有 deepseek 调用的默认模型
          default_model = "deepseek-chat",
          -- 原生适配器会自动从环境变量 DEEPSEEK_API_KEY 读取密钥
          -- 你也可以在这里显式指定，但不推荐硬编码
          env = {
            api_key = "sk-82bee91b93b54d54abcb7fc0d3d886e8",
          },
        })
      end,
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- 在这里添加快捷键配置
  keys = {
    {
      "<Leader>ac",
      ":CodeCompanionChat<CR>",
      mode = "n", -- "n" 代表 Normal 模式
      desc = "CodeCompanion: Chat (聊天)",
    },
    {
      "<Leader>aa",
      ":CodeCompanionAction<CR>",
      mode = "n",
      desc = "CodeCompanionAction",
    },
  },
}
