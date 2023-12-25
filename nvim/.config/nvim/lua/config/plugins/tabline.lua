-- local M = {
--     'akinsho/bufferline.nvim',
--     version = '*',
--     lazy = false,
--     dependencies = {
--         'kyazdani42/nvim-web-devicons',
--     },
-- }
--
-- M.config = function ()
--     local bufferline = require("bufferline")
--
--     --bufferline setup
--     bufferline.setup{}
--     -- keymap configuration
--     vim.keymap.set('n', 'N', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
--     vim.keymap.set('n', 'M', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
--     vim.keymap.set('n', '<leader>xm', ':BufferLineCloseRight<CR>', { noremap = true, silent = true })
--     vim.keymap.set('n', '<leader>xn', ':BufferLineCloseLeft<CR>', { noremap = true, silent = true })
--     vim.keymap.set('n', '<leader>xo', ':BufferLineCloseOther<CR>', { noremap = true, silent = true })
-- end
--
-- use barbar
local M = {
    "romgrk/barbar.nvim",
    dependencies = {
        "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
        "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    },
    -- init = function ()
    -- vim.g.barbar_auto_setup = false
    -- end
    event = "UIEnter",
}

M.config = function()
    local barbar = require("barbar")
    vim.g.barbar_auto_setup = false

    local keymap = {
        { mode = "n", key = "N", cmd = ":BufferPrevious<CR>" },
        { mode = "n", key = "M", cmd = ":BufferNext<CR>" },
        { mode = "n", key = "{", cmd = ":BufferMovePrevious<CR>" },
        { mode = "n", key = "}", cmd = ":BufferMoveNext<CR>" },
        { mode = "n", key = "<leader>xx", cmd = ":BufferClose<CR>" },
    }

    for _, it in ipairs(keymap) do
        vim.keymap.set(it.mode, it.key, it.cmd, { noremap = true, silent = true })
    end
end

return M
