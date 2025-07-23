-- #region Indent Blankline
local hooks = require("ibl.hooks")
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    -- Original indent line colors (foreground)
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#662121" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#767621" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#216631" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#325a5e" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#324b7b" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#562155" })

    -- Subtle whitespace background colors
    vim.api.nvim_set_hl(0, "RainbowRedBg", { bg = "#2d2427" })
    vim.api.nvim_set_hl(0, "RainbowYellowBg", { bg = "#2d2d24" })
    vim.api.nvim_set_hl(0, "RainbowGreenBg", { bg = "#242d26" })
    vim.api.nvim_set_hl(0, "RainbowCyanBg", { bg = "#242a2b" })
    vim.api.nvim_set_hl(0, "RainbowBlueBg", { bg = "#24272d" })
    vim.api.nvim_set_hl(0, "RainbowVioletBg", { bg = "#2a242d" })
end)

require("ibl").setup({
    indent = {
        highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowGreen",
            "RainbowCyan",
            "RainbowBlue",
            "RainbowViolet",
        },
        char = "│",
    },
    whitespace = {
        highlight = {
            "RainbowRedBg",
            "RainbowYellowBg",
            "RainbowGreenBg",
            "RainbowCyanBg",
            "RainbowBlueBg",
            "RainbowVioletBg",
        },
        remove_blankline_trail = false,
    },
})
-- #endregion
