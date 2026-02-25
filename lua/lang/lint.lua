local M = {}

local fn = vim.fn

local lint_config_dir = fn.stdpath("config") .. "/config/lang/lint"
local markdownlint_config = lint_config_dir .. "/.markdownlint.jsonc"
local yamllint_config = lint_config_dir .. "/yamllint.yml"

M.ale_linter_options_by_ft = {
    markdown = {
        markdownlint = "--config " .. fn.shellescape(markdownlint_config),
    },
    yaml = {
        yamllint = "-c " .. fn.shellescape(yamllint_config),
    },
}

return M
