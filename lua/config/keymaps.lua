-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("v", "<leader>mb", 'c**<C-r>"**<Esc>', { desc = "Bold selected text" })
vim.keymap.set("v", "<leader>mi", 'c*<C-r>"*<Esc>', { desc = "Italic selected text" })
vim.keymap.set("v", "<leader>mc", 'c`<C-r>"`<Esc>', { desc = "Code block selected text" })
vim.keymap.set("v", "<leader>ml", 'c[<C-r>"]()<Esc>', { desc = "Link for selected text" })
vim.keymap.set("v", "<leader>mq", 'c><C-r>"<Esc>', { desc = "Quote selected text" })
vim.keymap.set("v", "<leader>mh", 'c# <C-r>"<Esc>', { desc = "Heading on selected text" })
