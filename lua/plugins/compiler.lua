return {
	{
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
		opts = {},
		config = {
			vim.api.nvim_set_keymap("n", "<leader>cc", "<cmd>CompilerOpen<cr>", { noremap = true, silent = true }),
			vim.api.nvim_set_keymap(
				"n",
				"<leader>cr",
				"<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>",
				{ noremap = true, silent = true }
			),
			vim.api.nvim_set_keymap(
				"n",
				"<leader>ct",
				"<cmd>CompilerToggleResults<cr>",
				{ noremap = true, silent = true }
			),
		},
	},
	{
		"stevearc/overseer.nvim",
		commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		opts = {
			task_list = {
				direction = "bottom",
				min_height = 20,
				max_height = 20,
				default_detail = 1,
			},
		},
	},
}
