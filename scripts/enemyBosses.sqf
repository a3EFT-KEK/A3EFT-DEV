/*
Code for the creation of a boss division, this division will have 1 boss unit, and from 4 to 8 minion scavs.
This code was inspired by OpticCobra's and is currently created by MKNG for EFT mission.
*/
params ["_markerSelection","_customBoss"];

private _commonLoot = ["ItemGPS","acc_flashlight","acc_pointer_IR","optic_Yorris","EFT_Keycard","MineDetector","ToolKit"];

if (canCreateBossDivision) then
{
	if !(alive myLeader) then
	{
	deleteVehicle myLeader;

	//Creates the general scav group where the AI will be assigned.
	private _scavBossGroup = createGroup [east,true];

	//Creates the boss unit.
	private _randomMinionAmmount = 0;
	private _bossName = "";

	myLeader = _scavBossGroup createUnit ["b_survivor_F",getPos player, _markerSelection, 0, "NONE"];

	if !(_customBoss == "") then
	{
	myleader setName _customBoss;
	};

	if (_customBoss == "") then
	{
	 _bossName = ["Cultist Priest","Glukhar","Killa","Reshala","Shturman","Yankee","Vasily","Severov","Sanitar","MF"];
	 myleader setName (selectRandom _bossName);
	};

	publicVariable "myLeader";
	[myLeader] join _scavBossGroup;
	_scavBossGroup selectLeader myLeader;

	//Generilizes the boss unit skill to max
	myLeader setSkill 1;

	//Loadout, health (currently 95% damage reduction), custom skills and minion possibility for the bosses according to its randomized name.
	switch (Name myLeader) do
	{
		case "Cultist Priest": //Loadout done, damage handling added - Corrected to be executed on server only, pending loot pool
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard_Red","EFT_Keycard","rhs_weap_ak105_zenitco01_b33","rhs_30Rnd_545x39_7N10_AK","CUP_smg_Mac10_rail","CUP_30Rnd_45ACP_MAC10_M"];
			private _bossBackpackContent = [];
			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"sgun_HunterShotgun_01_sawedoff_F","", "", "",    // Primary weapon, (weapon items) silencer, pointer, optic
					["2Rnd_12Gauge_Pellets", 2],                                    // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"TRYK_U_B_PCUGs_BLK_R", // Uniform Type
					[    // Uniform Items
							["2Rnd_12Gauge_Pellets",2,3],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"rhs_6b2_chicom",    // Vest Type
					[    // Vest Items
							["2Rnd_12Gauge_Pellets",2,15]
					]
				],
				["B_Messenger_Black_F",[["EFT_KeyCard_Violet",1],["EFT_Keycard",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)
				"NWTS_Deer_bloody",                    // Helmet
				"G_Blindfold_01_white_F",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["ItemWatch", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];
			_randomMinionAmmount = random [8,11,14];
			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"rvg_zed_face_9","male03gre"] call BIS_fnc_setIdentity;

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
			myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.07);}];
			};
		};

		case "Glukhar": //Loadout done, damage handling added - Corrected to be executed on server only, custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard_Yellow","EFT_Keycard","Mask_M50","G_AirPurifyingRespirator_01_F","G_AirPurifyingRespirator_02_black_F","arifle_AK12U_F","30rnd_762x39_AK12_Mag_F","muzzle_snds_m_khk_F"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"rhs_weap_vhsd2", "rhsusf_acc_rotex5_grey", "acc_flashlight","optic_Holosight_blk_F",    // Primary weapon, (weapon items) silencer, pointer, optic
					["rhsgref_30rnd_556x45_vhs2", 30],                                    // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"U_B_CTRG_Soldier_2_Arid_F", // Uniform Type
					[    // Uniform Items
							["rhsgref_30rnd_556x45_vhs2",3,30],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"TRYK_V_Bulletproof_BLK",    // Vest Type
					[    // Vest Items
							[]
					]
				],
				["TRYK_B_Kitbag_blk",[["EFT_Keycard_Yellow",1],["MiniGrenade",1],["HandGrenade",1],["EFT_Keycard",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)
				"",                    // Helmet
				"",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"WhiteHead_03","male12eng"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = random [4,5,7];

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "Killa": //Loadout done, damage handling added - Corrected to be executed on server only,custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard","EFT_Keycard_Red","CUP_arifle_AK109_railed","CUP_muzzle_snds_socom762rc","CUP_acc_ANPEQ_15_Top_Flashlight_Black_L","optic_NVS","CUP_30Rnd_762x39_AK103_bakelite_M"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"arifle_RPK12_F","muzzle_snds_B", "acc_flashlight", "optic_Holosight_blk_F",    // Primary weapon, (weapon 			items) silencer, pointer, optic
					["75rnd_762x39_AK12_Mag_F", 75],                                    // Loaded mag in primary muzzle, ammo 			count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"U_O_R_Gorka_01_black_F", // Uniform Type
					[    // Uniform Items
							["75rnd_762x39_AK12_Mag_F",1,75],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"rhs_6b3_off",    // Vest Type
					[    // Vest Items
							["75rnd_762x39_AK12_Mag_F",2,75]
					]
				],
				["B_ViperHarness_blk_F",[["EFT_Keycard_Red",1],["EFT_Keycard",1],["HandGrenade",1],["MiniGrenade",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)
				"rhs_altyn_visordown",                    // Helmet
				"rhs_balaclava",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"GreekHead_A3_09","male01eng"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = 0;

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0)+((_this select 2)*.050);}];
			};
		};

		case "Reshala": //Loadout done, damage handling added - Corrected to be executed on server only, pending loot pool
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard_Red","EFT_Keycard","rhs_weap_ak105_zenitco01_b33","rhs_30Rnd_545x39_7N10_AK","CUP_smg_Mac10_rail","CUP_30Rnd_45ACP_MAC10_M"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"rhs_weap_akms","rhs_acc_dtkakm", "", "",    // Primary weapon, (weapon items) silencer, pointer, optic
					["rhs_30Rnd_762x39mm_bakelite", 30],                                    // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"TRYK_U_pad_hood_tan", // Uniform Type
					[    // Uniform Items
							["rhs_30Rnd_762x39mm_bakelite",3,30],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"V_Chestrig_oli",    // Vest Type
					[    // Vest Items
							["rhs_30Rnd_762x39mm_bakelite",2,30]
					]
				],
				["B_Carryall_oli",[["EFT_Keycard_Red",1],["EFT_Keycard",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)
				"",                    // Helmet
				"",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["itemMap", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
		];

		//myLeader setUnitLoadout _bossLoadout;
		_randomMinionAmmount = 4;
		[myLeader,"Mavros","male03gre"] call BIS_fnc_setIdentity;

		//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "Shturman": //Loadout done, damage handling added - Corrected to be executed on server only, custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard_Blue","EFT_Keycard","CUP_srifle_VSSVintorez_flash_top","CUP_10Rnd_9x39_SP5_VSS_M","CUP_SKS_rail","CUP_10Rnd_762x39_SKS_M"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"rhs_weap_ak105","rhs_acc_pgs64", "", "",    // Primary weapon, (weapon items) silencer, pointer, optic
					["rhs_30Rnd_545x39_7N10_AK", 30],                                    // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"TRYK_U_B_PCUHsW3", // Uniform Type
					[    // Uniform Items
							["rhs_30Rnd_545x39_7N10_AK",1,30],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"AGE_TV110_AK_Black",    // Vest Type
					[    // Vest Items
							["rhs_30Rnd_545x39_7N10_AK",3,30]
					]
				],
				["TRYK_B_Carryall_blk",[["EFT_Keycard_Blue",1],["EFT_Keycard",1],["Rangefinder",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)
				"",                    // Helmet
				"G_Balaclava_TI_blk_F",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			_randomMinionAmmount = random [1,2,2];
			[myLeader,"WhiteHead_09","male09eng"] call BIS_fnc_setIdentity;

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "Yankee": //Loadout done, damage handling added - Corrected to be executed on server only, custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard_Yellow","EFT_Keycard","CUP_30Rnd_556x45_X95","LMG_Mk200_black_F","NVGoggles","AGE_Goggles_ComTacs","muzzle_snds_M"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"arifle_SPAR_02_snd_F","muzzle_snds_M", "acc_flashlight", "optic_Holosight",    // Primary weapon, (weapon 			items) silencer, pointer, optic
					["150Rnd_556x45_Drum_Sand_Mag_F", 150],                                    // Loaded mag in primary muzzle, 			ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					"bipod_01_F_blk"    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"hgun_P07_F", "", "", "",
					["16Rnd_9x21_Mag",16],
					[],
					""
				],
				[    // Uniform
					"TRYK_U_pad_hood_Cl_blk", // Uniform Type
					[    // Uniform Items
							["16Rnd_9x21_Mag", 3],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"V_PlateCarrier2_blk",    // Vest Type
					[    // Vest Items
							["150Rnd_556x45_Drum_Sand_Mag_F",3]
					]
				],
				["AGE_F2Bergen_Multicam",[["ItemGPS",1],["optic_ERCO_blk_F",1],["EFT_Keycard_Yellow",1],["EFT_Keycard",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)],    // Backpack Info (follows same layout as above for Uniform and Vest)
				"TRYK_H_headsetcap_blk",                    // Helmet
				"PU_shemagh_GryO",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"whitehead_rvg_01","male04eng"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = random [2,3,4];

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "Vasily": //Loadout done, damage handling added - Corrected to be executed on server only,custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_KeyCard_Blue","EFT_KeyCard","arifle_AK12U_lush_F","muzzle_snds_B_lush_F","optic_Holosight_lush_F","30rnd_762x39_AK12_Lush_Mag_F"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"arifle_AK12U_arid_F","muzzle_snds_B_snd_F","acc_pointer_IR","optic_Arco_arid_F",    // Primary weapon, 			(weapon items) silencer, pointer, optic
					["30rnd_762x39_AK12_Arid_Mag_F", 30],       // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"TRYK_T_BLK_PAD", // Uniform Type
					[    // Uniform Items
							["30rnd_762x39_AK12_Arid_Mag_F",3],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"rhs_6b45_desert",    // Vest Type
					[    // Vest Items
							[]
					]
				],
				["B_Kitbag_cbr",[["EFT_Keycard_Blue",1],["EFT_KeyCard",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)],    // Backpack Info (follows same layout as above for Uniform and Vest)  // Backpack Info (follows same layout as above for Uniform and Vest)
				"TRYK_R_CAP_BLK",                    // Helmet
				"G_Bandanna_blk",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", "TRYK_US_ESS_Glasses_NV"]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"LivonianHead_4","male03rus"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = random [2,3,4];

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "Severov": //Loadout done, damage handling added - Corrected to be executed on server only, custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_Keycard_Yellow","EFT_Keycard","Mask_M50","G_AirPurifyingRespirator_01_F","G_AirPurifyingRespirator_02_black_F","arifle_AK12U_F","30rnd_762x39_AK12_Mag_F","muzzle_snds_m_khk_F"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"arifle_TRG21_F","muzzle_snds_m_khk_F", "acc_pointer_IR", "optic_ERCO_khk_F",    // Primary weapon, (weapon 			items) silencer, pointer, optic
					["30Rnd_556x45_Stanag", 30],                // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""    // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"rhs_uniform_gorka_r_g_gloves", // Uniform Type
					[    // Uniform Items
							["FirstAidKit",1],    // Type, count
							["MiniGrenade",1,1],
							["30Rnd_556x45_Stanag",3,30]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"rhs_6b3_AK_2",    // Vest Type
					[    // Vest Items
							["HandGrenade",1,1],
							["SmokeShell",1,1],
							["SmokeShellGreen",1,1],
							["Chemlight_blue",2,1]
					]
				],
				["B_Carryall_oli",[["EFT_KeyCard_Yellow",1],["EFT_Keycard",1],["optic_Holosight_lush_F",1],["DemoCharge_Remote_Mag",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)],    // Backpack Info (follows same layout as above for Uniform and Vest)  // Backpack Info (follows same layout as above for Uniform and Vest)
				"H_EarProtectors_black_F",        // Helmet
				"Mask_M40_OD",                   //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"RussianHead_1","male03rus"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = 3;

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "Sanitar": //Loadout done, damage handling added - Corrected to be executed on server only, custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_KeyCard_Green","EFT_Keycard","CUP_sgun_Saiga12K_top_rail","CUP_arifle_SR3M_Vikhr_VFG_top_rail","CUP_arifle_AS_VAL_flash_top","CUP_20Rnd_9x39_SP5_VSS_M","CUP_30Rnd_9x39_SP5_VIKHR_M"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _weaponArray=["rhs_weap_ak74m_zenitco01_b33","rhs_weap_vss_grip_npz"];
			private _ammoArray=["rhs_30Rnd_545x39_7N22_AK","rhs_10rnd_9x39mm_SP5"];
			private _muzzleArray=["rhs_acc_dtk3",""];
			private _opticArray=["optic_Holosight","optic_Yorris"];
			private _accesoryArray=["rhsusf_acc_anpeq15_wmx_light","rhs_acc_perst1ik_ris"];
			private _bipodArray=["","rhs_acc_grip_rk2"];
			private _randomSelector = random 1;

			private _bossLoadout = [
				[
					_weaponArray select _randomSelector,_muzzleArray select _randomSelector,_accesoryArray select _randomSelector,_opticArray select _randomSelector,    // Primary weapon, (weapon items) silencer, pointer, optic
					[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					_bipodArray select _randomSelector     // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"U_C_rvg_hood_bandit", // Uniform Type
					[    // Uniform Items
							[_ammoArray select _randomSelector,2,30],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"V_TacVestIR_blk",    // Vest Type
					[    // Vest Items
							[_ammoArray select _randomSelector,random 5,30]
					]
				],
				["rhs_medic_bag",[["Medikit",1],["rhs_weap_svdp_wd_npz",1],["rhs_10Rnd_762x54mmR_7N1",1],["EFT_KeyCard_Green",1],["EFT_KeyCard",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)],    // Backpack Info (follows same layout as above for Uniform and Vest)  // Backpack Info (follows same layout as above for Uniform and Vest)
				"H_Headbandage_clean_F",                    // Helmet
				"",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"WhiteHead_27","male03eng"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = random [2,4,6];

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};

		case "MF": //Loadout done, damage handling added - Corrected to be executed on server only, custom loot pools set up for initial release.
		{
			//Boss specific loot rolls:
			private _bossLoot = ["EFT_KeyCard_Green","EFT_KeyCard","rhs_weap_ak103_zenitco01_b33","rhs_30Rnd_762x39mm_polymer","CUP_arifle_Sa58_Carbine_RIS_VFG_woodland","CUP_30Rnd_Sa58_woodland_M"];
			private _bossBackpackContent = [];

			for "_i" from 1 to 4 do
			{
					_bossBackpackContent pushBack (selectRandom _bossLoot);
			};

			//Unit Loadouts
			private _bossLoadout = [
				[
					"AGE_AKM_V_Quadrail","AGE_Muzzle_FA762SS_Black","rhsusf_acc_anpeq15_bk","optic_Holosight_blk_F",    // Primary weapon, (weapon items) silencer, pointer, optic
					["AGE_30Rnd_762x39mm_PMag",30],                                    // Loaded mag in primary muzzle, ammo count
					[],                                        // Loaded mag in secondary muzzle, ammo count
					""   // Bipod
				],
				[],    // Secondary weapon info (see primary above)
				[    // handGun info (see primary above)
					"", "", "", "",
					[],
					[],
					""
				],
				[    // Uniform
					"TRYK_U_hood_nc", // Uniform Type
					[    // Uniform Items
							["AGE_30Rnd_762x39mm_PMag",2,30],    // Type, count
							[]
					]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
				],
				[    // Vest Info
					"V_CarrierRigKBT_01_light_Olive_F",    // Vest Type
					[    // Vest Items
							["AGE_30Rnd_762x39mm_PMag",random 5,30]
					]
				],
				["B_Kitbag_rgr",[["EFT_KeyCard_Green",1],["EFT_KeyCard",1],["hgun_Pistol_heavy_02_F",1],[_bossBackpackContent select 0,1],[_bossBackpackContent select 1,1],[_bossBackpackContent select 3,1],[_bossBackpackContent select 4,1]]],    // Backpack Info (follows same layout as above for Uniform and Vest)],    // Backpack Info (follows same layout as above for Uniform and Vest)  // Backpack Info (follows same layout as above for Uniform and Vest)
				"H_Watchcap_khk",                    // Helmet
				"G_Bandanna_oli",                        //Facewear glasses/bandanna etc
			["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
			["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
			];

			myLeader setUnitLoadout _bossLoadout;
			[myLeader,"WhiteHead_27","male03eng"] call BIS_fnc_setIdentity;
			_randomMinionAmmount = random 2;

			//Set an event handler for the boss that will make it considerably resistant to gunfire and explosives.
			if (isServer) then
			{
				myLeader addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.10);}];
			};
		};
	};

	_randomMinionAmmount = round _randomMinionAmmount;

	if (_randomMinionAmmount > 0) then
	{
		for "_i" from 1 to _randomMinionAmmount do
		{
			private _minion = _scavBossGroup createUnit ["b_survivor_F",position myLeader, _markerSelection, 0,"NONE"];
			private _minionLoadout = [];
			switch (Name myLeader) do
			{
				case "Cultist Priest": //Minion loadout done, damage handling added (pending correct handling)
				{
					_minionLoadout = [
					[
						"rhs_weap_scorpion","","","",    // Primary weapon, (weapon items) silencer, pointer, optic
						["rhsgref_20rnd_765x17_vz61", 20],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						"TRYK_shirts_DENIM_BK_Sleeve", // Uniform Type
						[    // Uniform Items
								["HandGrenade",2,1],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						"rhs_chicom_khk",    // Vest Type
						[    // Vest Items
								["rhsgref_20rnd_765x17_vz61",5,20]
						]
					],
					[
					"B_LegStrapBag_olive_F", [["SmokeShell",1,4]]
					],    // Backpack Info (follows same layout as above for Uniform and Vest)
					"H_HeadBandage_bloody_F",                    // Helmet
					"G_Blindfold_01_black_F",                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["", "", "ItemWatch", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];

					[_minion,"rvg_zed_face_6","male03gre"] call BIS_fnc_setIdentity;
				};

				case "Glukhar": //3 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["arifle_SDAR_F","CUP_sgun_AA12","AGE_AK104_C_Cover"];
					private _ammoArray=["20Rnd_556x45_UW_mag","CUP_20Rnd_B_AA12_Buck_4","AGE_30Rnd_762x39mm_PMag"];
					private _muzzleArray=["","",""];
					private _opticArray=["","","AGE_Eotech_Black"];
					private _accesoryArray=["","","rhsusf_acc_anpeq15_wmx_light"];
					private _vestArray=["V_Chestrig_blk","TRYK_V_IOTV_BLK","V_TacVest_blk"];
					private _uniformArray =["TRYK_U_B_GRY_PCUs_R","TRYK_U_B_UCP_PCUs_R","TRYK_U_nohoodPcu_gry"];
					private _backpackArray =["rhs_tortila_black","TRYK_B_Medbag_ucp","TRYK_B_Kitbag_blk"];
					private _facewearArray=["AGE_SPLAV_Gloves","G_Bandanna_blk","G_Bandanna_tan"];
					private _headwearArray=["H_Cap_police","TRYK_r_cap_blk_Glasses","TRYK_H_woolhat_br"];
					private _randomSelector = random 2;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector,_muzzleArray select _randomSelector,_accesoryArray select _randomSelector,_opticArray select _randomSelector,    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						_uniformArray select _randomSelector, // Uniform Type
						[    // Uniform Items
								[_ammoArray select _randomSelector,1,20],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						_vestArray select _randomSelector,    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,3,20]
						]
					],
					[
					_backpackArray select _randomSelector, []
					],    // Backpack Info (follows same layout as above for Uniform and Vest)
					_headwearArray select _randomSelector,                    // Helmet
					_facewearArray select _randomSelector,                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];

					[_minion,"Sturrock","male09eng"] call BIS_fnc_setIdentity;
				};

				case "Reshala": //2 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["arifle_SDAR_F","AGE_AK105_V"];
					private _ammoArray=["20Rnd_556x45_UW_mag","AGE_30Rnd_545x39mm_Mag"];
					private _muzzleArray=["","AGE_Muzzle_FA556AR_Black"];
					private _opticArray=["","optic_Holosight"];
					private _accesoryArray=["","rhsusf_acc_anpeq15_wmx_light"];
					private _vestArray=["V_Chestrig_blk","V_Chestrig_blk"];
					private _uniformArray =["TRYK_U_B_GRY_PCUs_R","U_I_C_Soldier_Bandit_2_F"];
					private _backpackArray =["rhs_tortila_black",""];
					private _facewearArray=["AGE_SPLAV_Gloves","AGE_SPLAV_Gloves"];
					private _headwearArray=["H_Watchcap_blk","H_Cap_red"];
					private _randomSelector = random 1;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector,_muzzleArray select _randomSelector,_accesoryArray select _randomSelector,_opticArray select _randomSelector,    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						_uniformArray select _randomSelector, // Uniform Type
						[    // Uniform Items
								[_ammoArray select _randomSelector,1,30],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						_vestArray select _randomSelector,    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,random 5,30]
						]
					],
					[
					_backpackArray select _randomSelector, []
					],    // Backpack Info (follows same layout as above for Uniform and Vest)
					_headwearArray select _randomSelector,                    // Helmet
					_facewearArray select _randomSelector,                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];

					[_minion,"Sturrock","male09eng"] call BIS_fnc_setIdentity;
				};

				case "Shturman": //3 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["rhs_weap_m70b1","rhs_weap_m70b1","rhs_weap_m70b1"];
					private _ammoArray=["rhssaf_30Rnd_762x39mm_M67","rhssaf_30Rnd_762x39mm_M67","rhssaf_30Rnd_762x39mm_M67"];
					private _muzzleArray=["","",""];
					private _opticArray=["","",""];
					private _accesoryArray=["","",""];
					private _bipodArray=["","",""];
					private _vestArray=["V_Rangemaster_belt","V_TacVest_khk","V_LegStrapBag_black_F"];
					private _uniformArray=["TRYK_U_B_BLK_T_BG_BK","U_BG_Guerilla2_1","TRYK_U_B_PCUHsW9"];
					private _facewearArray=["","rvg_construction_3","TRYK_H_Bandana_wig_g"];
					private _backpackArray=["B_CivilianBackpack_01_Everyday_Black_F","B_FieldPack_cbr","B_Respawn_Sleeping_bag_blue_F"];
					private _headwearArray=["rhs_scarf","G_Bandanna_khk","G_Bandanna_shades"];
					private _randomSelector = random 2;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector,_muzzleArray select _randomSelector, "", "",    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						_uniformArray select _randomSelector, // Uniform Type
						[    // Uniform Items
								[_ammoArray select _randomSelector,random [2,2,3],30],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						_vestArray select _randomSelector,    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,random 1,30]
						]
					],
					[],    // Backpack Info (follows same layout as above for Uniform and Vest)
					_headwearArray select _randomSelector,                    // Helmet
					_facewearArray select _randomSelector,                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];
				};

				case "Yankee": //2 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["AGE_MP9","SMG_01_F"];
					private _ammoArray=["30Rnd_9x21_Mag","30Rnd_45ACP_Mag_SMG_01"];
					private _muzzleArray=["AGE_MP9_Silencer","muzzle_snds_acp"];
					private _opticArray=["optic_Holosight_smg","optic_Holosight"];
					private _accesoryArray=["rhsusf_acc_anpeq15side","acc_flashlight_smg_01"];
					private _vestArray=["V_PlateCarrier1_blk","V_PlateCarrier1_blk"];
					private _uniformArray=["AGE_CryeG3_G_Black","AGE_CryeG3_G_BlackMCam"];
					private _facewearArray=["PU_shemagh_TanCLR","PU_shemagh_Tan"];
					private _headwearArray=["H_Cap_blk","TRYK_H_woolhat"];
					private _randomSelector = random 1;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector, _muzzleArray select _randomSelector, _accesoryArray select _randomSelector, "",    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"hgun_P07_F", "", "", "",
						["16Rnd_9x21_Mag",16],
						[],
						""
					],
					[    // Uniform
						_uniformArray select _randomSelector, // Uniform Type
						[    // Uniform Items
								[_ammoArray select _randomSelector,random [2,2,3],30],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						_vestArray select _randomSelector,    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,random 1,30],["16Rnd_9x21_Mag",3,16]
						]
					],
					["B_AssaultPack_cbr"],    // Backpack Info (follows same layout as above for Uniform and Vest)
					_headwearArray select _randomSelector,                    // Helmet
					_facewearArray select _randomSelector,                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];
				};

				case "Vasily": //2 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["arifle_AK12_lush_F","AGE_Vityaz_C_Grip"];
					private _ammoArray=["30rnd_762x39_AK12_Lush_Mag_F","30Rnd_9x21_Mag_SMG_02"];
					private _muzzleArray=["muzzle_snds_B_lush_F","AGE_Muzzle_FA556AR_Black"];
					private _opticArray=["optic_Holosight_lush_F","AGE_Eotech_Black"];
					private _accesoryArray=["acc_pointer_IR","rhsusf_acc_anpeq15_bk"];
					private _facewearArray=["AGE_Goggles_ComTacs","rhs_facewear_6m2_1"];
					private _headwearArray=["H_Cap_blk","rhs_beanie_green"];
					private _randomSelector = random 1;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector, _muzzleArray select _randomSelector, _accesoryArray select _randomSelector, "",    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"hgun_Rook40_F", "", "", "",
						["16Rnd_9x21_Mag",16],
						[],
						""
					],
					[    // Uniform
						"U_O_R_Gorka_01_camo_F", // Uniform Type
						[    // Uniform Items
								[_ammoArray select _randomSelector,random 1,30],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						"V_CarrierRigKBT_01_light_Olive_F",    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,random 3,30],["16Rnd_9x21_Mag",3,16]
						]
					],
					["B_FieldPack_taiga_F"],    // Backpack Info (follows same layout as above for Uniform and Vest)
					_headwearArray select _randomSelector,                    // Helmet
					_facewearArray select _randomSelector,                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];
				};

				case "Severov": //3 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["rhs_weap_aks74n","arifle_AK12U_F","rhs_weap_m70ab2"];
					private _ammoArray=["rhs_30Rnd_545x39_7N6M_AK","30Rnd_762x39_AK12_Mag_F", "rhssaf_30Rnd_762x39mm_M67"];
					private _muzzleArray=["rhs_acc_tgpa","muzzle_snds_B","rhs_acc_pbs1"];
					private _opticArray=["","",""];
					private _accesoryArray=["rhs_acc_2dpZenit","acc_flashlight","rhs_acc_2dpZenit"];
					private _bipodArray=["","",""];
					private _vestArray=["rhs_6b3_AK_2","rhs_6b3_AK","rhs_6b3_AK_2"];
					private _facewearArray=["G_Bandanna_oli","rhs_facewear_6m2_1","Mask_M40_OD"];
					private _headwearArray=["rhs_beanie_green","rhs_headband","H_Cap_oli"];
					private _randomSelector = random 2;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector, _muzzleArray select _randomSelector, _accesoryArray select _randomSelector, "",    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						"rhs_uniform_gorka_r_g_gloves", // Uniform Type
						[    // Uniform Items
								[_ammoArray select _randomSelector,random [2,2,3],30],    // Type, count
								[]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						_vestArray select _randomSelector,    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,random 1,30]
						]
					],
					[],    // Backpack Info (follows same layout as above for Uniform and Vest)
					_headwearArray select _randomSelector,                    // Helmet
					_facewearArray select _randomSelector,                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["ItemMap", "ItemCompass", "ItemWatch", "ItemRadio", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];
				};

				case "Sanitar": //2 types of Minions loadout done, damage handling added (pending correct handling)
				{
					private _weaponArray=["rhs_weap_aks74n_2_npz","CUP_sgun_Saiga12K"];
					private _ammoArray=["rhs_30Rnd_545x39_7N6M_plum_AK","CUP_12Rnd_B_Saiga12_Buck_4"];
					private _muzzleArray=["rhs_acc_dtk3","rhs_acc_ekp8_02"];
					private _opticArray=["rhs_acc_1p87",""];
					private _accesoryArray=["rhs_acc_2dpZenit",""];
					private _bipodArray=["",""];
					private _randomSelector = random 1;

					_minionLoadout = [
					[
						_weaponArray select _randomSelector,_muzzleArray select _randomSelector,_accesoryArray select _randomSelector,_opticArray select _randomSelector,    // Primary weapon, (weapon items) silencer, pointer, optic
						[_ammoArray select _randomSelector, 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						"TRYK_shirts_DENIM_BL_Sleeve", // Uniform Type
						[    // Uniform Items
								["FirstAidKit",2],    // Type, count
								["HandGrenade",2,1],
								[_ammoArray select _randomSelector,2,30]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						"TRYK_V_harnes_od_L",    // Vest Type
						[    // Vest Items
								[_ammoArray select _randomSelector,random 5,30]
						]
					],
					[
					"B_CivilianBackpack_01_Everyday_Black_F", []
					],    // Backpack Info (follows same layout as above for Uniform and Vest)
					"rhsgref_patrolcap_specter",                    // Helmet
					"TRYK_Shemagh_shade_MH",                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];

					[_minion,"WhiteHead_23","male03gre"] call BIS_fnc_setIdentity;
				};

				case "MF": //Minion loadout done, damage handling added (pending correct handling)
				{
					_minionLoadout = [
					[
						"AGE_MP9","AGE_MP9_Silencer","","",    // Primary weapon, (weapon items) silencer, pointer, optic
						["30Rnd_9x21_Mag", 30],                                    // Loaded mag in primary muzzle, ammo count
						[],                                        // Loaded mag in secondary muzzle, ammo count
						""    // Bipod
					],
					[],    // Secondary weapon info (see primary above)
					[    // handGun info (see primary above)
						"", "", "", "",
						[],
						[],
						""
					],
					[    // Uniform
						"TRYK_U_B_BLK_T_BG_BK", // Uniform Type
						[    // Uniform Items
								["FirstAidKit",2],    // Type, count
								["HandGrenade",2,1],
								["30Rnd_9x21_Mag",2,30]
						]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
					],
					[    // Vest Info
						"V_TacVest_blk",    // Vest Type
						[    // Vest Items
								["30Rnd_9x21_Mag",random 5,30]
						]
					],
					[
					"TRYK_B_Kitbag_blk", []
					],    // Backpack Info (follows same layout as above for Uniform and Vest)
					"H_Cap_blk",                    // Helmet
					"rhs_googles_clear",                        //Facewear glasses/bandanna etc
					["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
					["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
					];

					[_minion,"WhiteHead_23","male03gre"] call BIS_fnc_setIdentity;
				};
			};

		//Set an event handler for the minion that will make it considerably resistant to gunfire and explosives.
		_minion addEventHandler ["HandleDamage",{getDammage (_this select 0) +((_this select 2)*.45);}];

		_minion setUnitLoadout _minionLoadout;
		_minion setSkill .75;
		[_minion] join _scavBossGroup;
		};
	};

	[]spawn
	{
	hint "Boss creation script has entered a cooldown of ~90minutes.";
	canCreateBossDivision = false;
	publicVariable "canCreateBossDivision";
	sleep 5400;
	canCreateBossDivision = true;
	publicVariable "canCreateBossDivision";
	};

	//Need to create a way point to do sentry ops in the area.
	private _bossWaypoint1 = _scavBossGroup addWaypoint [getMarkerPos (selectRandom _markerSelection),10,0];
	_bossWaypoint1 setWaypointType "SENTRY";
	_bossWaypoint1 setWaypointBehaviour "SAFE";
	_bossWaypoint1 setWaypointCombatMode "RED";

	//This is the closing bracket for the whole IF statement
	}
	else
	{
	hint "You see an ominous figure in the vicinity. Brace yourself for some heavy combat!";
	};
}
else
{
	if !(alive myLeader) then
	{
	hint "After a quick look at the area, you notice that no one is here.";
	}
	else
	{
	hint "You see an ominous figure in the vicinity. Brace yourself for some heavy combat!";
	};
};
