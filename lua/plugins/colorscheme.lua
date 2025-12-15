return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "Mofiqul/dracula.nvim" },
  { "rebelot/kanagawa.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
