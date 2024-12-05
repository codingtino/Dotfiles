hs.eventtap.new({hs.eventtap.event.types.keyDown}, function(event)
    local keyCode = event:getKeyCode()
    local flags = event:getFlags()
    print("Key pressed: " .. keyCode, hs.inspect(flags))
end):start()


-- Define the Hyper Key (Caps Lock remapped to F18)
local hyper = {"cmd", "alt", "ctrl", "shift"}

-- Trigger the Hyper Key when F18 is pressed
local f18 = hs.hotkey.modal.new({}, "F18")

-- Enter Hyper Key mode when Caps Lock (F18) is pressed
f18:entered(function() end)
f18:exited(function() end)

-- Bind Hyper Key + Shortcuts
hs.hotkey.bind(hyper, "T", function()
    hs.application.launchOrFocus("Terminal") -- Open Terminal
end)

-- You can add more Hyper Key bindings here
hs.hotkey.bind(hyper, "K", function()
    hs.alert.show("Hyper + K pressed!") -- Example binding
end)