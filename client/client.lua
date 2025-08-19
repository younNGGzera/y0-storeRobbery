local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

CreateThread(function()
    for id, info in pairs(Config.StoreRobberies) do
        CreateThread(function()
            local model = GetHashKey(info.object)
            local location = info.coords
            local safe

            while not safe or not DoesEntityExist(safe) do
                safe = GetClosestObjectOfType(location.x, location.y, location.z, 2.5, model, false, false, false)
                Wait(1000)
            end

            exports.ox_target:addLocalEntity(safe, {
                name = 'rob_location_'..id,
                label = info.label,
                icon = 'fas fa-user-secret',
                distance = 2.0,
                onSelect = function()
                    local canInteract = lib.callback.await('y0-storeRobbery:checkCooldown', false, id)
                    if not canInteract then return end
                    local playerPed = PlayerPedId()
                    local isMale = IsPedMale(playerPed)
                    local animations = info.animations['player']
                    local gender = animations.female

                    if isMale then 
                        gender = animations.male
                    end
                    
                    local dict = gender.dict    
                    local anim = gender.cond   
          
                    RequestAnimDict(dict)

                    while not HasAnimDictLoaded(dict) do
                        Wait(0)
                    end

                    FreezeEntityPosition(playerPed, true)
                    TaskPlayAnimAdvanced(playerPed, dict, anim, location.x, location.y, location.z, 0.0, 0.0, location.w, 8.0, -8.0, -1, 1, 0.0, 0, 0, 0)


                    TriggerServerEvent('y0-storeRobbery:alertPolice', 'Store robbery in progress at ' .. info.label)
                    local success = lib.progressCircle({
                        duration = info.robTime,
                        label = 'Robbing...',
                        useWhileDead = false,
                        canCancel = false,
                        disable = {
                            car = true,
                            move = true,
                            combat = true,
                        },
                    })

                    if success then
                        local addedCooldown = lib.callback.await('y0-storeRobbery:addCooldown', false, id)
                        if addedCooldown then
                            TriggerServerEvent('y0-storeRobbery:robStore', id)
                            ClearPedTasks(playerPed)
                            FreezeEntityPosition(playerPed, false)
                        end
                    else
                        ClearPedTasks(playerPed)
                        FreezeEntityPosition(playerPed, false)
                    end
                end,
            })
        end)
    end
end)

