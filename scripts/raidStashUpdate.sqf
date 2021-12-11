private _localPlayerUID = getPlayerUID player;
private _newStashValue = "";
_newStashValue = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"_stash", []];

profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"_stash", _newStashValue];
missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_stash", _newStashValue];
if (missionNameSpace getVariable "scavExtraction" == "") then
{
profileNameSpace setVariable ["EFTVar_"+_localPlayerUID+"_loadout",[""]];
};
//hint "Your stash has been updated, there is no going back contractor. Do your stuff and exfiltrate safely or you will be sorry.";
