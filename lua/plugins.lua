local packer = require('packer')
packer.startup({
  function(use)
    -- Packer 可以管理自己本身
    use('wbthomason/packer.nvim')
    -- 你的插件列表
    -------------------------- plugins -------------------------------------------
    -- nvim-tree (新增)
    use({ 'nvim-tree/nvim-tree.lua', requires = 'nvim-tree/nvim-web-devicons' })
    -- bufferline (新增)
    use({ 'akinsho/bufferline.nvim', requires = { 'nvim-tree/nvim-web-devicons', 'moll/vim-bbye' } })
    -- lualine (新增)
    use({ 'nvim-lualine/lualine.nvim', requires = { 'nvim-tree/nvim-web-devicons' } })
    use('arkav/lualine-lsp-progress')
    -- telescope （新增）
    use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
    -- dashboard-nvim (新增)
    use('glepnir/dashboard-nvim')
    -- project
    use('ahmedkhalf/project.nvim')
    -- treesitter （新增）
    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    --------------------- LSP --------------------
    -- use({ 'williamboman/nvim-lsp-installer' })
    -- Lspconfig
    use{ 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim', 'neovim/nvim-lspconfig' }
    -- 补全引擎
    use('hrsh7th/nvim-cmp')
    -- Snippet 引擎
    use('hrsh7th/vim-vsnip')
    -- 补全源
    use('hrsh7th/cmp-vsnip')
    use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
    use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
    use('hrsh7th/cmp-path') -- { name = 'path' }
    use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
    use('hrsh7th/cmp-nvim-lsp-signature-help') -- { name = 'nvim_lsp_signature_help' }
    -- 常见编程语言代码段
    use('rafamadriz/friendly-snippets')
    -- UI 增强
    use('onsails/lspkind-nvim')
    -- 代码格式化
    -- use("mhartington/formatter.nvim")
    use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
    -- TypeScript 增强
    use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })
    -- Lua 增强
    use('folke/neodev.nvim')
    -- JSON 增强
    use('b0o/schemastore.nvim')
    --------------------- colorschemes --------------------
    -- tokyonight
    use('folke/tokyonight.nvim')
    -------------------------------------------------------
    -- comment
    use('numToStr/Comment.nvim')
    -- nvim-autopairs
    use("windwp/nvim-autopairs")
    -- coc
    use({ 'neoclide/coc.nvim', branch = 'release' })
    -- gitsigns
    use('lewis6991/gitsigns.nvim')
    -- terminal
    use('akinsho/toggleterm.nvim')
    -- debugger (debugger-for-chrome is depre)
    use('puremourning/vimspector')
    -- debugger new way
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    -- debugger js
    use { "mxsdev/nvim-dap-vscode-js", requires = {"mfussenegger/nvim-dap"} }
    use {
      "microsoft/vscode-js-debug",
      opt = true,
      run = "npm install --legacy-peer-deps && npm run compile" 
    }
    -- format on save
    use('lukas-reineke/lsp-format.nvim')
  end,
  config = {
    -- 并发数限制
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
  },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
