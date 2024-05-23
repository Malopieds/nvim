return {
    'akinsho/toggleterm.nvim', version = "*",
    config = function()
        require("toggleterm").setup{}

        local opts = {noremap = true, silent = true}
        vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", opts)
        vim.api.nvim_set_keymap("t", "<esc><esc>", "<cmd>ToggleTerm<CR>", opts)
        vim.api.nvim_set_keymap("t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    end
}
