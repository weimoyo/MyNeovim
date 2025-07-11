return {
  "mfussenegger/nvim-dap",
  -- 强烈推荐安装 nvim-dap-ui 来获得更好的调试 UI 体验
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- =================================================================
    -- 1. 适配器定义 (Adapter Definition)
    -- 这部分内容来自文档，并针对你的 v1.11.5 版本和 Windows 环境进行了适配
    -- =================================================================
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        -- !!! 重要 !!! 请将这里的路径替换为你第一步中解压得到的真实路径。
        -- 在 Lua 字符串中，即使是 Windows 路径，也建议使用正斜杠 "/"
        command = "C:/Users/weimo/AppData/Local/nvim/src/lldb/extension/adapter/codelldb.exe",

        args = { "--port", "${port}" },

        -- 根据文档建议，在 Windows 上，你可能需要设置这个为 false
        -- 这能确保 Neovim 退出时，codelldb 进程也能被正确关闭
        detached = false,
      },
    }

    -- =================================================================
    -- 2. 调试配置 (Debug Configuration)
    -- 这部分告诉 nvim-dap 如何启动一个 Rust 程序的调试会话
    -- =================================================================
    dap.configurations.rust = {
      {
        name = "Launch file (codelldb)",
        type = "codelldb", -- 必须与上面 dap.adapters 中定义的名字一致
        request = "launch",
        program = function()
          -- 启动时会提示你输入要调试的可执行文件的路径
          -- 默认会帮你填充到 cargo 的 debug 输出目录
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        -- 如果你的程序需要命令行参数，可以像下面这样添加
        -- args = { "参数1", "参数2" },
      },
    }

    -- 如果你想 C 和 C++ 也使用这个配置，可以取消下面的注释
    -- dap.configurations.c = dap.configurations.rust
    -- dap.configurations.cpp = dap.configurations.rust

    -- =================================================================
    -- 3. DAP UI 配置和事件监听 (DAP UI Setup)
    -- =================================================================
    dapui.setup({
      -- 布局配置: 定义了哪些窗口以及它们如何排列
      layouts = {
        {
          elements = {
            -- 左侧窗口: 作用域和堆栈
            { id = "scopes", size = 0.5 }, -- 60% 的空间给变量作用域
            { id = "stacks", size = 0.5 }, -- 40% 的空间给调用堆栈
          },
          size = 80, -- 左侧边栏总共占用 40 列的宽度
          position = "left", -- 位置在左边
        },
        {
          elements = {
            -- 底部窗口: REPL 和 Console
            { id = "repl", size = 0.5 }, -- 50% 空间给 REPL
            { id = "console", size = 0.5 }, -- 50% 空间给程序输出
          },
          size = 20, -- 底部面板总共占用 10 行的高度
          position = "bottom", -- 位置在底部
        },
      },
      -- 其他 UI 选项
      floating = {
        max_height = nil, -- 浮动窗口的最大高度 (nil 表示无限制)
        max_width = nil, -- 浮动窗口的最大宽度 (nil 表示无限制)
        border = "rounded", -- 浮动窗口边框样式
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      -- 在变量和监视窗口中显示值的具体实现
      render = {
        max_value_lines = 1000, -- 显示值的最大行数
      },
    })

    -- 在调试会话开始时自动打开 DAP UI，在结束时自动关闭
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    -- =================================================================
    -- 4. 快捷键 (Keymaps)
    -- =================================================================

    vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "[DAP] 打开REPL" })
    vim.keymap.set("n", "<Leader>dl", dap.run_last, { desc = "[DAP] 运行上次配置" })
    vim.keymap.set({ "n", "v" }, "<Leader>dK", function()
      dapui.eval()
    end, { desc = "[DAP] 查看变量值" })
    vim.keymap.set("n", "<F5>", dap.continue, { desc = "[DAP] 继续 (F5)" })
    vim.keymap.set("n", "<F6>", dap.pause, { desc = "[DAP] 暂停 (F6)" }) -- 新增：暂停功能
    vim.keymap.set("n", "<F7>", dap.step_out, { desc = "[DAP] 单步跳出 (F7)" })
    vim.keymap.set("n", "<F8>", dap.step_over, { desc = "[DAP] 单步跳过 (F8)" })
    vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "[DAP] 切换断点 (F9)" })
    vim.keymap.set("n", "<F10>", dap.step_into, { desc = "[DAP] 单步进入 (F10)" })
    vim.keymap.set("n", "<F12>", function()
      dapui.toggle()
    end, { desc = "[DAP] 切换UI (F12)" }) -- 新增：方便地显示/隐藏UI

    -- Shift + F* 快捷键
    vim.keymap.set("n", "<S-F5>", dap.terminate, { desc = "[DAP] 终止调试 (Shift+F5)" }) -- 对应VSCode的Shift+F5
    vim.keymap.set("n", "<S-F8>", function()
      dap.run_to_cursor()
    end, { desc = "[DAP] 运行到光标处 (Shift+F8)" })
  end,
}
