local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local lint = null_ls.builtins.diagnostics

local sources = {
	formatting.beautysh,
	formatting.black,
	formatting.clang_format,
	formatting.prettier,
	formatting.prettierd,
	formatting.stylua,
	--formatting.shfmt,

	--lint.cpplint, annoying
	lint.luacheck,
	lint.shellcheck,
}

null_ls.setup({
	debug = true,
	sources = sources,
})
