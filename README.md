# Neovim Configuration

A comprehensive and well-organized Neovim configuration focused on modern development with LSP support, advanced UI components, and productivity enhancements.

## 🚀 Quick Start

### Prerequisites

- Neovim >= 0.8.0
- Git
- A [Nerd Font](https://www.nerdfonts.com/) for proper icon rendering
- Node.js (for certain LSP servers and tools)
- Python (for Python LSP and tools)

### Installation

1. **Backup your existing configuration** (if any):

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository**:

   ```bash
   git clone <your-repo-url> ~/.config/nvim
   ```

3. **Install using the bootstrap script**:

   ```bash
   cd ~/.config/nvim
   ./bootstrap.sh
   ```

   Or force install:

   ```bash
   ./bootstrap.sh --force
   ```

4. **Launch Neovim**:

   ```bash
   nvim
   ```

   On first launch, the plugin manager (Lazy.nvim) will automatically install all plugins and Mason will install language servers, linters, and formatters.

## 📁 Project Structure

```
nvim-config/
├── init.lua                 # Main entry point
├── bootstrap.sh             # Installation script
└── lua/
    ├── core/                # Core Neovim configurations
    │   ├── bootstrap.lua    # Bootstrap setup
    │   ├── lazy.lua         # Plugin definitions with Lazy.nvim
    │   ├── options.lua      # Neovim options and settings
    │   ├── plugins.lua      # Plugin initialization (Mason setup)
    │   ├── autocmd.lua      # Auto commands
    │   └── mappings.lua     # Key mappings
    ├── lang/                # Language-specific configurations
    │   ├── requirements.lua # LSP servers, linters, and formatters list
    │   ├── lsp.lua         # LSP configuration
    │   ├── lint.lua        # Linting configuration
    │   ├── fmt.lua         # Formatting configuration
    │   ├── snippet.lua     # Snippet configuration
    │   └── comments.lua    # Comment utilities
    ├── ui/                  # User interface configurations
    │   ├── theme.lua       # Colorscheme setup
    │   ├── statusline.lua  # Status line configuration
    │   ├── dashboard.lua   # Alpha dashboard
    │   ├── tree.lua        # Neo-tree file explorer
    │   ├── commandbar.lua  # Noice command bar
    │   ├── comments.lua    # Comment highlighting
    │   └── indent.lua      # Indentation guides
    ├── plugins/             # Individual plugin configurations
    │   ├── neo-tree.lua    # Neo-tree specific config (references ui/tree.lua)
    │   └── treesitter.lua  # Treesitter config
    └── helper/              # Helper utilities
        └── sessions.lua    # Session management
```

## 🔧 Configuration Overview

### Core Features

- **Leader Key**: `;` (semicolon)
- **Local Leader**: `<Space>`
- **Plugin Manager**: [Lazy.nvim](https://github.com/folke/lazy.nvim)
- **Package Manager**: [Mason.nvim](https://github.com/williamboman/mason.nvim)
- **Themes**: Tokyo Night (Night variant) and Gruvbox

### Key Settings

- **Indentation**: 4 spaces, expandtab enabled
- **Line Numbers**: Relative numbering enabled
- **Clipboard**: System clipboard integration
- **Mouse Support**: Enabled
- **Auto-completion**: Enhanced with nvim-cmp
- **Persistent Undo**: Disabled (can be enabled by changing `undofile = true`)

## 🔌 Installed Plugins

### Package Management

- **mason.nvim** - Portable package manager for LSP servers, linters, and formatters
- **mason-tool-installer.nvim** - Automatic tool installation
- **mason-lspconfig.nvim** - LSP server management

### Language Support & LSP

- **nvim-lspconfig** - Neovim LSP configuration
- **nvim-cmp** - Autocompletion engine with multiple sources:
  - `cmp-buffer` - Buffer completions
  - `cmp-nvim-lsp` - LSP completions
  - `cmp-path` - Path completions
  - `cmp-nvim-lua` - Lua API completions
  - `cmp-cmdline` - Command line completions
- **none-ls.nvim** - Inject external linters/formatters via a unified LSP
- **lsp_signature.nvim** - Inline function signature help
- **inc-rename.nvim** - Live, incremental LSP renaming

#### Supported Language Servers

- **clangd** - C/C++
- **cmake** - CMake
- **cssls** - CSS
- **bashls** - Bash
- **pyright** - Python
- **eslint** - JavaScript/TypeScript linting
- **ts_ls** - TypeScript/JavaScript
- **tailwindcss** - Tailwind CSS
- **intelephense** - PHP

#### Linters

- **ast-grep** - Multi-language structural search
- **stylelint** - CSS/SCSS
- **eslint_d** - JavaScript/TypeScript (fast)
- **markdownlint** - Markdown
- **flake8** - Python
- **shellcheck** - Shell scripts
- **vint** - Vimscript
- **yamllint** - YAML
- **phpstan** - PHP

#### Formatters

- **clang-format** - C/C++
- **prettier** - Web technologies
- **google-java-format** - Java
- **ktlint** - Kotlin
- **latexindent** - LaTeX
- **black** - Python
- **shfmt** - Shell scripts
- **stylua** - Lua

### Debugging

- **nvim-dap** - Debug Adapter Protocol client
- **nvim-dap-ui** - UI for nvim-dap
- **nvim-dap-virtual-text** - Virtual text for debugging
- **nvim-dap-python** - Python debugging support
- **trouble.nvim** - Diagnostics and quickfix list

### Code Intelligence

- **nvim-treesitter** - Syntax highlighting and text objects
- **LuaSnip** - Snippet engine
- **nvim-lint** - Asynchronous linting
- **formatter.nvim** - Code formatting (with LSP formatting integration)

### UI & Interface

- **alpha-nvim** - Dashboard/start screen
- **neo-tree.nvim** - File explorer with modern UI
- **lualine.nvim** - Status line
- **noice.nvim** - Enhanced UI for messages, cmdline, and popupmenu
- **nvim-notify** - Notification manager
- **indent-blankline.nvim** - Indentation guides
- **tokyonight.nvim** - Colorscheme
- **gruvbox.nvim** - Alternative colorscheme
- **barbar.nvim** - Tab bar
- **which-key.nvim** - Key binding hints
- **dressing.nvim** - Better vim.ui pop-ups
- **tint.nvim** - Dim inactive windows
- **nvim-colorizer.lua** - Inline colour previews
- **headlines.nvim** - Pretty markdown/Org headers

### Code Editing & Navigation

- **todo-comments.nvim** - Highlight and search TODO comments
- **vim-surround** - Surround text objects
- **nvim-autopairs** - Auto-close brackets and quotes
- **vim-visual-multi** - Multiple cursors
- **vim-signature** - Mark visualization
- **flash.nvim** - Lightning-fast jump/search
- **nvim-context-vt** - Shows current code context at top

### Productivity Tools

- **fzf** - Fuzzy finder (fallback)
- **telescope.nvim** - Extensible fuzzy finder & pickers
- **harpoon** - Quick file bookmarking & navigation
- **neovim-session-manager** - Auto save/restore sessions
- **nvim-spectre** - Search & replace across multiple files
- **ale** - Asynchronous Lint Engine
- **dense-analysis/ale** - Additional linting and fixing

## ⌨️ Key Mappings

The configuration uses `;` as the leader key and includes mappings for:

### Trouble (Diagnostics)

- `<leader>xx` - Toggle diagnostics
- `<leader>xX` - Toggle buffer diagnostics
- `<leader>cs` - Toggle symbols
- `<leader>cl` - Toggle LSP definitions/references
- `<leader>xL` - Toggle location list
- `<leader>xQ` - Toggle quickfix list

### File Operations

- `<C-p>` - Telescope file finder
- `<leader>/` - Live grep with Telescope
- `<leader>fb` - List open buffers with Telescope
- `<leader>fh` - Help tags picker
- `<leader>f` - Global search & replace (Spectre)
- `<leader>e` - Toggle Neo-tree file explorer
- `<leader>r` - Incremental LSP rename
- `<leader>ca` - LSP code actions

### Harpoon

- `<leader>ha` - Add file to Harpoon list
- `<leader>hm` - Toggle Harpoon menu
- `<leader>h1` … `<leader>h4` - Jump to files 1-4

### Buffer Management

- `<leader>p` - Buffer pick (interactive buffer selection)
- `<leader>c` - Close current buffer
- `<leader>,` - Previous buffer
- `<leader>.` - Next buffer
- `<leader><` - Move buffer left
- `<leader>>` - Move buffer right

_For complete key mappings, see `lua/core/mappings.lua`_

## 🛠️ Customization

### Adding New Plugins

1. Add the plugin to `lua/core/lazy.lua`:

   ```lua
   {
       "author/plugin-name",
       config = function()
           -- Plugin configuration
       end
   }
   ```

2. Create a specific configuration file in appropriate directory:
   - `lua/plugins/` for plugin-specific configs
   - `lua/ui/` for UI-related plugins
   - `lua/lang/` for language-related plugins

### Adding Language Support

1. Add LSP server to `lua/lang/requirements.lua` in the `M.lsps` table
2. Add corresponding linter to `M.linters` and `M.linters_by_ft`
3. Add formatter to `M.fmts`
4. The tools will be automatically installed on next Neovim startup

### Changing Theme

Modify `lua/ui/theme.lua` to use a different colorscheme:

```lua
vim.cmd([[colorscheme your-preferred-theme]])
```

## 🔍 Troubleshooting

### Plugin Installation Issues

- Run `:Lazy sync` to synchronize plugins
- Run `:Lazy clean` to remove unused plugins
- Check `:Lazy log` for installation logs

### LSP Issues

- Run `:Mason` to check installed tools
- Use `:LspInfo` to check LSP server status
- Run `:MasonToolsInstall` to reinstall tools

### Performance Issues

- Use `:Lazy profile` to check plugin loading times
- Consider lazy-loading plugins with `lazy = true` option
