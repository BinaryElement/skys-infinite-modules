local new = {}
for i=1,get_speed_tiers(),1 do

    local string_concat = ""
    if i ~= 1 then
        string_concat = "-"..i
    end
    if data.raw.module["speed-module"..string_concat] then 
        existing_speed(data.raw.module["speed-module"..string_concat], i)
    else
        new[#new+1], new[#new+2] = new_speed(i)
    end
end
for i=1,get_efficiency_tiers(),1 do

    local string_concat = ""
    if i ~= 1 then
        string_concat = "-"..i
    end
    if data.raw.module["effectivity-module"..string_concat] then 
        existing_efficiency(data.raw.module["effectivity-module"..string_concat], i)
    else
        new[#new+1], new[#new+2] = new_efficiency(i)
    end
end
for i=1,get_productivity_tiers(),1 do

    local string_concat = ""
    if i ~= 1 then
        string_concat = "-"..i
    end
    if data.raw.module["productivity-module"..string_concat] then 
        existing_productivity(data.raw.module["productivity-module"..string_concat], i)
    else
        new[#new+1], new[#new+2] = new_productivity(i)
    end
end
data:extend(new)