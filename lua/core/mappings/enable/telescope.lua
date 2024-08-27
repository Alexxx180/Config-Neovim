function live_grep()
	require('telescope.builtin').live_grep {
		grep_open_files = true,
		prompt_title = 'Live Grep in Open Files',
	}
end

function find_files()
    require('telescope.builtin').find_files {
		cwd = vim.fn.stdpath 'config'
	}
end

function buffer_search()
	local themes = require('telescope.themes')
	builtin.current_buffer_fuzzy_find(
		themes.get_dropdown { winblend = 10, previewer = false, }
	)
end

telescope = {
    builtin = { 
        plugin = nil,
        features = {
            'help_tags', 'keymaps', 'find_files', 'builtin', 'grep_string',
            'live_grep', 'diagnostics', 'resume', 'oldfiles', 'buffers',
        }
    },
    buffer = {
        plugin = {
			buffer_search = buffer_search,
			live_grep = live_grep,
			find_files = find_files
		},
        features = {
            'buffer_search', 'live_grep', 'find_files',
        }
    }
}

function get_telescope_features()
	for _, provider in pairs(telescope) do
		if provider.plugin == nil then
			provider.plugin = require('telescope.builtin')
		end
	end
    return telescope
end

