vim.keymap.set({ "n", "x", "o" }, "s", function()
    require("flash").jump()
end, { desc = "Flash Jump" })

vim.keymap.set({ "n", "x", "o" }, "<leader>s", function()
    require("flash").treesitter()
end, { desc = "Flash Treesitter" })
