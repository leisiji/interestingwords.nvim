local M = {}
local fn = vim.fn
local colors = {'#8CCBEA', '#A4E57E', '#FFDB72', '#FF7272', '#FFB3FF', '#9999FF'}
-- save matchadd id words_group, its item struct is {word, id}
local words_array = vim.b.words_array

-- return: found, index
-- If found the word, then return {true, index}
-- If found an empty index, then return the {false, index}
-- Otherwise return {false, #words_group + 1}
local function get_word_index(word)
  local index = 1
  local min_nil_index = 0
  for i = 1, #words_array do
    if words_array[i] ~= nil then
      if words_array[i][1] == word then
        return true, i
      end
    elseif min_nil_index == 0 then
      min_nil_index = i
    end
    index = index + 1
  end

  if min_nil_index ~= 0 then
    index = min_nil_index
  end

  return false, index
end

local function color_word(index, word)
  if index > #colors then
    print('Number of highlight-word is greater than ' .. #colors)
    return
  end

  local hi = 'Interestingwords_' .. index
  vim.cmd(string.format('hi! %s guibg=%s guifg=Black', hi, colors[index]))
  local id = fn.matchadd(hi, string.format([[\V\<%s\>]], word), 11)
  words_array[index] = { word, id }
end

local function uncolor_word(index)
  fn.matchdelete(words_array[index][2])
  words_array[index] = nil
end

function M.toggle(word)
  if words_array == nil then
    words_array = {}
  end

  local found, index = get_word_index(word)
  if found then
    uncolor_word(index)
  else
    color_word(index, word)
  end
end

function M.uncolor_all()
  for key, value in pairs(words_array) do
    fn.matchdelete(value[2])
    words_array[key] = nil
  end
end

function M.navigate(word, direction)
  if direction == nil then
    fn.search(word)
  else
    fn.search(word, direction)
  end
end

return M
