# MyNeovim配置

先得下载LazyVim，然后将本配置放到nvim/下。

## 内容

1. markdown
  * 关闭了拼写检查，见`lua/config/autocmds.lua`。
  * 添加了VISUAL模式下的快捷键，可以加粗、斜体、行级代码块、链接、引用、标题，见`lua/config/keymap.lua`。
  * 添加、配置了**MeanderingProgrammer/render-markdown**插件，见`lua/plugins/markdown.lua`。
  * 添加了**dkarter/bullets.vim**插件，见`lua/plugins/bullet-vim.lua`。
2. AI 
  * 在`:LazyExtra`里安装了**Copilot**的相关插件。
  * 添加了**olimorris/codecompanion.vim**插件，见`lua/plugins/codecompanion.lua`。
3. 终端
  * 配置了**folke/snacks.vim**，改用了Powershell 7，见`lua/plugins/terminal.lua`。
4. 添加了`rebelot/kanagawa.nvim`主题，见`lua/plugins/colorscheme.lua`。
