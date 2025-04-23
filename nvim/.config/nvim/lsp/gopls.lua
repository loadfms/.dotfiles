return {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    usePlaceholders = true,
    completeUnimported = true,
    staticcheck = true,
    analyses = {
        unusedparams = true,
    },
}
