local g = vim.g
local requirements = require("lang.requirements")
local lint = require("lang.lint")
local linters_by_ft = requirements.linters_by_ft
local fixers_by_ft = requirements.fixers_by_ft
local global_fixers = requirements.global_fixers

-- Global ALE options.
local ale_global_options = {
    -- ale_markdown_markdownlint_options = "--disable MD013",
}

-- Per-filetype/per-linter ALE options.
local ale_linter_options_by_ft = lint.ale_linter_options_by_ft

-- Map tool names used in requirements.lua to ALE's internal linter names.
local ale_linter_name_map = {
    ["ast-grep"] = "ast_grep",
}

local function to_ale_linter_name(name)
    return ale_linter_name_map[name] or name
end

local function build_ale_linters(table_by_ft)
    local result = {}
    for ft, linters in pairs(table_by_ft) do
        result[ft] = {}
        for _, linter in ipairs(linters) do
            table.insert(result[ft], to_ale_linter_name(linter))
        end
    end
    return result
end

-- Core ALE behavior for this config.
g.ale_disable_lsp = 1
g.ale_completion_enabled = 0
g.ale_linters_explicit = 1
g.ale_use_neovim_diagnostics_api = 1
g.ale_fix_on_save = 1

-- Linter and fixer sources are defined in lang.requirements.
g.ale_linters = build_ale_linters(linters_by_ft)
g.ale_fixers = vim.tbl_extend("force", { ["*"] = global_fixers }, fixers_by_ft)

-- Apply global ALE options.
for key, value in pairs(ale_global_options) do
    g[key] = value
end

-- Apply per-filetype/per-linter options.
for ft, linters in pairs(ale_linter_options_by_ft) do
    for linter, option in pairs(linters) do
        local ale_linter = to_ale_linter_name(linter)
        g[string.format("ale_%s_%s_options", ft, ale_linter)] = option
    end
end
