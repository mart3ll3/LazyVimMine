return {
  "gbprod/substitute.nvim",
  event = "InsertEnter",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = function(_, opts)
    require("substitute").setup(opts)
  end,
}
