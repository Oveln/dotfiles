return {
    setup = function(lspconfig, lspz)
        local lua_opts = lspz.nvim_lua_ls({
            single_file_support = false,
            on_attach = function(_, _) end,
        })
        lspconfig.lua_ls.setup(lua_opts)
    end,
}
