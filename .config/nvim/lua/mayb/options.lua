-- After we set all the plugins we need to set default or initial values for nvim


local Options = {
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

    hlsearch = true, -- highlight all matches on previous search pattern
    ignorecase = true, -- ignore case in search patterns

    splitbelow = true, -- force all horizontal splits to go below current window
    splitright = true, -- force all vertical splits to go to the right of current window

    swapfile = false, -- creates a swapfile

    termguicolors = true, -- set term gui colors (most terminals support this)
    
    updatetime = 100, -- faster completion (4000ms default) 

}

function ApplyAllOptions()
    for k,v in pairs(Options) do
	    vim.api.nvim_set_option_value(k, v, {})
    end
end

ApplyAllOptions()





