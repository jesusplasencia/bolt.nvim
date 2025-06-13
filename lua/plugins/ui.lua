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
      -- Improved BufferLine Keymaps
      -- Cycling buffers: <leader>bn (next), <leader>bp (previous) is a good standard
      { "<leader>bn", "<cmd>BufferLineCycleNext<CR>", desc = "BufferLine: Next Buffer" },
      { "<leader>bp", "<cmd>BufferLineCyclePrev<CR>", desc = "BufferLine: Previous Buffer" },

      -- Jumping to specific buffers by number (often uses a global remap for <leader><number>)
      -- To jump to specific buffers:
      { "<leader>1", "<cmd>BufferLineGoToBuffer 1<CR>", desc = "BufferLine: Go to Buffer 1" },
      { "<leader>2", "<cmd>BufferLineGoToBuffer 2<CR>", desc = "BufferLine: Go to Buffer 2" },
      { "<leader>3", "<cmd>BufferLineGoToBuffer 3<CR>", desc = "BufferLine: Go to Buffer 3" },
      { "<leader>4", "<cmd>BufferLineGoToBuffer 4<CR>", desc = "BufferLine: Go to Buffer 4" },
      { "<leader>5", "<cmd>BufferLineGoToBuffer 5<CR>", desc = "BufferLine: Go to Buffer 5" },
      { "<leader>6", "<cmd>BufferLineGoToBuffer 6<CR>", desc = "BufferLine: Go to Buffer 6" },
      { "<leader>7", "<cmd>BufferLineGoToBuffer 7<CR>", desc = "BufferLine: Go to Buffer 7" },
      { "<leader>8", "<cmd>BufferLineGoToBuffer 8<CR>", desc = "BufferLine: Go to Buffer 8" },
      { "<leader>9", "<cmd>BufferLineGoToBuffer 9<CR>", desc = "BufferLine: Go to Buffer 9" },
      { "<leader>0", "<cmd>BufferLineGoToBuffer -1<CR>", desc = "BufferLine: Go to Last Buffer" }, -- -1 usually means last

      -- Closing buffers:
      { "<leader>bc", "<cmd>BufferLineCloseOthers<CR>", desc = "BufferLine: Close Other Buffers" },
      { "<leader>bd", "<cmd>bdelete<CR>", desc = "BufferLine: Close Current Buffer" }, -- Renamed to 'bd' for 'buffer delete'

      -- Pinning/Unpinning
      { "<leader>bt", "<cmd>BufferLineTogglePin<CR>", desc = "BufferLine: Toggle Pin" }, -- Changed from <leader>bp to <leader>bt for 'toggle pin'
      -- You might also want to jump to the first/last visible buffer
      { "<leader>bf", "<cmd>BufferLineGoToFirstBuffer<CR>", desc = "BufferLine: Go to First Buffer" },
      { "<leader>bl", "<cmd>BufferLineGoToLastBuffer<CR>", desc = "BufferLine: Go to Last Buffer" },
      -- Other useful BufferLine commands
      { "<leader>bm", "<cmd>BufferLineToggleGroups<CR>", desc = "BufferLine: Toggle Groups" },
      { "<leader>bs", "<cmd>BufferLineSortByDirectory<CR>", desc = "BufferLine: Sort by Directory" },
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
      -- "famiu/bufdelete.nvim",       -- Optional: Better buffer deletion when closing files from tree
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
