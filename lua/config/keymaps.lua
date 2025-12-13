-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<leader>w", ":w<CR>", { silent = true })
vim.keymap.set("n", "<S-Right>", ":bnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Left>", ":bprevious<CR>", { silent = true })
vim.keymap.set("n", "<leader>hh", "<cmd>nohlsearch<CR>", { desc = "Clear highlights" })
vim.keymap.set("n", "<C-q>", "<cmd>Bdelete!<CR>", { desc = "[B]uffer Force [D]elete" })
vim.keymap.set("n", "<leader>ba", "<cmd>bufdo Bwipeout<cr>", { desc = "[B]uffers Close [A]ll" })
-- vim.keymap.set("n", "<leader>ba", "<cmd>Bdeleteall<cr>", { desc = "[B]uffers Close [A]ll" })
-- vim.keymap.set("n", "<leader>bu", "<cmd>%bd|e#<CR>", { desc = "[B]uffers Close All B[u]t This" })
vim.keymap.set("n", "<leader>bu", "<cmd>Bdeleteexcept<CR>", { desc = "[B]uffers Close All B[u]t This" })
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "[B]uffer [N]ew " })
vim.keymap.set("n", "<leader>|", "<C-W>v", { desc = "Split Vertically" })
vim.keymap.set("n", "s", function()
  require("hop")
  vim.cmd("silent! HopWord")
end, { desc = "Hop to word" })
vim.keymap.set("x", "s", function()
  require("hop")
  vim.cmd("silent! HopWord")
end, { desc = "Hop to word" })

vim.keymap.set("n", "m", require("substitute").operator, { noremap = true })
vim.keymap.set("n", "mm", require("substitute").line, { noremap = true })
vim.keymap.set("n", "M", require("substitute").eol, { noremap = true })
vim.keymap.set("x", "m", require("substitute").visual, { noremap = true })

-- Open parent directory in current window
-- vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Open parent directory in floating window
vim.keymap.set("n", "<space>e", require("oil").toggle_float)
vim.keymap.set("n", "<leader>sf", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
vim.keymap.set("n", "<leader>sh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sW", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", require("telescope.builtin").diagnostics, { desc = "[S]earch [D]iagnostics" })
vim.keymap.set("n", "<leader>sR", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>sR", require("telescope.builtin").resume, { desc = "[S]earch [R]esume" })
vim.keymap.set("n", "<leader>sj", require("telescope.builtin").jumplist, { desc = "[J]ump [L]ist" })
vim.keymap.set("n", "<leader>sr", '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
