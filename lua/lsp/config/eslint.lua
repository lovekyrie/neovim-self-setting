local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


return {
  on_setup = function(server)
    server.setup({
      capabilities = capabilities,
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, bufnr)
        -- require 'lsp-format'.on_attach(client)
        -- 禁用格式化功能，交给专门插件插件处理
        -- client.server_capabilities.documentRangeFormattingProvider = false
         client.server_capabilities.documentFormattingProvider = true
    if client.server_capabilities.documentFormattingProvider  then
      local au_lsp = vim.api.nvim_create_augroup("eslint_lsp", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*",
        callback = function()
          vim.lsp.buf.format({async = true})
        end,
        group = au_lsp,
      })
    end
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
      end,
      settings = {
        codeActionOnSave = {
          enable = true,
          mode = 'all'
        }
      }
    })
  end,
}
