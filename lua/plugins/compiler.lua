return {
	{
		"Zeioth/compiler.nvim",
		cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
		dependencies = { "stevearc/overseer.nvim" },
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
		commit = "68a2d344cea4a2e11acfb5690dc8ecd1a1ec0ce0",
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
