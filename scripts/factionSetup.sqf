//This goes in onPlayerRespawn.sqf

params["_forcedFaction"];

private _localPlayerUID = getPlayerUID player;
private _playerRPGSys = profileNamespace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]];
private _playerFaction = _playerRPGSys select 0;

//Check the set faction for the player or if its defined
if !(_forcedFaction == 3) then
{
	switch (_playerFaction select 1) do
	{
		case 0:
		{
		//Code to execute initial faction selection using UI.
			hint "No faction selected, launching selection dialog";
			profileNameSpace setVariable ["EFTVar_"+_localPlayerUID+"_loadout",[]];
			missionNamespace setVariable ["canLoadout",0];
			_ok = createDialog "EFTP_Selection_Menu";
			if (!_ok) then {hint "You dun goofed!"};
			//The initial set up for the player faction should give the desired allowance and initial gear, should be done in same script file.
		};

		//Populate the player on respawn, specifically uniforms and unit type, since the allowance is only given once is faction is undefined.
		//Penalize the player on respawn, stats would be reduced.

		case 1:
		{
			removeUniform player;
			player forceAddUniform "AGE_CryeG3_G_BlackMCam";
			player setName "USEC Operative";
		};

		case 2:
		{
			removeUniform player;
			player forceAddUniform "U_O_R_Gorka_01_camo_F";
			player SetName "BEAR Operative";
		};
		
	};
};

