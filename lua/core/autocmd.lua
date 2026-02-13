local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local cmd = vim.api.nvim_create_user_command
local namespace = vim.api.nvim_create_namespace

-- Custom filetype overrides to ensure linters/formatters pick the right tool
vim.filetype.add({
    filename = {
        [".prettierrc"] = "jsonc",
    },
    extension = {
        [ "mts" ] = "typescript",
        [ "mjs" ] = "javascript",
        prettierrc = "jsonc",
    },
})

-- * Groups
local filetypes_group = augroup("filetypes", { clear = true })
local indent_group = augroup("indent", { clear = true })
local lsp_group = augroup("lsp", { clear = true })
local treesitter_group = augroup("treesitter", { clear = true })
local files_group = augroup("files", { clear = true })

-- File type
autocmd({ "FileType" }, {
    desc = "Set format options for all file types",
    group = filetypes_group,
    pattern = "*",
    callback = function()
        vim.cmd("set formatoptions-=cro")
        vim.cmd("set formatoptions+=tqjnl")
    end,
})

autocmd({ "FileType" }, {
    desc = "Set format options for python",
    group = filetypes_group,
    pattern = "python",
    callback = function()
        vim.opt.foldmethod = "indent"
    end,
})

autocmd({ "BufEnter", "BufRead" }, {
    desc = "Set syntax mode for custom dotfiles",
    group = files_group,
    pattern = ".aliases,.bash_prompt,.exports,.functions,.inputrc",
    callback = function()
        vim.opt.syntax = "sh"
    end,
})

-- Format on save
autocmd({ "BufWritePre" }, {
    desc = "Format on save using LSP",
    group = files_group,
    callback = function()
        -- Use LSP formatting instead of formatter.nvim to avoid conflicts
        vim.lsp.buf.format({ async = false, timeout_ms = 2000 })
    end,
})

-- Indent
autocmd({ "BufReadPre", "BufNewFile" }, {
    desc = "Enable Treesitter highlighting",
    group = indent_group,
    pattern = "*",
    callback = function()
        -- Check if Treesitter is available before enabling
        local ok, _ = pcall(require, "nvim-treesitter")
        if ok then
            vim.cmd("TSEnable highlight")
        end
    end,
})

-- Lint
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    group = files_group,
    callback = function()
        pcall(require("lint").try_lint)
    end,
})

-- Highlight on yank
autocmd("TextYankPost", {
    group = files_group,
    callback = function()
        vim.highlight.on_yank({ timeout = 150 })
    end,
})

-- Create AutoFormat command for compatibility
vim.api.nvim_create_user_command("AutoFormat", function()
    vim.cmd("Format")
end, { desc = "Format current buffer using formatter.nvim" })
