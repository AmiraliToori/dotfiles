local function setup()
	-- Add symlink in status bar
	-- This is placed here so it's only registered once at startup.
	Status:children_add(function(self)
		local h = self._current.hovered
		if h and h.link_to then
			return " -> " .. tostring(h.link_to)
		else
			return ""
		end
	end, 3300, Status.LEFT)

	Status:children_add(function()
		local h = cx.active.current.hovered
		if not h or ya.target_family() ~= "unix" then
			return ""
		end

		return ui.Line({
			ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
			":",
			ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
			" ",
		})
	end, 500, Status.RIGHT)

	Header:children_add(function()
		if ya.target_family() ~= "unix" then
			return ""
		end
		return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
	end, 500, Header.LEFT)

	Manager.render = function(self, area)
		local c = self:layout(area)
		local bar = function(c, x, y)
			if x <= 0 or x == area.w - 1 then
				return {}
			end

			return ui.Bar(
				ui.Rect({ x = x, y = math.max(0, y), w = ya.clamp(0, area.w - x, 1), h = math.min(1, area.h) }),
				ui.Bar.TOP
			):symbol(c)
		end

		local style = THEME.manager.border_style
		return ya.flat({
			-- Borders
			ui.Border(area, ui.Border.ALL):type(ui.Border.ROUNDED):style(style),
			ui.Bar(c[1]:padding(ui.Padding.y(1)), ui.Bar.RIGHT):style(style),
			ui.Bar(c[3]:padding(ui.Padding.y(1)), ui.Bar.LEFT):style(style),

			bar("┬", c[1].right - 1, c[1].y),
			bar("┴", c[1].right - 1, c[1].bottom - 1),
			bar("┬", c[2].right, c[2].y),
			bar("┴", c[2].right, c[2].bottom - 1),

			-- Parent
			Parent:render(c[1]:padding(ui.Padding.xy(1))),
			-- Current
			Current:render(c[2]:padding(c[1].w > 0 and ui.Padding.y(1) or ui.Padding(1, 0, 1, 1))),
			-- Preview
			Preview:render(c[3]:padding(ui.Padding.xy(1))),
		})
	end
end

-- full-border plugin
require("full-border"):setup({
	-- Available values: ui.Border.PLAIN, ui.Border.ROUNDED
	type = ui.Border.ROUNDED,
})

-- DuckDB plugin configuration
require("duckdb"):setup()

-- recycle-bin
require("recycle-bin"):setup()

-- git.yazi
require("git"):setup()

-- starship.yazi
require("starship"):setup()

return { setup = setup }
