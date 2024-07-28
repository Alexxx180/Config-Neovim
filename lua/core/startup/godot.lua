function file_exists(name)
   local f = io.open(name, "r")
   return f ~= nil and io.close(f)
end

local project = vim.fn.getcwd() .. '/project.godot'
if file_exists(project) then
    print("Synced to Godot Engine")
    vim.fn.serverstart './godothost'
end
