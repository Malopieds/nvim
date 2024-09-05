return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local nvimtree = require("nvim-tree")
		vim.g.loaded_netrw = 1

		nvimtree.setup({
			update_focused_file = {
				enable = true,
			},
			view = {
				width = 30,
			},
			git = {
				ignore = true,
			},
		})
		local keymap = vim.keymap

		keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
	end,
}
