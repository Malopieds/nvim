return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  -- Optional dependency
  dependencies = { 'hrsh7th/nvim-cmp' },
  config = function()
    local autopairs = require('nvim-autopairs')
    autopairs.setup {}
    -- If you want to automatically add `(` after selecting a function or method
    local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
    local cmp = require 'cmp'
    cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    local Rule = require 'nvim-autopairs.rule'
    autopairs.add_rules {
        Rule('$', '$', { 'tex', 'markdown', 'typst' }),
    }
  end,
}
