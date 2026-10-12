local M = {}

local SEPARATOR = string.rep('-', 40)

local function norm(s)
  s = vim.fn.tolower(s)
  local map = {
    ['ä'] = 'a', ['ö'] = 'o', ['ü'] = 'u', ['ß'] = 'ss',
    ['é'] = 'e', ['è'] = 'e', ['á'] = 'a', ['à'] = 'a',
    ['ó'] = 'o', ['í'] = 'i', ['ú'] = 'u', ['ñ'] = 'n',
    ['ç'] = 'c', ['ø'] = 'o', ['å'] = 'a', ['æ'] = 'ae',
  }
  return (s:gsub('[%z\1-\127\194-\244][\128-\191]*', function(c)
    return map[c]
  end))
end

function M.sort()
  local entries = {}

  for _, line in ipairs(vim.api.nvim_buf_get_lines(0, 0, -1, false)) do
    if line:match('%S') and not line:match('^%-+$') then
      local artist, title = line:match('^(.-) %- (.*)$')
      artist = artist or line
      title = title or ''

      -- Hauptkünstler: Kollaborationen gehören in den Block des ersten Künstlers
      local main = artist:gsub(' [&+] .*$', '')
      main = main:gsub(' [Ff]eat%.? .*$', '')

      table.insert(entries, {
        line = line,
        group = norm(main),
        title = norm(title),
        full = norm(line),
      })
    end
  end

  table.sort(entries, function(a, b)
    if a.group ~= b.group then return a.group < b.group end
    if a.title ~= b.title then return a.title < b.title end
    return a.full < b.full
  end)

  local out, prev = {}, nil
  for _, e in ipairs(entries) do
    if prev and e.group ~= prev then
      table.insert(out, SEPARATOR)
    end
    table.insert(out, e.line)
    prev = e.group
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, out)
end

function M.setup()
  vim.api.nvim_create_user_command('SortPlatten', M.sort, {})
end

return M
