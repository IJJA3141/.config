--- @param template_parameter_list TSNode
--- @return string[]
local function get_tparam(template_parameter_list)
  local tparam = {}

  for parameter in template_parameter_list:iter_children() do
    if #parameter:type() > 1 then
      --- @type TSNode
      local identifier = parameter:field("declarator")[1] or (function()
        for child in parameter:iter_children() do
          if (child:type() == "type_identifier") then
            return child
          end
        end
      end)()

      table.insert(tparam, vim.treesitter.get_node_text(identifier, 0))
    end
  end

  return tparam
end

--- @param parameter_list TSNode
--- @return string[]
local function get_param(parameter_list)
  local param = {}

  for parameter in parameter_list:iter_children() do
    if #parameter:type() > 1 then
      local identifier = parameter:field("declarator")[1]

      --- TODO change

      if identifier:type() ~= "identifier" then
        for child in identifier:iter_children() do
          if child:type() == "identifier" then
            identifier = child
            break
          end
        end
      end

      table.insert(param, vim.treesitter.get_node_text(identifier, 0))
    end
  end

  return param
end

local function gendoc()
  local query = vim.treesitter.query.parse("cpp", "(function_definition) @func")
  local tree = vim.treesitter.get_parser(0, "cpp"):parse()[1]

  local row = vim.api.nvim_win_get_cursor(0)[1]

  local tparam = {}
  local param = {}

  local start
  local dec

  for _, node, _ in query:iter_captures(tree:root(), 0) do
    local parent = node:parent()

    if parent and parent:type() == "template_declaration" then
      if parent:start() <= row and row <= parent:end_() then
        start, dec = parent:start()

        tparam = get_tparam(parent:field("parameters")[1])
        param = get_param(node:field("declarator")[1]:field("parameters")[1])
      end
    elseif node:start() <= row and row <= node:end_() then
      start, dec = node:start()

      param = get_param(node:field("declarator")[1]:field("parameters")[1])
    end
  end

  local padding = string.rep(' ', dec)
  local comment = {
    padding .. "/**",
    padding .. " * ",
    padding .. " * ",
    padding .. " * @brief ",
    padding .. " * ",
  }

  for _, type_parameter in ipairs(tparam) do
    table.insert(comment, padding .. " * @tparam " .. type_parameter)
  end

  if #tparam > 0 then table.insert(comment, padding .. " *") end

  for _, parameter in ipairs(param) do
    table.insert(comment, padding .. " * @param " .. parameter)
  end

  if #param > 0 then table.insert(comment, padding .. " *") end

  table.insert(comment, padding .. " * @return ")
  table.insert(comment, padding .. " */")

  vim.api.nvim_buf_set_lines(0, start, start, false, comment)
  vim.cmd("startinsert")
  vim.api.nvim_win_set_cursor(0, { start + 2, #comment[2] })
end

local callback = function(err, result)
  if err then error(tostring(err)) end
  if not result then return vim.notify('corresponding file cannot be determined') end

  vim.cmd.edit(vim.uri_to_fname(result))
end

return {
  cmd = {
    "clangd",
    "--clang-tidy",
    "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=iwyu",
    "--log=error",
  },

  on_attach = function(client, bufnr)
    local mappings = {}

    print("test")

    mappings.n = {
      ["<leader>ld"] = { gendoc, "Generate documentation" },
      ["ms"] = {
        function()
          client:request("textDocument/switchSourceHeader",
            vim.lsp.util.make_text_document_params(bufnr),
            callback,
            bufnr)
        end,
        "Switch source header"
      },
    }

    require 'core.functions'.set_mappings(mappings, { buffer = bufnr })

    client.server_capabilities.semanticTokensProvider = nil
  end
}
