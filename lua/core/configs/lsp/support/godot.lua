-- GDscript not listed in Mason. Add manually
function add_gdscript(features)
    require("core.configs.os")
    local gdconfig = {
        settings = {},
        capabilities = features,
    }
    if is_windows then
        local port = os.getenv 'GDScript_Port' or '6005'
        gdconfig.cmd = { 'ncat', 'localhost', port }
    end
    return gdconfig
end
