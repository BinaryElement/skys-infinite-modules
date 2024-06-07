require("defines")

script.on_init(function()
    local check_formulas = get_invalid_formula()
    for i=1,#check_formulas,1 do
        if check_formulas[i] ~= nil then
            local moduleType = "???"
            if i == 1 then moduleType = "speed" end
            if i == 2 then moduleType = "efficiency" end
            if i == 3 then moduleType = "productivity" end
            error("Infinite Modules: erroneous maths formula for "..moduleType.." modules: "..check_formulas[i])
        end
    end
end)