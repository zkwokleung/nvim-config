local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = { "typescript", "tsx", "javascript" },
    highlight = { enable = true },
})
