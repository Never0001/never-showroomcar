local QBCore = exports['qb-core']:GetCoreObject()


for k, v in pairs(Config.Vehicles) do
Citizen.CreateThread(function()
	Citizen.Wait(5)
		RequestModel(v.car)
		while not HasModelLoaded(v.car) do
			Citizen.Wait(1)
		end
        local veh = CreateVehicle(GetHashKey(v.car), v.coords.x, v.coords.y, v.coords.z-1.0, v.heading,  false, true)
		SetVehicleDoorsLocked(veh, 2) 
		FreezeEntityPosition(veh, true)
        SetVehicleNumberPlateText(veh, v.plate)
        SetVehicleColours(veh,math.random(1,100))  
        SetVehicleModKit(veh, 0)    
        SetVehicleWindowTint(veh, 1)

    while true do 
        local vhead = GetEntityHeading(veh)
        SetEntityHeading(veh,vhead+2)
        Citizen.Wait(250) -- Dönme hızını ayarlar- (Resmon değerlerini etkiler)
        end
end)
end

