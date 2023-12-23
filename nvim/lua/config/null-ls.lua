local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
  formatting.clang_format,
  formatting.prettier,
  formatting.prettierd,
  formatting.stylua,
  formatting.beautysh,
  --formatting.shfmt,

  lint.shellcheck,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
