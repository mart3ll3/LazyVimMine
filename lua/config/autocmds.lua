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
