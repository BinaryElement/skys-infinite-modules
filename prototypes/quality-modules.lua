function existing_quality(prototype, tier)
	prototype.subgroup = "quality-modules"
	prototype.order = get_order(prototype.tier)
	if get_quality_bonus_custom_start() >= 0 or get_quality_bonus_formula() ~= "" then
		prototype.effect = { consumption = get_quality_bonuses()[tier] * -1}
	end
end
function new_quality(tier)
	local icon_string = get_icon_string(tier, "quality-module")
	return {
		category = "quality",
		effect = {
			quality = get_quality_bonuses()[tier],
			speed = get_quality_penalties()[tier] * -1
		},
		tier = tier,
		icons = {
			{icon = icon_string, icon_size = 64},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=1,b=1,a=1},shift={-10,0}},
            {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(tier):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=1,b=1,a=1}}
		},
		stack_size = 50,
		name = "quality-module-"..tier,
		localised_name = {"", {"item-name.quality-module"}, " ", tostring(tier)},
		type = "module",
		subgroup = "quality-modules",
		order = get_order(tier),
		localised_description = {"item-description.quality-module"}
	},
	{
		ingredients = get_cost(tier, "quality", get_craft_circuit_scale(), get_craft_circuit_scale_type(), get_craft_module_scale(), get_craft_module_scale_type()),
		results = {{name = "quality-module-"..tier, amount = 1, type = "item"}},
		name = "quality-module-"..tier,
        localised_name = {"", {"item-name.quality-module"}, " ", tostring(tier)},
        type = "recipe",
        order = get_order(tier),
        energy_required = math.floor(get_time_cost(tier)),
        enabled = false
	}
end