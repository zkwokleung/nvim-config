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
        lualine_a = {
            {
                function()
                    -- Get file icon and name
                    local filename = vim.fn.expand("%:t")
                    if filename == "" then
                        return "  [No Name]"
                    end

                    local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
                    if devicons_ok then
                        local icon, icon_color = devicons.get_icon(filename, vim.fn.expand("%:e"), { default = true })
                        return string.format("   %s %s ", icon or "󰈔", filename)
                    else
                        return string.format("   󰈔 %s ", filename)
                    end
                end,
                color = { gui = "bold" },
                padding = { left = 1, right = 0 },
                separator = { right = "" },
            },
        },
        lualine_b = {
            {
                function()
                    local filepath = vim.fn.expand("%:h")
                    if filepath == "" or filepath == "." then
                        return ""
                    end
                    return string.format(" %s", filepath)
                end,
                color = { fg = "#7aa2f7" },
                padding = { left = 0, right = 1 },
                separator = { right = "" },
            },
        },
        lualine_c = {
            {
                function()
                    if vim.bo.modified then
                        return "●"
                    elseif vim.bo.readonly then
                        return ""
                    else
                        return ""
                    end
                end,
                color = function()
                    if vim.bo.modified then
                        return { fg = "#f7768e" }
                    else
                        return { fg = "#9ece6a" }
                    end
                end,
                padding = { left = 1, right = 1 },
            },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
    },
    inactive_winbar = {
        lualine_c = {
            {
                function()
                    local filename = vim.fn.expand("%:t")
                    if filename == "" then
                        return "  [No Name]"
                    end

                    local devicons_ok, devicons = pcall(require, "nvim-web-devicons")
                    local icon = "󰈔"
                    if devicons_ok then
                        icon = devicons.get_icon(filename, vim.fn.expand("%:e"), { default = true }) or "󰈔"
                    end

                    local modified = vim.bo.modified and " ●" or ""
                    return string.format("  %s %s%s", icon, filename, modified)
                end,
                color = { fg = "#6c7086" },
                padding = { left = 1, right = 1 },
            },
        },
    },
    extensions = { "neo-tree", "trouble", "lazy" },
})
