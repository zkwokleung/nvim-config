local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete without yanking
map("n", "<Leader>d", '"_d', opts)

-- Move lines up and down
map("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
map("v", "<A-j>", "<cmd>m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", "<cmd>m '<-2<CR>gv=gv", opts)

-- Copy lines up
map("n", "<A-J>", "<cmd>copy .<CR>==", opts)
map("n", "<A-K>", "<cmd>copy .-1<CR>==", opts)
map("i", "<A-J>", "<Esc><cmd>copy .-1<CR>==gi", opts)
map("i", "<A-K>", "<Esc><cmd>copy .<CR>==gi", opts)
map("v", "<A-J>", "<cmd>copy '>-1<CR>gv=gv", opts)
map("v", "<A-K>", "<cmd>copy '<<CR>gv=gv", opts)

-- Create new line
map("i", "<C-j>", "<Esc>o", opts)
map("i", "<C-k>", "<Esc>O", opts)

-- Escaping
map("n", "<Leader><Space>", "<cmd>nohl<CR>", opts)

-- ALE fix
map("n", "<Leader>?", "<cmd>ALEFixSuggest<CR>", opts)

-- Buffer
map("n", "<C-b>,", "<cmd>BufferPrevious<CR>", opts)
map("n", "<C-b>.", "<cmd>BufferNext<CR>", opts)

-- Buffer Navigation
map("n", "<C-b><", "<cmd>BufferMovePrevious<CR>", opts)
map("n", "<C-b>>", "<cmd>BufferMoveNext<CR>", opts)
map("n", "<C-b>o", "<cmd>BufferCloseAllButCurrent<CR>", opts)
map("n", "<C-b>c", "<cmd>BufferClose<CR>", opts)

-- Magic buffer-picking mode
map("n", "<C-b>p", "<cmd>BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", "<cmd>BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", "<cmd>BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", "<cmd>BufferOrderByLanguage<CR>", opts)

-- Toggle Neotree
map("n", "<Leader>e", "<cmd>Neotree toggle<CR>", opts)

-- Telescope finder
map({ "n", "v", "i" }, "<C-p>", "<cmd>Telescope find_files<CR>", opts)

-- Telescope additional pickers
map("n", "<leader>/", "<cmd>Telescope live_grep<CR>", opts)

-- Harpoon mappings
map("n", "<leader>ha", function()
    require("harpoon.mark").add_file()
end, opts)
map("n", "<leader>hm", function()
    require("harpoon.ui").toggle_quick_menu()
end, opts)
map("n", "<leader>h1", function()
    require("harpoon.ui").nav_file(1)
end, opts)
map("n", "<leader>h2", function()
    require("harpoon.ui").nav_file(2)
end, opts)
map("n", "<leader>h3", function()
    require("harpoon.ui").nav_file(3)
end, opts)
map("n", "<leader>h4", function()
    require("harpoon.ui").nav_file(4)
end, opts)

-- LSP Rename
-- Incremental Rename (inc-rename)
map("n", "<leader>r", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })
-- Quick code action
map("n", "<leader>ca", vim.lsp.buf.code_action, opts)

-- Disable command-line window
map("n", "q:", "<nop>", opts)
