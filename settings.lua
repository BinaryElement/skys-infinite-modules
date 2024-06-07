--[[
Speed Module:
	Bonuses:
		Speed: +20%/+30%/+50%
	Penalties:
		Energy Consumption: +50%/+60%/+70%
		
Efficiency Module:
	Bonuses:
		Energy Consumption: -30%/-40%/-50%
		
Production Module:
	Bonuses:
		Productivity: +4%/+6%/+10%
	Penalties:
		Energy Consumption: +40%/+60%/+80%
		Speed:-5%/-10%/-15%
		Pollution:+5%/+7%/+10%
--]]
settings = {
--SPEED MODULES START HERE
    { 
        name = "max-speed-module-tier",
        type = "int-setting",
        order = "mod1-1",
        default_value = 10,
        minimum_value = 3,
        maximum_value = 50,
        setting_type = "startup"
    },
    {
        name = "speed-module-bonus-scale",
        type = "double-setting",
        order = "mod1-2a",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "speed-module-bonus-scaling-type",
        type = "string-setting",
        order = "mod1-2b",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "speed-module-penalty-scale",
        type = "double-setting",
        order = "mod1-3a",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "speed-module-penalty-scaling-type",
        type = "string-setting",
        order = "mod1-3b",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "speed-module-bonus-custom-formula",
        type = "string-setting",
        order = "mod1-4a",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "speed-module-bonus-custom-start",
        type = "double-setting",
        order = "mod1-4b",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
    {
        name = "speed-module-penalty-custom-formula",
        type = "string-setting",
        order = "mod1-5a",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "speed-module-penalty-custom-start",
        type = "double-setting",
        order = "mod1-5b",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
--EFFICIENCY MODULES START HERE
    { 
        name = "max-efficiency-module-tier",
        type = "int-setting",
        order = "mod2-1",
        default_value = 10,
        minimum_value = 3,
        maximum_value = 50,
        setting_type = "startup"
    },
    {
        name = "efficiency-module-bonus-scale",
        type = "double-setting",
        order = "mod2-2a",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "efficiency-module-bonus-scaling-type",
        type = "string-setting",
        order = "mod2-2b",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "efficiency-module-penalty-scale",
        type = "double-setting",
        order = "mod2-3a",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup",
        hidden = true
    },
    {
        name = "efficiency-module-penalty-scaling-type",
        type = "string-setting",
        order = "mod2-3b",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup",
        hidden = true
    },
    {
        name = "efficiency-module-bonus-custom-formula",
        type = "string-setting",
        order = "mod2-4a",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "efficiency-module-bonus-custom-start",
        type = "double-setting",
        order = "mod2-4b",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
    {
        name = "efficiency-module-penalty-custom-formula",
        type = "string-setting",
        order = "mod2-5a",
        default_value = "",
        setting_type = "startup",
        allow_blank = true,
        hidden = true
    },
    {
        name = "efficiency-module-penalty-custom-start",
        type = "double-setting",
        order = "mod2-5b",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
        hidden = true
    },
--PRODUCTIVITY MODULES START HERE
    { 
        name = "max-productivity-module-tier",
        type = "int-setting",
        order = "mod3-1",
        default_value = 10,
        minimum_value = 3,
        maximum_value = 50,
        setting_type = "startup"
    },
    {
        name = "productivity-module-bonus-scale",
        type = "double-setting",
        order = "mod3-2a",
        default_value = 0.04,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-bonus-scaling-type",
        type = "string-setting",
        order = "mod3-2ba",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-speed-penalty-scale",
        type = "double-setting",
        order = "mod3-3aa",
        default_value = 0.05,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-speed-penalty-scaling-type",
        type = "string-setting",
        order = "mod3-3ab",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-efficiency-penalty-scale",
        type = "double-setting",
        order = "mod3-3ba",
        default_value = 0.20,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-efficiency-penalty-scaling-type",
        type = "string-setting",
        order = "mod3-3bb",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-pollution-penalty-scale",
        type = "double-setting",
        order = "mod3-3ca",
        default_value = 0.025,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-pollution-penalty-scaling-type",
        type = "string-setting",
        order = "mod3-3cb",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-bonus-custom-formula",
        type = "string-setting",
        order = "mod3-4a",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-bonus-custom-start",
        type = "double-setting",
        order = "mod3-4b",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
    {
        name = "productivity-module-speed-penalty-custom-formula",
        type = "string-setting",
        order = "mod3-5aa",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-speed-penalty-custom-start",
        type = "double-setting",
        order = "mod3-5ab",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
    {
        name = "productivity-module-efficiency-penalty-custom-formula",
        type = "string-setting",
        order = "mod3-5ba",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-efficiency-penalty-custom-start",
        type = "double-setting",
        order = "mod3-5bb",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
    {
        name = "productivity-module-pollution-penalty-custom-formula",
        type = "string-setting",
        order = "mod3-5ca",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-pollution-penalty-custom-start",
        type = "double-setting",
        order = "mod3-5cb",
        default_value = -1,
        minimum_value = -1,
        setting_type = "startup",
    },
-- GLOBAL SETTINGS START HERE
    {
        name = "technology-cost-scale",
        type = "double-setting",
        order = "g-1a",
        default_value = 2,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "technology-cost-scaling-type",
        type = "string-setting",
        order = "g-1b",
        default_value = "Multiplicative",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "crafting-circuit-cost-scale",
        type = "double-setting",
        order = "g-2a",
        default_value = 5,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "crafting-circuit-cost-scaling-type",
        type = "string-setting",
        order = "g-2b",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "crafting-module-cost-scale",
        type = "double-setting",
        order = "g-2c",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "crafting-module-cost-scaling-type",
        type = "string-setting",
        order = "g-2d",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "crafting-time-cost-scale",
        type = "double-setting",
        order = "g-2e",
        default_value = 2,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "crafting-time-cost-scaling-type",
        type = "string-setting",
        order = "g-2f",
        default_value = "Multiplicative",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
}
data:extend(settings)