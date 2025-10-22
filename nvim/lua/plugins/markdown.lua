return {
  -- "MeanderingProgrammer/render-markdown.nvim",
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
  -- ---@module 'render-markdown'
  -- ---@type render.md.UserConfig
  -- opts = {},
  -- ft = { "markdown" }
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  ft = { "markdown" },
  build = "cd app && yarn install",
  config = function()
    vim.g.mkdp_filetypes = { "markdown" }
    vim.g.mkdp_browser = "/bin/firefox-developer-edition"
  end,
}
