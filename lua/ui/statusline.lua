require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = {
            {
                function()
                    local reg = vim.fn.reg_recording()
                    if reg == "" then
                        return ""
                    else
                        return "(⏺) " .. reg .. " "
                    end
                end,
                color = { fg = "#1a1b26", bg = "#f7768e", gui = "bold" },
                separator = { right = "", left = "" },
                cond = function()
                    return vim.fn.reg_recording() ~= ""
                end,
            },
        },
        lualine_c = {
            "branch",
            "diff",
            "diagnostics",
            "filename",
        },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "neo-tree", "trouble", "lazy" },
})
