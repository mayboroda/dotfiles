vim.api.nvim_create_user_command('BazelScalaMake', function(opts)
  vim.opt_local.makeprg = 'bazel test ' .. opts.args

  vim.opt_local.errorformat = table.concat({
    '%E%f:%l: error: %m',
    '%W%f:%l: warning: %m',
    '%C%.%#',
    '%Z%p^',
    '%-G[%#%.%#',
    '%-GERROR: %.%#',
    '%-GINFO: %.%#',
    '%-GTarget %.%#',
    '%-G%.%# errors found',
    '%-G%.%# warnings found',
  }, ',')

  vim.cmd('make')
  vim.cmd('copen')
end, {
  nargs = '+',
  complete = 'file',
})
