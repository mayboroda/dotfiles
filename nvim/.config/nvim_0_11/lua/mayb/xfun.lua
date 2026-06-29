

-- xfun
-- set of functions for running with vim
return {
	cmd = function(cmd_string)
        local ok, _ = pcall(vim.cmd, cmd_string)
        if not ok then
            print('Error on executing vim.cmd ')
            return
		end
    end

-- Dump lua table into console
    tb_dump = function(o)
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
}



