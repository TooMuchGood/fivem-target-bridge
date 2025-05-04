TargetBridge = TargetBridge or {}

function TargetBridge.AddBoxZone(name, coords, length, width, options)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addBoxZone({
            name = name,
            coords = coords,
            size = vec3(length, width, (options.maxZ and options.minZ and (options.maxZ - options.minZ)) or 2.0),
            rotation = options.heading or 0,
            debug = options.debugPoly or false,
            options = options.options,
            distance = options.distance or 2.5
        })
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddBoxZone(name, coords, length, width, options)
    else
        print('^1[Target Bridge] Aucun système de target actif pour AddBoxZone !^0')
    end
end

function TargetBridge.AddTargetModel(models, options)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addModel(models, options)
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddTargetModel(models, options)
    else
        print('^1[Target Bridge] Aucun système de target actif pour AddTargetModel !^0')
    end
end

function TargetBridge.AddTargetEntityBridge(entity, options)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addEntity(entity, options)
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddTargetEntity(entity, options)
    else
        print('^1[Target Bridge] Aucun système de target actif pour AddTargetEntity !^0')
    end
end

function TargetBridge.AddTargetBone(bones, options)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addGlobalBone(bones, options)
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddTargetBone(bones, options)
    else
        print('^1[Target Bridge] Aucun système de target actif pour AddTargetBone !^0')
    end
end

function TargetBridge.AddTargetPlayer(options)
    if GetResourceState('ox_target') == 'started' then
        exports['ox_target']:addGlobalPlayer(options)
    elseif GetResourceState('qb-target') == 'started' then
        exports['qb-target']:AddTargetEntity(PlayerPedId(), options)
    else
        print('^1[Target Bridge] Aucun système de target actif pour AddTargetPlayer !^0')
    end
end

-- Alerte au démarrage si aucun système de Target actif
CreateThread(function()
    local ox = GetResourceState('ox_target') == 'started'
    local qb = GetResourceState('qb-target') == 'started'
    if not ox and not qb then
        print('^1[Target Bridge] Aucun système de target actif ! Vérifie ton server.cfg (ox_target ou qb-target)^0')
    end
end)
