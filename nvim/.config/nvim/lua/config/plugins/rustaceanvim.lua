local M = {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    dependencies = {
        --     "VonHeikemen/lsp-zero.nvim",
        "neovim/nvim-lspconfig",
    },
    lazy = false,
}

M.init = require("config.lsp.rust").setup()

return M
