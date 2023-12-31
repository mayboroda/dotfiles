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
}

