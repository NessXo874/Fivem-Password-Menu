function ShowInfo(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

ESX = nil

local ped = PlayerPedId()

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
	end
end)



-----------autres--------
local fped = FindFirstPed(ped)

local code = Config.PassWord
RegisterCommand(Config.Command, function() 
	AddTextEntry('FMMC_MPM_NA', "Code d'accès")
	DisplayOnscreenKeyboard(false, "FMMC_MPM_NA", "Code d'accès", "", "", "", "", 7)
	while (UpdateOnscreenKeyboard() == 0) do
		DisableAllControlActions(0);
		Wait(0);
	end
	if (GetOnscreenKeyboardResult()) then
		text = GetOnscreenKeyboardResult()
	end
	local text = GetOnscreenKeyboardResult()
	if text == code then 
        if text ~= nil and text ~= "" then
			MenuAdmin()
		end
	else
		exports['b1g_notify']:Notify('false', 'Code incorrect !')
	end
end)


local MainMenu = RageUI.CreateMenu("Menu admin", "By NessXo874#2563");
MainMenu.EnableMouse = Config.EnableMouse;

local SubMenu = RageUI.CreateSubMenu(MainMenu, "Player options", "Menu des options du joueur")
local SubMenu2 = RageUI.CreateSubMenu(SubMenu, "God mode", "Activer/désactiver le god mode")
local SubMenu11 = RageUI.CreateSubMenu(SubMenu, "Fly", "Activer/désactiver le fly")
local SubMenu3 = RageUI.CreateSubMenu(SubMenu, "No ragdoll", "Activer/désactiver le no ragdoll")
local SubMenu4 = RageUI.CreateSubMenu(SubMenu, "Endurance ilimitée", "Activer/désactiver l\'endurance ilimitée")
local SubMenu5 = RageUI.CreateSubMenu(MainMenu, "Vehicle options", "Menu des options de vehicules")
local SubMenu6 = RageUI.CreateSubMenu(SubMenu5, "Blip", "Menu d'activation du blip'")
local SubMenu7 = RageUI.CreateSubMenu(SubMenu5, "Benny's", "Menu de personalisation du véhicule")
local SubMenu8 = RageUI.CreateSubMenu(SubMenu7, "Peinture", "Changer de peinture")
local SubMenu9 = RageUI.CreateSubMenu(SubMenu8, "Classic", "Peintures classiques")
local SubMenu10 = RageUI.CreateSubMenu(SubMenu7, "Livrées", "Modifier la livrée")
local SubMenu12 = RageUI.CreateSubMenu(SubMenu7, "Flash", "Particules")


local particleDictionary = "core"
local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))
local particleName = "exp_grd_flare"
local ped = PlayerPedId()
local PlayerPed = GetPlayerPed(GetPlayerFromServerId(ped))
local bone = GetPedBoneIndex(PlayerPed, 11816)



local Checked = false;
local ListIndex = 1;

local GridX, GridY = 0, 0

