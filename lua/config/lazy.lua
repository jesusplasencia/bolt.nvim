-- ~/.config/nvim/lua/config/lazy.lua

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

require("lazy").setup(plugins)
