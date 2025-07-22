local status_ok, configs = pcall(require, "nvim-treesitter.config")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { "typescript", "tsx", "javascript" },
    highlight = { enable = true },
    context_commentstring = {
        enable = true,

        javascript = {
            __default = "// %s",
            jsx_element = "{/* %s */}",
            jsx_fragment = "{/* %s */}",
            jsx_attribute = "// %s",
            comment = "// %s",
        },
        typescript = {
            __default = "// %s",
            jsx_element = "{/* %s */}",
            jsx_fragment = "{/* %s */}",
            jsx_attribute = "// %s",
            comment = "// %s",
        },
    },
})
