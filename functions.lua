require("error_util")

function calculate_multiplier(tiers, scale, scale_type, vanilla_factors, custom_formula, formula_index, custom_start)
	local factors = {vanilla_factors[1], vanilla_factors[2], vanilla_factors[3]} --TODO grab from prototype instead of hardcoded
	local min = 4
	if custom_start >= 0 then 
		factors[1] = custom_start
		min = 2 
	end
	if custom_formula ~= nil and custom_formula ~= "" then
		if min == 4 then
			min = 1
		end
		for i=min,tiers,1 do
			if pcall(apply_formula, custom_formula, factors, i, custom_start) then
			else
				local err_msg = "???"
				if formula_index == 1 then err_msg = "speed-module-"..i end
				if formula_index == 2 then err_msg = "efficiency-module-"..i end
				if formula_index == 3 then err_msg = "productivity-module-"..i end
				err_msg = "[Sky's Infinite Modules]: You have an erroneous maths formula for ["..err_msg.."] modules: ["..custom_formula.."].\n\nThis setting will be ignored until fixed."
				error_util.set_delayed_error_message(err_msg)
			end
		end
	else
		for i=min,tiers,1 do
			if scale_type == "Linear" then
				if i == 1 then factors[i] = scale
				else factors[i] = scale + factors[i-1] end
			elseif scale_type == "Multiplicative" then
				if i == 1 then factors[i] = 9.18171 --This result should never be seen
				else factors[i] = factors[i-1] * scale end
			end
		end
	end
	return factors
end

function apply_formula(custom_formula, factors, index, starting_value)
	local previousValue = 0
	local previousValueAlt = 1
	local firstValue = 0
	local firstValueAlt = 1
	if index > 1 then
		previousValue = factors[index - 1]
		previousValueAlt = factors[index - 1]
		firstValue = factors[1]
		firstValueAlt = factors[1]
	elseif starting_value >= 0 then
		firstValue = factors[1]
		firstValueAlt = factors[1]
	end
	factors[index] = parseFormula(custom_formula, factors, index, previousValue, previousValueAlt, firstValue, firstValueAlt)
end

function parseFormula(str, factors, workingTier, previousValue, previousValueAlt, firstValue, firstValueAlt)
    if maximumValue == nil or maximumValue < 1 then
        maximumValue = 2000000
    end
    str = parseSpecialStringChars(str, factors, workingTier, previousValue, previousValueAlt, firstValue, firstValueAlt)
    func = assert(load("return " .. str))
	local value = func()
	if type(value) ~= "number" then
		error("Erroneous formula "..str.." - doesn't result in a number!")
	end
    return value
end

function parseSpecialStringChars(str, factors, workingTier, previousValue, previousValueAlt, firstValue, firstValueAlt)
    if str == nil then
        error("Cannot parse nil string")
    end
	str = string.gsub(str, "P", tostring(previousValue))
	str = string.gsub(str, "R", tostring(previousValue))
	str = string.gsub(str, "F", tostring(firstValue))
	str = string.gsub(str, "S", tostring(firstValue))
    str = string.gsub(str, "T", tostring(workingTier))
    return str
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
		if circuit_cost <= 0 then 
			circuit_cost = 65535
			set_delayed_error_message("Your settings for module "..module.."-module-"..tier.." resulted in a negative circuits cost.\n\nThis setting will be ignored, and the cost will be the maximum, until this setting is fixed.")
		end
		if modules_cost <= 0 then 
			modules_cost = 65535 
			set_delayed_error_message("Your settings for module "..module.."-module-"..tier.." resulted in a negative previous-modules cost.\n\nThis setting will be ignored, and the cost will be the maximum, until this setting is fixed.")
		end
		if circuit_cost > 65535 then 
			circuit_cost = 65535 
			set_delayed_error_message("Your settings for module "..module.."-module-"..tier.." resulted in a circuit crafting cost higher than 65535.  Factorio does not allow this.\n\nThis setting will be ignored, and the cost will be the maximum, until this setting is fixed.")
		end
		if modules_cost > 65535 then 
			modules_cost = 65535 
			set_delayed_error_message("Your settings for module "..module.."-module-"..tier.." resulted in a previous-module crafting cost higher than 65535.  Factorio does not allow this.\n\nThis setting will be ignored, and the cost will be the maximum, until this setting is fixed.")
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