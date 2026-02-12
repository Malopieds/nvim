return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional completion
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- DBUI configuration
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_execute_on_save = true -- Auto-execute query on :w (for SQL buffers)
		vim.g.db_ui_save_location = vim.fn.stdpath("data") .. "/dadbod_ui" -- Persistent query history
		vim.g.db_ui_use_nvim_notify = true -- Notifications for results/errors

		vim.g.dbs = {
			{ name = "dev", url = "postgres://postgres@localhost:5432/roger_roger" },
		}

		-- Keymaps
		vim.keymap.set("n", "<leader>db", "<cmd>DBUIToggle<CR>", { desc = "Toggle database UI" })
		vim.keymap.set("n", "<leader>df", "<cmd>DBUIFindBuffer<CR>", { desc = "Find DB buffer" })
		vim.keymap.set("n", "<leader>dr", "<cmd>%DB<CR>", { desc = "Run current SQL buffer" }) -- Execute entire buffer
		vim.keymap.set("v", "<leader>ds", "<esc><cmd>'<,'>DB<CR>", { desc = "Run selected SQL lines" }) -- Visual selection execute
	end,
}
