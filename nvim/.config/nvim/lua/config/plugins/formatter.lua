local M = {
    "mhartington/formatter.nvim",
    event = "BufWinEnter",
}

M.config = function()
    local formatter = require("formatter")
    local util = require("formatter.util")
    local types = require("formatter.filetypes")

    formatter.setup({
        logging = true,
        log_level = vim.log.levels.WARN,
        filetype = {
            lua = {
                function()
                    return {
                        exe = "stylua",
                        args = {
                            "--search-parent-directories",
                            "--indent-type=Spaces",
                            "--stdin-filepath",
                            util.escape_path(util.get_current_buffer_file_path()),
                            "--",
                            "-",
                        },
                        stdin = true,
                    }
                end,
            },
            vue = {
                types.vue.prettier,
            },
            typescript = {
                types.typescript.prettier,
            },
            javascript = {
                types.javascript.prettier,
            },
            html = {
                types.html.prettier,
            },
            css = {
                types.css.prettier,
            },
            markdown = {
                types.markdown.prettier,
            },

        },
    })

    vim.keymap.set("n", "<leader>i", ":Format<CR>", { noremap = true, silent = true })
    vim.api.nvim_create_augroup("__formatter__", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePost", {
        group = "__formatter__",
        command = ":FormatWrite",
    })
end

return M
