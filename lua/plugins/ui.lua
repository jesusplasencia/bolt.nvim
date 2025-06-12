-- ~/.config/nvim/lua/plugins/ui.lua

return {
  -- ColorScheme: Tokyonight
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  -- ColorScheme: Habana
  {
    "ntk148v/habamax.nvim",
    dependencies = { "rktjmp/lush.nvim" },
  },
  -- Dashboard: Alpha
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    config = function()
      local alpha = require("alpha")
      local dashboard = require("alpha.themes.startify")

      dashboard.section.header.val = {
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                     ]],
        [[       ████ ██████           █████      ██                     ]],
        [[      ███████████             █████                             ]],
        [[      █████████ ███████████████████ ███   ███████████   ]],
        [[     █████████  ███    █████████████ █████ ██████████████   ]],
        [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
        [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
        [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
        [[                                                                       ]],
        [[                                                                       ]],
        [[                                                                       ]],
      }

      alpha.setup(dashboard.opts)
    end,
  },
  -- File Icons (nvim-web-devicons)
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- Only load when needed (e.g., by a file explorer)
    config = function()
      require("nvim-web-devicons").setup({
        -- Default: all filetypes are loaded (expensive on startup).
        -- Set `default = false` and load only what you need to speed things up.
        -- default = true,
      })
    end,
  },
  -- Statusline (lualine.nvim)
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          icons_enabled = true,
          theme = "dracula",
        },
      })
    end,
  },
  -- Bufferline (akin to tabs, but for buffers)
  {
    "akinsho/bufferline.nvim",
    event = "BufAdd", -- Load when a buffer is added
    dependencies = "nvim-tree/nvim-web-devicons", -- For icons
    opts = {
      options = {
        mode = "buffers",
        numbers = "none", -- "ordinal" , "buffer_id" , "none"
        indicator = {
          icon = "", -- "●"
          style = "underline",
        },
        buffer_close_icon = nil,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_buffer_icons = true, -- disable for performance
        color_icons = true,       -- Like tabpage number (for buffer in tabpage)
        enforce_regular_tabs = false,
        sort_by = "insert",       -- "id" | "tabs" | "buffers"
        always_show_bufferline = true,
        diagnostics = "nvim_lsp", -- Show LSP diagnostics in bufferline
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            text_align = "left",
            separator = true,
          },
        },
      },
    },
    -- Keymaps for bufferline
    keys = {
      { "<leader>bp", "<cmd>BufferLineTogglePin<CR>", desc = "Pin Buffer" },
      { "<leader>bc", "<cmd>BufferLineCloseOthers<CR>", desc = "Close Other Buffers" },
      { "<leader>bx", "<cmd>BufferLineClose<CR>", desc = "Close Buffer" },
      { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "Next Buffer" },
      { "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", desc = "Previous Buffer" },
    },
  },
  -- File Explorer (neo-tree)
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "famiu/bufdelete.nvim",       -- Optional: Better buffer deletion when closing files from tree
    },
    lazy = false,
    opts = {
      close_on_selection = false, -- Keep tree open after selecting a file
      popup_border_style = "rounded",
    },
    config = function()
      vim.keymap.set("n", "<C-n>", ":Neotree position=left toggle<CR>", { desc = "Toggle NvimTree" })
      vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
      vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })
    end,
  },
}
