private _localPlayerUID = getPlayerUID player;
private _factionSetup = ((missionNameSpace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]]) select 0) select 1;
private _canLoadout = missionNameSpace getVariable ["canLoadout",1];
private _canScav = missionNameSpace getVariable ["canScav",false];
private _scenarioVersion = profileNamespace getVariable ["scenarioVersion","0"];

If (_scenarioVersion == "0") then
{
    "Warning: An out-dated system control has been detected!" hintC 
    ["Attention Player.",
    "As for version 1.3 of this scenario, a pseudo-RPG system has been implemented for the hideout and its new modules.",
    "This system will now be applied to your current data to compatibility sake, but please consider wiping your data.",
    "Economy as well has suffered a dramatical change since previous versions, it's highly suggested for you to wipe your data to be able to fully enjoy the 1.3 experience that we fully envisioned for you.",
    "Best regards from the EFT TEAM."
    ];
    profileNamespace setVariable ["scenarioVersion","1.3.0"];
    _playerRPG = [["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False,10]]];
};

missionNamespace setVariable ["scavExtraction",""];
execVM "scripts\generatorCheck.sqf";
[0] execVM "scripts\factionSetup.sqf";
sleep 1;

if !(_canScav) then
{
	[]spawn
	{
	sleep 1200;
	missionNamespace setVariable ["canScav",true];
	};
};

if !(_canLoadout == 0) then
{
    missionNamespace setVariable ["canLoadout",0];
    private _localPlayerUID = getPlayerUID player;
    player setUnitLoadout (profileNameSpace getVariable ["EFTVar_"+_localPlayerUID+"_loadout",[]]);
    profileNameSpace setVariable ["EFTVar_"+_localPlayerUID+"_loadout",[""]];
};

_inRaid = player getVariable ["inRaid",false];
enableEnvironment [false, false];

if (_inRaid) then
{
	[player,["inRaid",false]] remoteExecCall ["setVariable",0];
	raidPlayerCount = raidPlayerCount - 1;
	publicVariable "raidPlayerCount";
};

sleep 0.2;
player setPosASL (getPosASL (player getVariable "stash") vectorAdd [0,0,0.2]);
player addRating -9999;
player setUnitTrait ["Medic", true];
