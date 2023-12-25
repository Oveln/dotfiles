local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

vim.keymap.set("n", "<leader>la", ":Lazy<CR>", { noremap = true })

-- Configure lazy.nvim
require("lazy").setup({
    spec = {
        { import = "config.plugins" },
    },
    defaults = { lazy = true, version = false },
    checker = { enabled = true },
})
