function calculate_multiplier(tiers, scale, scale_type, vanilla_factors)
	local factors = {vanilla_factors[1], vanilla_factors[2], vanilla_factors[3]} --TODO grab from prototype instead of hardcoded
	if tiers < 4 then 
		return factors
	end
	for i=4,tiers,1 do
		if scale_type == "Linear" then
			factors[i] = scale + factors[i-1]
		elseif scale_type == "Multiplicative" then
			factors[i] = factors[i-1] * scale
		end
	end
	return factors
end
function get_order(tier)
	local s = tostring(tier)
	local order = ""
	if #s < 2 then order = order.."0" end
	local order = order..s
	return order
end
function get_icon_string(tier, module)
    local icon_string = "__base__/graphics/icons/"..module.."-3.png"
    return icon_string
end
function get_cost(tier, module, circuit_scale, circuit_scale_type, module_scale, module_scale_type)
	local ingrediants = {}
	if tier == 1 then
		ingredients = {{"electronic-circuit", 5},{"advanced-circuit",5}}
	else
		local circuit_cost = 5 --Vanilla T3 module circuit cost
		local modules_cost = 5 --Vanilla T3 module previous-modules cost
		if circuit_scale_type == "Linear" then
			for i=4,tier,1 do
				circuit_cost = circuit_cost + circuit_scale
			end
		elseif circuit_scale_type == "Multiplicative" then
			for i=4,tier,1 do
				circuit_cost = circuit_cost * circuit_scale
			end
		end
		if module_scale_type == "Linear" then
			for i=4,tier,1 do
				modules_cost = modules_cost + module_scale
			end
		elseif module_scale_type == "Multiplicative" then
			for i=4,tier,1 do
				modules_cost = modules_cost * module_scale
			end
		end
		ingredients = {{module.."-module-"..(tier-1),modules_cost},{"advanced-circuit",circuit_cost},{"processing-unit",circuit_cost}}
	end
	return ingredients
end
function get_tech_cost(previous_cost)
	local cost = previous_cost
	local scale_type = get_tech_cost_scale_type()
	if scale_type == "Linear" then
		cost = cost + get_tech_cost_scale()
	elseif scale_type == "Multiplicative" then
		cost = cost * get_tech_cost_scale()
	else
		cost = 77777
	end
	return cost
end
function get_time_cost(tier)
	if tier == 1 then
		return 15
	elseif tier == 2 then
		return 30
	elseif tier == 3 then
		return 60
	end
	local time_scale = get_craft_time_scale()
	local time_scale_type = get_craft_time_scale_type()
	if time_scale_type == "Linear" then
		local crafting_time = 60
		for i=4,tier,1 do
			crafting_time = crafting_time + time_scale
		end
		return crafting_time
	elseif time_scale_type == "Multiplicative" then
		local crafting_time = 60
		for i=4,tier,1 do
			crafting_time = crafting_time * time_scale
		end
		return crafting_time
	end
	return 77777
end