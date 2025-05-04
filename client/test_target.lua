CreateThread(function()
    TargetBridge.AddBoxZone("test_zone", vector3(437.39, -981.96, 30.69), 2.5, 2.5, {
        name = "test_zone",
        heading = 0,
        debugPoly = true,
        minZ = 30.49,
        maxZ = 31.69,
        useZ = true,
        options = {
            {
                icon = "fas fa-eye",
                label = "Interaction Test",
                action = function()
                    print("✅ Interaction réussie !")
                    TriggerEvent('chat:addMessage', {
                        args = {"Test", "Tu as cliqué sur la zone !"}
                    })
                end
            }
        }
    })
end)
