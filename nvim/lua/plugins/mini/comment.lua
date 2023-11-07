-- BUG: sometimes not working if which-key not loaded?
return {
	"echasnovski/mini.comment",
	event = "BufReadPre",
	opts = {
		options = {
			custom_commentstring = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		},
		hooks = {
			pre = function()
				return require("ts_context_commentstring.internal").calculate_commentstring() or vim.bo.commentstring
			end,
		},
		-- Module mappings. Use `''` (empty string) to disable one.
		mappings = {
			-- Toggle comment (like `gcip` - comment inner paragraph) for both
			-- Normal and Visual modes
			comment = "<leader>C",

			-- Toggle comment on current line
			comment_line = "<c-C>",

			-- Toggle comment on visual selection
			comment_visual = "<c-C>",

			-- Define 'comment' textobject (like `dgc` - delete whole comment block)
			textobject = "gc",
		},
	},

	config = function(_, opts)
		require("mini.comment").setup(opts)
	end,
}
