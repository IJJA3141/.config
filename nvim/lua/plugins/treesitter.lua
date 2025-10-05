return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = 'main',
    build = ':TSUpdate',

    lazy = false, -- <-- doc
    init = function()
      -- auto-install
      require("core.functions").ensure_installed({
        "lua",
        "luadoc",

        "cmake",
        "cpp",
        "c",

        "go",

        "java",
        "scala",
      })

      -- auto-update
      require "nvim-treesitter".update()

      -- auto-start highlights & indentation
      vim.api.nvim_create_autocmd("FileType", {
        desc = "User: enable treesitter highlighting",
        callback = function(ctx)
          -- highlights
          local hasStarted = pcall(vim.treesitter.start) -- errors for filetypes with no parser

          -- indent
          local noIndent = {}
          if hasStarted and not vim.list_contains(noIndent, ctx.match) then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end
  },
}
