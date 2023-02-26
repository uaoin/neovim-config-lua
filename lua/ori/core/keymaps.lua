----------
-- TODO --
----------
--Readme.md
--


-- set leader key to space 
vim.g.mapleader = " "

local keymap = vim.keymap

---------------------
-- General Keymaps --
---------------------

-- use jj to exit insert mode
keymap.set("i","jj","<ESC>")

-- clear search highlights
keymap.set('n','<leader><CR>',':nohl<CR>')

-- save
keymap.set('n','<leader>w',':w<CR>')

-- quit
keymap.set('n','<leader>q',':q<CR>')

-- center search text
keymap.set('n','n','nzz')
keymap.set('n','N','Nzz')

-- to Left to Right
keymap.set('n','L','g_')
keymap.set('n','H','^')
keymap.set('v','L','g_')
keymap.set('v','H','^')

-- delete single character without copying into register
keymap.set("n","x",'"_x')

-- clipboard
keymap.set('n','<Leader>p','"+p')
keymap.set('v','<Leader>y','"+y')

-- window management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab
