function Notification(action, data)

    local str = data.message
	local pos = str:find('~')
	while pos do
		local tempString = string.sub(str, pos+2, pos+2)
		if tempString == "~" then
			local str1 = string.sub(str, 1, pos-1)
			local str2 = string.sub(str, pos+3)
			str = str1..str2
			pos = str:find('~')
		else
			pos = nil
		end
	end
    data.message = str

    SendNUIMessage({
        action = action,
        data = data
    })
end

RegisterNetEvent('kNotify:addNotifaction')
AddEventHandler('kNotify:addNotifaction', function(data)
    if type(data) == 'table' then
        Notification("addNotification", data)
    else
        print("[^1X^7] Invalid notification data")
    end
end)

exports('Notify', function(data)
    if type(data) == 'table' then
        Notification("addNotification", data)
    else
        print("[^1X^7] Invalid notification data")
    end
end)

RegisterCommand("notify_info", function(source, args)
    local message = table.concat(args, " ")
    Notification("addNotification", {type = "information", title = "Info", message = message, duration = 5000, position = "top-right", playSound=false})
end, false)

RegisterCommand("notify_success", function(source, args)
    local message = table.concat(args, " ")
    Notification("addNotification", {type = "success", title = "Success", message = message, duration = 5000, position = "middle-right",  playSound=true})
end, false)

RegisterCommand("notify_error", function(source, args)
    local message = table.concat(args, " ")
    Notification("addNotification", {type = "error", title = "Error", message = message, duration = 5000, position = "top-right",  playSound=true})
end, false)

RegisterCommand("notify_warning", function(source, args)
    local message = table.concat(args, " ")
    Notification("addNotification", {type = "warning", title = "Warning", message = message, duration = 5000, position = "top-right",  playSound=true})
end, false)

RegisterCommand("notify", function(source, args)
    local message = table.concat(args, " ")
    Notification("addNotification", {type = "cash", title = "hello", message = message, duration = 5000, position = "top",  playSound=false})
end, false)

--exports[kNotify]:Notify({type = "error", title = "Error", message = "this is an error message", duration = 5000, position = "top-right", playSound = true})