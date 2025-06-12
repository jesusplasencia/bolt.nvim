-- ~/.config/nvim/lua/config/options.lua

-- Set leader and localleader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Encoding and file handling
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

-- Line numbers: essential for numbertoggle
vim.opt.number = true         -- Show absolute line numbers
vim.opt.relativenumber = true -- Show relative line numbers

-- Indentation
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.tabstop = 2           -- Number of spaces a tab counts for
vim.opt.shiftwidth = 2        -- Number of spaces to use for each step of (auto)indent
vim.opt.autoindent = true     -- Copy indent from current line when starting a new line
vim.opt.smartindent = true    -- Smart autoindenting

-- UI & Aesthetics
vim.opt.termguicolors = true  -- Enable true colors support
vim.opt.background = "dark"   -- Set background to dark
vim.opt.cursorline = true     -- Highlight the current line
vim.opt.signcolumn = "yes"    -- Always show the sign column, to avoid screen jumps
vim.opt.cmdheight = 1         -- Command line height
vim.opt.updatetime = 300      -- Faster completion (if using LSP, etc.)
vim.opt.scrolloff = 8         -- Lines of context around the cursor

-- Search
vim.opt.hlsearch = true       -- Highlight search results
vim.opt.incsearch = true      -- Incremental search

-- Performance & Reliability
vim.opt.swapfile = false      -- Don't create swap files
vim.opt.undofile = true       -- Persistent undo
vim.opt.undodir = vim.fn.stdpath("data") .. "/undo" -- Directory for undo files
vim.opt.backupdir = vim.fn.stdpath("data") .. "/backup" -- Directory for backup files

-- Clipboard
vim.schedule(function()
  vim.opt.clipboard = 'unnamedplus'
end)

-- Other Useful options
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.wo.wrap = false           -- Don't wrap lines
vim.opt.mouse = 'a'           -- Allow mouse to resize windows
vim.opt.showmode = false      -- Don't show mode, since it's already in the status line
vim.opt.isfname:append("@-@") -- Allow hyphens in filenames
-- vim.opt.colorcolumn = "80"    -- Show a column at 80 characters for code style
vim.opt.splitright = true     -- New vertical splits open to the right
vim.opt.splitbelow = true     -- New horizontal splits open below
