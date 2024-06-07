require ("functions")

local speed_tiers = settings.startup["max-speed-module-tier"].value
local speed_bonus_scale = settings.startup["speed-module-bonus-scale"].value
local speed_penalty_scale = settings.startup["speed-module-penalty-scale"].value
local speed_bonus_scale_type = settings.startup["speed-module-bonus-scaling-type"].value
local speed_penalty_scale_type = settings.startup["speed-module-penalty-scaling-type"].value
local speed_bonus_custom_start = settings.startup["speed-module-bonus-custom-start"].value
local speed_penalty_custom_start = settings.startup["speed-module-penalty-custom-start"].value
local speed_bonus_formula = settings.startup["speed-module-bonus-custom-formula"].value
local speed_penalty_formula = settings.startup["speed-module-penalty-custom-formula"].value


local efficiency_tiers = settings.startup["max-efficiency-module-tier"].value
local efficiency_bonus_scale = settings.startup["efficiency-module-bonus-scale"].value
local efficiency_penalty_scale = settings.startup["efficiency-module-penalty-scale"].value
local efficiency_bonus_scale_type = settings.startup["efficiency-module-bonus-scaling-type"].value
local efficiency_penalty_scale_type = settings.startup["efficiency-module-penalty-scaling-type"].value
local efficiency_bonus_custom_start = settings.startup["efficiency-module-bonus-custom-start"].value
local efficiency_penalty_custom_start = settings.startup["efficiency-module-penalty-custom-start"].value
local efficiency_bonus_formula = settings.startup["efficiency-module-bonus-custom-formula"].value
local efficiency_penalty_formula = settings.startup["efficiency-module-penalty-custom-formula"].value


local productivity_tiers = settings.startup["max-productivity-module-tier"].value
local productivity_bonus_scale = settings.startup["productivity-module-bonus-scale"].value
local productivity_speed_penalty_scale = settings.startup["productivity-module-speed-penalty-scale"].value
local productivity_efficiency_penalty_scale = settings.startup["productivity-module-efficiency-penalty-scale"].value
local productivity_pollution_penalty_scale = settings.startup["productivity-module-pollution-penalty-scale"].value
local productivity_bonus_scale_type = settings.startup["productivity-module-bonus-scaling-type"].value
local productivity_speed_penalty_scale_type = settings.startup["productivity-module-speed-penalty-scaling-type"].value
local productivity_efficiency_penalty_scale_type = settings.startup["productivity-module-speed-penalty-scaling-type"].value
local productivity_pollution_penalty_scale_type = settings.startup["productivity-module-speed-penalty-scaling-type"].value
local productivity_bonus_custom_start = settings.startup["productivity-module-bonus-custom-start"].value
local productivity_speed_penalty_custom_start = settings.startup["productivity-module-speed-penalty-custom-start"].value
local productivity_efficiency_penalty_custom_start = settings.startup["productivity-module-efficiency-penalty-custom-start"].value
local productivity_pollution_penalty_custom_start = settings.startup["productivity-module-pollution-penalty-custom-start"].value
local productivity_bonus_formula = settings.startup["productivity-module-bonus-custom-formula"].value
local productivity_speed_penalty_formula = settings.startup["productivity-module-speed-penalty-custom-formula"].value
local productivity_efficiency_penalty_formula = settings.startup["productivity-module-efficiency-penalty-custom-formula"].value
local productivity_pollution_penalty_formula = settings.startup["productivity-module-pollution-penalty-custom-formula"].value


local tech_cost_scale = settings.startup["technology-cost-scale"].value
local tech_cost_scale_type = settings.startup["technology-cost-scaling-type"].value
local craft_circuit_scale = settings.startup["crafting-circuit-cost-scale"].value
local craft_circuit_scale_type = settings.startup["crafting-circuit-cost-scaling-type"].value
local craft_module_scale = settings.startup["crafting-module-cost-scale"].value
local craft_module_scale_type = settings.startup["crafting-module-cost-scaling-type"].value
local craft_time_scale = settings.startup["crafting-time-cost-scale"].value
local craft_time_scale_type = settings.startup["crafting-time-cost-scaling-type"].value

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
--[[calculate_multiplier(tiers, bonus_scale, penalty_scale, bonus_scale_type, penalty_scale_type)
local speed_bonuses, speed_penalties = calculate_multiplier(speed_tiers, speed_bonus_scale, speed_bonus_scale_type, speed_penalty_scale, speed_penalty_scale_type, {0.2, 0.3, 0.5}, {0.5, 0.6, 0.7})
local efficiency_bonuses, efficiency_penalties = calculate_multiplier(efficiency_tiers, efficiency_bonus_scale, efficiency_bonus_scale_type, efficiency_penalty_scale, efficiency_penalty_scale_type, {0.3, 0.4, 0.5}, {0, 0, 0})
local productivity_bonuses, productivity_penalties = calculate_multiplier(productivity_tiers, productivity_bonus_scale, productivity_bonus_scale_type, productivity_penalty_scale, productivity_penalty_scale_type, {0.04, 0.06, 0.1}, {0.4, 0.6, 0.8})]]--

--calculate_multiplier(tiers, scale, scale_type, vanilla_factors)
local speed_bonuses = calculate_multiplier(speed_tiers, speed_bonus_scale, speed_bonus_scale_type, {0.2, 0.3, 0.5}, speed_bonus_formula, 1, speed_bonus_custom_start)
local speed_penalties = calculate_multiplier(speed_tiers, speed_penalty_scale, speed_penalty_scale_type, {0.5, 0.6, 0.7}, speed_penalty_formula, 1, speed_penalty_custom_start)

