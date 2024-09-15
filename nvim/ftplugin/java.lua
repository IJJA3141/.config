local config = {
	cmd = { "/home/alexe/.local/share/nvim/mason/packages/jdtls/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
}

config["init_options"] = {
	bundles = {
		vim.fn.glob("~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar", 1),
	},
}

require("jdtls").start_or_attach(config)
