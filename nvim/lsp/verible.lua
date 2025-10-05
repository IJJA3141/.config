vim.lsp.config("verible", {
  -- cmd = { 'verible-verilog-ls', '--rules_config', "/home/alexe/tmp/flag.txt" }
  cmd = { 'verible-verilog-ls', '--rules_config_search' }
})

-- return {
--   cmd = { 'verible-verilog-ls', '--rules_config', "/home/alexe/tmp/flag.txt" }
-- }
