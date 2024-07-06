local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text = luasnip.text_node
local input = luasnip.insert_node

luasnip.add_snippets("c", {
	snippet("print", {
		text('printf("'),
		input(1),
		text('\\n");'),
	}),
})

luasnip.add_snippets("typescript", {
	snippet("func", {
		text("const "),
		input(1, "name"),
		text(" = ("),
		input(2, "param"),
		text(": "),
		input(3, "type"),
		text(") => {"),
		text({ "", "\t" }),
		input(4, "// CODE HERE"),
		text({ "", "}" }),
	}),
})

luasnip.add_snippets("markdown", {
	snippet("meta", {
		text({ "---", "title: " }),
		input(1, "file_meta_title"),
		text({ "", "date: " }),
		input(2, os.date("%A, %B %d %Y")),
		text({ "", "tags: " }),
		text({ "", "\t- " }),
		input(3, "programming"),
		text({ "", "---" }),
	}),
})
