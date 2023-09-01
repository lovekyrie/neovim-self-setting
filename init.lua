-- 基础配置
require('user.basic')
-- 快捷键绑定
require('keybindings')
-- Packer 插件管理
require('plugins')
-- 主题设置
require('colorscheme')
-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')
require('plugin-config.comment')
require('plugin-config.nvim-autopairs')
require('plugin-config.gitsigns')
require('plugin-config.web-icons')

-- 内置LSP (新增)
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')

-- 格式化
-- require("lsp.formatter")
require('lsp.null-ls')

-- 调试
-- require('dap.vimspector')
require('dap.nvim-dap')

vim.filetype.add({
  extension = {
    wxml = 'html',
    wxss = 'css',
  }
})

