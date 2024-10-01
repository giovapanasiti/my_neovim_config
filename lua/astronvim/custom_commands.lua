-- lua/astronvim/custom_commands.lua

local M = {}

function M.insert_erb()
  -- Get the current cursor position
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local col = cursor[2]

  -- Get the current line's content
  local current_line = vim.api.nvim_get_current_line()

  -- Insert '<%%>' at the cursor position
  local new_line = current_line:sub(1, col) .. '<%%>' .. current_line:sub(col + 1)
  vim.api.nvim_set_current_line(new_line)

  -- Move the cursor between the two '%'
  vim.api.nvim_win_set_cursor(0, {line, col + 2})
end

function M.insert_html_tag(tag)
  -- Trim any leading/trailing whitespace from the tag
  tag = vim.trim(tag)

  if not tag or tag == '' then
    vim.notify("Html command requires a tag name", vim.log.levels.ERROR)
    return
  end

  -- Get the current cursor position (line and column)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local col = cursor[2]

  -- Get the current line's content
  local current_line = vim.api.nvim_get_current_line()

  -- Build the opening and closing tags
  local open_tag = '<' .. tag .. '>'
  local close_tag = '</' .. tag .. '>'

  -- Insert the tags at the cursor position
  local new_line = current_line:sub(1, col) .. open_tag .. close_tag .. current_line:sub(col + 1)
  vim.api.nvim_set_current_line(new_line)

  -- Move the cursor between the opening and closing tags
  local new_col = col + #open_tag
  vim.api.nvim_win_set_cursor(0, {line, new_col})
end


function M.setup()
  -- Create the :erb command
  vim.api.nvim_create_user_command('Erb', M.insert_erb, {})

   -- Create the :Html command (uppercase 'H') that takes one argument
  vim.api.nvim_create_user_command('Html', function(opts)
    M.insert_html_tag(opts.args)
  end, { nargs = 1, complete = "tag" }) -- 'complete' can be customized for autocompletion
end

return M


