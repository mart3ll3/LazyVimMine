return 
{
  "stevearc/oil.nvim",
  lazy = true,
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  cmd = { "Oil" },
  opts = {
    columns = { "icon" },
    keymaps = {
      ["<C-h>"] = false,
      ["<C-l>"] = false,
      ["<C-k>"] = false,
      ["<C-j>"] = false,
      ["<BS>"] = { "actions.parent", mode = "n" },
      -- ["<M-h>"] = "actions.select_split",
    },
    -- win_options = {
    -- winbar = "%{v:lua.CustomOilBar()}",
    -- },
    view_options = {
      show_hidden = true,
      is_always_hidden = function(name, _)
        local folder_skip = { "dev-tools.locks", "dune.lock", "_build" }
        return vim.tbl_contains(folder_skip, name)
      end,
    },
  },
  config = function(_, opts)
    require("oil").setup(opts)
  end,
}
