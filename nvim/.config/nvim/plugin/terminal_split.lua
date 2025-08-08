
-- Open a terminal at the bottom of the screen with a fixed height.
vim.keymap.set('n', '<leader>st', function()
  vim.cmd.new()
  vim.cmd.wincmd 'J'
  vim.api.nvim_win_set_height(0, 12)
  vim.wo.winfixheight = true
  vim.cmd.term()
end)

-- function to run file
local function run_in_terminal()
  local filename = vim.fn.expand("%:p")
  local cmd = nil

  -- Try to read the first line for shebang
  local first_line = vim.fn.getline(1)
  if first_line:match("^#!") then
    -- Remove "#!" and trim spaces/newlines
    cmd = first_line:gsub("^#!%s*", "")
  else
   -- Fallback: decide by filetype
    local ft = vim.bo.filetype
    local interpreter_map = {
      python = "python",
      lua = "lua",
      sh = "bash",
      javascript = "node",
      typescript = "ts-node",
    }
    cmd = interpreter_map[ft]
    print(cmd)
  end

  if not cmd then
    print("No interpreter found for filetype: " .. vim.bo.filetype)
    return
  end

  -- Find existing terminal
  local term_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      term_buf = buf
      break
    end
  end

  if not term_buf or not vim.api.nvim_buf_is_loaded(term_buf) then
    -- Create new bottom split terminal if none found
    vim.cmd("botright split | terminal")
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    term_buf = vim.api.nvim_get_current_buf()
  end

  -- Send command to terminal buffer
  local term_chan = vim.b[term_buf].terminal_job_id
  if term_chan then
    vim.fn.chansend(term_chan, cmd .. " " .. filename .. "\n")
  else
    print("Could not find terminal job ID.")
  end
end

vim.keymap.set("n", "<leader>r", run_in_terminal, { desc = "Run file in terminal" })

