/*
Vehicle Service Point Rearm+ by piggd
Email: dayzpiggd@gmail.com
Website: http://dayzpiggd.enjin.com
Donations Accepted via paypal to danpigg@yahoo.com
Based on Vehicle Service Point (Refuel, Repair, Rearm) by Axe Cop
http://epochmod.com/forum/index.php?/topic/3935-release-vehicle-service-point-refuel-repair-rearm-script/
Refuel and Repair scripts are 100% Axe Cops work.  Rearm was rewritten to provide new rearm capabilities.
*/
private ["_vehicle","_args","_costs","_vehicleType","_vehicleName","_turret","_magazines","_rearm_rearmTime","_role","_ammoType","_weapons","_ammo"];

_vehicle = _this select 0;
if (!local _vehicle) exitWith { diag_log format["Error: called service_point_rearm.sqf with non-local vehicle: %1", _vehicle] };

_args = _this select 3;
_role = _args select 0;
_turret = _role select 1;
_costs = _args select 1;
_rearm_rearmTime = _args select 2;
_vehicleType = typeOf _vehicle;
_vehicleName = getText(configFile >> "cfgVehicles" >> _vehicleType >> "displayName");

if !([[[_costs select 0, _costs select 1]],0] call epoch_returnChange) then {
	cutText [format[(localize "STR_EPOCH_ACTIONS_12"), _costs select 1, _vehicleName], "PLAIN DOWN"];
} else {
	_vehicle setVehicleAmmo 1;
	_magazines = _vehicle magazinesTurret _turret;
	{
		_vehicle removeMagazineTurret [_x, _turret];
	} count _magazines;
	{
		_ammoType = getText (configFile >> "cfgMagazines" >> _x >> "displayName");
		if (_ammoType == "") then {_ammoType = _x;};
		titleText [format["Rearming %1 for %2 in progress...",_ammoType, _vehicleName], "PLAIN DOWN"];
		sleep _rearm_rearmTime;
		_vehicle addMagazineTurret [_x, _turret];
	} count _magazines;
// Epoch DZ Vehicles that start with 0 magazines
	if (count _magazines < 1) then {
		_weapons = _vehicle weaponsTurret _turret;
		{
			_magazines = getArray (configFile >> "cfgWeapons" >> _x >> "magazines");
			_ammo = _magazines select 0; // rearm with the first magazine
			_ammoType = getText (configFile >> "cfgMagazines" >> _ammo >> "displayName");
			if (_ammoType == "") then {_ammoType = _ammo;};
			if (_ammo != "") then {
				_vehicle removeMagazineTurret [_ammo,_turret];
				titleText [format["Rearming %1 for %2 in progress...",_ammoType, _vehicleName], "PLAIN DOWN"];
				sleep _rearm_rearmTime;
				_vehicle addMagazineTurret [_ammo,_turret];
			};
		} count _weapons;
	};
	titleText [format["Rearming %1 completed!", _vehicleName], "PLAIN DOWN"];
};			
