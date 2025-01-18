return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        -- Other dependencies
        'windwp/nvim-autopairs', -- Add nvim-autopairs as a dependency
    },
    config = function()

		local npairs = require('nvim-autopairs')
        npairs.setup({
            fast_wrap = {
                map = '<M-e>', -- Change this to your preferred key mapping
                chars = { '{', '[', '(', '"', "'" },
                pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
                offset = 0, -- Offset from pattern match
                end_key = '$',
                keys = 'qwertyuiopzxcvbnmasdfghjkl',
                check_comma = true,
                highlight = 'Search',
                highlight_grey = 'Comment'
            }
        })
        local cmp = require('cmp')
        cmp.setup({
            -- Your existing cmp configurations
            mapping = {
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<C-Space>'] = cmp.mapping.complete(),
                -- Add other mappings if needed
            },
            -- Additional cmp setup
        })

        -- Integration with nvim-autopairs
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end,
}

