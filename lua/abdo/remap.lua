-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Set quick commands to move highlighted text up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Bind C-c and C-v to copy and paste
vim.keymap.set('n', '<C-v>', '"+p', { desc = 'Paste copied text' })
vim.keymap.set('v', '<C-c>', '"+y', { desc = 'Copy selected text' })
vim.keymap.set('v', '<leader>p', '"_dP', { desc = 'Paste without yanking' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
