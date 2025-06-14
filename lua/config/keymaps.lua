-- ~/.config/nvim/lua/config/keymaps.lua

-- === Telescope Keymaps ===
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<C-p>", function() require("telescope.builtin").find_files() end, { desc = "Telescope: Find Files (Ctrl-P style)" })
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Telescope: Live Grep (Text Search)" })
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Telescope: Find Buffers" })
vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Telescope: Old Files (History)" })
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Telescope: Help Tags" })
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").commands() end, { desc = "Telescope: Commands" })
vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Telescope: Keymaps" })

-- === Git Keymaps ===
vim.keymap.set("n", "<leader>gs", function() require("telescope.builtin").git_status() end, { desc = "Git Status" })
vim.keymap.set("n", "<leader>gc", function() require("telescope.builtin").git_commits() end, { desc = "Git Commits" })
vim.keymap.set("n", "<leader>gb", function() require("telescope.builtin").git_branches() end, { desc = "Git Branches" })
-- === LazyGit Keymap ===
vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<CR>", { desc = "Open LazyGit" })

-- === LSP Keymaps (<leader>l) ===
vim.keymap.set("n", "<leader>ls", function() require("telescope.builtin").lsp_references() end, { desc = "LSP References" })
vim.keymap.set("n", "<leader>ld", function() require("telescope.builtin").lsp_definitions() end, { desc = "LSP Definitions" })
vim.keymap.set("n", "<leader>li", function() require("telescope.builtin").lsp_implementations() end, { desc = "LSP Implementations" })
vim.keymap.set("n", "<leader>lw", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "LSP Document Symbols" })
vim.keymap.set("n", "<leader>lW", function() require("telescope.builtin").lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
vim.keymap.set("n", "<leader>lr", function() require("telescope.builtin").lsp_references() end, { desc = "LSP References" }) -- Redundant for desc, but okay
vim.keymap.set("n", "<leader>lS", function() require("telescope.builtin").lsp_document_symbols() end, { desc = "LSP Document Symbols (Current File)" }) -- Redundant for desc, but okay

-- === Toggles Keymaps ===
vim.keymap.set("n", "<leader>tt", function() vim.cmd.Neotree "toggle" end, { desc = "Toggle NeoTree" })
vim.keymap.set("n", "<leader>tu", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undo Tree" }) -- From utils.lua

-- === Utility Commands ===
vim.keymap.set("n", "<leader>ul", "<cmd>Lazy<CR>", { desc = "Lazy: Open Manager" })
vim.keymap.set("n", "<leader>uc", "<cmd>checkhealth<CR>", { desc = "Check Health" })
vim.keymap.set("n", "<leader>uu", "<cmd>Lazy sync<CR>", { desc = "Lazy: Update & Sync" }) -- Often useful

-- === Highlight when yanking (copying) text ===
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'BoltNvimYankHighlight',
    { clear = true }
  ),
  callback = function()
    vim.highlight.on_yank({
      timeout = 200,
    })
  end,
})
