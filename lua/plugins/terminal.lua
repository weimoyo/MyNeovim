return {
  "folke/snacks.nvim",
  opts = {
    terminal = {
      shell = { "pwsh.exe", "-NoLogo" }, -- Windows 下 PowerShell Core
    },
  },
  init = function()
    vim.api.nvim_create_autocmd("TermOpen", {
      pattern = "*",
      callback = function()
        vim.wo.number = true
        vim.wo.relativenumber = true
      end,
    })
    -- 默认终端命令
    local function create_terminal(cmd, overrides)
      local opts = vim.tbl_deep_extend("force", {
        interactive = true,
        auto_insert = true,
        win = {
          relative = "editor",
          border = "rounded",
          title = "Terminal",
          title_pos = "center",
          size = { width = 0.9, height = 0.8 },
          position = "float",
        },
      }, overrides or {})
      return require("snacks.terminal").open(cmd, opts)
    end
    -- 常用终端，位于底部
    vim.keymap.set("n", "<leader>tt", function()
      create_terminal(nil, {
        win = {
          position = "bottom",
          size = 0.3,
        },
      })
    end, { desc = "Bottom terminal" })
    -- 浮动终端
    vim.keymap.set("n", "<leader>tf", function()
      create_terminal(nil, {})
    end, { desc = "Floating terminal" })
    -- 尝试关闭全部终端
    vim.keymap.set("n", "<leader>tc", function()
      for _, buf in ipairs(vim.api.nvim_list_bufs()) do
        if vim.bo[buf].buftype == "terminal" then
          vim.cmd("bd! " .. buf)
        end
      end
    end, { desc = "Close all Terminal" })
  end,
}
