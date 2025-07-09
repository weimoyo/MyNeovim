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
  end,
}
