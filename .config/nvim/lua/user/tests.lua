vim.cmd("let test#strategy = 'vimux'")

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-t><C-n>", ":w <bar> TestNearest<CR>", opts)
keymap("n","<C-t><C-f>", ":w <bar> TestFile<CR>", opts)
keymap("n","<C-t><C-s>", ":w <bar> TestSuite<CR>", opts)
keymap("n","<C-t><C-l>", ":w <bar> TestLast<CR>", opts)
keymap("n","<C-t><C-t>", ":w <bar> TestLast<CR>", opts)
keymap("n","<C-t><C-g>", ":w <bar> TestVisit<CR>", opts)
