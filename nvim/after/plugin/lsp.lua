local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
    local opts = {buffer = bufnr}
    vim.keymap.set('n', '<leader>gd', function()
        -- Try implementation first
        vim.lsp.buf_request(0, 'textDocument/implementation', vim.lsp.util.make_position_params(), function(err, result, ctx, config)
            if result and #result > 0 then
                -- If we found implementations, jump to the first one
                vim.lsp.util.jump_to_location(result[1], "utf-8")
            else
                -- Fallback to definition search with Telescope
                telescope.lsp_definitions({
                    show_line = true,
                    jump_type = "vsplit",
                    reuse_win = true
                })
            end
        end)
    end, opts)
    
    -- Find references and implementations
    vim.keymap.set('n', 'gr', function() telescope.lsp_references() end, opts)       -- Find references
    vim.keymap.set('n', 'gi', function() telescope.lsp_implementations() end, opts)   -- Find implementations
    
    -- Documentation and help
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                               -- Show hover docs
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)                  -- Show signature
    
    -- Type definition (useful for languages like TypeScript)
    vim.keymap.set('n', '<leader>d', function() telescope.lsp_type_definitions() end, opts)
    
    -- Symbol operations
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)                     -- Rename symbol
    
    -- Diagnostics
    vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)end

lsp_zero.extend_lspconfig({
  lsp_attach = lsp_attach,
})
