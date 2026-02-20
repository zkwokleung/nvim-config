require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "%.git/",
            "node_modules/",
            "%.cache/",
            "%.local/share/",
            "%.npm/",
            "%.cargo/",
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            find_command = {
                "rg",
                "--files",
                "--hidden",
                "--glob",
                "!**/.git/*",
                "--glob",
                "!**/node_modules/*",
                "--glob",
                "!**/.cache/*",
                "--glob",
                "!**/.local/share/*",
                "--glob",
                "!lazy-lock.json",
                "--glob",
                "!package-lock.json",
                "--glob",
                "!pnpm-lock.yaml",
                "--glob",
                "!.pnpm-store/*",
            },
        },
        live_grep = {
            additional_args = function()
                return {
                    "--hidden",
                    "--glob",
                    "!**/.git/*",
                    "--glob",
                    "!**/node_modules/*",
                    "--glob",
                    "!**/.cache/*",
                }
            end,
            hidden = true,
        },
    },
    extensions = {
        -- Your extension configuration goes here:
        -- extension_name = {
        --   extension_config_key = value,
        -- }
        -- please take a look at the readme of the extension you want to configure
    },
})
