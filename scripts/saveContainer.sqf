//systemChat "Debug Message: a container has been closed";
params ["_containerName","_scavLoot"];

if !(typeName _scavLoot == "ARRAY") then
{
_scavLoot = [];
};
//hint str _scavLoot;

private _localPlayerUID = getPlayerUID player;
private _localContainerArray = [];

private _itemsInContainer = ItemCargo _containerName;
private _weaponsInContainer = weaponsItems _containerName;
private _ammoInContainer = magazinesAmmoCargo _containerName;
private _backpacksInContainer = backpackCargo _containerName;

if (count _itemsInContainer > 0) then {_localContainerArray append _itemsInContainer;};
if (count _weaponsInContainer > 0) then {_localContainerArray append _weaponsInContainer;};
if (count _ammoInContainer > 0) then {_localContainerArray append _ammoInContainer;};
if (count _backpacksInContainer > 0) then {_localContainerArray append _backpacksInContainer;};

{
	_localContainerArray append itemCargo (_x select 1);
	_localContainerArray append weaponsItems (_x select 1);
	_localContainerArray append magazinesAmmoCargo (_x select 1);
}forEach everyContainer _containerName;

if (count _scavLoot > 0) then
{
	_localContainerArray append _scavLoot;
};

missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_stash", _localContainerArray];

clearItemCargoGlobal _containerName;
clearMagazineCargoGlobal _containerName;
clearWeaponCargoGlobal _containerName;
clearBackpackCargoGlobal _containerName;
_containerName execVM "scripts\loadContainer.sqf";
