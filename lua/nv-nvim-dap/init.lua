-- dap module
require("telescope").load_extension("dap")
local dap = require("dap")

-- vim.fn.sign_define('DapBreakpoint', {text='', texthl='error', linehl='', numhl=''})
-- vim.fn.sign_define('DapLogPoint', {text='⟿', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='⟼', texthl='warning', linehl='debugPC', numhl=''})


-- vim.fn.sign_define('DapBreakpoint', {text='🟥', texthl='', linehl='', numhl=''})
-- vim.fn.sign_define('DapStopped', {text='🟢', texthl='', linehl='', numhl=''})

vim.fn.sign_define('DapBreakpoint', {text='⭕', texthl='DapBreakpoint', linehl='', numhl=''})
vim.fn.sign_define('DapLogPoint', {text='🟡', texthl='DapLogPoint', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='🔴', texthl='DapStopped', linehl='debugPC', numhl=''})


-- virtual text for dap, plugin configuration
-- vim.g.dap_virtual_text = false -- virtual text deactivated (default)
vim.g.dap_virtual_text = true -- show virtual text for current frame (recommended)
-- vim.g.dap_virtual_text = 'all frames' -- request variable values for all frames (experimental)

--require('dap').adapters.go = {
--type = 'executable';
--  command = 'node';
--  args = {os.getenv('HOME') .. '/.vscode-insiders/extensions/golang.go-0.24.0/dist/debugAdapter.js'};
--}


dap.adapters.go = function(callback, config)
    local handle
    local pid_or_err
    local port = 38697
    handle, pid_or_err =
      vim.loop.spawn(
      "dlv",
      {
        args = {"dap", "-l", "127.0.0.1:" .. port},
        detached = true
      },
      function(code)
        handle:close()
        print("Delve exited with exit code: " .. code)
      end
    )
     ----should we wait for delve to start???
    --vim.defer_fn(
    --function()
      --dap.repl.open()
      --callback({type = "server", host = "127.0.0.1", port = port})
    --end,
    --100)

      dap.repl.open()
      callback({type = "server", host = "127.0.0.1", port = port})
end

require('dap').configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = true;
    program = "${file}";
    dlvToolPath = os.getenv('HOME') .. "/bin/dlv";
  },
}
