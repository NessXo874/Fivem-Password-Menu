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

local code = "ness"
RegisterCommand("menu", function() 
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
MainMenu.EnableMouse = false;

local SubMenu = RageUI.CreateSubMenu(MainMenu, "Player options", "Menu des options du joueur")
local SubMenu2 = RageUI.CreateSubMenu(SubMenu, "God mode", "Activer/désactiver le god mode")
local SubMenu3 = RageUI.CreateSubMenu(SubMenu, "No ragdoll", "Activer/désactiver le no ragdoll")
local SubMenu4 = RageUI.CreateSubMenu(SubMenu, "Endurance ilimitée", "Activer/désactiver l\'endurance ilimitée")

local Checked = false;
local ListIndex = 1;

local GridX, GridY = 0, 0

function RageUI.PoolMenus:Example()
	MainMenu:IsVisible(function(Items)
		Items:AddButton("Player options", "Menu des options du joueur", { IsDisabled = false }, function(onSelected)
		end, SubMenu)


    end, function(Panels)
	end)

	SubMenu:IsVisible(function(Items)
		-- Items
		Items:AddButton("God mode", "Activer/désactiver le god mode", { IsDisabled = false }, function(onSelected)
			
		end, SubMenu2)
		Items:AddButton("No ragdoll", "Activer/désactiver le no ragdoll", { IsDisabled = false }, function(onSelected)
		end, SubMenu3)
		Items:AddButton("Endurance ilimitée (en dev)", "Activer/désactiver l\'endurance ilimitée", { IsDisabled = false }, function(onSelected)
		end, SubMenu4)
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
		Items:AddButton("Activer", "Activer l\'endurance ilimitée", { IsDisabled = false }, function(onSelected)
			if (onSelected) then
			    if IsPedSprinting(ped) then
					while true do
						Citizen.Wait(2000)
						ResetPlayerStamina(ped)
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

end


Citizen.CreateThread(function()
	while true do
		if IsControlJustPressed(0, 344) then
			ExecuteCommand("menu")
			Citizen.Wait(1)
		end
		Citizen.Wait(1)
	end
	Citizen.Wait(1)
end)





	function MenuAdmin()
		RageUI.Visible(MainMenu, not RageUI.Visible(MainMenu))
	end








