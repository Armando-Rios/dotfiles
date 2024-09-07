local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- keymap for write
keymap("n", "<leader>w", ":w<CR>", opts)

-- keymap for quit
keymap("n", "<leader>q", ":bd<CR>", opts)

-- keymap for exit nvim
keymap("n", "<leader>Q", ":qa!<CR>", opts)

-- keymap select option
keymap("n", "<C-a>", "gg<S-v>G") -- select all

-- keymaps for telescope
local telescope = require('telescope.builtin')
keymap('n', "<leader>fg", telescope.live_grep, opts)
keymap('n', "<leader>p", telescope.find_files, opts)

-- keymap nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
