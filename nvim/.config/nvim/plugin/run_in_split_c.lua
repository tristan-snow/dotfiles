
local function run_in_terminal()
  local filename = vim.fn.expand("%:p")
  local basename = vim.fn.expand("%:r")
  local ft = vim.bo.filetype
  local cmd = nil

  -- Find or create a terminal first
  local term_buf = nil
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].buftype == "terminal" then
      term_buf = buf
      break
    end
  end
  if not term_buf or not vim.api.nvim_buf_is_loaded(term_buf) then
    vim.cmd("botright split | terminal")
    vim.api.nvim_win_set_height(0, 12)
    vim.wo.winfixheight = true
    term_buf = vim.api.nvim_get_current_buf()
  end

  local term_chan = vim.b[term_buf].terminal_job_id
  if not term_chan then
    print("Could not find terminal job ID.")
    return
  end

  if ft == "c" then
    local binary_name = vim.fn.fnamemodify(basename, ":t") -- filename without path
    -- Chain gcc and run only if compilation succeeds
    cmd = string.format("clear && gcc -o %s %s && ./%s", binary_name, filename, binary_name)
  else
    local first_line = vim.fn.getline(1)
    if first_line:match("^#!") then
      cmd = first_line:gsub("^#!%s*", "") .. " " .. filename
    else
      local interpreter_map = {
        python = "python",
        lua = "lua",
        sh = "bash",
        javascript = "node",
        typescript = "ts-node",
      }
      cmd = interpreter_map[ft]
      if not cmd then
        print("No interpreter found for filetype: " .. ft)
        return
      end
      cmd = "clear && " .. cmd .. " " .. filename
    end
  end

  -- Send command to terminal
  vim.fn.chansend(term_chan, cmd .. "\n")
end

vim.keymap.set("n", "<leader>r", run_in_terminal, { desc = "Run file in terminal" })
