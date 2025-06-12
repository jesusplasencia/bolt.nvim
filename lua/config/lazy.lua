-- Setup lazy.nvim
local plugins = {
  spec = {
    { import = "plugins" },
  },
  checker = { enabled = true },
  change_detection = {
    enabled = true,
    notify  = false
  },
  performance = {
    rtp = {
      -- disable some of the default vim plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
}

-- Check if NvimTree buffer exists and close it on startup
vim.api.nvim_create_autocmd("VimEnter", {
  group = vim.api.nvim_create_augroup("NvimTreeCleanup", { clear = true }),
  callback = function()
    local nvim_tree_buf = vim.fn.bufexists("NvimTree_1") or vim.fn.bufexists("NvimTree_2") -- Common NvimTree buffer names
    if nvim_tree_buf then
      vim.cmd("silent! bw NvimTree_1") -- Close the NvimTree buffer if it exists
      vim.cmd("silent! bw NvimTree_2")
      -- You might need to check other potential nvim-tree buffer names
      -- For example, by iterating over all buffers and checking their names if they contain "NvimTree"
    end
  end,
  once = true, -- Only run once on VimEnter
})

require("lazy").setup(plugins)