local efficiency_bonuses = calculate_multiplier(efficiency_tiers, efficiency_bonus_scale, efficiency_bonus_scale_type, {0.3, 0.4, 0.5}, efficiency_bonus_formula, 2, efficiency_bonus_custom_start)
local efficiency_penalties = calculate_multiplier(efficiency_tiers, efficiency_penalty_scale, efficiency_penalty_scale_type, {0, 0, 0}, efficiency_penalty_formula, 2, efficiency_penalty_custom_start)

local productivity_bonuses = calculate_multiplier(productivity_tiers, productivity_bonus_scale, productivity_bonus_scale_type, {0.04, 0.06, 0.1}, productivity_bonus_formula, 3, productivity_bonus_custom_start)
local productivity_speed_penalties = calculate_multiplier(productivity_tiers, productivity_speed_penalty_scale, productivity_speed_penalty_scale_type, {0.05, 0.1, 0.15}, productivity_speed_penalty_formula, 3, productivity_speed_penalty_custom_start)
local productivity_efficiency_penalties = calculate_multiplier(productivity_tiers, productivity_efficiency_penalty_scale, productivity_efficiency_penalty_scale_type, {0.4, 0.6, 0.8}, productivity_efficiency_penalty_formula, 3, productivity_efficiency_penalty_custom_start)
local productivity_pollution_penalties = calculate_multiplier(productivity_tiers, productivity_pollution_penalty_scale, productivity_pollution_penalty_scale_type, {0.05, 0.075, 0.1}, productivity_pollution_penalty_formula, 3, productivity_pollution_penalty_custom_start)

function get_speed_tiers()
	return speed_tiers
end
function get_speed_bonus_scale()
	return speed_bonus_scale
end
function get_speed_penalty_scale()
	return speed_penalty_scale
end
function get_speed_bonus_scale_type()
	return speed_bonus_scale_type
end
function get_speed_penalty_scale_type()
	return speed_penalty_scale_type
end
function get_speed_bonuses()
	return speed_bonuses
end
function get_speed_penalties()
	return speed_penalties
end
function get_speed_bonus_custom_start()
	return speed_bonus_custom_start
end
function get_speed_penalty_custom_start()
	return speed_penalty_custom_start
end
function get_speed_bonus_formula()
	return speed_bonus_formula
end
function get_speed_penalty_formula()
	return speed_penalty_formula
end

function get_efficiency_tiers()
	return efficiency_tiers
end
function get_efficiency_bonus_scale()
	return efficiency_bonus_scale
end
function get_efficiency_penalty_scale()
	return efficiency_penalty_scale
end
function get_efficiency_bonus_scale_type()
	return efficiency_bonus_scale_type
end
function get_efficiency_penalty_scale_type()
	return efficiency_penalty_scale_type
end
function get_efficiency_bonuses()
	return efficiency_bonuses
end
function get_efficiency_penalties()
	return efficiency_penalties
end
function get_efficiency_bonus_custom_start()
	return efficiency_bonus_custom_start
end
function get_efficiency_penalty_custom_start()
	return efficiency_penalty_custom_start
end
function get_efficiency_bonus_formula()
	return efficiency_bonus_formula
end
function get_efficiency_penalty_formula()
	return efficiency_penalty_formula
end

function get_productivity_tiers()
	return productivity_tiers
end
function get_productivity_bonus_scale()
	return productivity_bonus_scale
end
function get_productivity_bonus_scale_type()
	return productivity_bonus_scale_type
end
function get_productivity_speed_penalty_scale_type()
	return productivity_speed_penalty_scale_type
end
function get_productivity_efficiency_penalty_scale_type()
	return productivity_efficiency_penalty_scale_type
end
function get_productivity_pollution_penalty_scale_type()
	return productivity_pollution_penalty_scale_type
end
function get_productivity_bonuses()
	return productivity_bonuses
end
function get_productivity_speed_penalties()
	return productivity_speed_penalties
end
function get_productivity_efficiency_penalties()
	return productivity_efficiency_penalties
end
function get_productivity_pollution_penalties()
	return productivity_pollution_penalties
end
function get_productivity_bonus_custom_start()
	return productivity_bonus_custom_start
end
function get_productivity_speed_penalty_custom_start()
	return productivity_speed_penalty_custom_start
end
function get_productivity_efficiency_penalty_custom_start()
	return productivity_efficiency_penalty_custom_start
end
function get_productivity_pollution_penalty_custom_start()
	return productivity_pollution_penalty_custom_start
end
function get_productivity_bonus_formula()
	return productivity_bonus_formula
end
function get_productivity_speed_penalty_formula()
	return productivity_speed_penalty_formula
end
function get_productivity_efficiency_penalty_formula()
	return productivity_efficiency_penalty_formula
end
function get_productivity_pollution_penalty_formula()
	return productivity_pollution_penalty_formula
end

function get_tech_cost_scale()
	return tech_cost_scale
end
function get_tech_cost_scale_type()
	return tech_cost_scale_type
end
function get_craft_circuit_scale()
	return craft_circuit_scale
end
function get_craft_circuit_scale_type()
	return craft_circuit_scale_type
end
function get_craft_module_scale()
	return craft_module_scale
end
function get_craft_module_scale_type()
	return craft_module_scale_type
end
function get_craft_time_scale()
	return craft_time_scale
end
function get_craft_time_scale_type()
	return craft_time_scale_type
end