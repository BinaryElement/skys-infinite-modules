function existing_productivity(prototype)
	prototype.subgroup = "productivity-modules"
	prototype.order = get_order(prototype.tier)
end
function new_productivity(tier)
	local icon_string = get_icon_string(tier, "productivity-module")
	return {
		category = "productivity",
		effect = {
			productivity = {bonus = get_productivity_bonuses()[tier]},
			consumption = {bonus = get_productivity_efficiency_penalties()[tier]},
			speed = {bonus = get_productivity_speed_penalties()[tier] * -1},
			pollution = {bonus = get_productivity_pollution_penalties()[tier]}
		},
		tier = tier,
		icons = {
			{icon = icon_string, icon_size = 64},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1},shift={-10,0}},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1}}
		},
		stack_size = 50,
		name = "productivity-module-"..tier,
		localised_name = {"", {"item-name.productivity-module"}, " ", tier},
		type = "module",
		subgroup = "productivity-modules",
		order = get_order(tier),
		localised_description = {"item-description.productivity-module"}
	},
	{
		ingredients = get_cost(tier, "productivity", get_craft_circuit_scale(), get_craft_circuit_scale_type(), get_craft_module_scale(), get_craft_module_scale_type()),
		result = "productivity-module-"..tier,
		name = "productivity-module-"..tier,
        localised_name = {"", {"item-name.productivity-module"}, " ", tier},
        type = "recipe",
        order = get_order(tier),
        energy_required = math.floor(get_time_cost(tier)),
        enabled = false
	}
end
--[[
Production Module:
	Bonuses:
		Productivity: +4%/+6%/+10%
	Penalties:
		Energy Consumption: +40%/+60%/+80% (+20, 1x)
		Speed:-5%/-10%/-15% (-5, -0.25x)
		Pollution:+5%/+7%/+10% (+2.5, 0.125x)
]]--