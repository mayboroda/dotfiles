-- After we set all the plugins we need to set default or initial values for nvim

local Options = {
    number = true,
    relativenumber = true,

    clipboard = 'unnamedplus',

    -- Use 2 spaces instead of a Tab
    tabstop = 2,
    expandtab = true,
    softtabstop = 2,
    shiftwidth = 2,

    -- Foldable with tree-sitter
    foldmethod = 'expr',
    foldexpr = 'nvim_treesitter#foldexpr()',
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
    -- Custom status line
    statusline =table.concat({
      '[%n]',        -- buffer number
      ' %f',         -- file path (relative); to truncate filename: `%<%f`
      ' %m',         -- [+] if modified
      ' %r',         -- [RO] if read-only

      '%=',          -- split: left | right

      ' %l:%c',      -- line:column
      ' %P',         -- percentage through file (Top / 45% / Bot)
    }),
    smoothscroll = true,
    confirm = true,

    -- Replaces Vim’s default grep with ripgrep (rg)
    grepprg = 'rg --vimgrep --no-messages --smart-case',
}

function ApplyAllOptions()
    for k,v in pairs(Options) do
	    vim.api.nvim_set_option_value(k, v, {})
    end

    -- Extra appends
    -- Enables fuzzy matching for command-line completion (:e, :find, :cd, etc.)
    -- For example :e sufi => :e src/utils/file.lua
    vim.opt.wildoptions:append { 'fuzzy' }
    -- Search recursively in all subdirectories when using file-finding commands.
    vim.opt.path:append { '**' }
end

ApplyAllOptions()

