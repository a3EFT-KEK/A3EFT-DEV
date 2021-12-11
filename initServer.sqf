["Initialize"] call BIS_fnc_dynamicGroups;

//Event handlers for player disconnection
addMissionEventHandler ["HandleDisconnect", {
params ["_unit"];
  private _containerName = "";
  private _clearUnit = _unit;

  switch (_clearUnit) do
  {
      case player_0:
          {_containerName = playerstash_0;};

      case player_1:

          {_containerName = playerstash_1;};

      case player_2:
          {_containerName = playerstash_2;};

      case player_3:
          {_containerName = playerstash_3;};

      case player_4:
          {_containerName = playerstash_4;};

      case player_5:
          {_containerName = playerstash_5;};

      case player_6:
          {_containerName = playerstash_6;};

      case player_7:
          {_containerName = playerstash_7;};

      case player_8:
          {_containerName = playerstash_8;};

      case player_9:
          {_containerName = playerstash_9;};

      case player_10:
          {_containerName = playerstash_10;};

      case player_11:
          {_containerName = playerstash_11;};

  };

  clearItemCargoGlobal _containerName;
  clearMagazineCargoGlobal _containerName;
  clearWeaponCargoGlobal _containerName;
  clearBackpackCargoGlobal _containerName;

  deleteVehicle _unit;

  ["A player has disconnected."] remoteExec ["hint",0];
  }];

  canCreateBossDivision = true;
  publicVariable "canCreateBossDivision";
