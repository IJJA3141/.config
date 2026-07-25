local config = vim.fn.stdpath("config")

return {
  {
    "IJJA3141/color-board.nvim",
    dependencies = { "m00qek/baleia.nvim" },

    lazy = false,
    ---@module "color-board"
    ---@type color-board.config
    opts = {
      dashboards = {
        -- pbmmv
        ["Elsa Doroty amazed"] = {
          path = config .. "/lua/core/assets/pbmmv/Elsa_Dorothy_amazed",
          width = 48,
          height = 40,
          colored = true,
        },

        ["Elsa Doroty embarassed"] = {
          path = config .. "/lua/core/assets/pbmmv/Elsa_Dorothy_embarrassed",
          width = 53,
          height = 40,
          colored = true,
        },

        ["Elsa Doroty put"] = {
          path = config .. "/lua/core/assets/pbmmv/Elsa_Dorothy_put",
          width = 63,
          height = 42,
          colored = true,
        },

        -- Can't defy the lonely gril
        ["守永 和奏"] = {
          path = config .. "/lua/core/assets/can_t_defy_the_lonely_girl/Wakana_Morinaga",
          width = 70,
          height = 36,
          colored = false,
        },

        -- hana ni harashi
        ["Kumako"] = {
          path = config .. "/lua/core/assets/hana_ni_arashi/Kumako",
          width = 65,
          height = 37,
          colored = false,
        },

        ["藤宮 千鳥"] = {
          path = config .. "/lua/core/assets/hana_ni_arashi/Fujimiya_Chidori",
          width = 70,
          height = 33,
          colored = false,
        },

        ["Huh?"] = {
          path = config .. "/lua/core/assets/hana_ni_arashi/Huh?",
          width = 200,
          height = 35,
          colored = false,
        },

        -- How do I get together with my childhood friend?
        ["生駒 未波"] = {
          path = config .. "/lua/core/assets/how_do_i_get_together_with_my_childhood_friend/Minami_Ikoma",
          width = 130,
          height = 40,
          colored = false,
        }
      },

      keymaps = {
        { icon = "", key = "l", description = "Lazy", func = "Lazy" },
        { icon = "", key = "n", description = "Neogit", func = "Neogit" },
        { icon = "󰕛", key = "d", description = "Diffview", func = "Diffview" },
        { icon = "󰉓", key = "e", description = "Oil", func = "Oil" },
        { icon = "", key = "f", description = "Find.file", func = "Telescope find_files" },
        { icon = "", key = "/", description = "Grep.file", func = "Telescope live_grep" },
        { icon = "", key = "c", description = "Open.config", func = "e $MYVIMRC" },
        { icon = "", key = "q", description = "Quit", func = "qa" },
      },
    },
    init = function()
      vim.opt.laststatus = 0
    end,
  },
  {
    "folke/which-key.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    event = { "BufReadPre", "BufNewFile" },
  },
  {
    "echasnovski/mini.indentscope",

    event = { "BufReadPre", "BufNewFile" },

    opts = {
      -- symbol = "|",
      symbol = "│",
      -- symbol = "┃",
      -- symbol = "║",
      -- symbol = "┊",
      options = { try_as_border = false, },
    },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = {
          "help",
          "alpha",
          "oil",
          "lazy",
          "mason",
          "dashboard",
        },

        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    event = "BufRead",

    opts = {
      options = {
        -- theme = require('core.functions').theme,
        -- theme = "vscode",
        theme = "auto",
        component_separators = "",
        globalstatus = true,
        section_separators = "",
        disabled_filetypes = { statusline = { "dashboard", "lazy" } },
        refresh = { statusline = 100, },
      },
      sections = {
        lualine_a = { "mode", "branch", "diff" },
        lualine_b = {},
        lualine_c = {
          "%=",
          { "filename", symbols = { modified = '', readonly = "" } },
          { "diagnostics", sources = { "nvim_diagnostic" }, sections = { "error", "warn", "info", "hint" }, colored = true, }
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
          { 'lsp_status', icon = '', symbols = { done = '', }, },
          "filetype",
          "encoding"
        },
      },
    },
  },
}
