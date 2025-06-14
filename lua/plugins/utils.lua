return {
  -- Treesitter (Syntax Highlighting & Code Parsing)
  {
    "nvim-treesitter/nvim-treesitter",
    event = "BufReadPost",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "javascript", "typescript", "lua", "css", "html", "json", "markdown", "dockerfile" },
        sync_install = false,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        autotag = {
          enable = true,
        },
      })
      vim.keymap.set("n", "<leader>tsu", ":TSUpdate<CR>", { desc = "Treesitter Update" })
    end,
  },

  -- NumberToggle (Automatic relative/absolute numbers)
  {
    "jeffkreeftmeijer/vim-numbertoggle",
    lazy = true,
  },

  -- Auto Pairs (mini.pairs)
  {
    "echasnovski/mini.pairs",
    event = "BufReadPost",
    opts = {},
  },

  -- Auto Close HTML/XML tags (mini.surround)
  {
    "echasnovski/mini.surround",
    event = "BufReadPost",
    opts = {},
  },

  -- Undo Tree (optional, but very powerful)
  {
    "mbbill/undotree",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo Tree" } },
  },

  -- The Primeagen Plugin (The Nvim Goat)
  {
    "ThePrimeagen/vim-be-good",
  },

}
