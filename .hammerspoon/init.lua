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

-- Open Microsoft Teams with Hyper + T
hs.hotkey.bind(hyper, "T", function()
    hs.application.launchOrFocus("Microsoft Teams")
end)

-- Open Kitty osTicket with Hyper + O
hs.hotkey.bind(hyper, "O", function()
    hs.application.launchOrFocus("osTicket")
end)

-- Open Kitty VSCode with Hyper + V
hs.hotkey.bind(hyper, "V", function()
    hs.application.launchOrFocus("Visual Studio Code")
end)

-- Open Kitty Ghostty with Hyper + G
hs.hotkey.bind(hyper, "G", function()
    hs.application.launchOrFocus("Ghostty")
end)

-- Open Kitty Microsoft Outlook with Hyper + M
hs.hotkey.bind(hyper, "M", function()
    hs.application.launchOrFocus("Microsoft Outlook")
end)

-- Open Kitty pascom with Hyper + P
hs.hotkey.bind(hyper, "P", function()
    hs.application.launchOrFocus("pascom Client")
end)

-- Open Kitty Fernwartung with Hyper + W
hs.hotkey.bind(hyper, "W", function()
    hs.application.launchOrFocus("Fernwartung")
end)

-- Open Kitty Intune with Hyper + I
hs.hotkey.bind(hyper, "I", function()
    hs.application.launchOrFocus("Intune")
end)

-- Open Kitty Youtube with Hyper + Y
hs.hotkey.bind(hyper, "Y", function()
    hs.application.launchOrFocus("YouTube")
end)

-- Open Kitty academicFive with Hyper + A
hs.hotkey.bind(hyper, "A", function()
    hs.application.launchOrFocus("academyFIVE")
end)

-- Open Kitty Edge with Hyper + E
hs.hotkey.bind(hyper, "E", function()
    hs.application.launchOrFocus("Microsoft Edge")
end)

-- Open Kitty Cynapp with Hyper + C
hs.hotkey.bind(hyper, "C", function()
    hs.application.launchOrFocus("Cynapp")
end)


-- Notify when the config is loaded
-- hs.alert.show("Hammerspoon Config Loaded")
