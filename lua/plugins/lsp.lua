return {
  -- Mason.nvim (LSP, DAP, Linter/Formatter installer)
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    keys = { { "<leader>cm", "<cmd>Mason<CR>", desc = "Mason" } },
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason-LSPConfig (Bridge Mason installed LSPs to nvim-lspconfig)
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vtsls",
          "dockerls",
          -- Add more LSPs as you expand language support, e.g., "pyright", "rust_analyzer", "jsonls"
        },
        automatic_setup = true, -- Automatically sets up LSP servers installed by Mason
        -- Optional: Handlers to add custom settings to specific LSPs
        handlers = {
          -- Custom settings for Lua_LS
          ["lua_ls"] = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    -- Find your nvim config and runtime files for better diagnostics
                    library = {
                      vim.fn.stdpath("config"),
                      vim.fn.stdpath("data") .. "/lazy/plugin",
                      vim.api.nvim_get_runtime_and_config_path(),
                    },
                    checkThirdParty = false,
                  },
                  telemetry = { enable = false },
                },
              },
            })
          end,
          -- Default handler for other LSPs not explicitly listed here
          function(server_name)
            require("lspconfig")[server_name].setup({})
          end,
        },
      })
    end,
  },

  -- nvim-lspconfig (Core LSP client plugin)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
      vim.diagnostic.config({
        virtual_text = true,
        update_in_insert = false,
        severity_sort = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
    end,
  },
}
