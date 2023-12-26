local util = require("formatter.util")

return function()
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
end
