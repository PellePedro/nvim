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

require('dap').adapters.go = {
  type = 'executable';
  command = 'node';
  args = {os.getenv('HOME') .. '/.config/nvim/vscode-go/debugAdapter.js'};
}
require('dap').configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = false;
    program = "${file}";
    dlvToolPath = os.getenv('HOME') .. "/bin/dlv"; 
  },
}
