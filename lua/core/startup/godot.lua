-- Enable neovim to be the external editor for Godot, if the cwd has a project.godot file
if vim.fn.filereadable(vim.fn.getcwd() .. '/project.godot') == 1 then
  local address = './godot.pipe'
  if vim.fn.has 'win32' == 1 then address = '127.0.0.1:6004' end
  vim.fn.serverstart(address)
end

--[=[ Godot Engine Neovim as External Editor
  -   Exec Path: nvim
  -   Exec Flags: --server 127.0.0.1:6004 --remote-send "<esc>:n {file}<CR>:call cursor({line},{col})<CR>"
]=]-- Config
