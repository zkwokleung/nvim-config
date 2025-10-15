local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete without yanking
map("n", "<Leader>d", '"_d', opts)

-- Move lines up and down
map("n", "<A-j>", "<cmd>m .+1<CR>==", opts)
map("n", "<A-k>", "<cmd>m .-2<CR>==", opts)
map("i", "<A-j>", "<Esc><cmd>m .+1<CR>==gi", opts)
map("i", "<A-k>", "<Esc><cmd>m .-2<CR>==gi", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)

-- Copy lines up
map("n", "<A-J>", "<cmd>copy .<CR>==", opts)
map("n", "<A-K>", "<cmd>copy .-1<CR>==", opts)
map("i", "<A-J>", "<Esc><cmd>copy .-1<CR>==gi", opts)
map("i", "<A-K>", "<Esc><cmd>copy .<CR>==gi", opts)

-- Create new line
map("i", "<C-j>", "<Esc>o", opts)
map("i", "<C-k>", "<Esc>O", opts)

-- Windows Management
map("n", "<C-w>-", "<cmd>wincmd s<CR>")
map("n", "<C-w>_", "<cmd>wincmd v<CR>")

-- Escaping
map("n", "<Leader><Space>", "<cmd>nohl<CR>", opts)

-- Buffer
map("n", "<Space>,", "<cmd>BufferPrevious<CR>", opts)
map("n", "<Space>.", "<cmd>BufferNext<CR>", opts)
map("n", "<Space>o", "<cmd>BufferCloseAllButCurrent<CR>", opts)
map("n", "<Space>c", "<cmd>BufferClose<CR>", opts)
map("n", "<Space>p", "<cmd>BufferPick<CR>", opts)

-- Toggle Neotree
map("n", "<Leader>e", "<cmd>Neotree toggle<CR>", opts)

-- Toggle Undotree
map("n", "<Leader>z", "<cmd>UndotreeToggle<CR>", opts)

-- Telescope finder
map({ "n", "v", "i" }, "<C-p>", "<cmd>Telescope find_files<CR>", opts)

-- Telescope additional pickers
map("n", "<Leader>/", "<cmd>Telescope live_grep<CR>", opts)

-- Harpoon mappings
map("n", "<Leader>ha", function()
    require("harpoon.mark").add_file()
end, opts)
map("n", "<Leader>hm", function()
    require("harpoon.ui").toggle_quick_menu()
end, opts)
map("n", "<Leader>h1", function()
    require("harpoon.ui").nav_file(1)
end, opts)
map("n", "<Leader>h2", function()
    require("harpoon.ui").nav_file(2)
end, opts)
map("n", "<Leader>h3", function()
    require("harpoon.ui").nav_file(3)
end, opts)
map("n", "<Leader>h4", function()
    require("harpoon.ui").nav_file(4)
end, opts)

-- LSP Rename
-- Incremental Rename (inc-rename)
map("n", "<Leader>r", function()
    return ":IncRename " .. vim.fn.expand("<cword>")
end, { expr = true })

-- Quick code action
map("n", "<Leader>.", vim.lsp.buf.code_action, opts)

-- Disable command-line window
map("n", "q:", "<nop>", opts)
