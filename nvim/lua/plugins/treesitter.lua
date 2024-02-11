return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = false, --event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },

    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          use_languagetree = true,
          disable = { "cpp" },
        },

        ensure_installed = {
          "bash",
          "c",
          "cairo",
          "cmake",
          "cpp",
          "css",
          "dot",
          "git_config",
          "git_rebase",
          "gitattributes",
          "gitcommit",
          "gitignore",
          "html",
          "http",
          "hyprlang",
          "javascript",
          "jq",
          "jsdoc",
          "json",
          "json5",
          "jsonc",
          "latex",
          "llvm",
          "lua",
          "luadoc",
          "luap",
          "make",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "scss",
          "ssh_config",
          "typescript",
          "vim",
          "vimdoc",
          "yuck",
        },
      })
    end,
  },
}
