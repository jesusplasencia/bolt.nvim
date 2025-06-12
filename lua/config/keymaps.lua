-- ~/.config/nvim/lua/config/keymaps.lua

-- Basic Navigation & Window Management
vim.keymap.set("n", "<leader>w", "<cmd>w<CR>", { desc = "Save File" })
vim.keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit Window" })
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit All (Force)" })

-- Window navigation (crucial for Neotree & other splits)
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to Below Window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to Above Window" })
vim.keymap.set("n", "<leader><tab>", "<C-w>w", { desc = "Cycle Windows" }) -- Common for easy window cycling

-- Resize windows with arrows
vim.keymap.set("n", "<leader><left>", "<C-w><", { desc = "Shrink Window Horizontally" })
vim.keymap.set("n", "<leader><right>", "<C-w>>", { desc = "Expand Window Horizontally" })
vim.keymap.set("n", "<leader><up>", "<C-w>+", { desc = "Expand Window Vertically" })
vim.keymap.set("n", "<leader><down>", "<C-w>-", { desc = "Shrink Window Vertically" })

-- Buffer navigation
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { desc = "Previous Buffer" })
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete Current Buffer" })
