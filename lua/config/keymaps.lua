-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- markdown行为
vim.keymap.set("v", "<leader>mb", 'c**<C-r>"**<Esc>', { desc = "Bold selected text" })
vim.keymap.set("v", "<leader>mi", 'c*<C-r>"*<Esc>', { desc = "Italic selected text" })
vim.keymap.set("v", "<leader>mc", 'c`<C-r>"`<Esc>', { desc = "Code block selected text" })
vim.keymap.set("v", "<leader>ml", 'c[<C-r>"]()<Esc>', { desc = "Link for selected text" })
vim.keymap.set("v", "<leader>mq", 'c><C-r>"<Esc>', { desc = "Quote selected text" })
vim.keymap.set("v", "<leader>mh", 'c# <C-r>"<Esc>', { desc = "Heading on selected text" })

-- 时间
vim.api.nvim_create_user_command("InsertTime", function()
  local time = os.date("%Y-%m-%d %H:%M:%S")
  vim.api.nvim_put({ time }, "", true, true)
end, {})
vim.keymap.set("n", "<leader>dt", "<cmd>InsertTime<CR>", { noremap = true, desc = "Insert current %Y-%m-%d %H:%M:%S" })

-- =============================================================================
-- Lspsaga 按键绑定
-- =============================================================================

-- 查看悬停文档 (K 是一个比较通用的按键，通常不会冲突)
vim.keymap.set("n", "<leader>k", "<Cmd>Lspsaga hover_doc<CR>", { desc = "Lspsaga Hover Doc" })

-- 跳转到下一个/上一个诊断 (使用 [e 和 ]e)
vim.keymap.set("n", "[e", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Lspsaga Prev Diagnostic" })
vim.keymap.set("n", "]e", "<Cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Lspsaga Next Diagnostic" })

-- 查看某一范围的诊断
vim.keymap.set("n", "<leader>dc", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", { desc = "Lspsaga Cursor Diagnostics" })
vim.keymap.set("n", "<leader>dl", "<Cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Lspsaga Line Diagnostics" })
vim.keymap.set(
  "n",
  "<leader>dw",
  "<Cmd>Lspsaga show_workspace_diagnostics<CR>",
  { desc = "Lspsaga Workspace Diagnostics" }
)
vim.keymap.set("n", "<leader>db", "<Cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Lspsaga Buffer Diagnostics" })

-- 查看符号大纲 (使用 <leader>o)
vim.keymap.set("n", "<leader>o", "<Cmd>Lspsaga outline<CR>", { desc = "Lspsaga Outline" })

-- Peek Type Definition (预览类型定义)
vim.keymap.set("n", "<leader>pd", "<Cmd>Lspsaga peek_definition<CR>", { desc = "Lspsaga Peek Definition" })
vim.keymap.set("n", "<leader>py", "<Cmd>Lspsaga peek_type_definition<CR>", { desc = "Lspsaga Peek Type Definition" })
