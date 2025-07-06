local home = vim.env.HOME -- Get the home directory

local jdtls = require("jdtls")
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/.cache/jdtls-workspace/" .. project_name

-- Needed for debugging
local bundles =
	{ vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin.jar") }

vim.list_extend(bundles, vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/share/java-test/*.jar", true), "\n"))
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(home .. "/.config/nvim/miscellaneous/vscode-java-test/server/*.jar", true), "\n")
)

-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/share/jdtls/lombok.jar",
		"-Xmx4g",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",

		-- Eclipse jdtls location
		"-jar",
		home .. "/.local/share/nvim/mason/share/jdtls/plugins/org.eclipse.equinox.launcher.jar",
		"-configuration",
		home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
		"-data",
		workspace_dir,
	},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "pom.xml", "build.gradle" }),
	settings = {
		java = {
			home = "/usr/lib/jvm/java-24-openjdk",
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
				runtimes = {
					{
						name = "JavaSE-11",
						path = "/usr/lib/jvm/java-11-openjdk",
					},
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk",
					},
					{
						name = "JavaSE-24",
						path = "/usr/lib/jvm/java-24-openjdk",
					},
				},
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			signatureHelp = { enabled = true },
			format = {
				enabled = true,
				settings = {
					url = home .. "/.config/nvim/miscellaneous/javaStyle.xml",
					-- url = "https://github.com/google/styleguide/blob/gh-pages/intellij-java-google-style.xml",
					-- profile = "GoogleStyle",
				},
			},
			-- completion = {
			-- 	favoriteStaticMembers = {
			-- 		"org.hamcrest.MatcherAssert.assertThat",
			-- 		"org.hamcrest.Matchers.*",
			-- 		"org.hamcrest.CoreMatchers.*",
			-- 		"org.junit.jupiter.api.Assertions.*",
			-- 		"java.util.Objects.requireNonNull",
			-- 		"java.util.Objects.requireNonNullElse",
			-- 		"org.mockito.Mockito.*",
			-- 	},
			-- 	importOrder = {
			-- 		"java",
			-- 		"javax",
			-- 		"com",
			-- 		"org",
			-- 	},
			-- },
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
			codeGeneration = {
				toString = {
					template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
				},
				useBlocks = true,
			},
		},
	},
	-- Needed for auto-completion with method signatures and placeholders
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		-- References the bundles defined above to support Debugging and Unit Testing
		bundles = bundles,
		extendedClientCapabilities = jdtls.extendedClientCapabilities,
	},
}

-- Needed for debugging
config["on_attach"] = function(client, bufnr)
	jdtls.setup_dap({ hotcodereplace = "auto" })
	require("jdtls.dap").setup_dap_main_class_configs()
end

-- This starts a new client & server, or attaches to an existing client & server based on the `root_dir`.
jdtls.start_or_attach(config)
require("core.functions").setMappings(require("core.mappings").ft.java)
