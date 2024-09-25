-- The idea:
-- Gather all plugin specifications in one place and path it to lazy
local LAZY_SPEC_PLUGINS = {}

-- Adds a LazySpec to a table
-- See more about LazySpec [here](https://lazy.folke.io/spec#spec-setup)
local function registerPlugin(lazySpec)
    table.insert(LAZY_SPEC_PLUGINS, { import = lazySpec })
end

-- List of all plugins
registerPlugin("mayb.plugins.colorscheme")
registerPlugin("mayb.plugins.treesitter")
registerPlugin("mayb.plugins.lsp")

return LAZY_SPEC_PLUGINS

