function existing_efficiency(prototype)
	prototype.subgroup = "effectivity-modules"
	prototype.order = get_order(prototype.tier)
end
function new_efficiency(tier)
	local icon_string = get_icon_string(tier, "effectivity-module")
	return {
		category = "effectivity",
		effect = {
			consumption = {bonus = get_efficiency_bonuses()[tier] * -1},
		},
		tier = tier,
		icons = {
			{icon = icon_string, icon_size = 64},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1},shift={-10,0}},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1}}
		},
		stack_size = 50,
		name = "effectivity-module-"..tier,
		localised_name = {"", {"item-name.effectivity-module"}, " ", tier},
		type = "module",
		subgroup = "effectivity-modules",
		order = get_order(tier),
		localised_description = {"item-description.effectivity-module"}
	},
	{
		ingredients = get_cost(tier, "effectivity", get_craft_circuit_scale(), get_craft_circuit_scale_type(), get_craft_module_scale(), get_craft_module_scale_type()),
		result = "effectivity-module-"..tier,
		name = "effectivity-module-"..tier,
        localised_name = {"", {"item-name.effectivity-module"}, " ", tier},
        type = "recipe",
        order = get_order(tier),
        energy_required = math.floor(get_time_cost(tier)),
        enabled = false
	}
end