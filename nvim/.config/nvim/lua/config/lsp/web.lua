return {
    setup = function(lspconfig, lspz)
        local eslint_opts = {
            on_attach = function(_, bufnr)
                vim.api.nvim_create_autocmd("BufWritePre", {
                    buffer = bufnr,
                    command = "EslintFixAll",
                })
            end,
        }
        lspconfig.eslint.setup(eslint_opts)
        local volar_opts = {
            filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
        }
        lspconfig.volar.setup(volar_opts)
    end,
}
