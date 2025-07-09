-- 编写markdown文档时，执行`:setlocal nospell`命令
local augroup = vim.api.nvim_create_augroup("FileTypeSettings", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  group = augroup,
  callback = function()
    vim.opt_local.spell = false -- :setlocal nospell
  end,
  desc = "Disable spell check for Markdown files",
})
