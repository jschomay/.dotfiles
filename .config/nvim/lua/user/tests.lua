vim.cmd("let test#strategy = 'vimux'")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-t><C-n>", ":wa <bar> TestNearest<CR>", opts)
keymap("n","<C-t><C-f>", ":wa <bar> TestFile<CR>", opts)
keymap("n","<C-t><C-s>", ":wa <bar> TestSuite<CR>", opts)
keymap("n","<C-t><C-l>", ":wa <bar> TestLast<CR>", opts)
keymap("n","<C-t><C-t>", ":wa <bar> TestLast<CR>", opts)
keymap("n","<C-t><C-g>", ":wa <bar> TestVisit<CR>", opts)
