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

function M.insert_html_tag(tag_input)
  -- Trim any leading/trailing whitespace from the input
  tag_input = vim.trim(tag_input)

  if not tag_input or tag_input == '' then
    vim.notify("Html command requires a tag name", vim.log.levels.ERROR)
    return
  end

  -- Split the input by '.' to separate tag and classes
  local parts = {}
  for part in string.gmatch(tag_input, "[^%.]+") do
    table.insert(parts, part)
  end

  -- The first part is the tag name
  local tag = table.remove(parts, 1)

  -- The remaining parts are class names
  local classes = parts

  -- Validate the tag name (optional but recommended)
  local valid_tags = {
    "div", "span", "p", "a", "ul", "li", "table", "tr",
    "td", "th", "header", "footer", "section", "article",
    "nav", "form", "input", "button", "h1", "h2", "h3",
    "h4", "h5", "h6", "img", "script", "style"
    -- Add more tags as needed
  }

  local is_valid = false
  for _, valid_tag in ipairs(valid_tags) do
    if tag == valid_tag then
      is_valid = true
      break
    end
  end

  if not is_valid then
    vim.notify("Invalid HTML tag: " .. tag, vim.log.levels.WARN)
    -- Optionally, proceed or return
    -- return
  end

  -- Get the current cursor position (line and column)
  local cursor = vim.api.nvim_win_get_cursor(0)
  local line = cursor[1]
  local col = cursor[2]

  -- Get the current line's content
  local current_line = vim.api.nvim_get_current_line()

  -- Build the class attribute if classes are present
  local class_attr = ""
  if #classes > 0 then
    class_attr = ' class="' .. table.concat(classes, " ") .. '"'
  end

  -- Build the opening and closing tags
  local open_tag = '<' .. tag .. class_attr .. '>'
  local close_tag = '</' .. tag .. '>'

  -- Insert the tags at the cursor position
  local new_line = current_line:sub(1, col) .. open_tag .. close_tag .. current_line:sub(col + 1)
  vim.api.nvim_set_current_line(new_line)

  -- Move the cursor between the opening and closing tags
  local new_col = col + #open_tag
  vim.api.nvim_win_set_cursor(0, {line, new_col})
end

-- List of common HTML tags for autocompletion
local html_tags = {
  "div", "span", "p", "a", "ul", "li", "table", "tr",
  "td", "th", "header", "footer", "section", "article",
  "nav", "form", "input", "button", "h1", "h2", "h3",
  "h4", "h5", "h6", "img", "script", "style"}


function M.setup()
  -- Create the :erb command
  vim.api.nvim_create_user_command('Erb', M.insert_erb, {})

  -- Create the :Html command (uppercase 'H') that takes one argument with autocompletion
  vim.api.nvim_create_user_command('Html', function(opts)
    M.insert_html_tag(opts.args)
  end, {
    nargs = 1,
    complete = function(arg_lead, cmd_line, cursor_pos)
      -- Simple autocomplete: return tags that start with the current input
      local matches = {}
      for _, tag in ipairs(html_tags) do
        if vim.startswith(tag, arg_lead) then
          table.insert(matches, tag)
        end
      end
      return matches
    end
  })end

return M


