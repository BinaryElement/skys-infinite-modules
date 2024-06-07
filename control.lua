require("functions")

--[[script.on_init(function()
    print("[Sky's Infinite Modules] performing runtime error check...")
    if get_delayed_error_message() ~= nil then
        error(get_delayed_error_message())
    end
end)]]--

script.on_event(defines.events.on_player_created,
	function(event)
    if get_delayed_error_message() ~= nil then
        local player = game.get_player(event.player_index)
        if player == nil then return end
        if not global.skip_intro then
            if game.is_multiplayer() then
              player.print(get_delayed_error_message())
            else
              game.show_message_dialog{text = get_delayed_error_message()}
            end
        end

    end
end)