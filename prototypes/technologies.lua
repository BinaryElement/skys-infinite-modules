require "util"

for i=1,get_speed_tiers(),1 do
	local string_concat = ""
	if i>1 then
		string_concat = "-"..i
	end
	local icon_string = get_icon_string(i, "speed-module")
	if data.raw.technology["speed-module"..string_concat] == nil then
        data:extend({
            {
                icons = {
                    {icon = icon_string, icon_size = 64},
                    {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(i):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1},shift={-20,0}},
                    {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(i):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1}}
                },
                unit = {
                    count = get_tech_cost(data.raw.technology["speed-module-"..(i-1)].unit.count),
                    time = data.raw.technology["speed-module-"..(i-1)].unit.time,
                    ingredients = data.raw.technology["speed-module-"..(i-1)].unit.ingredients,
                },
                effects = {
                    {type = "unlock-recipe", recipe = "speed-module-"..i}
                },
                prerequisites = {"speed-module-"..(i-1)},
                upgrade = true,
                name = "speed-module"..string_concat,
                type = "technology",
                localised_name = {"", {"item-name.speed-module"}, " ", i},
                localised_description = {"technology-description.speed-module"}
            }
        })
    end
end
for i=1,get_efficiency_tiers(),1 do
	local string_concat = ""
	if i>1 then
		string_concat = "-"..i
	end
	local icon_string = get_icon_string(i, "effectivity-module")
	if data.raw.technology["effectivity-module"..string_concat] == nil then
        data:extend({
            {
                icons = {
                    {icon = icon_string, icon_size = 64},
                    {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(i):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1},shift={-20,0}},
                    {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(i):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1}}
                },
                unit = {
                    count = get_tech_cost(data.raw.technology["effectivity-module-"..(i-1)].unit.count),
                    time = data.raw.technology["effectivity-module-"..(i-1)].unit.time,
                    ingredients = data.raw.technology["effectivity-module-"..(i-1)].unit.ingredients,
                },
                effects = {
                    {type = "unlock-recipe", recipe = "effectivity-module-"..i}
                },
                prerequisites = {"effectivity-module-"..(i-1)},
                upgrade = true,
                name = "effectivity-module"..string_concat,
                type = "technology",
                localised_name = {"", {"item-name.effectivity-module"}, " ", i},
                localised_description = {"technology-description.effectivity-module"}
            }
        })
    end
end
for i=1,get_productivity_tiers(),1 do
	local string_concat = ""
	if i>1 then
		string_concat = "-"..i
	end
	local icon_string = get_icon_string(i, "productivity-module")
	if data.raw.technology["productivity-module"..string_concat] == nil then
        data:extend({
            {
                icons = {
                    {icon = icon_string, icon_size = 64},
                    {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(i):sub(1,1))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1},shift={-20,0}},
                    {icon = "__skys-infinite-modules__/graphics/icons/"..(get_order(i):sub(2,2))..".png", icon_size = 64, tint = {r=1,g=0,b=0,a=1}}
                },
                unit = {
                    count = get_tech_cost(data.raw.technology["productivity-module-"..(i-1)].unit.count),
                    time = data.raw.technology["productivity-module-"..(i-1)].unit.time,
                    ingredients = data.raw.technology["productivity-module-"..(i-1)].unit.ingredients,
                },
                effects = {
                    {type = "unlock-recipe", recipe = "productivity-module-"..i}
                },
                prerequisites = {"productivity-module-"..(i-1)},
                upgrade = true,
                name = "productivity-module"..string_concat,
                type = "technology",
                localised_name = {"", {"item-name.productivity-module"}, " ", i},
                localised_description = {"technology-description.productivity-module"}
            }
        })
    end
end