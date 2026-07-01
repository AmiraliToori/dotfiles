-- For LSP status with spinner
local spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" }
local current_frame = 1
local function lsp_status_with_spinner()
	local status = require("lsp-status").status()
	if status:match("initializing") then
		current_frame = (current_frame % #spinner_frames) + 1
		return spinner_frames[current_frame] .. " LSP initializing"
	else
		return status
	end
end

return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				-- Global options
				theme = "auto", -- Or a specific theme name
				icons_enabled = true,
				component_separators = { left = "|", right = "|" },
				section_separators = { left = "", right = "" },
				always_divide_middle = true,
				globalstatus = false, -- Display a single statusline per window
				refresh = {
					statusline = 200, -- Update rate in milliseconds
					tabline = 1000,
				},
				-- ... more options
			},
			sections = {
				-- Left sections
				lualine_a = {
					{
						"mode", -- Add icons to multiple modes for statusline
						fmt = function(mode)
							if mode == "NORMAL" then
								return " NORMAL"
							elseif mode == "TERMINAL" then
								return " TERMINAL"
							elseif mode == "INSERT" then
								return "󰏫 INSERT"
							elseif mode == "REPLACE" then
								return "  REPLACE"
							elseif mode == "COMMAND" then
								return "$ COMMAND"
							elseif mode == "VISUAL" then
								return " VISUAL"
							elseif mode == "V-LINE" then
								return " V-LINE"
							elseif mode == "V-BLOCK" then
								return " V-BLOCK"
							else
								return mode
							end
						end,
					},
				},
				lualine_b = {
					{ "branch", icon = "" },
					{
						"diff",
						source = "gitsigns",
						symbols = { added = " ", modified = " ", removed = " " },
					},
					{
						"gitsigns",
						components = {
							--"branch", -- shows the current branch
							--"diff", -- added removed modified
							"behind", -- How many commits behind of remote
							"ahead", -- How many commits ahead of remote
							-- 'untracked'    Untracked files
							-- 'staged'       Staged files
							-- 'conflicted'   Conflicted files
						},
					},
					"diagnostics", -- showing info, errors and warnings
				},
				lualine_c = {
					{ "filename", path = 1, symbols = { modified = "*", readonly = "" } },
				},
				-- Right sections
				lualine_x = { "encoding", "fileformat", "filetype", "lsp_status" },
				lualine_y = { "progress" },
				lualine_z = { { "location", icon = "" } },
			},
			extensions = {
				-- Enable and configure extensions
				"nvim-tree",
				"toggleterm",
				"lazy",
				-- { name = 'neo-tree', icon = { closed = '', open = '' } }, -- Example with custom icon
			},
		})
	end,
}
