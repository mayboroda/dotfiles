local workspace_prefix = ""
local function get_workspace_root()
  vim.system(
    { "bazel", "info", "workspace", "--noshow_progress"},
    {text = true},
    function(result)
      if result.code ~= 0 then
        vim.schedule(function()
          vim.notify(result.stderr, vim.log.levels.ERROR)
        end)
        return
      end
      workspace_prefix = vim.trim(result.stdout)
    end)
end

local function get_directory_label()
  local file_dir = vim.fn.expand("%:p:h")
  if file_dir == "" then
    return nil
  end

  local ws = workspace_prefix
  if not ws then
    return nil
  end

  if file_dir:sub(1, #ws) ~= ws then
    return nil
  end

  local rel = file_dir:sub(#ws + 2) -- skip workspace + "/"
  return "//" .. rel
end


local function bazel_query(query, callback)
    vim.system({
    "bazel",
    "query",
    query,
  }, { text = true }, function(result)
    if result.code ~= 0 then
      vim.schedule(function()
        vim.notify(result.stderr, vim.log.levels.ERROR)
      end)
      return
    end
    local targets = vim.split(result.stdout, "\n", { trimempty = true })

    vim.schedule(function()
      callback(targets)
    end)
  end
)
end

-- Get only runnable test targets
-- bazel query 'kind("scala_junit_test rule", rdeps(//cd/rube-goldberg/test/cd/tx/action/judge/..., //cd/rube-goldberg/test/cd/tx/action/judge:JudgeRulesTest.scala))'

local function bazel_targets_for_current_file(callback)
  local current_file = vim.fn.expand("%:t") -- Path to a current filename only
  local query = string.format('attr(srcs, "%s", //...)', current_file)
  bazel_query(query, callback)
end

local function bazel_test_targets_for_current_file(callback)
  local current_file = vim.fn.expand("%:t") -- Path to a current filename only
  local current_dir_label = get_directory_label()
  local query = string.format('kind("scala_junit_test rule", rdeps(%s/..., %s:%s))', current_dir_label, current_dir_label, current_file)
  print(query)
  bazel_query(query, callback)
end

local function bazel_test_current_file()
  bazel_test_targets_for_current_file(function(targets)
    if vim.tbl_isempty(targets) then
      vim.notify("No Bazel targets found for current file", vim.log.levels.WARN)
      return
    end
    vim.ui.select(targets, {
      prompt = "Run Bazel test:",
    }, function(choice)
      if not choice then
        return
      end
      vim.cmd("split | terminal bazel test " .. vim.fn.shellescape(choice))
    end)
  end)
end

vim.keymap.set("n", "<leader>rt", bazel_test_current_file, {
  desc = "Bazel test current file",
})


vim.api.nvim_create_user_command('BazelWorkspace', function()
  get_workspace_root()
  vim.notify(workspace_prefix)
end, {})

-- 
vim.api.nvim_create_user_command('BazelDirTarget', function()
  print(get_directory_label())
  bazel_test_targets_for_current_file()
end, {})

vim.api.nvim_create_user_command('BazelTestFile', function()
  print(get_directory_label())
  bazel_test_current_file()
end, {})

