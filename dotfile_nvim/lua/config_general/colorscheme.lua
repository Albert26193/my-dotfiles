-- local colorscheme = "neosolarized"
-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--   vim.notify("colorscheme " .. colorscheme .. " 没有找到！")
--   return
-- end


-- Example config in Lua
require("github-theme").setup({
  theme_style = "dark_default",
})
