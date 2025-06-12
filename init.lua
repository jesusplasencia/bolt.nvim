-- ~/.config/nvim/init.lua

-- Ensure config directory is correctly on the runtimepath for Lua module resolution
local config_dir = vim.fn.stdpath("config")
vim.opt.rtp:prepend(config_dir)

-- Explicitly add the 'lua' subdirectory of your config to Lua's package.path.
-- This helps Lua find modules like 'lua.config.options' etc.
package.path = package.path .. ";" .. config_dir .. "/lua/?.lua"
package.path = package.path .. ";" .. config_dir .. "/lua/?/init.lua"

-- Bootstrap Lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load lazy.nvim
require("lua.config.options")
require("config.lazy")

