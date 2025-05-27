local utils = require("utils")

return {
    cmd = { "tailwindcss-language-server", "--stdio" },
    filetypes = { "html", "typescript", "typescriptreact", "tsx", "css", "scss", "less", "vue" },
    root_dir = utils.find_root({
        "tailwind.config.js",
        "tailwind.config.ts",
        "postcss.config.js",
        "package.json",
        ".git"
    }),
}
