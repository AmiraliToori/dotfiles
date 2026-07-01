return {
	{
		"folke/snacks.nvim",
		opts = {
			explorer = {
				replace_netrw = true,
			},
			picker = {
				sources = {
					explorer = {
						hidden = true,
						ignored = true,
						autoclose = false,
						focus = "list",
						layout = {
							preset = "sidebar",
							preview = false,

							layout = {
								position = "left",
								width = 40,
							},
						},

						win = {
							list = {
								keys = {

									["l"] = "confirm",
									["h"] = "explorer_close",
									["<BS>"] = "explorer_up",

									["a"] = "explorer_add",
									["d"] = "explorer_del",
									["r"] = "explorer_rename",
									["c"] = "explorer_copy",
									["m"] = "explorer_move",
									["y"] = "explorer_yank",

									["."] = "toggle_hidden",
								},
							},
						},
					},
				},
			},
		},
	},
}
