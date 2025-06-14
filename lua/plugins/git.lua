-- ~/.config/nvim/lua/plugins/git.lua

return {
  -- Gitsigns (Git diffs in the gutter)
  {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "right_align",
        delay = 500,
        ignore_whitespace_diff = false,
      },
    },
  },

  -- LazyGit Integration
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit", -- Load only when `:LazyGit` is called
    keys = { { "<leader>gg", "<cmd>LazyGit<CR>", desc = "Open LazyGit" } },
  },
}
