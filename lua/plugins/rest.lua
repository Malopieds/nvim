return {
	"rest-nvim/rest.nvim",
	config = function()
		require("rest-nvim").setup({
			result = {
				behavior = {
					formatters = {
						json = "jq",
						vnd = "jq",
					},
				},
			},
		})
		vim.keymap.set("n", "<leader>rr", "<cmd>Rest run<CR>")
		vim.keymap.set("n", "<leader>rl", "<cmd>Rest last<CR>")
	end,
}
