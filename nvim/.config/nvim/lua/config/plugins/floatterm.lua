local M = {
    "numToStr/FTerm.nvim",
    event = "VeryLazy",
}

M.config = function()
    local fterm = require("FTerm")
    fterm.setup({
        border = "double",
        -- dimensions = {
        --     height = 0.8,
        --     width = 0.9,
        -- },
        auto_close = true,
    })

    vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
    vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
end

return M
