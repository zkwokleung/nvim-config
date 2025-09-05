-- Smart Splits: defaults scaffold for easy tweaking
-- This file is required from lua/core/lazy.lua

local ok, smart_splits = pcall(require, "smart-splits")
if not ok then
    return
end

smart_splits.setup({
    ignored_filetypes = { "nofile", "quickfix", "prompt" },
    ignored_buftypes = { "nofile", "quickfix", "prompt" },

    default_amount = 3,

    -- When moving the cursor, do not wrap to the opposite side at window edge
    -- move_cursor_same_row = false,

    -- When swapping buffers between windows, follow the buffer with the cursor
    -- cursor_follows_swapped_bufs = false,
})

local map = vim.keymap.set
local ss = smart_splits
-- Movement between splits
-- map("n", "<C-h>", ss.move_cursor_left)
-- map("n", "<C-j>", ss.move_cursor_down)
-- map("n", "<C-k>", ss.move_cursor_up)
-- map("n", "<C-l>", ss.move_cursor_right)
-- map("n", "<C-\\>", ss.move_cursor_previous)

-- Resizing splits
map("n", "<C-Left>", ss.resize_left)
map("n", "<C-Down>", ss.resize_down)
map("n", "<C-Up>", ss.resize_up)
map("n", "<C-Right>", ss.resize_right)

-- Swapping buffers between windows
-- map("n", "<leader><leader>h", ss.swap_buf_left)
-- map("n", "<leader><leader>j", ss.swap_buf_down)
-- map("n", "<leader><leader>k", ss.swap_buf_up)
-- map("n", "<leader><leader>l", ss.swap_buf_right)
