local M = {
    "mrcjkb/rustaceanvim",
    version = "^4", -- Recommended
    ft = { "rust" },
    dependencies = {
        "VonHeikemen/lsp-zero.nvim",
    },
    event = "VeryLazy",
}

M.init = require("config.lsp.rust").setup()

return M
