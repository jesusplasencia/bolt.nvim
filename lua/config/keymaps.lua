-- ~/.config/nvim/lua/config/keymaps.lua

-- === Telescope Keymaps ===
vim.keymap.set("n", "<leader>ff", function() require("telescope.builtin").find_files() end, { desc = "Telescope: Find Files" })
vim.keymap.set("n", "<C-p>", function() require("telescope.builtin").find_files() end, { desc = "Telescope: Find Files (Ctrl-P style)" })

-- Grep (Find text in files)
vim.keymap.set("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, { desc = "Telescope: Live Grep (Text Search)" })

-- Buffers (Navigate open buffers)
vim.keymap.set("n", "<leader>fb", function() require("telescope.builtin").buffers() end, { desc = "Telescope: Find Buffers" })

-- Old Files (Recently opened files)
vim.keymap.set("n", "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Telescope: Old Files (History)" })

-- Help Tags (Search Neovim help documentation)
vim.keymap.set("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, { desc = "Telescope: Help Tags" })

-- Commands (Search Neovim commands)
vim.keymap.set("n", "<leader>fc", function() require("telescope.builtin").commands() end, { desc = "Telescope: Commands" })

-- Keymaps (Search Neovim keymaps)
vim.keymap.set("n", "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Telescope: Keymaps" })


-- === Highlight when yanking (copying) text ===
-- This autocmd will visually indicate when you've yanked text.
-- It's a helpful visual feedback.
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup(
    'BoltNvimYankHighlight', -- Renamed the group for clarity
    { clear = true }
  ),
  callback = function()
    -- The default highlight for vim.highlight.on_yank() is typically 'IncSearch' or 'Visual'
    -- You can customize it further if you like, e.g.,
    vim.highlight.on_yank({
      -- higroup = "Visual", -- Use the Visual highlight group
      timeout = 200,    -- Highlight duration in milliseconds
    })
  end,
})
