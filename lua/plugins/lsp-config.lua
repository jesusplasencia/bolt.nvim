return {
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
				},
			})
		end,
	},
	{
    "jay-babu/mason-null-ls.nvim",
    dependencies = {
      "williamboman/mason.nvim",  -- Depends on Mason
      "nvimtools/none-ls.nvim",   -- Depends on null-ls
    },
    -- Use `ft` (filetype) to load this plugin only when relevant, improving startup
    ft = {
      "lua", "python", "javascript", "typescript", "css", "html", "json", "markdown",
    },
    config = function()
      require("mason-null-ls").setup({
        -- List the linters and formatters you want Mason to ensure are installed.
        ensure_installed = {
          "stylua",
          "prettier",
          "black",
          "isort",
          "eslint_d", -- Mason will install this executable
        },
        automatic_setup = true,
        -- You can define custom handlers for these sources if needed,
        -- similar to mason-lspconfig.
        -- handlers = {
        --   -- Example: Add custom arguments to prettier
        --   prettier = function()
        --     require("null-ls.builtins").formatting.prettier.with({
        --       extra_args = { "--single-quote", "--jsx-single-quote" },
        --     })
        --   end,
        -- },
      })
    end,
  },
  {
		"neovim/nvim-lspconfig",
		config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities
      })

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
