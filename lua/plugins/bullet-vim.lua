return {
  "dkarter/bullets.vim",
  -- 可选的配置
  config = function()
    -- 开启 markdown 文件类型的 bullets.vim 功能
    vim.g.bullets_enabled_file_types = { "markdown", "text", "gitcommit", "scratch" }

    -- 定义列表项符号 (可以自定义)
    vim.g.bullets_list_markers = {
      -- 符号类型: [符号, 是否启用编号, 是否对子弹有效]
      ["-"] = { marker = "–", numbered = 0, child = 1 },
      ["*"] = { marker = "*", numbered = 0, child = 1 },
      ["+"] = { marker = "+", numbered = 0, child = 1 },
      ["="] = { marker = "=", numbered = 0, child = 0 },
      [">"] = { marker = "»", numbered = 0, child = 1 },
      ["."] = { marker = ".", numbered = 1, child = 1 }, -- 关键：这是针对 `1.` `2.` 的编号列表
    }
  end,
  -- 如果你希望它在打开 markdown 文件时才加载
  ft = { "markdown", "text" },
}
