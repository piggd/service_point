/*
Vehicle Service Point Rearm+ by piggd
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Donations Accepted via paypal to danpigg@yahoo.com
Based on Vehicle Service Point (Refuel, Repair, Rearm) by Axe Cop
http://epochmod.com/forum/index.php?/topic/3935-release-vehicle-service-point-refuel-repair-rearm-script/
Refuel and Repair scripts are 100% Axe Cops work.  Rearm was rewritten to provide new rearm capabilities.
*/

Mod Features:

Configurable Service points (service_point.sqf)
Adjustable pricing of each service. (service_point.sqf)
Disable dfeatures you do not want ((service_point.sqf))
Rearms by vehicle postion and turrent.
Non-Epoch vehicles will rearm like a re-arm truck back to there spawned loadout
Pulls the loadout from the ingame configuration instead of the config file ( This is important if you mod your vehicles on spawn )
Epoch vehicles spawn with 0 magazines so rearm+ will add one magazine to the turrent.

Download:
1) https://github.com/piggd/service_point
2) Left side towards the bottom click download zip.
3) Unzip and move cusom into your mission pbo.

Installation:

Edit your init.sqf

Modify the following block of code:

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	//anti Hack
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	
};

if (!isDedicated) then {
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";	
	
	//anti Hack
	[] execVM "\z\addons\dayz_code\system\antihack.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	// Service Point Rearm+
	[] execVM "custom\service_point\service_point.sqf";
};


Based on Vehicle Service Point (Refuel, Repair, Rearm) by Axe Cop
http://epochmod.com/forum/index.php?/topic/3935-release-vehicle-service-point-refuel-repair-rearm-script/

Refuel and Repair scripts are 100% Axe Cops work.  Rearm was rewritten to provide new rearm capabilities.
