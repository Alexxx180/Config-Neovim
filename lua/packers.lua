local authors = { pckr = 'lewis6991', lazy = 'folke' }

function use_packer(name)
    local path = vim.fn.stdpath("data") .. "/"..name.."/"..name..".nvim"
    local author = authors[name]
    if not vim.loop.fs_stat(path) then
        local repo = "https://github.com/"..author.."/"..name..".nvim.git"
        vim.fn.system({'git', 'clone', '--filter=blob:none', '--branch=stable' repo, path})
    end
    vim.opt.rtp:prepend(pckr_path)
end

use_packer(packer_name)
