-- After we set all the plugins we need to set default or initial values for nvim

-- helper to run vim.cmd with error message
function VimCmd(cmd_string)
    local ok, _ = pcall(vim.cmd, cmd_string)
    if not ok then
        print('vim.cmd `' .. cmd_string .. '` is not correct')
	return
    end
end

-- Set colorscheme
VimCmd('colorscheme rose-pine')

local WindowScope = {
    number = true,
    relativenumber = true,

    clipboard = "unnamedplus",

    -- Use 4 spaces instead of a Tab
    tabstop = 4,
    expandtab = true,
    softtabstop = 4,
    shiftwidth = 4,
    
    -- Foldable with tree-sitter
    foldmethod = "expr",
    foldexpr = "nvim_treesitter#foldexpr()",
    foldenable = false,
}

function ApplyWindowScopeOptions()
    for k,v in pairs(WindowScope) do
	    vim.api.nvim_set_option_value(k, v, {})
    end
end

ApplyWindowScopeOptions()





