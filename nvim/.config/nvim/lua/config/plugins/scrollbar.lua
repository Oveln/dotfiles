local M = {
    "petertriho/nvim-scrollbar",
    -- lazy = false,
    event = "UIEnter",
    dependencies = {
        "tokyonight.nvim",
        "kevinhwang91/nvim-hlslens",
    },
}

M.config = function()
    local colors = require("tokyonight.colors").setup()
    require("scrollbar.handlers.search").setup({})
    require("scrollbar.handlers.gitsigns").setup()
    require("scrollbar").setup({
        show = true,
        handle = {
            color = colors.bg_highlight,
        },
        marks = {
            Search = { color = colors.orange },
            Error = { color = colors.error },
            Warn = { color = colors.warning },
            Info = { color = colors.info },
            Hint = { color = colors.hint },
            Misc = { color = colors.purple },
        },
    })
end

return M
