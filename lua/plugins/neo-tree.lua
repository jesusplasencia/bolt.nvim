return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	opts = {},
	config = function()
		vim.keymap.set("n", "<C-n>", ":Neotree position=left toggle<CR>", { desc = "Toggle NvimTree" })
		vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to Left Window" })
		vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to Right Window" })
	end,
}
