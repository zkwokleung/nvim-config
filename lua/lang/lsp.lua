local lsp = require('lspconfig')
local lsps = require('lang.requirements').lsps
local lsp_signature = require('lsp_signature')

require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
local function on_attach(client, bufnr)
    -- Keymaps only when LSP attaches
    local map = vim.keymap.set
    local opts = { buffer = bufnr, silent = true }
    map('n', 'gd', vim.lsp.buf.definition, opts)
    map('n', 'gD', vim.lsp.buf.declaration, opts)
    map('n', 'gr', vim.lsp.buf.references, opts)
    map('n', 'K', vim.lsp.buf.hover, opts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, opts)

    -- lsp_signature
    lsp_signature.on_attach({ bind = true, handler_opts = { border = 'rounded' } }, bufnr)
end

for _, s in ipairs(lsps) do
    lsp[s].setup {
        capabilities = capabilities,
        on_attach = on_attach,
    }
end

-- none-ls setup
local has_null, null_ls = pcall(require, 'null-ls')
if has_null then
    null_ls.setup {
        on_attach = on_attach,
        sources = {
            null_ls.builtins.formatting.prettier,
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.formatting.black,
            null_ls.builtins.diagnostics.eslint_d,
        },
    }
end