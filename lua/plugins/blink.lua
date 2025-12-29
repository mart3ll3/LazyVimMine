--if true then
--  return {}
-- end
return {
  "saghen/blink.cmp",
  dependencies = { "fang2hou/blink-copilot" },
  opts = {
    sources = {
      default = { "copilot" },
      providers = {
        copilot = {
          name = "copilot",
          module = "blink-copilot",
          score_offset = 100,
          async = true,
        },
      },
    },
    keymap = {
      preset = "super-tab",      
      ["<CR>"] = {},
      ["<C-y>"] = {
        -- Insert-mode Ctrl+Y: mirror normal-mode behavior
        -- Accept Copilot NES when active; otherwise gracefully fall back to cmp
        function(cmp)
          local bufnr = vim.api.nvim_get_current_buf()
          local state = vim.b[bufnr] and vim.b[bufnr].nes_state
          local ok, nes = pcall(require, "copilot-lsp.nes")

          if state and ok and nes then
            cmp.hide()
            local _ = nes.walk_cursor_start_edit()
              or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
            return
          end

          if cmp.snippet_active() then
            return cmp.accept()
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
  },
}
