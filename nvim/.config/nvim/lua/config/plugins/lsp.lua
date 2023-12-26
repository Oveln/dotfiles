local M = {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    dependencies = {
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
            },
        },
        { "williamboman/mason-lspconfig.nvim" },
        { "williamboman/mason.nvim" },
        {
            "simrat39/rust-tools.nvim",
        },
    },
}
M.config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
        vim.diagnostic.config({
            severity_sort = true,
            underline = true,
            signs = true,
            virtual_text = false,
            update_in_insert = false,
            float = true,
        })
    end)

    lsp_zero.set_sign_icons({
        error = "✘",
        warn = "▲",
        hint = "⚑",
        info = "»",
    })

    require("mason").setup({})

    local ensure_installed_list = {
        "eslint",
        "rust_analyzer",
        "lua_ls",
        "volar",
        "clangd",
    }

    require("mason-lspconfig").setup({
        ensure_installed = ensure_installed_list,
        handlers = {
            lsp_zero.default_setup,
        },
    })

    local lspconfig = require("lspconfig")
    require("config.lsp.lua").setup(lspconfig, lsp_zero)
    require("config.lsp.web").setup(lspconfig, lsp_zero)
    require("config.lsp.rust").setup()
end

return M
