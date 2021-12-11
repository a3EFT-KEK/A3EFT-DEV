debug_console addAction ["Reset player data from server and delete stash.",
{
private _localPlayerUID = getPlayerUID player;
missionNamespace setVariable ["EFTVar_"+_localPLayerUID+"_stash","new"];
profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"_stash","new"];
missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money",25000];
profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money",25000];
profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]];
missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]];
profileNameSpace setVariable ["EftVar_"+_localPlayerUID+"_loadout", []];
missionNameSpace setVariable ["EftVar_"+_localPlayerUID+"_loadout", []];

player setUnitLoadout [];
private _playerRPG = profileNamespace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]];
[[player, _playerRPG],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
execVM "scripts\hideoutTrader.sqf";

private _containerName = "";

switch (str player) do
{
    case "player_0":
        {_containerName = playerstash_0;};

    case "player_1":
        {_containerName = playerstash_1;};

    case "player_2":
        {_containerName = playerstash_2;};

    case "player_3":
        {_containerName = playerstash_3;};

    case "player_4":
        {_containerName = playerstash_4;};

    case "player_5":
        {_containerName = playerstash_5;};

    case "player_6":
        {_containerName = playerstash_6;};

    case "player_7":
        {_containerName = playerstash_7;};

    case "player_8":
        {_containerName = playerstash_8;};

    case "player_9":
        {_containerName = playerstash_9;};

    case "player_10":
        {_containerName = playerstash_10;};

    case "player_11":
        {_containerName = playerstash_11;};

};

clearItemCargoGlobal _containerName;
clearMagazineCargoGlobal _containerName;
clearWeaponCargoGlobal _containerName;
clearBackpackCargoGlobal _containerName;

[0] execVM "scripts\factionSetup.sqf";


systemChat "Data removed from server.";
}
];
