return {
  {
    "ellisonleao/gruvbox.nvim",

    opts = {
      bold = false,
      alpha = true,
      terminal_colors = true,
      transparent_mode = true,
      ovverrides = {
        StatusLine = { fg = "NONE", bg = "NONE" },
        StatusLineNC = { fg = "NONE", bg = "NONE" },
      }
    },

  },
  {
    "folke/tokyonight.nvim",

    opts = {}
  },
  {
    "ribru17/bamboo.nvim",

    opts = {
      style = 'multiplex'
    }
  },
  {
    "rebelot/kanagawa.nvim",

    opts = {
      transparent = false,
      theme = "dragon", -- wave dragon lotus
      background = {
        dark = "dragon",
        light = "dragon"
      },

      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none", -- LineNr, SignColumn, FoldColumn, etc.
            },
          },
        }
      },

      -- fix transparency
      overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle         = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal  = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder  = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          --
          -- LineNr                 = { bg = "none" },
          -- CursorLineNr           = { bg = "none" },
          -- SignColumn             = { bg = "none" },
          -- FoldColumn             = { bg = "none" },
          -- LineNrAbove            = { bg = "none" },
          -- LineNrBelow            = { bg = "none" },
          -- EndOfBuffer            = { bg = "none" },
        }
      end,
    }
  },
  {
    "jpwol/thorn.nvim",

    opts = {
      theme = 'dark',     -- light dark
      background = "warm" -- warm cold
    }
  },
  {
    "Mofiqul/vscode.nvim",

    opts = {
      style = 'dark',
      transparent = false,
    },
  },
}
