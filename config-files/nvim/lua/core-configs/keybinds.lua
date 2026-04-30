vim.keymap.set("n", "<leader>fp", "<cmd>Ex<CR>", { desc = "LET ME SEE MY FILES" }) -- ahhhh
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>", { desc = "CLEAR HIGHLIGHT" }) -- compromise!

-- thanks tj
vim.keymap.set("n", "<leader><leader>x", "<cmd>source % <CR>")
vim.keymap.set("n", "<leader>x", ":.lua<CR>")
vim.keymap.set("v", "<leader>x", ":.lua<CR>")

-- ditch the mouse embrace the jump
-- note: there is a weird though intended interaction with the
-- scroll off option. Where if we jump, vim will correct the jump
-- when given a high enough scroll off
vim.keymap.set("n", "<C-U>", "10<C-u>", { desc = "Scroll up by 10", noremap = true })
vim.keymap.set("n", "<C-D>", "10<C-d>", { desc = "Scroll down by 10", noremap = true })

-- let me peak!!!
vim.keymap.set("n", "<C-y>", "10<C-y>", { desc = "Peak 10 lines up", noremap = true })
vim.keymap.set("n", "<C-e>", "10<C-e>", { desc = "Peak 10 lines below", noremap = true })

-- tab navigation

vim.keymap.set("n", "<leader>n", "<cmd>tabN<CR>", { desc = "Move to next tab" })
vim.keymap.set("t", "<esc>", "<C-\\><C-N>", { desc = "Get out of terminal mode" })

---
--- PLUGIN KEYBINDS TO MAKE LIFE EASIER TO FIND THEM IN THE FUTURE.
--- EXCEPTION
--- There are some keybinds that ought to be triggered in a autocmd...
---
---

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
vim.keymap.set("n", "<leader>fm", builtin.keymaps, { desc = "Telescope keymaps" })
