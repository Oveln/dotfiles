local M = {
    "VonHeikemen/lsp-zero.nvim",
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
    },
}
M.config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(_, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require("mason").setup({})
    require("mason-lspconfig").setup({
        handlers = {
            lsp_zero.default_setup,
        },
    })

    local lspconfig = require("lspconfig")
    require("config.lsp.lua").setup(lspconfig, lsp_zero)
end

return M
