sEvents = {}

function sEvents.register(eventName, method)
    if not sEvents[eventName] then
        if method then
            sEvents[eventName] = {}
            sEvents[eventName].method = method
        else
            print(string.format("sEvents.register '℅s' n'as pas de function définie.", eventName))
        end
    else
        print(string.format("sEvents.register '%s' existe déjà.", eventName))
    end
end

function sEvents.trigger(source, eventName, ...)
    local resName = string.format("%s:%s", "sEvents:tempEvent", eventName)
    local newEvent = AddEventHandler(resName, function(source, eventName, ...)
        if sEvents[eventName] then
            sEvents[eventName].method(source, ...)
        end
    end)
    TriggerEvent(resName, source, eventName, ...)
    RemoveEventHandler(newEvent)
end

RegisterServerEvent("sEvents:tempEvent")
AddEventHandler("sEvents:tempEvent", function (eventName, ...)
    local src = source
    sEvents.trigger(source, eventName, ...)
end)