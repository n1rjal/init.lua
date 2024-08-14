local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- Disable Ctrl + l behavior in insert mode
vim.api.nvim_set_keymap("i", "<C-l>", "<Nop>", { noremap = true })

-- Disable Ctrl + j behavior in insert mode
vim.api.nvim_set_keymap("i", "<C-j>", "<Nop>", { noremap = true })

-- Disable Ctrl + k behavior in insert mode
vim.api.nvim_set_keymap("i", "<C-k>", "<Nop>", { noremap = true })

vim.api.nvim_set_keymap("i", "<C-e>", "<Nop>", { noremap = true })

vim.keymap.set({ "i" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { noremap = true, silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
	if ls.jumpable(1) then
		ls.jump(1)
	end
end, { noremap = true, silent = true })

vim.keymap.set({ "i", "s" }, "<C-j>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { noremap = true, silent = true })

ls.add_snippets("all", {
	s("hello", {
		t("Hello, "),
		i(1),
	}),
})

ls.add_snippets("lua", {
	s("hello", {
		t("print('Hello, '"),
		i(1),
		t(")"),
	}),

	s("hell", {
		t("print('Hell, '"),
		i(1),
		t(")"),
	}),
})

ls.add_snippets("python", {
	s("print", {
		t("print('Hello, '"),
		i(1),
		t(")"),
	}),

	ls.parser.parse_snippet(
		"class",
		"class ${1:ClassName}:\n\tdef __init__(self, ${2:arg}):\n\t\tself.${2:arg} = ${2:arg}"
	),

	ls.parser.parse_snippet("celery_task", "@celery.shared_task\n def ${1:task_name}(self, ${2:arg}):\n\t${0:pass}"),

	ls.parser.parse_snippet("model", "class ${1:Model}(models.Model):\n\t${0:pass}"),

	ls.parser.parse_snippet(
		"mser",
		'class ${1:Serializer}(serializers.ModelSerializer):\n\tclass Meta:\n\t\tmodel = ${2}\n\t\tfields = "__all"'
	),

	--- django class based view snippet by cbv
	--- also use choices node for ApiView or View for the first argument
	ls.parser.parse_snippet(
		"cbv",
		"class ${1:ViewName}(${2:c|ApiView,View}):\n\tdef ${3:get}(self, request, *args, **kwargs):\n\t\t${0:pass}"
	),

	ls.parser.parse_snippet(
		{ trig = "def", name = "def", wordTrig = true },
		"def ${1:func_name}(${2:args}):\n\t${0:pass}"
	),
})

--[[ ls.add_snippets("gitcommit", {
	ls.parser.parse_snippet(
		{ trig = "feat", name = "feature commit", wordTrig = true },
		"feat(${1:scope}): ${2:description}"
	),
	ls.parser.parse_snippet(
		{ trig = "feat", name = "feature commit", wordTrig = true },
		"feat(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "fix", name = "bug fix commit", wordTrig = true },
		"fix(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "chore", name = "chore commit", wordTrig = true },
		"chore(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "test", name = "test commit", wordTrig = true },
		"test(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "refactor", name = "refactor commit", wordTrig = true },
		"refactor(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "docs", name = "documentation commit", wordTrig = true },
		"docs(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "style", name = "style commit", wordTrig = true },
		"style(${1:scope}): ${2:description}"
	),

	ls.parser.parse_snippet(
		{ trig = "perf", name = "performance commit", wordTrig = true },
		"perf(${1:scope}): ${2:description}"
	),
}) ]]

ls.add_snippets("javascript", {
	s("console.log", {
		t("console.log('Hello, '"),
		i(1),
		t(")"),
	}),
})

vim.keymap.set(
	"n",
	"<leader><leader>s",
	"<cmd> source ~/.config/nvim/after/plugin/snip.lua<CR>",
	{ noremap = true, silent = true }
)

-- add snippets for typescript react and javascript react
-- I need for rafce and rfc
-- I also need setState, useEffect, useState, and useRef
--
ls.add_snippets("typescriptreact", {
	ls.parser.parse_snippet(
		"rafce",
		"import React from 'react'\n\nfunction ${1:ComponentName}() {\n\treturn (\n\t\t<div>\n\t\t\t${0}\n\t\t</div>\n\t)\n}\n\nexport default ${1:ComponentName}"
	),
	ls.parser.parse_snippet(
		"rfc",
		"import React from 'react'\n\nconst ${1:ComponentName} = () => {\n\treturn (\n\t\t<div>\n\t\t\t${0}\n\t\t</div>\n\t)\n}\n\nexport default ${1:ComponentName}"
	),
	ls.parser.parse_snippet(
		"uS",
		"const [${1:state}, set${1/(.*)/${1:/capitalize}/}] = React.useState(${2:initialState})"
	),
	ls.parser.parse_snippet("uE", "React.useEffect(() => {\n\t${0}\n}, [])"),
	ls.parser.parse_snippet("uR", "const ${1:ref} = React.useRef(${2:initialValue})"),
	ls.parser.parse_snippet("ss", "set${1/(.*)/${1:/capitalize}/}(${2:value})"),
})

-- load vscode like snippets
require("luasnip.loaders.from_vscode").lazy_load()
