# What is it ?

TempEvents allows you to minimally secure your `TriggerServerEvent` with a temporary event system

# How to use ?

Import TempEvents in your ressource copy/paste this code in your `fxmanifest.lua`<br>
```lua
client_scripts {
    "@TempEvents/client.lua",
}
server_scripts {
    "@TempEvents/server.lua",
} 
```

Create new server event (server-side)
```lua
sEvents.registre("yourEventName", function (source, yoursAgrs) -- source must be here
    print(yourArgs)
end)
```

Use an events (client-side)
```lua
sEvents("yourEventName", "myArgs")
```
