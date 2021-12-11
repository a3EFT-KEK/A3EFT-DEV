enableEnvironment false;

player addRating -9999;
player setUnitTrait ["Medic", true];

execVM "initPlayerCustom.sqf";

["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;
sleep 0.2;
player setPosASL (getPosASL (player getVariable "stash") vectorAdd [0,0,0.2]);
//[player] call mp_load_player;


[
    hub,                                            // Object the action is attached to
    "Enter Raid",                                        // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Progress icon shown on screen
    "_this distance doorObj < 3.5 && _this != leader group _this && (leader group _this) getVariable ['inRaid',false]",                        // Condition for the action to be shown
    "_caller distance doorObj < 3.5",                        // Condition for the action to progress
    {},                                                    // Code executed when action starts
    {},                                                    // Code executed on every progress tick
    {
		[3,15,3,"","Deploying (Again...)","",_caller] spawn KEK_fnc_fade;
		sleep 5;
		_spawn = selectRandom[
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
        {
            _x setPosATL [_pos select 0,_pos select 1,0];
            _x setDir random 360;
			raidPlayerCount = raidPlayerCount + 1;
			publicVariable "raidPlayerCount";
			[_x,["inRaid",true]] remoteExecCall ["setVariable",0];
			enableEnvironment [true, true];
      [missionNamespace getVariable "containerName"] execVM "scripts\raidStashUpdate.sqf";
        } forEach  [_caller];
    },                                                    // Code executed on completion
    {},                                                    // Code executed on interrupted
    [],                                                    // Arguments passed to the scripts as _this select 3
    2,                                                    // Action duration [s]
    100,                                                // Priority
    false,                                                // Remove on completion
    false                                                // Show in unconscious state
] call BIS_fnc_holdActionAdd;

[
    hub,                                            // Object the action is attached to
    "Enter Raid",                                        // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Progress icon shown on screen
    "_this distance doorObj < 3.5 && _this == leader group _this",                        // Condition for the action to be shown
    "_caller distance doorObj < 3.5",                        // Condition for the action to progress
    {},                                                    // Code executed when action starts
    {},                                                    // Code executed on every progress tick
    {
		if (raidPlayerCount == 0) then
		{
			{
				clearWeaponCargoGlobal _x;
				clearMagazineCargoGlobal _x;
				clearItemCargoGlobal _x;
				clearBackpackCargoGlobal _x;
				_boxType = typeOf _x;
				switch _boxType do
				{
					case "plp_ct_MilBoxMediumOlive":
					{
						_items = ["hgun_Rook40_F","hgun_PDW2000_F","rhs_weap_m76","CUP_arifle_AKM","rhs_weap_akm","rhs_weap_akms","rhs_weap_akmn","rhs_weap_ak74","rhs_weap_aks74u","rhs_weap_aks74un","rhs_weap_ak74m","rhs_weap_aks74","rhs_weap_aks74_2","rhs_weap_aks74n","rhs_weap_aks74n_2","rhs_weap_savz58p","rhs_weap_savz58v","rhs_weap_m70b1","rhs_weap_m70ab2","rhs_weap_m70b1n","rhs_weap_m70b3n","rhs_weap_m92","rhs_weap_m21a","rhs_weap_m21s","rhs_weap_pm63","CUP_smg_saiga9","CUP_arifle_SIAGE_MK03_Wood_top_rail","CUP_arifle_Sa58_sporter_compact","rhs_weap_l1a1_wood","rhs_weap_l1a1","rhs_weap_m38","AGE_Vityaz","sgun_HunterShotgun_01_F","sgun_HunterShotgun_01_sawedoff_F","hgun_Pistol_01_F","hgun_Pistol_heavy_02_F","CUP_arifle_AK74M","CUP_arifle_AKS74U","CUP_arifle_AK101","CUP_arifle_AK102","CUP_arifle_AK108","CUP_arifle_AK103","CUP_arifle_AK104","CUP_arifle_AK109","CUP_arifle_AK105","CUP_arifle_AK107","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_AS_VAL","CUP_arifle_SR3M_Vikhr","rhs_weap_m4a1_carryhandle"];
						for "_i" from 1 to 1 + round random 1 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_MilBoxMediumBlack":
					{
						_items = ["hgun_Rook40_F","hgun_PDW2000_F","rhs_weap_m76","CUP_arifle_AKM","rhs_weap_akm","rhs_weap_akms","rhs_weap_akmn","rhs_weap_ak74","rhs_weap_aks74u","rhs_weap_aks74un","rhs_weap_ak74m","rhs_weap_aks74","rhs_weap_aks74_2","rhs_weap_aks74n","rhs_weap_aks74n_2","rhs_weap_savz58p","rhs_weap_savz58v","rhs_weap_m70b1","rhs_weap_m70ab2","rhs_weap_m70b1n","rhs_weap_m70b3n","rhs_weap_m92","rhs_weap_m21a","rhs_weap_m21s","rhs_weap_pm63","CUP_smg_saiga9","CUP_arifle_SIAGE_MK03_Wood_top_rail","CUP_arifle_Sa58_sporter_compact","rhs_weap_l1a1_wood","rhs_weap_l1a1","rhs_weap_m38","AGE_Vityaz","sgun_HunterShotgun_01_F","sgun_HunterShotgun_01_sawedoff_F","hgun_Pistol_01_F","hgun_Pistol_heavy_02_F","CUP_arifle_AK74M","CUP_arifle_AKS74U","CUP_arifle_AK101","CUP_arifle_AK102","CUP_arifle_AK108","CUP_arifle_AK103","CUP_arifle_AK104","CUP_arifle_AK109","CUP_arifle_AK105","CUP_arifle_AK107","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_AS_VAL","CUP_arifle_SR3M_Vikhr","rhs_weap_m4a1_carryhandle"];
						for "_i" from 1 to 1 + round random 1 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_FootlockerBrown":
					{
						_items = ["hgun_Rook40_F","hgun_PDW2000_F","rhs_weap_m76","CUP_arifle_AKM","rhs_weap_akm","rhs_weap_akms","rhs_weap_akmn","rhs_weap_ak74","rhs_weap_aks74u","rhs_weap_aks74un","rhs_weap_ak74m","rhs_weap_aks74","rhs_weap_aks74_2","rhs_weap_aks74n","rhs_weap_aks74n_2","rhs_weap_savz58p","rhs_weap_savz58v","rhs_weap_m70b1","rhs_weap_m70ab2","rhs_weap_m70b1n","rhs_weap_m70b3n","rhs_weap_m92","rhs_weap_m21a","rhs_weap_m21s","rhs_weap_pm63","CUP_smg_saiga9","CUP_arifle_SIAGE_MK03_Wood_top_rail","CUP_arifle_Sa58_sporter_compact","rhs_weap_l1a1_wood","rhs_weap_l1a1","rhs_weap_m38","AGE_Vityaz","sgun_HunterShotgun_01_F","sgun_HunterShotgun_01_sawedoff_F","hgun_Pistol_01_F","hgun_Pistol_heavy_02_F","CUP_arifle_AK74M","CUP_arifle_AKS74U","CUP_arifle_AK101","CUP_arifle_AK102","CUP_arifle_AK108","CUP_arifle_AK103","CUP_arifle_AK104","CUP_arifle_AK109","CUP_arifle_AK105","CUP_arifle_AK107","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_AS_VAL","CUP_arifle_SR3M_Vikhr","rhs_weap_m4a1_carryhandle"];
						for "_i" from 1 to 1 + round random 1 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_WoodBoxDarkMedium":
					{
						_items = ["hgun_Rook40_F","hgun_PDW2000_F","rhs_weap_m76","CUP_arifle_AKM","rhs_weap_akm","rhs_weap_akms","rhs_weap_akmn","rhs_weap_ak74","rhs_weap_aks74u","rhs_weap_aks74un","rhs_weap_ak74m","rhs_weap_aks74","rhs_weap_aks74_2","rhs_weap_aks74n","rhs_weap_aks74n_2","rhs_weap_savz58p","rhs_weap_savz58v","rhs_weap_m70b1","rhs_weap_m70ab2","rhs_weap_m70b1n","rhs_weap_m70b3n","rhs_weap_m92","rhs_weap_m21a","rhs_weap_m21s","rhs_weap_pm63","CUP_smg_saiga9","CUP_arifle_SIAGE_MK03_Wood_top_rail","CUP_arifle_Sa58_sporter_compact","rhs_weap_l1a1_wood","rhs_weap_l1a1","rhs_weap_m38","AGE_Vityaz","sgun_HunterShotgun_01_F","sgun_HunterShotgun_01_sawedoff_F","hgun_Pistol_01_F","hgun_Pistol_heavy_02_F","CUP_arifle_AK74M","CUP_arifle_AKS74U","CUP_arifle_AK101","CUP_arifle_AK102","CUP_arifle_AK108","CUP_arifle_AK103","CUP_arifle_AK104","CUP_arifle_AK109","CUP_arifle_AK105","CUP_arifle_AK107","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_AS_VAL","CUP_arifle_SR3M_Vikhr","rhs_weap_m4a1_carryhandle"];
						for "_i" from 1 to 1 + round random 1 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
          case "Box_Ammo_Syndicate_Ammo_F":
          {
            _items = ["hgun_Rook40_F","hgun_PDW2000_F","rhs_weap_m76","CUP_arifle_AKM","rhs_weap_akm","rhs_weap_akms","rhs_weap_akmn","rhs_weap_ak74","rhs_weap_aks74u","rhs_weap_aks74un","rhs_weap_ak74m","rhs_weap_aks74","rhs_weap_aks74_2","rhs_weap_aks74n","rhs_weap_aks74n_2","rhs_weap_savz58p","rhs_weap_savz58v","rhs_weap_m70b1","rhs_weap_m70ab2","rhs_weap_m70b1n","rhs_weap_m70b3n","rhs_weap_m92","rhs_weap_m21a","rhs_weap_m21s","rhs_weap_pm63","CUP_smg_saiga9","CUP_arifle_SIAGE_MK03_Wood_top_rail","CUP_arifle_Sa58_sporter_compact","rhs_weap_l1a1_wood","rhs_weap_l1a1","rhs_weap_m38","AGE_Vityaz","sgun_HunterShotgun_01_F","sgun_HunterShotgun_01_sawedoff_F","hgun_Pistol_01_F","hgun_Pistol_heavy_02_F","CUP_arifle_AK74M","CUP_arifle_AKS74U","CUP_arifle_AK101","CUP_arifle_AK102","CUP_arifle_AK108","CUP_arifle_AK103","CUP_arifle_AK104","CUP_arifle_AK109","CUP_arifle_AK105","CUP_arifle_AK107","arifle_SDAR_F","CUP_srifle_VSSVintorez","CUP_arifle_AS_VAL","CUP_arifle_SR3M_Vikhr","rhs_weap_m4a1_carryhandle"];
            for "_i" from 1 to 1 + round random 1 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
					case "plp_ct_MilBoxSmallOlive":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_MilBoxSmallBlack":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_AmmoCaseBlackA":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_AmmoCaseBlackB":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_AmmoCaseBlackC":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_AmmoCaseOliveA":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_AmmoCaseBlackB":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_AmmoCaseBlackC":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "Box_Syndicate_Wps_F":
					{
						_items = ["rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_30Rnd_556x45_AK", "CUP_30Rnd_762x39_AK103_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_545x39_7N10_AK", "CUP_30Rnd_Sa58_M", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_30Rnd_9x39_SP5_VIKHR_M", "30Rnd_9x21_Mag_SMG_02", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "10Rnd_9x21_Mag", "6Rnd_45ACP_Cylinder", "rhsgref_10Rnd_792x57_m76", "rhs_30Rnd_762x39mm_Savz58", "rhsgref_30rnd_556x45_m21", "rhsgref_5Rnd_762x54_m38"];
						for "_i" from 1 to 1 + round random 9 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "Box_I_UAV_06_medical_F":
					{
						_items = ["FirstAidKits"];
						for "_i" from 1 to 4 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_FootlockerRed":
					{
						_items = ["FirstAidKits"];
						for "_i" from 1 to 4 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_BoxFoodSmallD":
					{
						_items = ["rvg_bacon", "rvg_beans", "rvg_rice", "rvg_milk", "rvg_plasticBottlePurified", "rvg_spirit", "rvg_franta"];
						for "_i" from 1 to 1 + round random 3 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_BoxFoodSmallB":
					{
						_items = ["rvg_bacon", "rvg_beans", "rvg_rice", "rvg_milk", "rvg_plasticBottlePurified", "rvg_spirit", "rvg_franta"];
						for "_i" from 1 to 1 + round random 3 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_BoxFoodSmallC":
					{
						_items = ["rvg_bacon", "rvg_beans", "rvg_rice", "rvg_milk", "rvg_plasticBottlePurified", "rvg_spirit", "rvg_franta"];
						for "_i" from 1 to 1 + round random 3 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_BoxFoodBigB":
					{
						_items = ["rvg_bacon", "rvg_beans", "rvg_rice", "rvg_milk", "rvg_plasticBottlePurified", "rvg_spirit", "rvg_franta"];
						for "_i" from 1 to 1 + round random 3 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_PlasticCoolerRed":
					{
						_items = ["rvg_bacon", "rvg_beans", "rvg_rice", "rvg_milk", "rvg_plasticBottlePurified", "rvg_spirit", "rvg_franta"];
						for "_i" from 1 to 1 + round random 3 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_PlasticCoolerBlue":
					{
						_items = ["rvg_bacon", "rvg_beans", "rvg_rice", "rvg_milk", "rvg_plasticBottlePurified", "rvg_spirit", "rvg_franta"];
						for "_i" from 1 to 1 + round random 3 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "Box_NATO_Support_F":
					{
						_items = ["rhs_acc_pbs1", "rhs_acc_pbs4", "rhs_acc_tgpa", "rhs_acc_dtk4short", "rhs_acc_ekp8_02", "rhs_acc_ekp1", "rhs_acc_grip_rk2", "rhs_acc_grip_rk6", "rhs_acc_grip_ffg2", "rhs_acc_2dpZenit_ris", "rhs_acc_perst1ik_ris", "rhs_acc_perst3", "optic_Aco", "optic_Aco_smg", "optic_yorris", "acc_flashlight", "acc_pointer_IR", "Rangefinder","Item_ChemicalDetector_01_watch_F","Item_ChemicalDetector_01_black_F","Item_ChemicalDetector_01_olive_F","Item_ChemicalDetector_01_tan_F", "ItemGPS"];
						for "_i" from 1 to 1 + round random 7 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_FootlockerYellow":
					{
						_items = ["rvg_tire", "rvg_hose", "rvg_toolkit", "rvg_canisterFuel","Item_ChemicalDetector_01_watch_F","Item_ChemicalDetector_01_black_F","Item_ChemicalDetector_01_olive_F","Item_ChemicalDetector_01_tan_F"];
						for "_i" from 1 to 1 + round random 4 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_FootlockerGreen":
					{
						_items = ["rvg_tire", "rvg_hose", "rvg_toolkit", "rvg_canisterFuel","Item_ChemicalDetector_01_watch_F","Item_ChemicalDetector_01_black_F","Item_ChemicalDetector_01_olive_F","Item_ChemicalDetector_01_tan_F"];
						for "_i" from 1 to 1 + round random 4 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_ToolboxRedDirty":
					{
						_items = ["rvg_tire", "rvg_hose", "rvg_toolkit", "rvg_canisterFuel","Item_ChemicalDetector_01_watch_F","Item_ChemicalDetector_01_black_F","Item_ChemicalDetector_01_olive_F","Item_ChemicalDetector_01_tan_F"];
						for "_i" from 1 to 1 + round random 4 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ct_ToolboxBlackDirty":
					{
						_items = ["rvg_tire", "rvg_hose", "rvg_toolkit", "rvg_canisterFuel","Item_ChemicalDetector_01_watch_F","Item_ChemicalDetector_01_black_F","Item_ChemicalDetector_01_olive_F","Item_ChemicalDetector_01_tan_F"];
						for "_i" from 1 to 1 + round random 4 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
					case "plp_ctm_PlasticBoxGrey":
					{
						_items = ["rvg_tire", "rvg_hose", "rvg_toolkit", "rvg_canisterFuel","Item_ChemicalDetector_01_watch_F","Item_ChemicalDetector_01_black_F","Item_ChemicalDetector_01_olive_F","Item_ChemicalDetector_01_tan_F"];
						for "_i" from 1 to 1 + round random 5 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
          case "EFT_Crate_Small":
					{
						_items = ["EFT_Keycard", "EFT_Keycard_Blue", "EFT_Keycard_Green", "EFT_Keycard_Yellow", "EFT_Keycard_Red", "EFT_Keycard_Violet", "ItemGPS", "Item_ChemicalDetector_01_watch_F", "", "", "", "", "", "", "", "", "", "", "", "", ""];
						for "_i" from 1 to 2 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
          case "EFT_Crate_Big":
					{
						_items = ["ItemGPS", "Item_ChemicalDetector_01_watch_F", "NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "NVGogglesB_blk_F", "NVGogglesB_grn_F", "NVGogglesB_gry_F", "G_Tactical_Clear", "G_Tactical_Black", "G_AirPurifyingRespirator_01_F", "", "", "", "", "", "", "", "", "", "", "", "", "", ""];
						for "_i" from 1 to 2 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
          case "plp_ct_KappaCaseBlackFlat":
					{
						_items = ["CUP_arifle_M4A1", "CUP_arifle_M4A3_black", "CUP_arifle_M4A1_MOE_short_black", "CUP_arifle_M4A1_MOE_short_wdl", "CUP_arifle_M4A1_MOE_black", "CUP_arifle_M4A1_MOE_wdl", "CUP_arifle_M4A1_SOMMOD_black", "CUP_arifle_M4A1_SOMMOD_hex", "CUP_arifle_M4A1_SOMMOD_ctrg", "CUP_arifle_M4A1_SOMMOD_ctrgt", "CUP_arifle_M4A1_SOMMOD_tan", "CUP_arifle_M4A1_SOMMOD_green", "CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_arifle_M4A1_SOMMOD_Grip_hex", "CUP_arifle_M4A1_SOMMOD_Grip_ctrg", "CUP_arifle_M4A1_SOMMOD_Grip_ctrgt", "CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_arifle_M4A1_SOMMOD_Grip_green", "arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F", "arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F", "CUP_sgun_M1014_vfg", "CUP_sgun_M1014_Entry_vfg", "CUP_arifle_X95_Grippod", "CUP_arifle_Fort224_Grippod", "SMG_01_F", "srifle_EBR_F", "arifle_MX_Black_F", "arifle_MXC_Black_F", "hgun_P07_blk_F", "hgun_P07_F", "arifle_ARX_blk_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_black_F", "CUP_arifle_Fort221", "CUP_arifle_Fort222"];
						for "_i" from 2 to 4 + random 1 do
						{
							_x addItemCargoGlobal [selectRandom _items,1];
						};
					};
          case "plp_ct_KappaCaseBlackBig":
          {
            _items = ["CUP_arifle_M4A1", "CUP_arifle_M4A3_black", "CUP_arifle_M4A1_MOE_short_black", "CUP_arifle_M4A1_MOE_short_wdl", "CUP_arifle_M4A1_MOE_black", "CUP_arifle_M4A1_MOE_wdl", "CUP_arifle_M4A1_SOMMOD_black", "CUP_arifle_M4A1_SOMMOD_hex", "CUP_arifle_M4A1_SOMMOD_ctrg", "CUP_arifle_M4A1_SOMMOD_ctrgt", "CUP_arifle_M4A1_SOMMOD_tan", "CUP_arifle_M4A1_SOMMOD_green", "CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_arifle_M4A1_SOMMOD_Grip_hex", "CUP_arifle_M4A1_SOMMOD_Grip_ctrg", "CUP_arifle_M4A1_SOMMOD_Grip_ctrgt", "CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_arifle_M4A1_SOMMOD_Grip_green", "arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F", "arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F", "CUP_sgun_M1014_vfg", "CUP_sgun_M1014_Entry_vfg", "CUP_arifle_X95_Grippod", "CUP_arifle_Fort224_Grippod", "SMG_01_F", "srifle_EBR_F", "arifle_MX_Black_F", "arifle_MXC_Black_F", "hgun_P07_blk_F", "hgun_P07_F", "arifle_ARX_blk_F", "arifle_MSBS65_UBS_black_F", "arifle_MSBS65_Mark_black_F", "arifle_MSBS65_black_F", "CUP_arifle_Fort221", "CUP_arifle_Fort222"];
            for "_i" from 2 to 4 + random 1 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
          case "plp_ct_KappaCaseBlackSmall":
          {
            _items = ["30Rnd_65x39_caseless_msbs_mag", "6Rnd_12Gauge_Pellets", "30Rnd_65x39_caseless_green", "CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_PMAG_QP", "CUP_30Rnd_556x45_PMAG_QP_Olive", "CUP_30Rnd_556x45_PMAG_QP_Tan", "rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", "rhs_mag_30Rnd_556x45_M855_PMAG_Tan", "CUP_30Rnd_556x45_X95", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "CUP_30Rnd_545x39_Fort224_M", "30Rnd_45ACP_Mag_SMG_01", "CUP_30Rnd_9x19_MP5", "CUP_40Rnd_46x30_MP7", "30Rnd_9x21_Mag_SMG_02", "20Rnd_762x51_Mag", "16Rnd_9x21_Mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_mag"];
            for "_i" from 3 to 5 + random 4 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
          case "plp_ct_KappaCaseBlackMed":
          {
            _items = ["30Rnd_65x39_caseless_msbs_mag", "6Rnd_12Gauge_Pellets", "30Rnd_65x39_caseless_green", "CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_PMAG_QP", "CUP_30Rnd_556x45_PMAG_QP_Olive", "CUP_30Rnd_556x45_PMAG_QP_Tan", "rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", "rhs_mag_30Rnd_556x45_M855_PMAG_Tan", "CUP_30Rnd_556x45_X95", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "CUP_30Rnd_545x39_Fort224_M", "30Rnd_45ACP_Mag_SMG_01", "CUP_30Rnd_9x19_MP5", "CUP_40Rnd_46x30_MP7", "30Rnd_9x21_Mag_SMG_02", "20Rnd_762x51_Mag", "16Rnd_9x21_Mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_mag"];
            for "_i" from 3 to 5 + random 4 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
          case "Land_PlasticCase_01_small_black_F":
          {
            _items = ["30Rnd_65x39_caseless_msbs_mag", "6Rnd_12Gauge_Pellets", "30Rnd_65x39_caseless_green", "CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_PMAG_QP", "CUP_30Rnd_556x45_PMAG_QP_Olive", "CUP_30Rnd_556x45_PMAG_QP_Tan", "rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", "rhs_mag_30Rnd_556x45_M855_PMAG_Tan", "CUP_30Rnd_556x45_X95", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "CUP_30Rnd_545x39_Fort224_M", "30Rnd_45ACP_Mag_SMG_01", "CUP_30Rnd_9x19_MP5", "CUP_40Rnd_46x30_MP7", "30Rnd_9x21_Mag_SMG_02", "20Rnd_762x51_Mag", "16Rnd_9x21_Mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_mag"];
            for "_i" from 3 to 5 + round random 4 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
          case "Land_PlasticCase_01_medium_black_F":
          {
            _items = ["30Rnd_65x39_caseless_msbs_mag", "6Rnd_12Gauge_Pellets", "30Rnd_65x39_caseless_green", "CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_PMAG_QP", "CUP_30Rnd_556x45_PMAG_QP_Olive", "CUP_30Rnd_556x45_PMAG_QP_Tan", "rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", "rhs_mag_30Rnd_556x45_M855_PMAG_Tan", "CUP_30Rnd_556x45_X95", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "CUP_30Rnd_545x39_Fort224_M", "30Rnd_45ACP_Mag_SMG_01", "CUP_30Rnd_9x19_MP5", "CUP_40Rnd_46x30_MP7", "30Rnd_9x21_Mag_SMG_02", "20Rnd_762x51_Mag", "16Rnd_9x21_Mag", "30Rnd_65x39_caseless_black_mag", "30Rnd_65x39_caseless_mag"];
            for "_i" from 6 to 9 + round random 8 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
          case "Land_PlasticCase_01_large_black_F":
          {
            _items = ["V_PlateCarrier1_rgr_noflag_F", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier1_blk", "V_PlateCarrier2_blk", "AGE_Fast_Black_H_A_L", "AGE_CryeG3_G_BlackMCam", "AGE_WAS_AK_Holster_MultiCam", "AGE_WAS_AK_MultiCam", "TRYK_B_Kitbag_blk", "B_AssaultPack_blk", "AGE_Camelback_Coyote", "AGE_F2Bergen_Multicam", "G_Tactical_Clear", "G_Tactical_Black", "G_AirPurifyingRespirator_01_F"];
            for "_i" from 1 to 2 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
          case "B_CargoNet_01_ammo_F":
          {
            _items = ["NVGoggles", "NVGoggles_OPFOR", "NVGoggles_INDEP", "NVGogglesB_blk_F", "NVGogglesB_grn_F", "NVGogglesB_gry_F", "optic_NVS", "optic_Nightstalker"];
            for "_i" from 2 to 2 do
            {
              _x addItemCargoGlobal [selectRandom _items,1];
            };
          };
				};
			} forEach allBoxes;
		};
        _spawn = selectRandom[
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
		{[3,15,3,"","Deploying...","",_x] remoteExec ["KEK_fnc_fade",0];} forEach units group _caller;
		sleep 5;
        _pos = getMarkerPos _spawn;

		{
            _x setPosATL [_pos select 0,_pos select 1,0];
            _x setDir random 360;
			raidPlayerCount = raidPlayerCount + 1;
			publicVariable "raidPlayerCount";
			[_x,["inRaid",true]] remoteExecCall ["setVariable",0];
			[true, true] remoteExecCall ["enableEnvironment",owner _x];
			[missionNamespace getVariable "containerName"] execVM "scripts\raidStashUpdate.sqf";
        } forEach units group _caller;
    },                                                    // Code executed on completion
    {},                                                    // Code executed on interrupted
    [],                                                    // Arguments passed to the scripts as _this select 3
    2,                                                    // Action duration [s]
    100,                                                // Priority
    false,                                                // Remove on completion
    false                                                // Show in unconscious state
] call BIS_fnc_holdActionAdd;    // MP compatible implementation

[
    hub,                                            // Object the action is attached to
    "Go to stash",                                        // Title of the action
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Idle icon shown on screen
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",    // Progress icon shown on screen
    "_this distance doorObj < 3.5",                        // Condition for the action to be shown
    "_caller distance doorObj < 3.5",                        // Condition for the action to progress
    {},                                                    // Code executed when action starts
    {},                                                    // Code executed on every progress tick
    {
		_caller setPosASL (getPosASL (_caller getVariable "stash") vectorAdd [0,0,0.2]);
    },                                                    // Code executed on completion
    {},                                                    // Code executed on interrupted
    [],                                                    // Arguments passed to the scripts as _this select 3
    2,                                                    // Action duration [s]
    100,                                                // Priority
    false,                                                // Remove on completion
    false                                                // Show in unconscious state
] call BIS_fnc_holdActionAdd;    // MP compatible implementation


{
	[
    _x,
    "Go to hub",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "_this distance _target < 3.5",
    "_caller distance _target < 3.5",
    {},
    {},
    {
		_caller setPosASL (getPosASL (hubObj) vectorAdd [0,0,0.2]);
    },
    {},
    [],
    2,
    100,
    false,
    false
	] call BIS_fnc_holdActionAdd;

} forEach [stashHouse_0, stashHouse_1, stashHouse_2, stashHouse_3, stashHouse_4, stashHouse_5, stashHouse_6, stashHouse_7, stashHouse_8, stashHouse_9, stashHouse_10, stashHouse_11];

// Status bar
[] execVM "gui\jk_statusBar\jk_statusBar.sqf";
