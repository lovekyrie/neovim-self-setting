require('dap-vscode-js').setup({
    debugger_path = '.local/share/nvim/site/pack/packer/opt/vscode-js-debug',
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwd-extensionHost' },
})
for _, language in ipairs({ 'typescript', 'javascript' }) do
    require('dap').configurations[language] = {
        {
            type = 'pwa-node',
            request = 'launch',
            name = 'Launch file',
            program = '${file}',
            cwd = '${workspaceFolder}',
        },
        {
            type = 'pwa-node',
            request = 'attach',
            name = 'Attach',
            processId = require('dap.utils').pick_process,
            cwd = '${workspaceFolder}',
        },
        {
            type = 'pwa-chrome',
            request = 'launch',
            name = 'luanch chrome',
            url = 'http://localhost:8080',
            webRoot = '${workspaceFolder}',
        },
    }
end
