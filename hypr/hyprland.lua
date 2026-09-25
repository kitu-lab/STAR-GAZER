-- STAR-GAZER (kitu rice)

-- locals

local terminal = "kitty"
local mainMod = "SUPER"
local files = "dolphin"
local launcher = "rofi -show drun"

-- monitors

hl.monitor({ output = "HDMI-A-1", mode = "1600x900@75" })
hl.monitor({ output = "eDP-1", disabled = true }) 

-- configs

hl.config({ general = { 
	border_size = 1,
	gaps_in = 5, 
	gaps_out = 30,
	col = {
		active_border = { colors = {"rgb(dccda4)"},
		inactive_border = { colors = {"rgb(fb6f92)"},
	},
},
},
},
})
hl.config({ 
	decoration = {
		rounding = 0,
		blur = {
			enabled = false
		},
		shadow =  { 
			enabled = false
		},
	}
})

-- autostart


hl.on("hyprland.start", function() hl.exec_cmd("hyprpaper & waybar") end)

-- binds

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
for i = 1, 10 do
    local key = i % 10
    hl.bind("SUPER + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind("SUPER + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end
hl.bind("PRINT", hl.dsp.exec_cmd("hyprshot -m region -z"))
hl.bind("SUPER + PRINT", hl.dsp.exec_cmd("hyprshot -m output -z"))
hl.bind("SUPER + V", hl.dsp.window.float(toggle, window))
hl.bind("SUPER + C", hl.dsp.window.close(window))
hl.bind("SUPER + SHIFT + E", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) 
hl.bind("SUPER + left",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + up",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + down",  hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + E", hl.dsp.exec_cmd(files))
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + R", hl.dsp.exec_cmd(launcher))
hl.bind("SUPER + SHIFT + left",  hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + up",    hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + down",  hl.dsp.window.move({ direction = "down" }))
hl.bind("SUPER + H", hl.dsp.exec_cmd("hyprpicker --autocopy"))

-- window manager layout

hl.config({ general = { 
	layout = "dwindle" 
} 
})
hl.config({ 
	dwindle = { 
		preserve_split = true 
	} 
})

-- keyboard layout

hl.config({ 
	input = { 
		kb_layout  = "us", 
		kb_variant = "intl" 
	}
})

-- env settings

hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XCURSOR_THEME", "Adwaita")
hl.env("XCURSOR_SIZE", "24")

-- animations

animations = { 
	enabled = true 
},

hl.curve("bounce", { 
	type = "spring", 
	mass = 1, 
	stiffness = 16, 
	dampening = 8 
})
hl.curve("easeOutQuint", { 
	type = "bezier", 
	points = { 
		{0.23, 1},    {0.32, 1}    
	} 
})
hl.animation({ 
	leaf = "workspaces", 
	enabled = true, 
	speed = 5, 
	bezier = "easeOutQuint", 
	style = "slide" 
})
