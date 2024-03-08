local o = vim.o

o.termguicolors = true
vim.env.NVIM_TUI_ENABLE_TRUE_COLOR = 1

o.autochdir = true
o.number = true
-- o.relativenumber = true
o.cursorline = true
o.expandtab = true
o.tabstop = 4
o.smarttab = true
o.shiftwidth = 4
o.smartindent = true

o.list = true
o.listchars = "tab:|\\ ,trail:▫"
o.scrolloff = 4
o.ttimeoutlen = 0
o.timeout = false
o.viewoptions = "cursor,folds,slash,unix"

o.wrap = true
o.textwidth = 0
o.indentexpr = ""
-- will be reset by treesitter
o.foldmethod = "indent"
-- dont fold by default
o.foldlevel = 99
o.foldenable = true
o.formatoptions = o.formatoptions:gsub("tc", "")
o.splitright = true
o.splitbelow = true
o.showmode = false
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.shortmess = o.shortmess .. "c"
o.inccommand = "split"

o.completeopt = "menuone,noinsert,noselect,preview"

o.visualbell = true
--o.colorcolumn = '100'
o.updatetime = 100
o.virtualedit = "block"

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, { pattern = "*.md", command = "setlocal spell" })
vim.api.nvim_create_autocmd("BufEnter", { pattern = "*", command = "silent! lcd %:p:h" })
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
