local config = require("session_manager.config")

require("session_manager").setup({
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_filetypes = { "gitcommit", "gitrebase" },
    autosave_only_in_session = false,
    autoload_mode = {
        config.AutoloadMode.GitSession,
        config.AutoloadMode.LastSession,
        config.AutoloadMode.CurrentDir,
    },
})
