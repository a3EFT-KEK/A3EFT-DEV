/*

1) Player can be scav in this moment? We will check a variable (this will be donde by the player, not the server)
binded to each player that resets after succesful scav extraction or after 30minutes IRL. <--- Done

2) Set player faction in missionNamespace to 3 temporarily and let factionSetup.sqf do its job (faction setup is
missing the code we have for faction bear and faction usec to get their random equipment, its just a matter of copy pasting into those).
We have to hold on to the player loadout and check if it dies, in onPlayerRespawn.sqf check if faction in namespace is 3 and if it was restore loadout). <--- Done

3) Set as conditional having more than 1000 rubles to initiate SCAV raid. 500 charged when entering the raid, and another 500 on extraction. Option to pay another 1000 for full scav loadout. <--- Done

4) Set custom spawn locations for scavs using the same conditions as normal raid. <--- Done

5) Set custom extraction point for each player, this has to be a variable in the condition of the triggers
(trigger name is tr_ScavEX_0 to infinite and condition variable is assignedScav = Player_0 to 11),
so something like " if (assignedScav = player) then {player extract;} else {hint "This is not my home, better leave fast."}; <--- Done

6) When SCAV extracts, retrieve objects from SCAV backpack and add them to player stash.

*/

params ["_objectCaller"];

[
    _objectCaller,                                            // Object the action is attached to
    "Enter SCAV Raid",                                        // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Progress icon shown on screen
    "player distance _target < 2 && missionNamespace getVariable 'canScav' == true && _this == leader group _this && (count (units group _this)) < 2 && (missionNameSpace getVariable ['EFTVar_'+(getPlayerUID player)+'_money',[]]) > 14999 && missionNamespace getVariable 'generatorActive' == true",                        // Condition for the action to be shown
    "player distance _target < 2",                        // Condition for the action to progress
    {},                                                    // Code executed when action starts
    {},                                                    // Code executed on every progress tick
    {
		[3,15,3,"","Deploying as SCAV","",_caller] spawn KEK_fnc_fade;
		sleep 5;

		_spawn = selectRandom
		[
			"spawn1",
			"spawn2",
			"spawn3",
			"spawn4",
			"spawn5",
			"spawn6",
			"spawn7",
			"spawn8",
			"spawn9",
			"spawn10",
			"spawn11",
			"spawn12",
			"spawn13",
			"spawn14",
			"spawn15",
			"spawn16",
			"spawn17",
			"spawn18",
			"spawn19",
			"spawn20",
			"spawn21",
			"spawn22",
			"spawn23",
			"spawn24",
			"spawn25",
			"spawn26",
			"spawn27",
			"spawn28",
			"spawn29",
			"spawn30",
			"spawn31",
			"spawn32",
			"spawn33",
			"spawn34",
			"spawn35",
			"spawn36",
			"spawn37",
			"spawn38"
        ];
        _pos = getMarkerPos _spawn;

		_extraction =
		[
		"scavXtm_1",
		"scavXtm_2",
		"scavXtm_3",
		"scavXtm_4",
		"scavXtm_5",
		"scavXtm_6",
		"scavXtm_7",
		"scavXtm_8",
		"scavXtm_9",
		"scavXtm_10",
		"scavXtm_11",
		"scavXtm_12",
		"scavXtm_13",
		"scavXtm_14",
		"scavXtm_15",
		"scavXtm_16",
		"scavXtm_17",
		"scavXtm_18",
		"scavXtm_19"
		];

        {
			{
			_x setMarkerAlphaLocal 0;
			}forEach _extraction;

            _x setPosATL [_pos select 0,_pos select 1,0];
            _x setDir random 360;
			raidPlayerCount = raidPlayerCount + 1;
			publicVariable "raidPlayerCount";
			[_x,["inRaid",true]] remoteExecCall ["setVariable",0];
			enableEnvironment [true, true];
			private _localPlayerUID = getPlayerUID player;
			profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"_loadout",getUnitLoadout player];
			missionNamespace setVariable ["canLoadout",1];
			_extractionSelected = selectRandom _extraction;
			missionNamespace setVariable ["scavExtraction", _extractionSelected];
			missionNamespace setVariable ["canScav",false];
			_extractionSelected setMarkerAlphaLocal 1;
			[missionNamespace getVariable "containerName"] execVM "scripts\raidStashUpdate.sqf";
			[3] execVM "scripts\factionSetup.sqf";
			_money = missionNameSpace getVariable ["EFTVar_"+_localPlayerUID+"_money", []];
			_money = _money - 7500;
			missionNameSpace setVariable ["EFTVar_"+_localPlayerUID+"_money", _money];
        } forEach [_caller];
    },                                                    // Code executed on completion
    {},                                                    // Code executed on interrupted
    [],                                                    // Arguments passed to the scripts as _this select 3
    2,                                                    // Action duration [s]
    100,                                                // Priority
    false,                                                // Remove on completion
    false                                                // Show in unconscious state
] remoteExec ["BIS_fnc_holdActionAdd", 0, _objectCaller];
