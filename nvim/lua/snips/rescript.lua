local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local d = ls.dynamic_node
local sn = ls.snippet_node
local rep = require("luasnip.extras").rep

local multiple = function(delimiter, numberArg)
    local node = {
        t(delimiter.start),
        i(1, "value1"),
    }
    for j = 2, numberArg do
        local currentIndex = j + 1
        node[currentIndex] = sn(j, { t(", "), i(1, "value" .. tostring(j)) })
    end
    node[#node + 1] = t(delimiter.end_)
    return node
end

local dynamic_log = function(_, snip)
    local nbStr = snip.captures[1]
    local nb = tonumber(nbStr)
    return sn(1, {
        t("Js.log" .. nbStr),
        sn(1, multiple({ start = "(", end_ = ")" }, nb)),
    })
end

local dynamic_dependencies = function(nb)
    local dependencie
    if nb == 0 then
        dependencie = { t(")") }
    elseif nb == 1 then
        dependencie = {
            t(", ["),
            i(1),
            t("])"),
        }
    else
        dependencie = multiple({ start = "(", end_ = ")" }, nb)
    end
    return dependencie
end

local dynamic_useEffect = function(_, snip)
    local nbStr = snip.captures[1]
    local nb = tonumber(nbStr)
    return sn(1, {
        t({ "React.useEffect" .. nbStr .. "(() => {", "" }),
        c(1, {
            t({ "  None", "}" }),
            t({ "  Some(() => {()})", "}" }),
        }),
        t(", "),
        sn(2, dynamic_dependencies(nb)),
        t(")"),
    })
end
local dynamic_useMemo = function(_, snip)
    local nbStr = snip.captures[1]
    local nb = tonumber(nbStr)
    return sn(1, {
        t({ "React.useMemo" .. nbStr .. "(() => {", "" }),
        t("}, "),
        sn(2, dynamic_dependencies(nb)),
        t(")"),
    })
end
local dynamic_useCallback = function(_, snip)
    local nbStr = snip.captures[1]
    local nb = tonumber(nbStr)
    return sn(1, {
        t({ "React.useCallback" .. nbStr .. "(() => {", "" }),
        t("}, "),
        sn(2, dynamic_dependencies(nb)),
        t(")"),
    })
end

local belt = function(scope)
    return function(trig, fn)
        local fnStr = "Belt." .. scope .. "." .. fn
        local fn_t = t(fnStr .. "(")
        local snippet_conf = c(1, {
            sn(1, {
                t("->"),
                fn_t,
                i(1, "mapper"),
                t(")"),
            }),
            sn(1, {
                fn_t,
                i(1, "option"),
                t(", "),
                i(2, "mapper"),
                t(")"),
            }),
        })
        return s({ trig = trig, dscr = fnStr }, snippet_conf)
    end
end

local belt_opt = belt("Option")
local belt_array = belt("Array")

return {
    -- Js.log
    s({
        trig = "clog",
        name = "classiq log",
        dscr = "Just a classiq Js.log",
    }, {
        t("Js.log("),
        i(1),
        t(")"),
    }),
    s({
        trig = "clog var",
        name = "log variable",
        dscr = "log variable with the variable name in first arg",
    }, {
        t('Js.log2("'),
        rep(1),
        t('", '),
        i(1),
        t(")"),
    }),
    s({
        trig = "dynalog(%d)",
        regTrig = true,
    }, d(1, dynamic_log, {})),

    -- React
    s({
        trig = "react_comp",
        name = "component",
        dscr = "Create a react component",
    }, {
        t({
            "@react.component",
            "let make = () => {",
            "",
        }),
        i(0),
        t({
            "",
            "}",
        }),
    }),
    s({ trig = "useEffect(%d)", regTrig = true }, d(1, dynamic_useEffect, {})),
    s({ trig = "useMemo(%d)", regTrig = true }, d(1, dynamic_useMemo, {})),
    s({ trig = "useCallback(%d)", regTrig = true }, d(1, dynamic_useCallback, {})),

    -- Switch
    s({ trig = "switch" }, {
        t("switch "),
        i(1, "variable"),
        t({ " {", "| " }),
        i(2, "case1"),
        t(" => "),
        i(3),
        t({ "", "| " }),
        i(4, "case2"),
        t(" => "),
        i(5),
        t({ "", "}" }),
    }),
    s({ trig = "switch_opt" }, {
        t("switch "),
        i(1, "variable"),
        t({ " {", "| Some(" }),
        i(2, "value"),
        t(") => "),
        i(3),
        t({ "", "| None => " }),
        i(4),
        t({ "", "}" }),
    }),

    -- Belt option
    belt_opt("bom", "map"),
    belt_opt("bof", "flatMap"),
    belt_opt("bod", "getWithDefault"),
    belt_opt("bomd", "mapWithDefault"),
    -- Belt array
    belt_array("bam", "map"),
    belt_array("baf", "flatMap"),
    belt_array("bak", "keep"),

    -- Test
    s({ trig = "tdesc", dscr = "Create a describe block" }, {
        t({ 'describe("' }),
        i(1, "description"),
        t({ '", () => {', "  " }),
        i(0),
        t({ "", "})" }),
    }),
    s({ trig = "ttest", dscr = "Create a test block" }, {
        t({ 'test("' }),
        i(1, "description"),
        t({ '", () => {', "" }),
        t({ "  let expectedResult = " }),
        i(2, "true"),
        t({ "", "  let result = " }),
        i(3, "true"),
        t({ "", "  result |> expect |> toEqual(expectedResult)" }),
        t({ "", "})" }),
    }),
}
