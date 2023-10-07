local keymap = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

keymap('n', '<Leader>w', ':w<CR>', ns)                                      -- Fast save
keymap('n', '<Leader>ep', ':e ~/.config/nvim/lua/plugins/init.lua<CR>', ns) -- Open config
keymap('n', '<Leader>bd', ':bd<CR>', ns)                                    -- Close buffer
keymap("n", "<A-TAB>", "<C-^>", ns)
keymap('n', 'Y', 'y$', ns)                                                  -- Yank from the cursor to the end of line
keymap('n', 'Q', '<Nop>', ns)                                               -- Disable ex mode. I dunno what is it
keymap('n', '<Leader><CR>', ':noh<CR>', ns)                                 -- Clear highlight
keymap('', ']b', ':bnext<CR>', ns)
keymap('', '[b', ':bprevious<CR>', ns)

keymap('n', '<C-p>', ':Telescope find_files<CR>', ns)      -- Telescope navigation
keymap('n', '<Leader>k', ':Telescope live_grep<CR>', ns)   -- Telescope find in files
keymap('n', '<Leader>K', ':Telescope grep_string<CR>', ns) -- Telescope find in files
keymap('n', '<leader>B', ':lua require("telescope.builtin").buffers()<CR>', ns)

keymap('n', '<Leader>gs', ':G<CR>', ns)           -- Vim fugitive summary
keymap('n', '<Leader>dq', '<C-W>k <C-W>o', ns)    -- Close compare buffs
keymap('n', '<Leader>gp', ':G pull<CR>', ns)      -- Close compare buffs
keymap('n', '<Leader>gP', ':G push<CR>', ns)      -- Close compare buffs
keymap('n', '<Leader>ga', ':G add .<CR>', ns)     -- Close compare buffs
keymap('n', '<Leader>da', ':diffget //2<CR>', ns) -- Get content from left side
keymap('n', '<Leader>dl', ':diffget //3<CR>', ns) -- Get content from right side

keymap('n', '<C-S-Left>', ':vertical resize +1<CR>', ns)
keymap('n', '<C-S-Right>', ':vertical resize -1<CR>', ns)

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ns)
keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', ns)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', ns)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ns)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ns)
keymap('n', 'gt', '<cmd>Gitsigns diffthis<CR>', ns)

keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', ns)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', ns)

-- Harpoon
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-j>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-k>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-l>", function() ui.nav_file(4) end)
