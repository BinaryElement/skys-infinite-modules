function existing_speed(prototype, tier)
	prototype.subgroup = "speed-modules"
	prototype.order = get_order(prototype.tier)
	if get_speed_bonus_custom_start() >= 0 or get_speed_bonus_formula() ~= "" then
		prototype.effect.speed = {bonus = get_speed_bonuses()[tier]}
	end
	if get_speed_penalty_custom_start() or get_speed_penalty_formula() ~= "" then
		prototype.effect.consumption = {bonus = get_speed_penalties()[tier]}
	end
end
function new_speed(tier)
	local icon_string = get_icon_string(tier, "speed-module")
	return {
		category = "speed",
		effect = {
			speed = {bonus = get_speed_bonuses()[tier]},
			consumption = {bonus = get_speed_penalties()[tier]}
		},
		tier = tier,
		icons = {
			{icon = icon_string, icon_size = 64},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=1,b=1,a=1},shift={-10,0}},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=1,b=1,a=1}}
		},
		stack_size = 50,
		name = "speed-module-"..tier,
		localised_name = {"", {"item-name.speed-module"}, " ", tier},
		type = "module",
		subgroup = "speed-modules",
		order = get_order(tier),
		localised_description = {"item-description.speed-module"}
	},
	{
		ingredients = get_cost(tier, "speed", get_craft_circuit_scale(), get_craft_circuit_scale_type(), get_craft_module_scale(), get_craft_module_scale_type()),
		result = "speed-module-"..tier,
		name = "speed-module-"..tier,
        localised_name = {"", {"item-name.speed-module"}, " ", tier},
        type = "recipe",
        order = get_order(tier),
        energy_required = math.floor(get_time_cost(tier)),
        enabled = false
	}
end