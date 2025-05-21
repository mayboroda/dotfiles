-- After we set all the plugins we need to set default or initial values for nvim


local Options = {
    number = true,
    relativenumber = true,

    clipboard = "unnamedplus",

    -- Use 2 spaces instead of a Tab
    tabstop = 2,
    expandtab = true,
    softtabstop = 2,
    shiftwidth = 2,

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

    -- :help windows-resize
    equalalways = false, -- window splits are not equals by default

    -- local configs
    exrc = true, -- Enable loading of local .nvimrc, .exrc, or .nvim.lua files
    secure = true, -- Restrict usage of some commands in local config files
}

function ApplyAllOptions()
    for k,v in pairs(Options) do
	    vim.api.nvim_set_option_value(k, v, {})
    end

    -- netrw plugin for Explorer
    vim.g.netrw_liststyle = 3 -- tree style listing
    vim.g.netrw_sizestyle = 'H' -- human-readable (ex. 5K, 4M, 3G)
    vim.g.netrw_banner = 0
    vim.g.netrw_hide = 0 -- show hidden files
    vim.g.netrw_winsize = 80 -- initial size of the new Ex window in percentage

end

ApplyAllOptions()





