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

-- 映射快捷键
vim.keymap.set("n", "<leader>dt", "<cmd>InsertTime<CR>", { noremap = true, desc = "Insert current %Y-%m-%d %H:%M:%S" })
