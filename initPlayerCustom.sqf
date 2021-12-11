waitUntil {!isNull player};

//hint "Player has been detected as client, initialisation for client executing now.";

//ContainerName is used in various loading scripts for the stash system, be careful when modifying this switch section.
switch (str player) do
{
	case "player_0":
		{missionNamespace setVariable ["containerName",playerstash_0];};

	case "player_1":
		{missionNamespace setVariable ["containerName",playerstash_1];};

	case "player_2":
		{missionNamespace setVariable ["containerName",playerstash_2];};

	case "player_3":
		{missionNamespace setVariable ["containerName",playerstash_3];};

	case "player_4":
		{missionNamespace setVariable ["containerName",playerstash_4];};

	case "player_5":
		{missionNamespace setVariable ["containerName",playerstash_5];};

	case "player_6":
		{missionNamespace setVariable ["containerName",playerstash_6];};

	case "player_7":
		{missionNamespace setVariable ["containerName",playerstash_7];};

	case "player_8":
		{missionNamespace setVariable ["containerName",playerstash_8];};

	case "player_9":
		{missionNamespace setVariable ["containerName",playerstash_9];};

	case "player_10":
		{missionNamespace setVariable ["containerName",playerstash_10];};

	case "player_11":
		{missionNamespace setVariable ["containerName",playerstash_11];};

};

missionNamespace getVariable "containerName" addEventHandler ["ContainerClosed",{[_this, "scripts\saveContainer.sqf"] remoteExec ["execVM", _this select 1];}];
missionNamespace setVariable ["canScav",true];
missionNamespace setVariable ["scavExtraction",""];
//Execute the script to make the player load properly according to locality.
execVM "scripts\playerLoadData.sqf";
