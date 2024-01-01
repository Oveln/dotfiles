local M = {
    "VonHeikemen/lsp-zero.nvim",
    event = "VeryLazy",
    branch = "v3.x",
    dependencies = {
        {
            "neovim/nvim-lspconfig",
            dependencies = {
                { "hrsh7th/cmp-nvim-lsp" },
                {
                    "nvimdev/lspsaga.nvim",
                    config = function()
                        require("lspsaga").setup({
                            outline = {
                                -- layout = "float",
                            },
                        })
                    end,
                    dependencies = {
                        "nvim-treesitter/nvim-treesitter", -- optional
                        "nvim-tree/nvim-web-devicons", -- optional
                    },
                },
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
        local keymap = vim.keymap
        local keymap_opts = { noremap = true, silent = true, buffer = bufnr }
        keymap.set("n", "gd", ":Lspsaga peek_definition<CR>", keymap_opts)
        keymap.set("n", "go", ":Lspsaga peek_type_definition<CR>", keymap_opts)
        -- map.set("n", "<leader>gd", ":Lspsaga goto_definition<CR>", map_opts)
        -- map.set("n", "<leader>gt", ":Lspsaga goto_type_definition<CR>", map_opts)
        keymap.set("n", "K", ":Lspsaga hover_doc<CR>", keymap_opts)
        keymap.set("n", "ga", ":Lspsaga code_action<CR>", keymap_opts)
        keymap.set("n", "gi", ":Lspsaga finder imp<CR>", keymap_opts)
        keymap.set("n", "gf", ":Lspsaga finder<CR>", keymap_opts)
        keymap.set("n", "gr", ":Lspsaga rename<CR>", keymap_opts)
        keymap.set("n", "gO", ":Lspsaga outline<CR>", keymap_opts)
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
    require("config.lsp.c_cpp").setup(lspconfig, lsp_zero)
end

return M
