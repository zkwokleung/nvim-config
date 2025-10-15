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
}

M.linters = {
    "ast-grep",
    "stylelint",
    "eslint_d",
    "jsonlint",
    "markdownlint",
    "flake8",
    "shellcheck",
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
    javascript = { "eslint_d" },
    javascriptreact = { "eslint_d" },
    json = { "jsonlint" },
    kotlin = { "ast-grep" },
    lua = { "ast-grep" },
    markdown = { "markdownlint" },
    php = { "phpstan" },
    python = { "flake8" },
    sass = { "stylelint" },
    scss = { "stylelint" },
    sh = { "shellcheck" },
    typescript = { "eslint_d" },
    typescriptreact = { "eslint_d" },
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
