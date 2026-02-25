local lsps = require("lang.requirements").lsps
local lsp_signature = require("lsp_signature")

require("mason-lspconfig").setup({
    ensure_installed = lsps,
})

-- Set up lspconfig.
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local server_overrides = {
    -- Example:
    -- marksman = {
    --     settings = {},
    -- },
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local bufnr = args.buf

        -- Keymaps only when LSP attaches
        local map = vim.keymap.set
        local opts = { buffer = bufnr, silent = true }
        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "K", vim.lsp.buf.hover, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

        -- lsp_signature
        lsp_signature.on_attach({ bind = true, handler_opts = { border = "rounded" } }, bufnr)
    end,
})

for _, s in ipairs(lsps) do
    local server_config = vim.tbl_deep_extend(
        "force",
        {
            capabilities = capabilities,
        },
        server_overrides[s] or {}
    )

    vim.lsp.config(s, server_config)
    vim.lsp.enable(s)
end
