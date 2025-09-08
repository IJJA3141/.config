return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },

  cmd = { "Oil" },
  keys = { { "<leader>e", "<cmd> Oil --float <cr>", desc = "Oil on water" } },

  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    prompt_save_on_select_new_entry = false,
    skip_confirm_for_simple_edits = true,
    default_file_explorer = true,
    delete_to_trash = true,

    use_default_keymaps = false,
    keymaps = {
      ["q"] = { "actions.close", mode = "n" },
      ["<Esc>"] = { "actions.close", mode = "n" },

      ["<Enter>"] = "actions.select",
      ["<S-Enter>"] = { "actions.select", opts = { vertical = true } },
      ["<C-Enter>"] = { "actions.select", opts = { horizontal = true } },

      ["<C-p>"] = "actions.preview",
      ["<C-l>"] = "actions.refresh",

      ["-"] = { "actions.parent", mode = "n" },
      ["_"] = { "actions.open_cwd", mode = "n" },

      ["g?"] = { "actions.show_help", mode = "n" },
      ["gx"] = "actions.open_external",
      ["g."] = { "actions.toggle_hidden", mode = "n" },
      ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },

    view_options = {
      show_hidden = true,

      is_hidden_file = function(name, bufnr)
        local m = name:match("^%.")
        return m ~= nil
      end,
      is_always_hidden = function(name, bufnr)
        if name == ".git" then return true end
        return false
      end,
    },

    float = {
      padding = 2,
      max_width = 60,
      max_height = 0.8,
      preview_split = "below",
    },
  }
}
