function calculate_multiplier(tiers, scale, scale_type, vanilla_factors, apply_to_vanilla, custom_formula, formula_index)
	local factors = {vanilla_factors[1], vanilla_factors[2], vanilla_factors[3]} --TODO grab from prototype instead of hardcoded
	local min = 4
	if apply_to_vanilla then min = 1 end
	for i=min,tiers,1 do
		if scale_type == "Linear" then
			if i == 1 then
				factors[i] = scale
			else
				factors[i] = scale + factors[i-1]
			end
		elseif scale_type == "Multiplicative" then
			if i == 1 then
				factors[i] = vanilla_factors[1] --TODO have a custom starting value
			else
				factors[i] = factors[i-1] * scale
			end
		end
	end
	if custom_formula ~= nil and custom_formula ~= "" then
		print("[InfMod] custom_formula = "..custom_formula)
		for i=min,tiers,1 do
			--apply_formula(custom_formula, factors, i)
			if pcall(apply_formula, custom_formula, factors, i) then
				set_invalid_formula(nil, formula_index)
			else
				set_invalid_formula(custom_formula, formula_index)
			end
		end
	end
	return factors
end

function apply_formula(custom_formula, factors, index)
	local previousValue = 0
	local firstValue = 0
	if index > 1 then
		previousValue = factors[index - 1]
		firstValue = factors[1]
	end
	factors[index] = parseFormula(custom_formula, factors, index, previousValue, firstValue)
end

function parseFormula(str, factors, workingTier, previousValue, firstValue)
    if maximumValue == nil or maximumValue < 1 then
        maximumValue = 2000000
    end
    str = parseSpecialStringChars(str, factors, workingTier, previousValue, firstValue)
    func = assert(load("return " .. str))
	print("[InfMod]    Result = "..func())
    return func()
end

function parseSpecialStringChars(str, factors, workingTier, previousValue, firstValue)
    if str == nil then
        error("Cannot parse nil string")
    end
	if workingTier == 1 then
		str = string.gsub(str, "P", 0)
		str = string.gsub(str, "R", 1)
		str = string.gsub(str, "F", 0)
		str = string.gsub(str, "S", 1)
	else
		str = string.gsub(str, "P", tostring(factors[workingTier-1]))
		str = string.gsub(str, "R", tostring(factors[workingTier-1]))
		str = string.gsub(str, "F", tostring(factors[1]))
		str = string.gsub(str, "S", tostring(factors[1]))
	end
    str = string.gsub(str, "T", tostring(workingTier))
    return str
end

local invalid_formulas = {nil, nil, nil}
function get_invalid_formula()
	--[[for i=1,#invalid_formula,1 do
		if invalid_formula[i] ~= nil then return invalid_formula[i] end
	end
	return nil]]
	return invalid_formulas
end

function set_invalid_formula(value, index)
	invalid_formulas[index] = value
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