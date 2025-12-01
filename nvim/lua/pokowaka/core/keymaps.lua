-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- TIP: This is where you should put the keymaps that are related to **your personal setup**
-- Create a keymap that exits insert mode
vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- Set tab and shift tab to move buffers
vim.keymap.set("n", "<Tab>", ":bNext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":bPrev<CR>", { silent = true })

vim.keymap.set({ "n", "v" }, "<C-a>", "<cmd>CodeCompanionActions<cr>", { noremap = true, silent = true })
vim.keymap.set({ "n", "v" }, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", { noremap = true, silent = true })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { noremap = true, silent = true })

-- Expand 'cc' into 'CodeCompanion' in the command line
vim.cmd([[cab cc CodeCompanion]])
