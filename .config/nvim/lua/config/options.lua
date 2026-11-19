-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

opt.clipboard = "" --vim.env.SSH_TTY and "" or "unnamedplus" -- Sync with system clipboard
vim.diagnostic.config({ virtual_text = false })
vim.o.winborder = "rounded"

opt.relativenumber = false
