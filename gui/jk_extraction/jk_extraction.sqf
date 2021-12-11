// Author: JK aka. Warrior - Edited by MK to fit new requirements.
disableSerialization;

    is_extracting = true;

    // DISPLAY
    preloadTitleRsc ["jk_extraction", "PLAIN", 1, false];
    _ext_rscLayer = "jk_extraction" call BIS_fnc_rscLayer;
    _ext_rscLayer cutRsc ["jk_extraction", "PLAIN", 1, true];

    // TIMER
    timer = 6.3;

    while {timer >= 0} do
    {
        timer = timer - 0.1;
        round timer;
        [timer, 1] call BIS_fnc_cutDecimals;

        ((uiNamespace getVariable "jk_extraction") displayCtrl 55554) ctrlSetStructuredText
        parseText format
        [
        "<t shadow='1' shadowColor='#000000' Color='#5eff00' shadowOffset='0.075' font='PuristaMedium' align='center' valign='middle'>Extraction: %1</t>
        </t>",
        timer
        ];
        sleep 0.1;
    };

    // EXTRACT SCRIPT
    if(is_extracting) then
    {
            if (timer <=1 && alive player) then
            {
                [3, 3, 3, "", "Extracting...", "", player] spawn KEK_fnc_fade;
                sleep 3;
                player setPosASL (getPosASL (hubObj) vectorAdd [0,0,0.2]);
                [player, ["inRaid", false]] remoteExecCall ["setVariable",0];
                raidPlayerCount = raidPlayerCount - 1;
                publicVariable "raidPlayerCount";

				if !(missionNamespace getVariable "scavExtraction" == "") then
				{
					private _localPlayerUID = getPlayerUID player;
					missionNamespace setVariable ["scavExtraction",""];

					private _scavLoot = backpackItems player;
					if (count _scavLoot > 0) then
					{
						[missionNamespace getVariable "containerName",_scavLoot] execVM "scripts\saveContainer.sqf";
						_money = missionNameSpace getVariable ["EFTVar_"+_localPlayerUID+"_money", []];
						_money = _money - 500;
            missionNameSpace setVariable ["EFTVar_"+_localPlayerUID+"_money", _money];
					};

					player setUnitLoadout (profileNameSpace getVariable ["EFTVar_"+_localPlayerUID+"_loadout",[]]);
					profileNameSpace setVariable ["EFTVar_"+_localPlayerUID+"_loadout",[]];
          [] spawn
          {
          sleep 900;
          missionNamespace setVariable ["canScav",true];
          };
					missionNamespace setVariable ["canLoadout",0];

					_extraction = ["scavXtm_1","scavXtm_2","scavXtm_3","scavXtm_4","scavXtm_5","scavXtm_6","scavXtm_7","scavXtm_8","scavXtm_9","scavXtm_10","scavXtm_11","scavXtm_12","scavXtm_13","scavXtm_14","scavXtm_15","scavXtm_16","scavXtm_17","scavXtm_18","scavXtm_19"];
					{
						_x setMarkerAlphaLocal 0;
					}forEach _extraction;
				};
            };
    };
