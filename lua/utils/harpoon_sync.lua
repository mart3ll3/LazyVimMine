local M = {}

local harpoon = require("harpoon")
local list = harpoon:list()

function M.sync_with_bufferline()
  list:clear()

  local ok, state = pcall(require, "bufferline.state")
  if not ok then
    return
  end

  for _, component in ipairs(state.components) do
    local buf = component.id
    if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].buflisted and vim.api.nvim_buf_get_name(buf) ~= "" then
      list:add({
        value = vim.api.nvim_buf_get_name(buf),
      })
    end
  end
end

return M
