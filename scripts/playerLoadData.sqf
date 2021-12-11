private _localPlayerUID = getPlayerUID player;
missionNamespace setVariable ["generatorActive",false];
private _playerBox = profileNamespace getVariable ["EFTVar_"+_localPlayerUID+"_stash", "new"];
private _playerMoney = profileNamespace getVariable ["EFTVar_"+_localPlayerUID+"_money",25000];
private _playerRPG = profileNamespace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False,10]]]];
private _scenarioVersion = profileNamespace getVariable ["scenarioVersion","0"];

//This section forces a soft raid.
If (_scenarioVersion == "0") then
{
	_playerRPG = [["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False,10]]];
};

if !(_playerBox isEqualTo "new") then
{
    systemChat "Welcome back player.";
    missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money",_playerMoney];
    missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_stash", _playerBox];
    missionNameSpace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",_playerRPG];
	missionNameSpace setVariable ["availableGeneratorFuel", (((_playerRPG select 3)select 10) select 2)];
	
    //systemChat format["Debug Message: Player ID %1 has joined and box array content is %2. Your current rubles are %3",_localPlayerUID,_playerBox,_playerMoney];
	missionNamespace getVariable "containerName" execVM "scripts\loadContainer.sqf";
}
else
{
    missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money",_playerMoney];
    missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_stash", _playerBox];
    missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False,10]]]];
    systemChat  format["Welcome to the mission new player, you have been granted %1 rubles as initial allowance.",_playerMoney];
	missionNameSpace setVariable ["availableGeneratorFuel", 10];
};
[[player, _playerRPG],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
execVM "scripts\hideoutTrader.sqf";

systemChat "Player data load is done";
