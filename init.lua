-- ~/.config/nvim/init.lua

local config_dir = vim.fn.stdpath("config") -- Get the path to your Neovim config directory

vim.opt.rtp:prepend(config_dir) -- Add your config directory to the runtimepath

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

vim.opt.number = true -- Corresponds to :set number
vim.opt.relativenumber = true -- Corresponds to :set relativenumber

-- Load lazy.nvim
require("config.lazy")
