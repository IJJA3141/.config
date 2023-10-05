local mappings = {}

mappings.custom = {
  n = {
    ["<leader><up>"] = { "<cmd> move -2 <cr>", "Move up"},
    ["<leader><down>"] = { "<cmd> move 1 <cr>", "Move down"},
    ["<leader>tt"] = {function ()
      require('base46').toggle_transparency()
      
    end, "Toggle transparency"},
    ["<leader>sh"]={"<cmd> set list listchars=tab:>\\ ,trail:-,eol:$ <cr>", "Show hidden characters"},
  },
  i = {
    ["<S-up>"]={"<cmd> move -2 <cr>", "Move up"},
    ["<S-down>"]={"<cmd> move 1 <cr>", "Move down"},
  },
}

return mappings
