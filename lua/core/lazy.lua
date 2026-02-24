require("lazy").setup({
    -- Package Manager
    {
        "williamboman/mason.nvim",
    },
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },

    -- LSP
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
        },
        lazy = false,
    },

    -- DAP
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "theHamsta/nvim-dap-virtual-text",
            "rcarriga/nvim-dap-ui",
            "mfussenegger/nvim-dap-python",
            "Pocco81/DAPInstall.nvim",
        },
    },

    -- UI
    {
        "goolord/alpha-nvim",
        event = "VimEnter",
    },
    {
        "tadaa/vimade",
        opts = {
            recipe = { "default", { animate = true } },
            fadelevel = 0.5,
        },
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        cmd = "Neotree",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons",
            "MunifTanjim/nui.nvim",
        },
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("notify").setup({
                timeout = 3000,
                stages = "fade_in_slide_out",
                fps = 30,
                max_width = 50,
                minimum_width = 20,
            })
        end,
    },
    {
        "nvim-lualine/lualine.nvim",
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {
        "kshenoy/vim-signature",
    },

    -- Windows Management
    {
        "mrjones2014/smart-splits.nvim",
    },

    -- Completion
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
    },
    {
        "tpope/vim-surround",
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = true,
    },

    -- Debugging
    {
        "folke/trouble.nvim",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
        keys = {
            {
                "<leader>xx",
                "<cmd>Trouble diagnostics toggle<cr>",
                desc = "Diagnostics (Trouble)",
            },
            {
                "<leader>xX",
                "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
                desc = "Buffer Diagnostics (Trouble)",
            },
            {
                "<leader>cs",
                "<cmd>Trouble symbols toggle focus=false<cr>",
                desc = "Symbols (Trouble)",
            },
            {
                "<leader>cl",
                "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
                desc = "LSP Definitions / references / ... (Trouble)",
            },
            {
                "<leader>xL",
                "<cmd>Trouble loclist toggle<cr>",
                desc = "Location List (Trouble)",
            },
            {
                "<leader>xQ",
                "<cmd>Trouble qflist toggle<cr>",
                desc = "Quickfix List (Trouble)",
            },
        },
    },

    -- Snippet
    {
        "L3MON4D3/LuaSnip",
        version = "v2.*",
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-calc",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "neovim/nvim-lspconfig",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
    },

    -- Comments
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    -- Theme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "morhetz/gruvbox",
        lazy = false,
        priority = 1000,
    },
    {
        "joshdick/onedark.vim",
        lazy = false,
        priority = 1000,
    },

    -- Make your life easier
    {
        "mg979/vim-visual-multi",
        branch = "master",
    },
    {
        "romgrk/barbar.nvim",
        dependencies = {
            "lewis6991/gitsigns.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        init = function()
            vim.g.barbar_auto_setup = false
        end,
        opts = {},
    },
    {
        "dense-analysis/ale",
    },
    {
        "folke/which-key.nvim",
    },
    {
        "mbbill/undotree",
    },

    -- UI Polish Plugins
    {
        "stevearc/dressing.nvim",
        event = "VeryLazy",
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = "VeryLazy",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        ft = { "markdown", "org", "norg", "rmd" },
        config = true,
    },

    -- Navigation & Productivity
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            -- optional but recommended
            { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        },
        cmd = "Telescope",
        keys = {
            {
                "<C-p>",
                "<cmd>Telescope find_files<cr>",
                desc = "Telescope Find Files",
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
    },
    {
        "haringsrob/nvim_context_vt",
        event = "BufReadPost",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require("nvim_context_vt").setup({})
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
        "Shatur/neovim-session-manager",
        event = "BufWinEnter",
    },

    -- LSP Enhancements
    {
        "ray-x/lsp_signature.nvim",
        event = "LspAttach",
        config = function()
            require("lsp_signature").setup()
        end,
    },
    {
        "smjonas/inc-rename.nvim",
        cmd = "IncRename",
        config = true,
    },

    -- Search & Replace
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        keys = {
            {
                "<leader>f",
                function()
                    require("spectre").toggle()
                end,
                desc = "Spectre - Search & Replace",
            },
        },
        opts = {},
    },

    -- Copilot
    {
        "github/copilot.vim",
    },
}, {
    concurrency = 8,
    performance = {
        cache = {
            enabled = true,
        },
    },
})
