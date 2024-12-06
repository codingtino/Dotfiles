-- Define the Hyper key combination
local hyper = {"ctrl", "alt", "cmd", "shift"}

-- Open Safari with Hyper + S
hs.hotkey.bind(hyper, "S", function()
    hs.application.launchOrFocus("Safari")
end)

-- Open Finder with Hyper + F
hs.hotkey.bind(hyper, "F", function()
    hs.application.launchOrFocus("Finder")
end)

-- Open Kitty terminal with Hyper + T
hs.hotkey.bind(hyper, "T", function()
    hs.application.launchOrFocus("Kitty")
end)

-- Notify when the config is loaded
-- hs.alert.show("Hammerspoon Config Loaded")