local api = vim.api

api.nvim_create_user_command('Pd', function()
  local cmd = "cd /workspace/www/mcenter/frontend && pnpm dev"
  vim.fn.jobstart(cmd, {
    detach = false,
    pty = true,
    on_stdout = function(job_id, data, event)
      if event == 'stdout' then
        vim.notify('pnpm dev started')
      end
    end
  })
end, {})
