local M = {
    "Bekaboo/dropbar.nvim",
    -- event = "UIEnter",
}

M.config = function()
    local bar = require("dropbar")
    local barapi = require("dropbar.api")

    vim.keymap.set("n", "<leader>;", barapi.pick)
    vim.keymap.set("n", "[c", barapi.goto_context_start)
    vim.keymap.set("n", "]c", barapi.select_next_context)

    bar.setup({})
end

return M
