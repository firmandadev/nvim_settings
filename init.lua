require("config.lazy")
require("config.lsp")
require("config.keymaps")

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.breakindent = true

function _G.open_terminal_vertical()
  vim.cmd('vsplit | terminal')
  vim.cmd('startinsert')
end

function _G.hide_terminal()
  local current_buf = vim.api.nvim_get_current_buf()
  if vim.bo[current_buf].buftype == 'terminal' then
    vim.api.nvim_win_close(0, false) -- Close current window, keep buffer
  else
    print('Not in a terminal buffer')
  end
end

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

