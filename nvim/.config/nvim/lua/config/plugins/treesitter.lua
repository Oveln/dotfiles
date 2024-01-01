local M = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
}

M.build = ":TSUpdate"

M.config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
        ensure_installed = {
            "vim",
            "vimdoc",
            "bash",
            "c",
            "cpp",
            "css",
            "dockerfile",
            "html",
            "javascript",
            "json",
            "lua",
            "python",
            "rust",
            "toml",
            "tsx",
            "typescript",
            "yaml",
            "vue",
            "scss",
            "markdown",
            "markdown_inline",
        },
        sync_install = false,
        highlight = {
            enable = true,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
        },
        refactor = {
            highlight_definitions = {
                enable = true,
                disable = {},
            },
            highlight_current_scope = {
                enable = true,
                disable = {},
            },
            smart_rename = {
                enable = true,
                disable = {},
            },
            navigation = {
                enable = true,
                disable = {},
            },
        },
        textobjects = {
            enable = true,
        },
        playground = {
            enable = true,
        },
        rainbow = {
            enable = true,
        },
    })

    vim.o.foldmethod = "expr"
    vim.o.foldexpr = "nvim_treesitter#foldexpr()"
end

return M
