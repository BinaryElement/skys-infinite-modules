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
        order = "aa",
        default_value = 10,
        minimum_value = 3,
        maximum_value = 50,
        setting_type = "startup"
    },
    {
        name = "speed-module-bonus-scale",
        type = "double-setting",
        order = "ab",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "speed-module-penalty-scale",
        type = "double-setting",
        order = "ac",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "speed-module-bonus-scaling-type",
        type = "string-setting",
        order = "ad",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "speed-module-penalty-scaling-type",
        type = "string-setting",
        order = "ae",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "speed-module-adjust-existing",
        type = "bool-setting",
        order = "af",
        default_value = false,
        setting_type = "startup"
    },
    {
        name = "speed-module-bonus-custom-formula",
        type = "string-setting",
        order = "ag",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "speed-module-penalty-custom-formula",
        type = "string-setting",
        order = "ah",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
--EFFICIENCY MODULES START HERE
    { 
        name = "max-efficiency-module-tier",
        type = "int-setting",
        order = "ba",
        default_value = 10,
        minimum_value = 3,
        maximum_value = 50,
        setting_type = "startup"
    },
    {
        name = "efficiency-module-bonus-scale",
        type = "double-setting",
        order = "bb",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "efficiency-module-penalty-scale",
        type = "double-setting",
        order = "bc",
        default_value = 0.10,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "efficiency-module-bonus-scaling-type",
        type = "string-setting",
        order = "bd",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "efficiency-module-penalty-scaling-type",
        type = "string-setting",
        order = "be",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "efficiency-module-adjust-existing",
        type = "bool-setting",
        order = "bf",
        default_value = false,
        setting_type = "startup"
    },
    {
        name = "efficiency-module-bonus-custom-formula",
        type = "string-setting",
        order = "bg",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
--PRODUCTIVITY MODULES START HERE
    { 
        name = "max-productivity-module-tier",
        type = "int-setting",
        order = "ca",
        default_value = 10,
        minimum_value = 3,
        maximum_value = 50,
        setting_type = "startup"
    },
    {
        name = "productivity-module-bonus-scale",
        type = "double-setting",
        order = "cb",
        default_value = 0.04,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-speed-penalty-scale",
        type = "double-setting",
        order = "cc",
        default_value = 0.05,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-efficiency-penalty-scale",
        type = "double-setting",
        order = "cd",
        default_value = 0.20,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-pollution-penalty-scale",
        type = "double-setting",
        order = "ce",
        default_value = 0.025,
        minimum_value = -1000,
        maximum_value = 1000,
        setting_type = "startup"
    },
    {
        name = "productivity-module-bonus-scaling-type",
        type = "string-setting",
        order = "cf",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-speed-penalty-scaling-type",
        type = "string-setting",
        order = "cg",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-efficiency-penalty-scaling-type",
        type = "string-setting",
        order = "ch",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-pollution-penalty-scaling-type",
        type = "string-setting",
        order = "ci",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "productivity-module-adjust-existing",
        type = "bool-setting",
        order = "cf",
        default_value = false,
        setting_type = "startup",
    },
    {
        name = "productivity-module-bonus-custom-formula",
        type = "string-setting",
        order = "cg",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-speed-penalty-custom-formula",
        type = "string-setting",
        order = "ch",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-efficiency-penalty-custom-formula",
        type = "string-setting",
        order = "ci",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
    {
        name = "productivity-module-pollution-penalty-custom-formula",
        type = "string-setting",
        order = "cj",
        default_value = "",
        setting_type = "startup",
        allow_blank = true
    },
-- GLOBAL SETTINGS START HERE
    {
        name = "technology-cost-scale",
        type = "double-setting",
        order = "da",
        default_value = 2,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "technology-cost-scaling-type",
        type = "string-setting",
        order = "db",
        default_value = "Multiplicative",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "crafting-circuit-cost-scale",
        type = "double-setting",
        order = "dc",
        default_value = 5,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "crafting-circuit-cost-scaling-type",
        type = "string-setting",
        order = "dd",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "crafting-module-cost-scale",
        type = "double-setting",
        order = "de",
        default_value = 0,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "crafting-module-cost-scaling-type",
        type = "string-setting",
        order = "df",
        default_value = "Linear",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
    {
        name = "crafting-time-cost-scale",
        type = "double-setting",
        order = "dg",
        default_value = 2,
        minimum_value = 0,
        maximum_value = 32000,
        setting_type = "startup"
    },
    {
        name = "crafting-time-cost-scaling-type",
        type = "string-setting",
        order = "dh",
        default_value = "Multiplicative",
        allowed_values = {"Linear", "Multiplicative"},
        setting_type = "startup"
    },
}
data:extend(settings)