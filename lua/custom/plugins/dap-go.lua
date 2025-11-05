return {
  {
    'leoluz/nvim-dap-go',
    ft = 'go',
    dependencies = { 'mfussenegger/nvim-dap' },
    opts = { delve = { initialize_timeout_sec = 20, port = '${port}' } },
  },
}
