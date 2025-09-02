local map = vim.keymap.set
local wk = require("which-key")

wk.register({
  b = {
    name = "Tabs",
    ['n'] = {
      "<cmd>tabnext<CR>","To the next tab"
    },
    ['v'] = {
      "<cmd>tabprevious<CR>","To the previous tab"
    },
    ['h'] = {
      "<cmd>tabnew<CR>","Create new Tab"
    }
  }
}, {prefix = "<leader>", mode={"n"}})

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", {
  desc = "Toggle File Explorer" 
})
map('n', '<leader>h', ':NvimTreeFocus<CR>', { noremap = true, silent = true, desc = 'Focus on the File Explorer' })
map('n', '<leader>l', ':wincmd l<CR>', { noremap = true, silent = true, desc ='Move to the right windows'})
map('t', '<C-j>', '<C-\\><C-n>:bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
map('t', '<C-k>', '<C-\\><C-n>:bprev<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })

--Terminal Keymaps
map('n', '<leader>tv', ':lua open_terminal_vertical()<CR>', { noremap = true, silent = true, desc = 'Open terminal (vertical split)' })
map('t', '<leader>tv', '<C-\\><C-n>:lua open_terminal_vertical()<CR>', { noremap = true, silent = true, desc = 'Open terminal (vertical split)' })
map('n', '<leader>th', ':lua hide_terminal()<CR>', { noremap = true, silent = true, desc = 'Hide terminal' })
map('t', '<leader>th', '<C-\\><C-n>:lua hide_terminal()<CR>', { noremap = true, silent = true, desc = 'Hide terminal' })
map('n', '<leader>tt', ':lua toggle_terminal()<CR>', { noremap = true, silent = true, desc = 'Toggle terminal (horizontal)' })
map('t', '<leader>tt', '<C-\\><C-n>:lua toggle_terminal()<CR>', { noremap = true, silent = true, desc = 'Toggle terminal (horizontal)' })
map('t', '<C-w>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })

-- NvimTree resize keymap
