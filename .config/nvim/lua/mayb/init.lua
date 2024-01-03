LAZY_SPEC_PLUGINS = {}

function registerPlugin(lazySpec)
    table.insert(LAZY_SPEC_PLUGINS, { import = lazySpec })
end

-- helper to run vim.cmd with error message
function VimCmd(cmd_string)
    local ok, _ = pcall(vim.cmd, cmd_string)
    if not ok then
        print('vim.cmd `' .. cmd_string .. '` is not correct')
	return
    end
end



require("mayb.keymaps")
require("mayb.plugins")
require("mayb.options")
require("mayb.lazy")

-- Dump lua table into console
function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end
