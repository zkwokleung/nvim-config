local M = {}

M.lsps = {
    clangd = {},
    cmake = {},
    cssls = {},
    bashls = {},
    pyright = {},
    eslint = {},
    jsonls = {},
    vtsls = {},
    tailwindcss = {},
    phpactor = {},
    gopls = {},
    lua_ls = {
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
            },
        },
    },
}

M.linters = {
    "ast-grep",
    "stylelint",
    "eslint",
    "jsonlint",
    "markdownlint",
    "ruff",
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
    php = { "phpstan", "phpactor" },
    python = { "ruff" },
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
    "ruff",
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
    python = { "ruff" },
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
