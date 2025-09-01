local status_ok, barbar = pcall(require, "barbar")
if not status_ok then
    return
end

barbar.setup({
    animation = true,
    auto_hide = false,
    tabpages = true,
    closable = true,
    clickable = true,
    exclude_ft = { "javascript" },
    exclude_name = { "package.json" },
    focus_on_close = "left",
    hide = { extensions = true, inactive = false },
    highlight_alternate = false,
    highlight_inactive_file_icons = false,
    highlight_visible = true,
    icons = {
        buffer_index = false,
        buffer_number = false,
        button = "",
        diagnostics = {
            [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
            [vim.diagnostic.severity.WARN] = { enabled = false },
            [vim.diagnostic.severity.INFO] = { enabled = false },
            [vim.diagnostic.severity.HINT] = { enabled = true },
        },
        gitsigns = {
            added = { enabled = true, icon = "+" },
            changed = { enabled = true, icon = "~" },
            deleted = { enabled = true, icon = "-" },
        },
        filetype = {
            custom_colors = false,
            enabled = true,
        },
        separator = { left = "▎", right = "" },
        separator_at_end = true,
        modified = { button = "●" },
        pinned = { button = "", filename = true },
        preset = "default",
        alternate = { filetype = { enabled = false } },
        current = { buffer_index = true },
        inactive = { button = "×" },
        visible = { modified = { buffer_number = false } },
    },
    insert_at_end = false,
    insert_at_start = false,
    maximum_padding = 1,
    minimum_padding = 1,
    maximum_length = 30,
    minimum_length = 0,
    semantic_letters = true,
    sidebar_filetypes = {
        ["neo-tree"] = {
            event = "BufWipeout",
            text = "  Explorer",
            align = "left",
            offset = {
                width = 30,
                margin = 1,
            },
        },
        NvimTree = {
            text = "  File Explorer",
            align = "left",
            offset = {
                width = 30,
                margin = 1,
            },
        },
        undotree = {
            text = "  Undo Tree",
            align = "center",
            offset = {
                width = 30,
                margin = 1,
            },
        },
        ["dap-repl"] = false,
        ["dapui_console"] = false,
        ["dapui_watches"] = false,
        ["dapui_stacks"] = false,
        ["dapui_breakpoints"] = false,
        ["dapui_scopes"] = false,
        Outline = {
            event = "BufWinLeave",
            text = "  Symbols",
            align = "right",
            offset = {
                width = 30,
                margin = 1,
            },
        },
    },
    sort = {
        ignore_case = false,
    },
    no_name_title = nil,
})