if (_forcedFaction == 3) then
{
	private _factionSUniforms = [
	"U_C_ArtTShirt_01_v1_F","U_C_ArtTShirt_01_v2_F","U_C_ArtTShirt_01_v3_F","U_C_ArtTShirt_01_v4_F","U_C_ArtTShirt_01_v5_F",
	"U_C_ArtTShirt_01_v6_F","U_BG_Guerilla2_2","U_BG_Guerilla2_3","U_BG_Guerilla2_1","U_BG_Guerilla3_1","U_C_HunterBody_grn",
	"U_C_Poor_1","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F",
	"U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_I_C_Soldier_Camo_F","U_I_L_Uniform_01_Camo_F","U_I_L_Uniform_01_Deserter_F",
	"U_O_R_Gorka_01_F","U_O_R_Gorka_01_brown_F","U_O_R_Gorka_01_camo_F","U_O_R_Gorka_01_black_F","U_C_E_LooterJacket_01_F",
	"U_I_L_Uniform_01_tshirt_black_F","U_I_L_Uniform_01_tshirt_olive_F","U_I_L_Uniform_01_tshirt_skull_F",
	"rhs_uniform_gorka_r_g","rhs_uniform_gorka_r_y","rhs_uniform_gorka_1_a","rhs_uniform_gorka_1_b","TRYK_U_B_BLK_T_BG_BK",
	"TRYK_U_B_RED_T_BG_BR","TRYK_U_B_BLK_T_BG_WH","TRYK_U_B_BLK_T_BK","TRYK_U_B_RED_T_BR","TRYK_U_B_BLK_T_WH",
	"TRYK_U_B_Denim_T_BG_BK","TRYK_U_B_Denim_T_BG_WH","TRYK_U_B_Denim_T_BK","TRYK_U_B_Denim_T_WH"];

	private _factionSHeadwear = ["H_Bandanna_blu","H_Cap_blk","H_Bandanna_gry","H_Bandanna_khk",
	"H_Bandanna_sgg","H_Bandanna_cbr","rhs_beanie_green","rhs_beanie","rvg_hat_brown","rvg_hat_grey",
	"rvg_hat_tan","rvg_presshelmet_1","rvg_presshelmet_2","rvg_presshelmet_3",
	"rhsgref_helmet_m1940","rhsgref_helmet_m1940_camo01","rhsgref_helmet_m1942",
	"rhsgref_helmet_m1942_camo01","rhsgref_helmet_m1942_heergreycover","H_PASGT_basic_black_F",
	"H_PASGT_basic_olive_F","H_PASGT_basic_blue_F","H_PASGT_basic_white_F","TRYK_H_woolhat",
	"TRYK_H_woolhat_br","TRYK_H_woolhat_cu","TRYK_H_woolhat_tan"];

	private _factionSVest =
	["V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli",
	"V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_khk",
	"V_TacVest_oli","V_I_G_resistanceLeader_F","V_Press_F","rhs_6sh92","V_BandollierB_blk","V_BandollierB_cbr",
	"V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","rhsgref_chicom","rhsgref_otv_khaki",
	"rhsgref_TacVest_ERDL","rhssaf_vest_md99_woodland","TRY_V_Bulletproof","TRY_V_Bulletproof_BL",
	"TRY_V_Bulletproof_BLK","V_LegStrapBag_black_F","V_LegStrapBag_coyote_F","V_LegStrapBag_olive_F",
	"V_Pocketed_black_F","V_Pocketed_coyote_F","V_Pocketed_olive_F","V_Press_AAN_F","V_EOD_blue_F",
	"V_EOD_coyote_F","V_EOD_olive_F","gm_dk_army_vest_54_rifleman"];

	private _factionSWeapons = [["rhs_weap_akm","rhs_30Rnd_762x39mm_bakelite"],
	["rhs_weap_akmn","rhs_30Rnd_762x39mm_bakelite"],["rhs_weap_akms","rhs_30Rnd_762x39mm_bakelite"],
	["rhs_weap_aks74","rhs_30Rnd_545x39_7N6M_AK"],["rhs_weap_aks74_2","rhs_30Rnd_545x39_7N6M_plum_AK"],
	["rhs_weap_aks74n","rhs_30Rnd_545x39_7N6M_AK"],["rhs_weap_aks74n_2","rhs_30Rnd_545x39_7N6M_plum_AK"],
	["rhs_weap_aks74u","rhs_30Rnd_545x39_7N6M_AK"],["rhs_weap_aks74un","rhs_30Rnd_545x39_7N6M_AK"],
	["rhs_weap_ak74","rhs_30Rnd_545x39_7N6M_AK"],["rhs_weap_ak74_2","rhs_30Rnd_545x39_7N6M_plum_AK"],
	["rhs_weap_ak103","rhs_30Rnd_762x39mm_polymer"],["rhs_weap_ak104","rhs_30Rnd_762x39mm_polymer"],
	["rhs_weap_ak105","rhs_30Rnd_545x39_7N10_AK"],["rhs_weap_ak74m","rhs_30Rnd_545x39_7N10_AK"],
	["rhs_weap_ak74n","rhs_30Rnd_545x39_7N6M_AK"],["rhs_weap_ak74n_2","rhs_30Rnd_545x39_7N6M_plum_AK"],
	["hgun_PDW2000_F","30Rnd_9x21_Mag"],["rhs_weap_rpk74m","rhs_45Rnd_545X39_7N6M_AK"],
	["rhs_weap_svdp_wd","rhs_10Rnd_762x54mmR_7N1"],["rhs_weap_pm63","rhs_30Rnd_762x39mm"],
	["rhs_weap_m70b1","rhssaf_30Rnd_762x39mm_M67"],["rhs_weap_m70ab2","rhssaf_30Rnd_762x39mm_M67"],
	["rhs_weap_m70b3n","rhssaf_30Rnd_762x39mm_M67"],["rhs_weap_savz58p","rhs_30Rnd_762x39mm_Savz58"],
	["rhs_weap_savz58p_rail","rhs_30Rnd_762x39mm_Savz58"],["rhs_weap_savz58v","rhs_30Rnd_762x39mm_Savz58"],
	["rhs_weap_savz58v_rail","rhs_30Rnd_762x39mm_Savz58"],["rhs_weap_m92","rhssaf_30Rnd_762x39mm_M67"],
	["rhs_weap_m3a1_specops","rhsgref_30rnd_1143x23_M1911B_SMG"],["rhs_weap_m21a","rhsgref_30rnd_556x45_m21"],
	["rhs_weap_m21a_pr","rhsgref_30rnd_556x45_m21"],["rhs_weap_m21s","rhsgref_30rnd_556x45_m21"],
	["rhs_weap_m21s_pr","rhsgref_30rnd_556x45_m21"],["rhs_weap_Izh18","rhsgref_1Rnd_00Buck"],
	["rhs_weap_M590_8RD","rhsusf_8Rnd_00Buck"],["rhs_weap_M590_5RD","rhsusf_8Rnd_00Buck"],
	["AGE_Vityaz","30Rnd_9x21_Mag_SMG_02"],["rhs_weap_m3a1","rhsgref_30rnd_1143x23_M1911B_SMG"],
	["rhs_weap_mg42","rhsgref_50Rnd_792x57_SmE_drum"],["rhs_weap_m38","rhsgref_5Rnd_762x54_m38"],
	["rhs_weap_m38_rail","rhsgref_5Rnd_762x54_m38"],["rhs_weap_mosin_sbr","rhsgref_5Rnd_762x54_m38"],
	["hgun_Rook40_F","16Rnd_9x21_Mag"],["hgun_Pistol_heavy_02_F","6Rnd_45ACP_Cylinder"],
	["srifle_DMR_06_hunter_F","10Rnd_Mk14_762x51_Mag"]];

	private _weaponSelector = _factionSWeapons select Random (count _factionSWeapons);	
	private _playerLoadout = 
	[
		[
		_weaponSelector select 0,"", "", "",    // Primary weapon, (weapon items) silencer, pointer, optic
		[_weaponSelector select 1, 30],                                    // Loaded mag in primary muzzle, ammo count
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
			selectRandom _factionSUniforms, // Uniform Type
			[    // Uniform Items
				[_weaponSelector select 1,random 2, 30],    // Type, count
				[]
			]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
		],
		[    // Vest Info
			selectRandom _factionSVest ,    // Vest Type
			[    // Vest Items
				[_weaponSelector select 1,random 4, 30]
			]
		],
		[],    // Backpack Info (follows same layout as above for Uniform and Vest)
		_factionSHeadwear select random 7,                    // Helmet
		"",                        //Facewear glasses/bandanna etc
		["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
		["itemMap", "itemCompass", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
	];
	
	player setUnitLoadout _playerLoadout;
	player SetName "SCAV";
};