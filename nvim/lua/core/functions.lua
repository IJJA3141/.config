local M = {}

function M.toggle_trans()
  if vim.g.colors_name == "gruvbox" then
    require "gruvbox".config.transparent_mode = not require "gruvbox".config.transparent_mode
    vim.cmd("colorscheme gruvbox")
  end
end

function M.set_mappings(pair, opts)
  opts = opts or {}

  for mode, binds in pairs(pair) do
    for keys, func in pairs(binds) do
      opts.desc = func[2]
      vim.keymap.set(mode, keys, func[1], opts)
    end
  end
end

function M.del_mappings(pair, opts)
  opts = opts or {}

  for mode, binds in pairs(pair) do
    for keys in pairs(binds) do
      vim.keymap.del(mode, keys, opts)
    end
  end
end

---@param parsers string[] list of parser names
function M.ensure_installed(parsers)
  local alreadyInstalled = require("nvim-treesitter.config").get_installed()
  local parsersToInstall = vim.iter(parsers):filter(
    function(parser)
      return not vim.tbl_contains(alreadyInstalled, parser)
    end
  ):totable()

  require("nvim-treesitter").install(parsersToInstall)
end

function M.theme()
  local colors = require("gruvbox").palette
  return {
    normal = {
      a = { bg = "NONE", fg = colors.light4, gui = "bold" },
      c = { bg = "NONE", fg = colors.light4 },
    },
    insert = {
      a = { bg = "None", fg = colors.bright_blue, gui = "bold" },
      b = { bg = "None", fg = colors.light4 },
      c = { bg = "None", fg = colors.light4 },
    },
    visual = {
      a = { bg = "None", fg = colors.bright_yellow, gui = "bold" },
      b = { bg = "None", fg = colors.light4 },
      c = { bg = "None", fg = colors.light4 },
    },
    replace = {
      a = { bg = "None", fg = colors.bright_red, gui = "bold" },
      b = { bg = "None", fg = colors.light4 },
      c = { bg = "None", fg = colors.light4 },
    },
    command = {
      a = { bg = "None", fg = colors.bright_green, gui = "bold" },
      b = { bg = "None", fg = colors.light4 },
      c = { bg = "None", fg = colors.light4 },
    },
    inactive = {
      a = { bg = "None", fg = colors.light4, gui = "bold" },
      b = { bg = "None", fg = colors.light4 },
      c = { bg = "None", fg = colors.light4 },
    },
  }
end

return M
