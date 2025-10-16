vim.cmd([[colorscheme onedark]])

-- Gitsigns: color for current line blame virtual text
vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", {
    fg = "#5c6370",
    italic = true,
    nocombine = true,
})

-- Barbar: brighten non-current buffers for better legibility
local dim_buffer_fg = "#9da5b4"
local dim_buffer_groups = {
    "BufferInactive",
    "BufferInactiveIndex",
    "BufferInactiveIcon",
    "BufferInactiveMod",
    "BufferInactiveSign",
    "BufferInactiveTarget",
    "BufferInactiveButton",
    "BufferVisible",
    "BufferVisibleIndex",
    "BufferVisibleIcon",
    "BufferVisibleMod",
    "BufferVisibleSign",
    "BufferVisibleTarget",
    "BufferVisibleButton",
}

for _, group in ipairs(dim_buffer_groups) do
    vim.api.nvim_set_hl(0, group, { fg = dim_buffer_fg })
end

local bold_buffer_groups = {
    "BufferCurrent",
    "BufferCurrentIndex",
    "BufferCurrentIcon",
    "BufferCurrentMod",
    "BufferCurrentSign",
    "BufferCurrentTarget",
    "BufferCurrentButton",
}

for _, group in ipairs(bold_buffer_groups) do
    vim.api.nvim_set_hl(0, group, { fg = "#ffffff", bold = true })
end
