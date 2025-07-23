-- Custom theme for winbar
local custom_theme = require("lualine.themes.auto")
custom_theme.normal.c.bg = "#2d3149"
custom_theme.inactive.c.bg = "#24283b"

require("lualine").setup({
    options = {
        icons_enabled = true,
        theme = custom_theme,
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
    winbar = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                "filename",
                path = 1, -- Show relative path
                symbols = {
                    modified = " ●",
                    readonly = " ",
                    unnamed = "[No Name]",
                },
            },
        },
        lualine_x = {
            {
                "diagnostics",
                sources = { "nvim_lsp" },
                symbols = { error = " ", warn = " ", info = " ", hint = " " },
                colored = true,
            },
            "filetype",
        },
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_c = {
            {
                "filename",
                path = 1,
                color = { fg = "#6c7086" }, -- Dimmed text for inactive
                symbols = {
                    modified = " ●",
                    readonly = " ",
                    unnamed = "[No Name]",
                },
            },
        },
    },
    extensions = { "neo-tree", "trouble", "lazy" },
})
