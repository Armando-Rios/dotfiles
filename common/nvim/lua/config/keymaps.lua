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

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
