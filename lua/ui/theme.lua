vim.cmd([[colorscheme onedark]])

-- Gitsigns: color for current line blame virtual text
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
    fg = "#5c6370",
    italic = true,
    nocombine = true,
})
