return {
    setup = function(lspconfig, lspz)
        local lua_opts = lspz.nvim_lua_ls({})
        lspconfig.lua_ls.setup(lua_opts)
    end,
}
