-- ~/.config/nvim/lua/plugins/null-ls.lua

return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" }, -- Load on file read/new file
  dependencies = {
    "jay-babu/mason-null-ls.nvim", -- Bridges Mason to null-ls
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {},
      -- Attach null-ls to buffers
      on_attach = function(client, bufnr)
        -- You can put autoformat on save here, or in lsp.lua
        -- (Already in lsp.lua in our combined config)
      end,
      -- Optional: Configure how diagnostics are displayed (can also be done globally via vim.diagnostic.config)
      -- diagnostics_format = "[#{c}] #{m} (#{s})",
      -- debug = false,
    })

    -- Manual format keymap (already in keymaps.lua, good to keep separate)
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format Buffer" })
  end,
}
