vim.lsp.config('rust_analyzer', {
  settings = {
    ['rust-analyzer'] = {
      diagnostic = { enable = false },
      assist = { importGranularity = 'module', importPrefix = 'self' },
      cargo = { allFeatures = true, loadOutDirsFromCheck = true },
      procMacro = { enable = true },
    },
  },
})

return {}

