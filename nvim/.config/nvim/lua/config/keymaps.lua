vim.g.mapleader = " "

local keymap = vim.keymap

local mappings = {
    -- window & split
    { from = "<leader>|", to = "<C-w>v", mode = "n" },
    { from = "<leader>-", to = "<C-w>s", mode = "n" },
    { from = "<leader>nh", to = ":nohl<CR>", mode = "n" },
    { from = "<leader>o", to = "<C-w>o", mode = "n" },
    { from = "<up>", to = ":res -5<CR>", mode = "n" },
    { from = "<down>", to = ":res +5<CR>", mode = "n" },
    { from = "<left>", to = ":vertical resize+5<CR>", mode = "n" },
    { from = "<right>", to = ":vertical resize-5<CR>", mode = "n" },
    -- format
    -- { from = '<leader>i', to = 'gg=G', mode = 'n'}
}

for _, it in ipairs(mappings) do
    keymap.set(it.mode or "n", it.from, it.to, { noremap = true, silent = true })
end
