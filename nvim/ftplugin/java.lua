local config = {
	cmd = { "/home/alexe/.local/share/nvim/mason/packages/jdtls/jdtls" },
	root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),
	settings = {
		java = {
			format = {
				settings = { url = "~/.config/nvim/miscellaneous/javaStyle.xml" },
			},
			configuration = {
				runtimes = {
					{
						name = "JavaSE-17",
						path = "/usr/lib/jvm/java-17-openjdk/",
					},
					{
						name = "JavaSE-23",
						path = "/usr/lib/jvm/java-23-openjdk/",
					},
				},
			},
		},
	},
}

config["init_options"] = {
	bundles = {
		vim.fn.glob("~/.local/share/nvim/mason/share/java-debug-adapter/com.microsoft.java.debug.plugin-*.jar", 1),
	},
}

require("jdtls").start_or_attach(config)
require("core.functions").setMappings(require("core.mappings").ft.java)
