return {
  "copilotlsp-nvim/copilot-lsp",
  init = function()
    -- Debounce NES actions to avoid input lag
    vim.g.copilot_nes_debounce = 200
    vim.lsp.enable("copilot_ls")
    -- Normal-mode Ctrl+Y: accept Copilot NES suggestion when active; otherwise fallback
    -- Includes error handling if copilot-lsp is not available
    vim.keymap.set("n", "<C-y>", function()
      local bufnr = vim.api.nvim_get_current_buf()
      local state = vim.b[bufnr] and vim.b[bufnr].nes_state
      local ok, nes = pcall(require, "copilot-lsp.nes")

      if state and ok and nes then
        -- Try starting the edit; if not started, apply pending and finish edit
        local _ = nes.walk_cursor_start_edit() or (nes.apply_pending_nes() and nes.walk_cursor_end_edit())
        return nil
      end

      -- Fallback preserves existing behavior when NES is inactive/unavailable
      return "<C-i>"
    end, { desc = "Accept Copilot NES suggestion", expr = true })
  end,
}
