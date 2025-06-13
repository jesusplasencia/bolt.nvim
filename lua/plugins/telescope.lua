return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for Telescope
    },
    cmd = "Telescope", -- Lazy load Telescope
    keys = {
    },
    config = function()
      require("telescope").setup({})
    end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
