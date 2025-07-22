local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    s("wpth", {
        t({ "/*" }),
        t({ "", "  Theme Name: " }),
        i(1),
        t({ "", "  Author: jcnnll" }),
        t({ "", "  Author URI: https://jcnnll.dev" }),
        t({ "", "  Description: Custom theme for " }),
        i(2),
        t({ "", "  Version: 1.0" }),
        t({ "", "  Text Domain: " }),
        i(3),
        t({ "", "*/" }),
        t({ "", "" }),
        i(0),
    }),
}
