local M = {}

-- direction is only used in --navigate
function M.command(opt, direction)
  local interestingwords = require('interestingwords.core')
  local word = vim.fn.expand('<cword>')

  if opt == '--remove_all' then
    interestingwords.uncolor_all()
  elseif opt == '--toggle' then
    interestingwords.toggle(word)
  elseif opt == '--navigate' then
    interestingwords.navigate(word, direction)
  end
end

return M
