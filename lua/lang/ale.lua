local g = vim.g
local requirements = require("lang.requirements")
local linters_by_ft = requirements.linters_by_ft
local fixers_by_ft = requirements.fixers_by_ft
local global_fixers = requirements.global_fixers

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

g.ale_disable_lsp = 1
g.ale_completion_enabled = 0
g.ale_linters_explicit = 1
g.ale_use_neovim_diagnostics_api = 1
g.ale_fix_on_save = 1

g.ale_linters = build_ale_linters(linters_by_ft)
g.ale_fixers = vim.tbl_extend("force", { ["*"] = global_fixers }, fixers_by_ft)
