local luasnip = require("luasnip")
local snippet = luasnip.snippet
local text = luasnip.text_node
local input = luasnip.insert_node

local function html_tag(tagName)
    return {
        text(string.format("<%s>", tagName))
    }
end

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

-- Quick script to add common html elements in to typescript react
local html_elements = { "h1", "h2", "h3", "h4", "h5", "h6", "p", "a", "button", "div" }
local typescriptreact_snippets = {}

for _, element_name in pairs(html_elements) do
    table.insert(typescriptreact_snippets, snippet(element_name, {
        text(string.format("<%s>", element_name)),
        input(1, ""),
        text(string.format("</%s>", element_name))
    }))
end

luasnip.add_snippets("typescriptreact", typescriptreact_snippets)
