return {
	"NeogitOrg/neogit",
	dependencies = {

		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration

		-- Only one of these is needed, not both.
		"nvim-telescope/telescope.nvim", -- optional
	},
	config = true,
	opts = {
		vim.api.nvim_set_keymap("n", "<leader>n", "<cmd>Neogit<cr>", {}),
	},
}
