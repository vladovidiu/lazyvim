-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

-- UI
opt.guicursor = ""

-- Backup
opt.undodir = vim.fn.stdpath("cache") .. "/undodir"

-- Disable all snacks animations
-- vim.g.snacks_animate = false
