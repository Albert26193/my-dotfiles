local status, trouble = pcall(require, "trouble")
if not status then
	vim.notify("not found plugin named 'trouble' ")
end

trouble.setup({
	position = "bottom", -- position of the list can be: bottom, top, left, right
	height = 10, -- height of the trouble list when position is top or bottom
	width = 50, -- width of the list when position is left or right
	icons = true, -- use devicons for filenames
	mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	severity = nil, -- nil (ALL) or vim.diagnostic.severity.ERROR | WARN | INFO | HINT
	fold_open = "", -- icon used for open folds
	fold_closed = "", -- icon used for closed folds
	group = true, -- group results by file
	padding = true, -- add an extra new line on top of the list
	cycle_results = true, -- cycle item list when reaching beginning or end of list
	action_keys = { -- key mappings for actions in the trouble list
		hover = "K", -- opens a small popup with the full multiline message
		multiline = true, -- render multi-line messages
	},
})
