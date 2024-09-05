return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = {
		toggler = {
			line = "<leader>/",
			block = "gbc",
		},
		opleader = {
			---Line-comment keymap
			line = "<leader>/",
			---Block-comment keymap
			block = "gb",
		},
	},
	lazy = false,
}
