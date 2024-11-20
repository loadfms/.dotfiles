local keymap = vim.api.nvim_set_keymap
local ns = { noremap = true, silent = true }

keymap('n', '<Leader>w', ':w<CR>', ns)                                      -- Fast save
keymap('n', '<Leader>qa', ':qa<CR>', ns)                                    -- Fast save
keymap('n', '<Leader>ep', ':e ~/.config/nvim/lua/plugins/init.lua<CR>', ns) -- Open config
keymap('n', '<Leader>bd', ':bd<CR>', ns)                                    -- Close buffer
keymap("n", "<A-TAB>", "<C-^>", ns)
keymap('n', 'Y', 'y$', ns)                                                  -- Yank from the cursor to the end of line
keymap('n', 'Q', '<Nop>', ns)                                               -- Disable ex mode. I dunno what is it
keymap('n', '<Leader><CR>', ':noh<CR>', ns)                                 -- Clear highlight
keymap('', ']b', ':bnext<CR>', ns)
keymap('', '[b', ':bprevious<CR>', ns)
keymap('', ']q', ':cnext<CR>', ns)
keymap('', '[q', ':cprevious<CR>', ns)

keymap('n', '-', ':Oil<CR>', ns)

--keymap('n', '<C-p>',
--"<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
--ns)
--keymap('n', '<Leader>k', ':Telescope live_grep<CR>', ns)   -- Telescope find in files
--keymap('n', '<Leader>K', ':Telescope grep_string<CR>', ns) -- Telescope find in files
--keymap('n', '<leader>B', ':lua require("telescope.builtin").buffers()<CR>', ns)
--
keymap('n', '<C-p>', "<cmd>FzfLua files<CR>", ns)
keymap('n', '<Leader>k', "<cmd>FzfLua live_grep<CR>", ns)
keymap('n', '<Leader>K', '<cmd>FzfLua grep_cword<CR>', ns)
keymap('n', '<leader>B', '<cmd>FzfLua buffers<CR>', ns)

keymap('n', '<Leader>gs', ':G<CR>5j', ns)         -- Vim fugitive summary
keymap('n', '<Leader>dq', '<C-W>k <C-W>o', ns)    -- Close compare buffs
keymap('n', '<Leader>gp', ':G pull<CR>', ns)      -- Close compare buffs
keymap('n', '<Leader>gP', ':G push<CR>', ns)      -- Close compare buffs
keymap('n', '<Leader>ga', ':G add .<CR>', ns)     -- Close compare buffs
keymap('n', '<Leader>da', ':diffget //2<CR>', ns) -- Get content from left side
keymap('n', '<Leader>dl', ':diffget //3<CR>', ns) -- Get content from right side
keymap('n', '<Leader>gc', ':Gvdiffsplit!<CR>', ns)
keymap('n', '<Leader>gl', ':0GcLog<CR>', ns)

keymap('n', '<C-S-Left>', ':vertical resize +1<CR>', ns)
keymap('n', '<C-S-Right>', ':vertical resize -1<CR>', ns)

keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', ns)
keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', ns)
keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', ns)
keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', ns)
keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', ns)

keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', ns)
keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', ns)


--keymap('n', '<C-u>', '<cmd>call smooth_scroll#up(&scroll, 2, 2)<CR>', ns)
--keymap('n', '<C-d>', '<cmd>call smooth_scroll#down(&scroll, 2, 2)<CR>', ns)
--keymap('n', '<C-b>', '<cmd>call smooth_scroll#up(&scroll*2, 2, 4)<CR>', ns)
--keymap('n', '<C-f>', '<cmd>call smooth_scroll#down(&scroll*2, 2, 4)<CR>', ns)

---- Harpoon
--keymap("n", "<leader>a", ':lua require("harpoon.mark").add_file()<CR>', ns)
--keymap("n", "<leader>h", ':lua require("harpoon.ui").toggle_quick_menu()<CR>', ns)
--keymap("n", "<C-h>", ':lua require("harpoon.ui").nav_file(1)<CR>', ns)
--keymap("n", "<C-j>", ':lua require("harpoon.ui").nav_file(2)<CR>', ns)
--keymap("n", "<C-k>", ':lua require("harpoon.ui").nav_file(3)<CR>', ns)
--keymap("n", "<C-l>", ':lua require("harpoon.ui").nav_file(4)<CR>', ns)
