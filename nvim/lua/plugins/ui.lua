return {
  { -- Dashboard
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function()
      local logo = require("config.logo").Wakana_Morinaga_n
      logo = string.rep("\n", 8) .. logo .. "\n\n"

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = vim.split(logo, "\n"),
          -- stylua: ignore
          center = {
            {
              action = "Telescope find_files",
              desc = " Find file",
              icon = " ",
              key = "f"
            },
            {
              action = "Telescope oldfiles",
              desc = " Recent files",
              icon = " ",
              key = "r"
            },
            {
              action = "Telescope live_grep",
              desc = " Find text",
              icon = " ",
              key = "g"
            },
            { action = "e $MYVIMRC", desc = " Config", icon = " ", key = "c" },
            --[[{
              action = 'lua require("persistence").load()',
              desc = " Restore Session",
              icon = " ",
              key = "s"
            },]]
            { action = "Lazy", desc = " Lazy", icon = "󰒲 ", key = "l" },
            { action = "qa", desc = " Quit", icon = " ", key = "q" },
            { action = "Oil", desc = " Oil", icon = "󰉓", key = "e" },
          },
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            return {
              "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
            }
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
      end

      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "DashboardLoaded",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      return opts
    end,
  },
  { -- Statusline
    "nvim-lualine/lualine.nvim",
    lazy = false,
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    },
  },
  { -- Notification
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    config = function()
      require("fidget").setup({
        window = {
          normal_hl = "Comment", -- Base highlight group in the notification window
          blend = 0,        -- Background color opacity in the notification window
          border = "rounded", -- Border around the notification window
          zindex = 45,      -- Stacking priority of the notification window
          max_width = 0,    -- Maximum width of the notification window
          max_height = 0,   -- Maximum height of the notification window
          x_padding = 10,   -- Padding from right edge of window boundary
          y_padding = 10,   -- Padding from bottom edge of window boundary
          relative = "editor",
        },
      })
    end,
  },
  {
    "shortcuts/no-neck-pain.nvim",
    opts = {
      minSideBufferWidth = 25,
      width = 100,
    },
  },

  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({ "*" })
    end,
  },

  {
    "echasnovski/mini.indentscope",
    opts = {
      symbol = "|",
      options = { try_as_border = true },
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
}
