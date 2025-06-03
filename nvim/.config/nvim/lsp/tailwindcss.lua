local path = require("utils.path")

return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "typescript", "typescriptreact", "tsx", "css", "scss", "less", "vue" },
    root_dir = path.find_root({
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        "package.json",
        ".git"
    }),
}
