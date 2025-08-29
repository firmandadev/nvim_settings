require("config.lazy")
require("config.lsp")
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.breakindent = true

function toggle_keymap()
  if vim.o.keymap == "russian-jcukenwin" then
    vim.o.keymap = "" -- Default to US/English
    print("Keymap: US")
  else
    vim.o.keymap = "russian-jcukenwin"
    print("Keymap: Russian")
  end
end

-- Map to a key, e.g., <leader>k
vim.api.nvim_set_keymap('n', '<leader>k', ':lua toggle_keymap()<CR>', { noremap = true, silent = true })
vim.keymap.set('n','<leader>t',':terminal<CR>',{ noremap = true, silent = true, desc = 'open terminal'})
-- Terminal mode: Exit to normal mode with <C-w>
vim.keymap.set('t', '<C-w>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>h', ':NvimTreeFocus<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>l', ':wincmd l<CR>', { noremap = true, silent = true })
-- Terminal mode: Navigate buffers with <C-j> and <C-k>
vim.keymap.set('t', '<C-j>', '<C-\\><C-n>:bnext<CR>', { noremap = true, silent = true, desc = 'Next buffer' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n>:bprev<CR>', { noremap = true, silent = true, desc = 'Previous buffer' })

-- Normal mode: Open terminal with <leader>t
vim.keymap.set('n', '<leader>t', ':terminal<CR>', { noremap = true, silent = true, desc = 'Open terminal' })

-- Function to open a new terminal in a vertical split (from previous response)
function _G.open_terminal_vertical()
  vim.cmd('vsplit | terminal')
  vim.cmd('startinsert')
end

-- Function to hide the current terminal
function _G.hide_terminal()
  local current_buf = vim.api.nvim_get_current_buf()
  if vim.bo[current_buf].buftype == 'terminal' then
    vim.api.nvim_win_close(0, false) -- Close current window, keep buffer
  else
    print('Not in a terminal buffer')
  end
end

-- Function to toggle terminal (horizontal, from previous response)
function _G.toggle_terminal()
  local buffers = vim.api.nvim_list_bufs()
  local term_buf = nil
  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_valid(buf) and vim.bo[buf].buftype == 'terminal' then
      term_buf = buf
      break
    end
  end
  local current_win = vim.api.nvim_get_current_win()
  local current_buf = vim.api.nvim_get_current_buf()
  if term_buf and current_buf == term_buf then
    vim.api.nvim_win_close(current_win, false)
  else
    vim.cmd('belowright split')
    if term_buf then
      vim.api.nvim_set_current_buf(term_buf)
    else
      vim.cmd('terminal')
    end
    vim.cmd('startinsert')
  end
end



-- Keymaps
vim.keymap.set('n', '<leader>tv', ':lua open_terminal_vertical()<CR>', { noremap = true, silent = true, desc = 'Open terminal (vertical split)' })
vim.keymap.set('t', '<leader>tv', '<C-\\><C-n>:lua open_terminal_vertical()<CR>', { noremap = true, silent = true, desc = 'Open terminal (vertical split)' })
vim.keymap.set('n', '<leader>th', ':lua hide_terminal()<CR>', { noremap = true, silent = true, desc = 'Hide terminal' })
vim.keymap.set('t', '<leader>th', '<C-\\><C-n>:lua hide_terminal()<CR>', { noremap = true, silent = true, desc = 'Hide terminal' })
vim.keymap.set('n', '<leader>t', ':lua toggle_terminal()<CR>', { noremap = true, silent = true, desc = 'Toggle terminal (horizontal)' })
vim.keymap.set('t', '<leader>t', '<C-\\><C-n>:lua toggle_terminal()<CR>', { noremap = true, silent = true, desc = 'Toggle terminal (horizontal)' })
vim.keymap.set('t', '<C-w>', '<C-\\><C-n>', { noremap = true, silent = true, desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>k', ':lua toggle_keymap()<CR>', { noremap = true, silent = true, desc = 'Toggle Russian keymap' })
