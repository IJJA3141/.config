return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets", },
  version = "1.*",

  event = { "BufReadPre", "BufNewFile" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    signature = {
      enabled = true,
      window = { show_documentation = true },
    },

    appearance = {
      use_nvim_cmp_as_default = false,
      nerd_font_variant = "mono",
    },

    sources = {
      default = { "lazydev", "lsp", "path", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
      },
    },

    keymap = {
      preset = "none",

      ["<S-enter>"] = { "select_next", "fallback" },
      ["<C-enter>"] = { "select_prev" },
      ["<S-tab>"] = { "accept" },
      ['<C-space>'] = { "show", },
    },
  },

  opts_extend = { "sources.default" }
}
