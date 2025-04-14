return {
    cmd = { "rust-analyzer" },
    filetypes = { 'rust' },
    capabilities = {
        experimental = {
            serverStatusNotification = true
        }
    },
}
