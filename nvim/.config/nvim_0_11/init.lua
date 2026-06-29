-- helper to run vim.cmd with error message
function VimCmd(cmd_string)
    local ok, _ = pcall(vim.cmd, cmd_string)
    if not ok then
        print('vim.cmd `' .. cmd_string .. '` is not correct')
    end
end


require("mayb")
