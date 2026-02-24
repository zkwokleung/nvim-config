local M = {}

M.lsps = {
    "clangd",
    "cmake",
    "cssls",
    "bashls",
    "pyright",
    "eslint",
    "jsonls",
    "ts_ls",
    "tailwindcss",
    "intelephense",
    "gopls",
    "lua-language-server",
}

M.linters = {
    "ast-grep",
    "stylelint",
    "eslint",
    "jsonlint",
    "markdownlint",
    "flake8",
    "shellcheck",
    "luacheck",
    "vint",
    "yamllint",
    "phpstan",
    "golangci-lint",
}

M.linters_by_ft = {
    bash = { "shellcheck" },
    c = { "ast-grep" },
    cpp = { "ast-grep" },
    css = { "stylelint" },
    go = { "golangci-lint" },
    html = { "ast-grep" },
    java = { "ast-grep" },
    javascript = { "eslint" },
    javascriptreact = { "eslint" },
    json = { "jsonlint" },
    kotlin = { "ast-grep" },
    lua = { "luacheck" },
    markdown = { "markdownlint" },
    php = { "phpstan" },
    python = { "flake8" },
    sass = { "stylelint" },
    scss = { "stylelint" },
    sh = { "shellcheck" },
    typescript = { "eslint" },
    typescriptreact = { "eslint" },
    vim = { "vint" },
    yaml = { "yamllint" },
}

M.fmts = {
    "clang-format",
    "prettier",
    "gofumpt",
    "google-java-format",
    "ktlint",
    "latexindent",
    "black",
    "shfmt",
    "stylua",
}

M.global_fixers = {
    "remove_trailing_lines",
    "trim_whitespace",
}

M.fixers_by_ft = {
    c = { "clang-format" },
    cpp = { "clang-format" },
    css = { "prettier" },
    html = { "prettier" },
    java = { "google_java_format" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    kotlin = { "ktlint" },
    lua = { "stylua" },
    markdown = { "prettier" },
    python = { "black" },
    go = { "gofumpt" },
    sh = { "shfmt" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "prettier" },
    zsh = { "shfmt" },
}

M.all = {}
for _, v in ipairs(M.lsps) do
    table.insert(M.all, v)
end
for _, v in ipairs(M.linters) do
    table.insert(M.all, v)
end
for _, v in ipairs(M.fmts) do
    table.insert(M.all, v)
end

return M
