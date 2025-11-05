-- Useful reference: https://www.johntobin.ie/blog/debugging_in_neovim_with_nvim-dap/
return {
  'mfussenegger/nvim-dap',
  lazy = true,
  keys = {
    {
      '<leader>db',
      function()
        require('dap').toggle_breakpoint()
      end,
      desc = 'DAP Toggle Breakpoint',
    },
    {
      '<leader>dc',
      function()
        require('dap').continue()
      end,
      desc = 'DAP Continue',
    },
    {
      '<leader>dC',
      function()
        require('dap').run_to_cursor()
      end,
      desc = 'Run to Cursor',
    },
    {
      '<leader>dT',
      function()
        require('dap').terminate()
      end,
      desc = 'Terminate',
    },
    {
      '<leader>du',
      function()
        require('dapui').toggle()
      end,
      desc = 'DAP UI Toggle',
    },
  },
  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dapvt = require 'nvim-dap-virtual-text'

    dapui.setup()
    dapvt.setup()

    -- automatically open/close UI
    dap.listeners.before.event_initialized['dapui_open'] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated['dapui_close'] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited['dapui_close'] = function()
      dapui.close()
    end

    dap.configurations.go = dap.configurations.go or {}
    table.insert(dap.configurations.go, {
      type = 'go',
      name = 'Attach (pick process)',
      request = 'attach',
      processId = require('dap.utils').pick_process,
    })
  end,
}
