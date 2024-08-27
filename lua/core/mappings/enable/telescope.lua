telescope = {
    builtin = { 
        plugin = nil,
        features = {
            'help_tags', 'keymaps', 'find_files', 'builtin', 'grep_string',
            'live_grep', 'diagnostics', 'resume', 'oldfiles', 'buffers',
        }
    },
    buffer = {
        plugin = nil,
        features = {
            'buffer_search', 'live_grep', 'find_files',
        }
    }
}

function get_telescope_features()
    if telescope.builtin.plugin == nil then
        for name, _ in pairs(telescope) do
            telescope[name].plugin = require('telescope.builtin')
        end
    end
    return telescope
end
