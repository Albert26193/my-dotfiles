-- leap config

local status_ok, leap = pcall(require, "leap")
if not status_ok then
  print("leap failing")
end

-- true to override conflicts
-- leap.set_default_keymaps(true)
-- Disable auto jump first match

require('leap').opts.safe_labels = {}

-- Bidirectional search
local function leap_current_window()
  leap.leap({ target_windows = { vim.fn.win_getid() } })
end

-- Map them to your preferred key, like:
vim.keymap.set("n", "w", leap_current_window, { silent = true })

require('leap').opts.highlight_unlabeled_phase_one_targets = true

-- vim.keymap.set({'x', 'o', 'n'}, 'W', '<Plug>(leap-forward-to)')
-- vim.keymap.set({'x', 'o', 'n'}, 'w', '<Plug>(leap-backward-to)')
