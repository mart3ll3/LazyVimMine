-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    -- break the Tree-sitter link first
    vim.api.nvim_set_hl(0, "@markup.strong", {})

    -- then apply your highlight
    vim.api.nvim_set_hl(0, "@markup.strong", {
      fg = "#fe8019", -- gruvbox orange
      bold = true,
    })
  end,
})

-- Enable active pane highlighting for lazygit with gruvbox theme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "gruvbox",
  callback = function()
    -- Set distinct colors for active vs inactive borders in floating windows (lazygit)
    local colors = {
      inactive = "#504945", -- gruvbox dark gray
      active = "#fe8019", -- gruvbox orange
    }

    -- Inactive border
    vim.api.nvim_set_hl(0, "FloatBorder", { fg = colors.inactive })

    -- Active border - linked to SnacksNotifierBorder which is used for active pane
    vim.api.nvim_set_hl(0, "MatchParen", { fg = colors.active, bold = true })
    vim.api.nvim_set_hl(0, "TelescopePromptTitle", { fg = colors.active })
    vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = colors.active })
  end,
})

-- Trigger the ColorScheme autocmd if gruvbox is already loaded
if vim.g.colors_name == "gruvbox" then
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = "gruvbox" })
end

vim.api.nvim_create_autocmd({
  "BufAdd",
  "BufEnter",
  "BufDelete",
}, {
  callback = function()
    vim.defer_fn(function()
      pcall(require("utils.harpoon_sync").sync_with_bufferline)
    end, 50)
  end,
})
