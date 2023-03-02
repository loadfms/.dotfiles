local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = false,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = true,
    call_servers = 'local',
    sign_icons = {
        error = '',
        warn = '▲',
        hint = '⚑',
        info = ''
    }
})

lsp.setup()
