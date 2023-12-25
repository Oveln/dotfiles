local M = {
    "simrat39/rust-tools.nvim",
    event = "BufEnter *.rs",
    dependencies = {
        {
            "VonHeikemen/lsp-zero.nvim",
        },
    },
}

M.config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    local rust_tools = require("rust-tools")

    rust_tools.setup({
        server = {
            on_attach = function(client, bufnr)
                vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
            end,
        },
    })
end

return M
