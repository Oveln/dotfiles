local rust_tools = require("rust-tools")

return {
    setup = function()
        rust_tools.setup({
            server = {
                on_attach = function(client, bufnr)
                    vim.keymap.set("n", "<leader>ca", rust_tools.hover_actions.hover_actions, { buffer = bufnr })
                end,
            },
        })
    end,
}
