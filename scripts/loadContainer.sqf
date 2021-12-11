//systemChat "Debug Message: a container has been opened";

private _localPlayerUID = getPlayerUID player;
private _localContainerArray = missionNamespace getVariable "EFTVar_"+_localPlayerUID+"_stash";
private _containerName = _this;

//systemChat format ["Debug Message: Your ID array is %1, and its content is %2", _localPlayerUID, _localContainerArray];

if (count _localContainerArray > 0) then

	//systemChat format ["Debug Message: Container array total lenght is %1",count _localContainerArray];
{
	{
	//systemChat format ["Debug Message: item is %1",_x];
		if(typeName _x == "ARRAY") then
		{
			if (isClass (configFile >> "CFGMagazines" >> _x select 0)) then
			{
				_containerName addMagazineAmmoCargo [_x select 0, 1, _x select 1];
			};

			if (isClass (configFile >> "CFGWeapons" >> _x select 0)) then
			{
				_containerName addWeaponWithAttachmentsCargoGlobal [_x, 1];
			};
		}
		else
		{
			if (count _x > 0) then
			{

				if (isClass (configFile >> "CFGVehicles" >> _x)) then
				{
				_containerName addBackpackCargoGlobal [_x,1];
				}
				else
				{
				_containerName addItemCargoGlobal [_x, 1];
				};
			};
		}
	}forEach _localContainerArray;

	{
		clearItemCargoGlobal (_x select 1);
		clearMagazineCargoGlobal (_x select 1);
		clearWeaponCargoGlobal (_x select 1);
	}forEach everyContainer _containerName;

};
