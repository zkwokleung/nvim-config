require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
            statusline = {},
            winbar = {
                "neo-tree",
                "alpha",
                "help",
                "trouble",
                "spectre_panel",
                "qf",
                "fugitive",
                "packer",
                "lazy",
                "mason",
                "TelescopePrompt",
                "harpoon",
            },
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
        },
        lualine_x = { "searchcount" },
        lualine_y = { "encoding" },
        lualine_z = { "filetype" },
    },
    inactive_sections = nil,
    tabline = {},
    winbar = {
        lualine_a = {
            {
                "filetype",
                icon_only = true,
                color = { fg = "#c0caf5", bg = "#1a1b26" },
            },
            {
                "filename",
                path = 0,
                symbols = {
                    modified = " ●",
                    readonly = " ",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                },
                color = { fg = "#c0caf5", bg = "#1a1b26", gui = "bold" },
            },
            {
                "diff",
                color = { fg = "#c0caf5", bg = "#1a1b26" },
            },
            {
                "diagnostics",
                color = { fg = "#c0caf5", bg = "#1a1b26" },
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_a = {
            {
                "filetype",
                icon_only = true,
            },
        },
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                path = 1,
                symbols = {
                    modified = " ●",
                    readonly = " ",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                },
            },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    extensions = { "neo-tree", "trouble", "lazy" },
})
