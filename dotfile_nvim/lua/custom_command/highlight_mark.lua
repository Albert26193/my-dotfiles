-- init.lua
vim.cmd("highlight MyMarkHighlight ctermbg=cyan guibg=cyan")
vim.cmd("highlight MyMarkLetter ctermfg=white ctermbg=red guifg=white guibg=red")

local api = vim.api
local ns = api.nvim_create_namespace("highlight_marks")

local old_marks = {}  -- 新增：用于存储上一次的标记
function highlight_marks()
  -- 清除之前的高亮
  api.nvim_buf_clear_namespace(0, ns, 0, -1)

  -- 新增：清除旧的标记字符
  for mark, mark_line in pairs(old_marks) do
    local mark_text = api.nvim_buf_get_lines(0, mark_line, mark_line + 1, false)[1]
    local mark_index = string.find(mark_text, "    " .. mark)
    if mark_index then
      local new_mark_text = string.sub(mark_text, 1, mark_index - 1) .. string.sub(mark_text, mark_index + 5)
      api.nvim_buf_set_lines(0, mark_line, mark_line + 1, false, {new_mark_text})
    end
  end

  -- 获取所有标记
  -- local marks = api.nvim_exec("marks", true)
  -- print("all marks: " .. vim.inspect(marks))

  -- 初始化当前缓冲区标记列表
  local current_buf_marks = {}

  -- 获取当前缓冲区的编号
  local current_bufnr = api.nvim_get_current_buf()

  -- 遍历 a-z 的标记
  for i = 97, 122 do -- ASCII values for 'a' to 'z'
    local mark = api.nvim_buf_get_mark(current_bufnr, string.char(i))
    if mark[1] >= 1 then
      current_buf_marks[string.char(i)] = mark[1] - 1
    end
  end

  -- 清除之前添加的字母
for _, mark_line in pairs(current_buf_marks) do
    local mark_text = api.nvim_buf_get_lines(0, mark_line, mark_line + 1, false)[1]
    api.nvim_buf_set_lines(0, mark_line, mark_line + 1, false, {string.sub(mark_text, 3)})
  end

  -- 打印 current_buf_marks
  print("Current buffer marks: " .. vim.inspect(current_buf_marks))

  -- 遍历当前缓冲区的标记
  for mark, mark_line in pairs(current_buf_marks) do
    -- 高亮标记所在的行
    api.nvim_buf_add_highlight(0, ns, "MyMarkHighlight", mark_line, 0, -1)

    -- 在标记所在的行尾添加对应的字母
  local mark_text = api.nvim_buf_get_lines(0, mark_line, mark_line + 1, false)[1]
    local mark_index = string.find(mark_text, "    " .. mark)
    if mark_index then
      mark_text = string.sub(mark_text, 1, mark_index - 1) .. string.sub(mark_text, mark_index + 4)
    end
  local new_mark_text = mark_text .. "    " .. mark
    api.nvim_buf_set_lines(0, mark_line, mark_line + 1, false, {new_mark_text})
    api.nvim_buf_add_highlight(0, ns, "MyMarkLetter", mark_line, #mark_text + 1, #new_mark_text)
  end

  -- 新增：更新 old_marks 以存储当前标记
  old_marks = current_buf_marks

end

-- 创建一个名为 HighlightMarks 的新命令
vim.cmd("command! HighlightMarks lua highlight_marks()")
