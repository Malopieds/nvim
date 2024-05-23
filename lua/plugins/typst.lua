return {
    {
        'chomosuke/typst-preview.nvim',
        lazy = false, -- or ft = 'typst'
        version = '0.3.*',
        build = function() require 'typst-preview'.update() end,
        config = function ()
            local keymap = vim.keymap
            keymap.set("n", "<leader>tp", "<cmd>TypstPreview<CR>")
        end
    },
    {
        'kaarmu/typst.vim',
        ft = 'typst',
        lazy=false,
    },
}