function RageUI.PoolMenus:Example()
	MainMenu:IsVisible(function(Items)
		Items:AddButton("Player options", "Menu des options du joueur", { IsDisabled = false }, function(onSelected)
		end, SubMenu)
		Items:AddButton("Vehicle options", "Menu des options de vehicules", { IsDisabled = false }, function(onSelected)
		end, SubMenu5)


    end, function(Panels)
	end)

	SubMenu:IsVisible(function(Items)
		-- Items
		Items:AddButton("God mode", "Activer/désactiver le god mode", { IsDisabled = false }, function(onSelected)
			
		end, SubMenu2)
		Items:AddButton("Fly", "Activer/désactiver le fly", { IsDisabled = false }, function(onSelected)
			
		end, SubMenu11)
		Items:AddButton("No ragdoll", "Activer/désactiver le no ragdoll", { IsDisabled = false }, function(onSelected)
		end, SubMenu3)
		Items:AddButton("Endurance ilimitée (en dev)", "Activer/désactiver l\'endurance ilimitée", { IsDisabled = false }, function(onSelected)
		end, SubMenu4)
		Items:AddButton("Flash", "Activer/désactiver le mode flash", { IsDisabled = false }, function(onSelected)
		end, SubMenu12)
		Items:AddButton("Activer", "Activer le god mode", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    StopAllScreenEffects()
			    Citizen.Wait(1)
			end
		end)
		-- Panels
	end, function(Panels)
	end)
	--------God mode--------
	SubMenu2:IsVisible(function(Items)
		-- Items
		Items:AddButton("Activer", "Activer le god mode", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    SetEntityInvincible(ped, true)
				SetEntityCanBeDamaged(ped, false)
				ShowInfo("~r~God mode activé")
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Désactiver", "Désactiver le god mode", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    SetEntityInvincible(ped, false)
				SetEntityCanBeDamaged(ped, true)
				ShowInfo("God mode désactivé")
			    Citizen.Wait(1)
			end
		end)
	end, function()
		-- Panels
	end)
	---------fly--------
	SubMenu11:IsVisible(function(Items)
		-- Items
		Items:AddButton("Activer", "Désactiver la gravité", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				local ped = PlayerPedId()
				SetEntityHasGravity(ped, false)
				ShowInfo("~r~fly désactivé")
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Désactiver", "activer la gravité", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				SetEntityHasGravity(ped, true)
				ShowInfo("gravité activé")
			    Citizen.Wait(1)
			end
		end)
	end, function()
		-- Panels
	end)
	------flash-------
	SubMenu12:IsVisible(function(Items)
		-- Items
		Items:AddButton("Super force", "activer la super force", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				local ped = PlayerPedId()
				N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 10000.0) 
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Super vitesse", "activer la super vitesse", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				local ped = PlayerPedId()
				Citizen.CreateThread(function() SetPedMoveRateOverride(PlayerId(),50.0) SetRunSprintMultiplierForPlayer(PlayerId(),10.49) end)
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Désactiver super vitesse", "désactiver la super vitesse", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				Citizen.CreateThread(function() SetPedMoveRateOverride(PlayerId(),1.0) SetRunSprintMultiplierForPlayer(PlayerId(),0.00) end)
			    Citizen.Wait(1)
			end
		end)
	end, function()
		-- Panels
	end)
	----------no ragdoll------
	SubMenu3:IsVisible(function(Items)
		-- Items
		Items:AddButton("Activer", "Activer le no ragdoll", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    SetPedCanRagdoll(ped, false)
				ShowInfo("~r~no ragdoll activé")
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Désactiver", "Désactiver le no ragdoll", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    SetPedCanRagdoll(ped, true)
				ShowInfo("no ragdoll désactivé")
			    Citizen.Wait(1)
			end
		end)
	end, function()
		-- Panels
	end)
	--------Stamina---------
	SubMenu4:IsVisible(function(Items)
		-- Items
		Items:CheckBox("Activer2", "Descriptions", Checked, { Style = 1 }, function(onSelected, IsChecked)
			if (onSelected) then
				Checked = IsChecked
				if (IsChecked) then
					Citizen.Wait(1)
				while true do
			    if IsPedSprinting(ped) then
						Citizen.Wait(2000)
						ResetPlayerStamina(ped)
						Citizen.Wait(1)
					Citizen.Wait(1)
				end
			end
				Citizen.Wait(1)
			end
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Activer", "Activer l\'endurance ilimitée", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				while true do
			    if IsPedSprinting(ped) then
						Citizen.Wait(2000)
						ResetPlayerStamina(ped)
						Citizen.Wait(1)
					Citizen.Wait(1)
				end
				Citizen.Wait(1)
			end
			    Citizen.Wait(1)
			end
		end)
		Items:AddButton("Désactiver", "Désactiver l\'endurance ilimitée", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    ShowInfo("Endurance ilimitée désactivée")
			    Citizen.Wait(1)
			end
		end)
	end, function()
		-- Panels
	end)
	-------------vehicle options------------
	SubMenu5:IsVisible(function(Items)
		Items:AddButton("Réparer", "Réparer le véhicule", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleFixed(veh)
			end
		end)
		Items:AddButton("Récup la plaque", "plaque", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				local plate = GetVehicleNumberPlateText(veh)
				print(plate)
			end
		end)
		Items:AddButton("Unfreeze vehicle", "unfreeze", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				FreezeEntityPosition(veh, false)
			end
		end)
		Items:AddButton("tp vehicule le plus proche(en dev)", "tp véhicule", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				SetPedIntoVehicle(ped, FindFirstVehicle(10), 1)
			end
		end)
		Items:AddButton("Blip", "Menu d'activation du blip", { IsDisabled = false }, function(onSelected)
		end, SubMenu6)
		Items:AddButton("Benny's", "Menu de personalisation du véhicule", { IsDisabled = false }, function(onSelected)
		end, SubMenu7)
	end, function()
		-- Panels
	end)
	---------Blip-----------
	SubMenu6:IsVisible(function(Items)
		-- Items
		Items:AddButton("Activer", "Activer le blip", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, true)
			function BLIP()
				local blip = AddBlipForEntity(veh)
				SetBlipColour(blip, white)
				SetBlipDisplay(blip, 2)
				SetBlipAsFriendly(blip, true)
			end
			function RBLIP()
				RemoveBlip()
			end
			if (onSelected) then
				BLIP()
			end
			if veh == nil then
				RemoveBlip(blip)
			end
		end)
		Items:AddButton("Désactiver", "Désactiver le blip", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				ExecuteCommand("restart AdminByNess")
			end
		end)
	end, function()
		-- Panels
	end)
	--------------Benny's-----------
	SubMenu7:IsVisible(function(Items)
		-- Items
		Items:AddButton("Peinture", "Changer la peinture du véhicule", { IsDisabled = false }, function(onSelected)
		end, SubMenu8)
		Items:AddButton("Livrées", "Changer la livrée du véhicule", { IsDisabled = false }, function(onSelected)
		end, SubMenu10)
	end, function()
		-- Panels
	end)
	--------------Peintures---------
	SubMenu8:IsVisible(function(Items)
		-- Items
		Items:AddButton("Classic/métalliques", "Peintures classiques", { IsDisabled = false }, function(onSelected)
		end, SubMenu9)
	end, function()
		-- Panels
	end)
	-------------livrées-------------
	SubMenu10:IsVisible(function(Items)
		-- Items-
		local NumberCharset = {}
		local Charset = {}

		for i = 48,  57 do table.insert(NumberCharset, string.char(i)) end
		local ped = PlayerPedId()
		function GetRandomNumber(length)
			Citizen.Wait(1)
			math.randomseed(GetGameTimer())
			if length > 0 then
				return GetRandomNumber(length - 1) .. NumberCharset[math.random(1, #NumberCharset)]
			else
				return ''
			end
		end
		local veh = GetVehiclePedIsIn(ped, false)
		local liv = GetVehicleLiveryCount(veh)
		function Number()
			local number = GetRandomNumber(1)
			--if number > liv then
			--local number =	GetRandomNumber(1)
			--else
			--	return
			--end
		end
		Items:AddButton("Livrée aléatoire", "Mettre une livrée", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
				SetVehicleColours(veh, number, 1)
			end
		end)
	end, function()
		-- Panels
	end)
	------------Peintures classiques--------
	SubMenu9:IsVisible(function(Items)
		-- Items
		Items:AddButton("Noir", "Peinture noire", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 0, 0)
			end
		end)
		Items:AddButton("Noir carbone", "Peinture noire", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 147, 147)
			end
		end)
		Items:AddButton("Graphite", "Peinture graphite", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 1, 1)
			end
		end)
		Items:AddButton("Noir Anthracite", "Peinture noir anthracite", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 11, 11)
			end
		end)
		Items:AddButton("Noir métal", "Peinture noir métal", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 2, 2)
			end
		end)
		Items:AddButton("Métal foncé", "Peinture métal foncé", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 3, 3)
			end
		end)
		Items:AddButton("Argenté", "Peinture Argentée", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 4, 4)
			end
		end)
		Items:AddButton("Argent bleuté", "Peinture Argent bleuté", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 5, 5)
			end
		end)
		Items:AddButton("Acier laminé", "Peinture Acier laminé", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 6, 6)
			end
		end)
		Items:AddButton("Argent foncé", "Peinture Argent foncé", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 7, 7)
			end
		end)
		Items:AddButton("Argent pierre", "Peinture Argent pierre", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 8, 8)
			end
		end)
		Items:AddButton("Argent de minuit", "Peinture Argent de minuit", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 9, 9)
			end
		end)
		Items:AddButton("Argent fondu", "Peinture Argent fondu", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 10, 10)
			end
		end)
		Items:AddSeparator("Rouges")
		Items:AddButton("Rouge", "Peinture Rouge", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 27, 27)
			end
		end)
		Items:AddButton("Rouge torino", "Peinture Rouge torino", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 28, 28)
			end
		end)
		Items:AddButton("Rouge formula", "Peinture Rouge formula", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 29, 29)
			end
		end)
		Items:AddButton("Rouge lave", "Peinture Rouge lave", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 150, 150)
			end
		end)
		Items:AddButton("Rouge flamboyant", "Peinture Rouge flamboyant", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 30, 30)
			end
		end)
		Items:AddButton("Rouge distingué", "Peinture Rouge distingué", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 31, 31)
			end
		end)
		Items:AddButton("Rouge grenat", "Peinture Rouge grenat", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 32, 32)
			end
		end)
		Items:AddButton("Rouge bordeau", "Peinture Rouge bordeau", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 33, 33)
			end
		end)
		Items:AddButton("Rouge cabernet", "Peinture Rouge cabernet", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 34, 34)
			end
		end)
		Items:AddButton("Rouge vin", "Peinture Rouge vin", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 143, 143)
			end
		end)
		Items:AddButton("Rouge bonbon", "Peinture Rouge bonbon", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 35, 35)
			end
		end)
		Items:AddSeparator("Roses")
		Items:AddButton("Rose chaud", "Peinture Rose chaud", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 135, 135)
			end
		end)
		Items:AddButton("Rose pfister", "Peinture Rose pfister", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 137, 137)
			end
		end)
		Items:AddButton("Rose saumon", "Peinture Rose saumon", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 136, 136)
			end
		end)
		Items:AddSeparator("Oranges")
		Items:AddButton("Orange couché de soleil", "Peinture Orange couché de soleil", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 36, 36)
			end
		end)
		Items:AddButton("Orange", "Peinture Orange", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 38, 38)
			end
		end)
		Items:AddSeparator("Autres")
		Items:AddButton("Or", "Peinture dorrée", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 99, 99)
			end
		end)
		Items:AddButton("Bronze", "Peinture bronze", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 90, 90)
			end
		end)
		Items:AddSeparator("Jaunes")
		Items:AddButton("Jaune", "Peinture Jaune", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 88, 88)
			end
		end)
		Items:AddButton("Jaune course", "Peinture jaune course", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 89, 89)
			end
		end)
		Items:AddButton("Jaune citron", "Peinture jaune citron", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 91, 91)
			end
		end)
		Items:AddSeparator("Verts")
		Items:AddButton("Vert foncé", "Peinture Vert foncé", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 49, 49)
			end
		end)
		Items:AddButton("Vert course", "Peinture Vert course", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 50, 50)
			end
		end)
		Items:AddButton("Vert océan", "Peinture Vert océan", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 51, 51)
			end
		end)
		Items:AddButton("Vert olive", "Peinture Vert oilve", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 52, 52)
			end
		end)
		Items:AddButton("Vert brillant", "Peinture Vert brillant", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 53, 53)
			end
		end)
		Items:AddButton("Vert essence", "Peinture Vert essence", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 54, 54)
			end
		end)
		Items:AddButton("Vert lime", "Peinture Vert lime", { IsDisabled = false }, function(onSelected)
			local veh = GetVehiclePedIsIn(ped, false)
			if (onSelected) then
				SetVehicleColours(veh, 92, 92)
			end
		end)
		Items:AddSeparator("Bleu")
	end, function()
		-- Panels
	end)
end


Citizen.CreateThread(function()
	if Config.UseAKey then
		while true do
			if IsControlJustPressed(0, Config.Key) then
				ExecuteCommand("menu")
				Citizen.Wait(1)
			end
				Citizen.Wait(1)
		end
		Citizen.Wait(1)
	end
end)





	function MenuAdmin()
		RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
	end








