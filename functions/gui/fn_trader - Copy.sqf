params ["_trader"];


rad_fnc_stashRefresh = {
	_menu = findDisplay 69421;
	_stash_player = _menu displayCtrl 101;
	lbClear _stash_player;
	_crate = (player getVariable "stashCrate");
	if (count (weaponCargo _crate + itemCargo _crate + magazineCargo _crate) > 0) then {
	{
	_itemName = "";
	_itemIcon = "";
	if (isClass (configFile >> "CfgWeapons" >> _x )) then
	{
		_itemName =  getText (configFile >> "CfgWeapons" >> _x >> "displayName");
		_itemIcon =  getText (configFile >> "CfgWeapons" >> _x >> "picture");
	};
	if (isClass (configFile >> "CfgGlasses" >> _x )) then
	{
		_itemName =  getText (configFile >> "CfgGlasses" >> _x >> "displayName");
		_itemIcon =  getText (configFile >> "CfgGlasses" >> _x >> "picture");
	};
		_stash_player lbAdd _itemName;
		_stash_player lbSetPicture [_foreachindex,_itemIcon];
		_stash_player lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
	} forEach (weaponCargo (player getVariable "stashCrate")) + (itemCargo (player getVariable "stashCrate"));
	{
		_mag = (_x select 0);
		_ammo = (_x select 1);
		_stash_player lbAdd format ["[%1] %2",_ammo, getText (configFile >> "CfgMagazines" >> _mag >> "displayName")];
		_stash_player lbSetPicture [_foreachindex + (count itemCargo (player getVariable "stashCrate")) + (count weaponCargo (player getVariable "stashCrate")),getText (configFile >> "CfgMagazines" >> _mag >> "picture")];
		_stash_player lbSetPictureColor [_foreachindex + (count itemCargo (player getVariable "stashCrate")) + (count weaponCargo (player getVariable "stashCrate")), [1, 1, 1, 1]];
	} forEach magazinesAmmoCargo (player getVariable "stashCrate");
	_stash_player lbSetCurSel 0;};


};
rad_fnc_stashRemove =
{
	params ["_toRemove"];
	_weapons = weaponsItems (player getVariable "stashCrate");
	_items = itemCargo (player getVariable "stashCrate");
	_magazines = magazinesAmmoCargo (player getVariable "stashCrate");
	if (_toRemove in _weapons) then {_weapons deleteAt (_weapons find _toRemove);};
	if (_toRemove in _items) then {_items deleteAt (_items find _toRemove);};
	if (_toRemove in _magazines) then {_magazines deleteAt (_magazines find _toRemove);};
	clearWeaponCargoGlobal (player getVariable "stashCrate");
	clearMagazineCargoGlobal (player getVariable "stashCrate");
	clearItemCargoGlobal (player getVariable "stashCrate");
	{
		(player getVariable "stashCrate") addWeaponWithAttachmentsCargoGlobal [_x,1];
	} forEach _weapons;
	{
		(player getVariable "stashCrate") addItemCargoGlobal [_x,1];
	} forEach _items;
	{
		(player getVariable "stashCrate") addMagazineAmmoCargo [_x select 0,1,_x select 1];
	} forEach _magazines;
	[] call rad_fnc_stashRefresh;
};


createDialog "trader";
_menu = findDisplay 69421;
_trader_pic = _menu displayCtrl 3;
_trader_name = _menu displayCtrl 4;
_player_name = _menu displayCtrl 5;
_funds = _menu displayCtrl 6;
_stash_trader = _menu displayCtrl 100;
_stash_player = _menu displayCtrl 101;
_player_name ctrlSetText name player;
_pics =
	[
		"pictures\traders\traderPavlov.paa",
		"pictures\traders\traderSurgeon.paa",
		"pictures\traders\traderMechanic.paa",
		"pictures\traders\traderAdams.paa",
		"pictures\traders\traderBoris.paa",
		"pictures\traders\traderRagman.paa"
	];
	//Pavlov
	_inventory_pavlov = ["CUP_arifle_AKM", "CUP_arifle_AKM_top_rail", "CUP_arifle_AKMN_railed", "rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_arifle_AK74M", "CUP_arifle_AK74M_top_rail", "CUP_arifle_AK74M_railed", "CUP_arifle_AKS74U", "CUP_arifle_AKS74U_top_rail", "CUP_arifle_AKS74U_railed", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_arifle_AK101", "CUP_arifle_AK101_top_rail", "CUP_arifle_AK101_railed", "CUP_arifle_AK102", "CUP_arifle_AK102_top_rail", "CUP_arifle_AK102_railed", "CUP_arifle_AK108", "CUP_arifle_AK108_top_rail", "CUP_arifle_AK108_railed", "CUP_30Rnd_556x45_AK", "CUP_arifle_AK103", "CUP_arifle_AK103_top_rail", "CUP_arifle_AK103_railed", "CUP_arifle_AK104", "CUP_arifle_AK104_top_rail", "CUP_arifle_AK104_railed", "CUP_arifle_AK109", "CUP_arifle_AK109_top_rail", "CUP_arifle_AK109_railed", "CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_arifle_AK105", "CUP_arifle_AK105_top_rail", "CUP_arifle_AK105_railed", "CUP_arifle_AK107", "CUP_arifle_AK107_top_rail", "CUP_arifle_AK107_railed", "CUP_30Rnd_545x39_AK74M_M", "rhs_weap_ak103_zenitco01_b33", "rhs_weap_ak104_zenitco01_b33", "rhs_30Rnd_762x39mm_polymer", "rhs_weap_ak105_zenitco01_b33", "rhs_30Rnd_545x39_7N10_AK", "CUP_arifle_Sa58_sporter_compact", "CUP_arifle_Sa58_sporter_compact_rearris", "CUP_arifle_Sa58_Carbine_RIS_VFG", "CUP_30Rnd_Sa58_M", "CUP_arifle_Sa58_Carbine_RIS_VFG_woodland", "CUP_30Rnd_Sa58_woodland_M", "arifle_AK12_F", "arifle_AK12U_F", "30Rnd_762x39_AK12_Mag_F", "arifle_AK12_arid_F", "arifle_AK12U_arid_F", "30rnd_762x39_AK12_Arid_Mag_F", "arifle_AK12_lush_F", "arifle_AK12U_lush_F", "30rnd_762x39_AK12_Lush_Mag_F", "arifle_AK12_GL_F", "arifle_AK12_GL_arid_F", "arifle_AK12_GL_lush_F", "1Rnd_HE_Grenade_shell", "arifle_RPK12_F", "30Rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "arifle_RPK12_arid_F", "30Rnd_762x39_AK12_Arid_Mag_F", "75rnd_762x39_AK12_Arid_Mag_F", "arifle_RPK12_lush_F", "30Rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_F", "CUP_srifle_VSSVintorez", "CUP_srifle_VSSVintorez_top_rail", "CUP_srifle_VSSVintorez_VFG_top_rail", "CUP_srifle_VSSVintorez_flash_top", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_arifle_AS_VAL", "CUP_arifle_AS_VAL_top_rail", "CUP_arifle_AS_VAL_VFG_top_rail", "CUP_arifle_AS_VAL_flash_top", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_arifle_SR3M_Vikhr", "CUP_arifle_SR3M_Vikhr_top_rail", "CUP_arifle_SR3M_Vikhr_VFG_top_rail", "CUP_30Rnd_9x39_SP5_VIKHR_M", "AGE_Vityaz", "AGE_Vityaz_C", "AGE_Vityaz_C_Grip", "AGE_Vityaz_V", "AGE_Vityaz_V_Grip", "30Rnd_9x21_Mag_SMG_02", "srifle_DMR_07_blk_F", "20Rnd_650x39_Cased_Mag_F", "sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "rhs_weap_Izh18", "rhsgref_1Rnd_00Buck", "rhsgref_1Rnd_Slug", "hgun_Pistol_01_F", "10Rnd_9x21_Mag", "hgun_Pistol_heavy_02_F", "6Rnd_45ACP_Cylinder"];
	_prices_pavlov = [51887, 57152, 61244, 4318, 8516, 11597, 11597, 11597, 11597, 11597, 11597, 14581, 19987, 19987, 19987, 60320, 66174, 70411, 45240, 49631, 52808, 9381, 9381, 9381, 9381, 9381, 12522, 12522, 15719, 67421, 73693, 77896, 50566, 55270, 58422, 52066, 56770, 59922, 12554, 68118, 74053, 78220, 51089, 57617, 61361, 69677, 75477, 79169, 11597, 47941, 53699, 57404, 67866, 73443, 77197, 9381, 78521, 61361, 11597, 57404, 9381, 42387, 48211, 60616, 11597, 61116, 11597, 75190, 56392, 11597, 75690, 56892, 12522, 75690, 56892, 12522, 121849, 122349, 122349, 12513, 82411, 11597, 15017, 82911, 12522, 16588, 82911, 12522, 16588, 80116, 82249, 84941, 90067, 6296, 81116, 83249, 85941, 91067, 8714, 60837, 64456, 63706, 11215, 38915, 42748, 46692, 43748, 47692, 9246, 2500, 12011, 30019, 27018, 1618, 2483, 27514, 2087, 2491, 25027, 4012, 52511, 6009];

//Surgeon
_inventory_surgeon = ["FirstAidKit", "Medikit", "rvg_bacon", "rvg_rice", "rvg_beans", "rvg_spirit", "rvg_franta", "rvg_milk", "rvg_plasticBottlePurified", "rvg_canteen", "rvg_antiRad", "rvg_canOpener", "rvg_purificationTablets", "rvg_ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS", "ChemicalDetector_01_watch_F", "Binocular", "Rangefinder", "rvg_guttingKnife", "rvg_canisterFuel_Empty", "rvg_canisterFuel"];
_prices_surgeon = [11528, 50418, 11246, 11246, 11246, 11246, 11246, 11246, 11246, 13246, 65726, 5401, 15000, 5000, 5000, 5000, 5000, 57250, 75040, 14177, 29380, 8513, 2781, 25884];

//Dimitri
_inventory_dimitri = ["optic_Aco", "optic_ACO_grn", "optic_Aco_smg", "optic_ACO_grn_smg", "optic_Holosight_blk_F", "optic_Holosight_smg_blk_F", "optic_Holosight", "optic_Holosight_smg", "optic_Holosight_arid_F", "optic_Holosight_lush_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_EOTECH", "rhsusf_acc_eotech_552", "rhsusf_acc_g33_xps3", "rhsusf_acc_g33_xps3_tan", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "optic_MRCO", "optic_Hamr", "optic_Hamr_khk_F", "optic_ERCO_blk_F", "optic_ERCO_snd_F", "optic_ERCO_khk_F", "optic_Arco", "optic_Arco_arid_F", "optic_Arco_lush_F", "optic_Arco_AK_blk_F", "optic_Arco_AK_arid_F", "optic_Arco_AK_lush_F", "rhsusf_acc_ACOG_USMC", "rhsusf_acc_ACOG2_USMC", "rhsusf_acc_ACOG_RMR", "rhs_acc_pso1m2", "rhs_acc_pso1m21", "optic_KHS_blk", "optic_KHS_tan", "optic_DMS", "optic_LRPS", "optic_SOS", "optic_Nightstalker", "optic_NVS", "optic_TWS", "acc_flashlight", "acc_flashlight_smg_01", "acc_pointer_IR", "rhsusf_acc_M952V", "rhsusf_acc_anpeq16a", "rhsusf_acc_anpeq16a_top", "rhsusf_acc_wmx", "rhsusf_acc_wmx_bk", "rhsusf_acc_anpeq15_wmx_light", "rhsusf_acc_anpeq15_wmx", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_anpeq15_bk", "rhs_acc_2dpZenit", "rhs_acc_2dpZenit_ris", "rhs_acc_perst3_2dp_light_h", "rhs_acc_perst3_2dp_h", "AGE_Inforce_White", "CUP_acc_ANPEQ_2_Flashlight_Black_L", "CUP_acc_ANPEQ_2_Flashlight_Coyote_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_acc_ANPEQ_15_Flashlight_Tan_L", "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "muzzle_snds_M", "muzzle_snds_m_snd_F", "muzzle_snds_m_khk_F", "muzzle_snds_H", "muzzle_snds_H_khk_F", "muzzle_snds_H_khk_F", "muzzle_snds_65_TI_blk_F", "muzzle_snds_B", "muzzle_snds_B_arid_F", "muzzle_snds_B_lush_F", "muzzle_snds_B_snd_F", "muzzle_snds_B_khk_F", "AGE_Muzzle_FA556_Black", "AGE_Muzzle_FA556AR_Black", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_nt4_black", "rhsusf_acc_nt4_tan", "rhsusf_acc_rotex5_grey", "rhsusf_acc_rotex5_tan", "rhs_acc_pbs1", "rhs_acc_dtk4long", "rhs_acc_dtk4screws", "rhs_acc_dtk4short", "rhs_acc_tgpa", "rhs_acc_pbs4", "CUP_muzzle_snds_SR3M", "CUP_muzzle_snds_MP5", "CUP_muzzle_snds_MP7", "CUP_muzzle_snds_FAMAS", "CUP_muzzle_snds_XM8", "CUP_muzzle_snds_G36_black", "CUP_muzzle_snds_SCAR_H", "CUP_muzzle_snds_M16", "CUP_muzzle_snds_M16_coyote", "CUP_muzzle_snds_M16_desert", "CUP_muzzle_snds_M16_camo", "CUP_muzzle_TGPA", "CUP_muzzle_TGPA_Woodland", "CUP_muzzle_PBS4", "CUP_muzzle_snds_KZRZP_AK762_woodland", "CUP_muzzle_snds_socom762rc", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_aac_scarh_silencer", "CUP_muzzle_Bizon", "AGE_Muzzle_FA762SS_Black", "bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_01_F_khk", "bipod_02_F_blk", "bipod_02_F_arid", "bipod_02_F_lush", "bipod_03_F_blk", "rhsusf_acc_kac_grip", "rhsusf_acc_rvg_blk", "rhsusf_acc_rvg_de", "rhsusf_acc_tdstubby_blk", "rhsusf_acc_tdstubby_tan", "rhsusf_acc_grip3", "rhsusf_acc_grip3_tan", "rhs_acc_grip_rk6", "rhs_acc_grip_rk2", "AGE_PK0", "AGE_PK1", "AGE_PK2"];
_prices_dimitri = [18752, 18752, 18752, 18752, 19751, 19751, 19751, 19751, 19951, 19951, 19751, 19751, 19751, 19751, 19751, 19751, 19751, 21841, 32191, 32691, 34417, 34417, 34417, 33199, 33690, 33690, 33199, 33690, 33690, 40449, 40449, 40449, 29133, 30481, 45853, 45853, 37613, 41441, 32420, 188457, 125080, 210448, 7506, 7506, 11945, 11945, 11945, 11945, 7506, 7506, 19851, 19851, 11945, 11945, 7506, 7506, 19851, 19851, 7506, 19851, 19851, 19851, 19851, 19851, 19851, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 27281, 16513, 16513, 16513, 16513, 16513, 16513, 16513, 16513, 4891, 4891, 4891, 4891, 4891, 4891, 4891, 4891, 4891, 4891, 4891, 4891];

//Adams
_inventory_adams = ["CUP_arifle_M4A1", "CUP_arifle_M4A3_black", "CUP_arifle_M4A1_MOE_short_black", "CUP_arifle_M4A1_MOE_short_wdl", "CUP_arifle_M4A1_MOE_black", "CUP_arifle_M4A1_MOE_wdl", "CUP_arifle_M4A1_SOMMOD_black", "CUP_arifle_M4A1_SOMMOD_hex", "CUP_arifle_M4A1_SOMMOD_ctrg", "CUP_arifle_M4A1_SOMMOD_ctrgt", "CUP_arifle_M4A1_SOMMOD_tan", "CUP_arifle_M4A1_SOMMOD_green", "CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_arifle_M4A1_SOMMOD_Grip_hex", "CUP_arifle_M4A1_SOMMOD_Grip_ctrg", "CUP_arifle_M4A1_SOMMOD_Grip_ctrgt", "CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_PMAG_QP", "CUP_30Rnd_556x45_PMAG_QP_Olive", "CUP_30Rnd_556x45_PMAG_QP_Tan", "rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", "rhs_mag_30Rnd_556x45_M855_PMAG_Tan", "CUP_30Rnd_556x45_X95", "arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand", "1Rnd_HE_Grenade_shell", "arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F", "20Rnd_762x51_Mag", "arifle_MX_F", "30Rnd_65x39_caseless_mag", "arifle_MX_Black_F", "30Rnd_65x39_caseless_black_mag", "arifle_MXC_Black_F", "30Rnd_65x39_caseless_black_mag", "CUP_arifle_X95_Grippod", "CUP_30Rnd_556x45_X95", "CUP_arifle_Fort224_Grippod", "CUP_30Rnd_545x39_Fort224_M", "SMG_01_F", "30Rnd_45ACP_Mag_SMG_01", "CUP_smg_MP5A5_Rail_VFG", "CUP_30Rnd_9x19_MP5", "CUP_smg_MP7", "CUP_40Rnd_46x30_MP7", "SMG_02_F", "SMG_05_F", "30Rnd_9x21_Mag_SMG_02", "srifle_EBR_F", "20Rnd_762x51_Mag", "rhs_weap_M590_8RD", "rhs_weap_M590_5RD", "rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug", "CUP_sgun_M1014", "CUP_sgun_M1014_vfg", "CUP_sgun_M1014_Entry", "CUP_sgun_M1014_Entry_vfg", "CUP_6Rnd_12Gauge_Pellets_No4_Buck", "CUP_8Rnd_12Gauge_Slug", "CUP_8Rnd_12Gauge_HE", "hgun_P07_blk_F", "hgun_P07_F", "16Rnd_9x21_Mag"];
_prices_adams = [59714, 61784, 63523, 63723, 67523, 67723, 74817, 75317, 75317, 75317, 75317, 75317, 81817, 82317, 82317, 82317, 82317, 82317, 12522, 14565, 14565, 14565, 14565, 14565, 14565, 14565, 14565, 61714, 62314, 62314, 140986, 141486, 141486, 12522, 12522, 25048, 65714, 66214, 66214, 50121, 50121, 74817, 75317, 75317, 15042, 55728, 120181, 55728, 120181, 45796, 120181, 46286, 14565, 45286, 11587, 41056, 8717, 40983, 8544, 41252, 9095, 39914, 37226, 8544, 90347, 11587, 38714, 35417, 2415, 5018, 31021, 35021, 27021, 31021, 2415, 5018, 10001, 27610, 27610, 9967];

//Boris
_inventory_boris = ["H_HelmetB_light", "H_HelmetB_light_black", "H_HelmetB_light_desert", "H_HelmetB_light_grass", "H_HelmetB_light_sand", "H_HelmetB_light_snakeskin", "H_HelmetB", "H_HelmetB_black", "H_HelmetB_desert", "H_HelmetB_grass", "H_HelmetB_sand", "H_HelmetB_snakeskin", "H_HelmetSpecB", "H_HelmetSpecB_blk", "H_HelmetSpecB_paint2", "H_HelmetSpecB_paint1", "H_HelmetSpecB_sand", "H_HelmetSpecB_snakeskin", "H_HelmetHBK_F", "H_HelmetHBK_headset_F", "H_HelmetHBK_ear_F", "AGE_Fast_Black", "AGE_Fast_Black_A_L", "AGE_Fast_Black_H", "AGE_Fast_Black_H_A_L", "AGE_Fast_Black_P", "AGE_Fast_Black_P_A_L", "AGE_Fast_Painted", "AGE_Fast_Painted_A_L", "AGE_Fast_Painted_H", "AGE_Fast_Painted_H_A_L", "AGE_Fast_Painted_P", "AGE_Fast_Painted_P_A_L", "AGE_Fast_Tan", "AGE_Fast_Tan_A_L", "AGE_Fast_Tan_H", "AGE_Fast_Tan_H_A_L", "AGE_Fast_Tan_P", "AGE_Fast_Tan_P_A_L", "rhsusf_opscore_bk_pelt", "rhsusf_opscore_fg_pelt", "rhsusf_opscore_ut_pelt", "TRYK_H_PASGT_BLK", "TRYK_H_PASGT_COYO", "TRYK_H_PASGT_OD", "H_HelmetB_TI_tna_F", "H_HelmetB_TI_arid_F", "rhs_6b26_green", "rhs_6b26_bala_green", "rhs_6b26_ess_bala_green", "rhs_6b26_digi", "rhs_6b26_digi_bala", "rhs_6b26_digi_ess_bala", "rhs_6b26", "rhs_6b26_bala", "rhs_6b26_ess_bala", "rhs_6b27m_green", "rhs_6b27m_green_bala", "rhs_6b27m_green_ess_bala", "rhs_6b27m_digi", "rhs_6b27m_digi_bala", "rhs_6b27m_digi_ess_bala", "rhs_6b27m", "rhs_6b27m_bala", "rhs_6b27m_ess_bala", "rhs_6b27m_ml", "rhs_6b27m_ml_bala", "rhs_6b27m_ML_ess_bala", "rhs_6b28_green", "rhs_6b28_green_bala", "rhs_6b28_green_ess_bala", "rhs_6b28", "rhs_6b28_bala", "rhs_6b28_ess_bala", "rhs_6b28_flora", "rhs_6b28_flora_bala", "rhs_6b28_flora_ess_bala", "rhs_6b47_bare", "rhs_6b47", "rhs_6b47_6m2_1", "rhs_6b47_bala", "rhs_6b7_1m", "rhs_6b7_1m_bala1", "rhs_6b7_1m_bala2", "rhs_6b7_1m_ess_bala", "rhs_6b7_1m_emr", "rhs_6b7_1m_bala1_emr", "rhs_6b7_1m_bala2_emr", "rhs_6b7_1m_emr_ess_bala", "rhs_6b7_1m_flora", "rhs_6b7_1m_bala1_flora", "rhs_6b7_1m_bala2_flora", "rhs_6b7_1m_olive", "rhs_6b7_1m_bala1_olive", "rhs_6b7_1m_bala2_olive", "rhs_altyn", "rhs_altyn_bala", "rhs_altyn_visordown", "rhsusf_hgu56p_visor_mask_smiley", "rhsusf_hgu56p_visor_mask_skull", "rhsusf_hgu56p_visor_mask_pink", "V_PlateCarrier1_rgr_noflag_F", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier1_blk", "V_PlateCarrier2_blk", "TRYK_V_ArmorVest_CBR", "TRYK_V_ArmorVest_cbr2", "TRYK_V_ArmorVest_Brown", "TRYK_V_ArmorVest_Brown2", "TRYK_V_ArmorVest_green", "TRYK_V_ArmorVest_green2", "TRYK_V_ArmorVest_coyo", "TRYK_V_ArmorVest_coyo2", "TRYK_V_ArmorVest_tan", "TRYK_V_ArmorVest_tan2", "V_Chestrig_blk", "V_Chestrig_rgr", "V_Chestrig_khk", "V_Chestrig_oli", "V_TacVestIR_blk", "V_SmershVest_01_F", "V_SmershVest_01_radio_F", "V_CarrierRigKBT_01_Olive_F", "V_CarrierRigKBT_01_EAF_F", "V_CarrierRigKBT_01_light_Olive_F", "V_CarrierRigKBT_01_light_EAF_F", "V_CarrierRigKBT_01_heavy_Olive_F", "V_CarrierRigKBT_01_heavy_EAF_F", "V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli", "V_I_G_resistanceLeader_F", "V_BandollierB_blk", "V_BandollierB_cbr", "V_BandollierB_rgr", "V_BandollierB_khk", "V_BandollierB_oli", "V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F", "AGE_TV110_AK_Black", "AGE_TV110_AK_Holster_Black", "AGE_TV110_SMG_Black", "AGE_TV110_SMG_Holster_Black", "AGE_TV110_AK_Coyote", "AGE_TV110_AK_Holster_Coyote", "AGE_TV110_SMG_Coyote", "AGE_TV110_SMG_Holster_Coyote", "AGE_TV110_AK_MultiCam", "AGE_TV110_AK_Holster_MultiCam", "AGE_TV110_SMG_MultiCam", "AGE_TV110_SMG_Holster_MultiCam", "AGE_WAS_AK_MultiCam", "AGE_WAS_AK_Holster_MultiCam", "AGE_WAS_Light_AK_MultiCam", "AGE_WAS_Medium_AK_MultiCam", "AGE_WAS_Heavy_AK_MultiCam", "rhsusf_mbav", "rhsusf_mbav_light", "rhsusf_mbav_rifleman", "V_EOD_coyote_F", "V_EOD_olive_F",  "rhs_6b2", "rhs_6b3", "rhs_6b5", "rhs_6b5_khaki", "rhs_6b43", "rhs_6b45_light", "rhs_6b45_rifleman", "rhs_6b45_rifleman_2", "rhs_6b13_Flora", "rhs_6b13_Flora_6sh92", "rhs_6b13_EMR", "rhs_6b13_EMR_6sh92", "rhs_6b23", "rhs_6b23_6sh116", "rhs_6b23_6sh116_od", "rhs_6b23_digi", "rhs_6b23_6sh116", "rhs_6b23_digi_6sh92_spetsnaz2", "rhs_6b23_6sh116_flora", "rhsgref_6b23_khaki_rifleman", "rhs_6sh117_rifleman", "B_AssaultPack_blk", "B_AssaultPack_cbr", "B_AssaultPack_rgr", "B_AssaultPack_khk", "B_AssaultPack_sgg", "B_AssaultPack_mcamo", "B_AssaultPack_tna_F", "B_Kitbag_cbr", "B_Kitbag_rgr", "B_Kitbag_mcamo", "B_Kitbag_sgg", "B_Kitbag_tan", "TRYK_B_Kitbag_blk", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_oli", "B_Carryall_oucamo", "TRYK_B_Carryall_blk", "B_Bergen_mcamo_F", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oli", "TRYK_B_Coyotebackpack_BLK", "TRYK_B_Coyotebackpack", "TRYK_B_Coyotebackpack_OD", "AGE_Camelback_Coyote", "AGE_F2Bergen_Multicam",  "G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_RegulatorMask_F", "Mask_M40", "Mask_M40_OD", "NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP", "O_NVGoggles_grn_F", "rvg_O_NVGoggles_grn_F", "NVGogglesB_blk_F", "NVGogglesB_grn_F", "NVGogglesB_gry_F", "rhsusf_ANPVS_14", "rhsusf_ANPVS_15", "rhs_1PN138"];
_prices_boris = [21550,21550,21550,21550,21550,21550,24600,24600,24600,24600,24600,24600,27700,27700,27700,27700,27700,27700,24600,26500,31900,24750,31750,37750,24750,31750,37750,24750,31750,37750,24750,31750,37750,24750,31750,37750,24750,31750,37750,31600,31600,31600,24600,24600,24600,81600,81600,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21575,21650,21500,21550,21700,21625,21550,21625,21625,21700,21550,21625,21625,21700,21550,21625,21625,21550,21625,21625,59900,59950,59900,20000,20000,20000,41913,74221,41913,74221,41913,74221,41913,74221,41913,74221,41913,74221,41913,74221,10194,10194,10194,10194,10350,10194,10194,43913,43913,44330,44330,51550,51550,10279,10279,10279,10279,10279,10279,7103,7103,7103,7103,7103,10201,10201,10201,41913,42413,41913,42413,41913,42413,41913,42413,41913,42413,41913,42413,41913,42413,45913,47117,49317,93100,93300,93700,57470,57470,31870,58470,83470,83470,91100,92300,92700,92700,91100,91100,91100,91100,58470,58470,58470,58470,58470,58470,58470,58470,10150,9150,9150,9150,9150,9150,9150,9150,11250,11250,11250,11250,11250,11250,14275,14275,14275,14275,14275,14275,34981,11350,11350,11350,11350,14112,14112,14112,21400,34257,400,400,400,400,400,400,400,15000,15000,15000,15000,15000,30000,30000,30000,15000,15000,15000];

//Ragman
_inventory_ragman = ["H_Cap_blk", "H_Cap_blk_ION", "TRYK_H_headsetcap_blk", "TRYK_H_headsetcap", "rhsusf_bowman_cap", "TRYK_H_woolhat", "TRYK_H_woolhat_cu", "TRYK_H_woolhat_tan", "rhs_beanie_green", "rhs_beanie", "H_Watchcap_blk", "H_Watchcap_cbr", "H_Watchcap_camo", "H_Watchcap_khk", "G_Aviator", "G_Spectacles_Tinted", "G_Sport_BlackRed", "G_Tactical_Clear", "G_Tactical_Black", "rhs_googles_black", "rhs_googles_clear", "rhs_googles_orange", "rhs_googles_yellow", "G_Combat", "G_Combat_Goggles_tna_F", "rhs_ess_black", "rhsusf_oakley_goggles_blk", "rhsusf_oakley_goggles_clr", "rhsusf_oakley_goggles_ylw", "G_Balaclava_blk", "G_Balaclava_oli", "TRYK_kio_balaclava_BLK", "TRYK_kio_balaclavas", "TRYK_kio_balaclava_ear", "TRYK_kio_balaclava_BLK_ear", "rhs_balaclava", "rhs_balaclava1_olive", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_tan", "G_Bandanna_beast", "G_Bandanna_aviator", "rhs_scarf", "G_Balaclava_TI_blk_F", "G_Balaclava_TI_G_blk_F", "G_Balaclava_TI_tna_F", "G_Balaclava_TI_G_tna_F", "U_B_CombatUniform_mcam_tshirt", "U_I_G_Story_Protagonist_F", "TRYK_C_AOR2_T", "U_B_CombatUniform_tshirt_mcam_wdL_f", "U_B_CTRG_Soldier_2_Arid_F", "U_B_CTRG_Soldier_Arid_F", "U_B_CTRG_Soldier_3_Arid_F", "U_B_GhillieSuit", "U_B_FullGhillie_lsh", "U_C_CBRN_Suit_01_White_F", "U_C_CBRN_Suit_01_Blue_F", "U_B_CBRN_Suit_01_MTP_F", "U_B_CBRN_Suit_01_Wdl_F", "U_I_E_CBRN_Suit_01_EAF_F", "U_O_R_Gorka_01_F", "TRYK_U_pad_hood_Blod", "TRYK_U_pad_hood_Cl_blk", "TRYK_U_pad_hood_Blk", "TRYK_U_pad_hood_tan", "TRYK_U_pad_hood_odBK", "TRYK_U_pad_hood_Cl", "TRYK_U_hood_nc"];
_prices_ragman = [25, 25, 50, 50, 50, 25, 25, 25, 25, 25, 50, 50, 50, 50, 25, 35, 125, 150, 125, 125, 125, 125, 150, 150, 150, 150, 150, 150, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 75, 400, 99, 99, 99, 99, 1000, 1000, 1000, 2500, 3500, 5000, 5000, 5000, 5000, 5000, 99, 99, 99, 99, 99, 99, 99, 99];

//O P T I O N A L   M O D S


if (isClass (configFile >> "CfgPatches" >> "modClass")) then
{
	_inventory_pavlov = _inventory_pavlov + [];
	_prices_pavlov = _prices_pavlov + [];

	_inventory_surgeon = _inventory_surgeon + [];
	_prices_surgeon = _prices_surgeon + [];

	_inventory_dimitri = _inventory_dimitri + [];
	_prices_dimitri = _prices_dimitri + [];

	_inventory_adams = _inventory_adams + [];
	_prices_adams = _prices_adams + [];

	_inventory_boris = _inventory_boris + [];
	_prices_boris = _prices_boris + [];

	_inventory_ragman = _inventory_ragman + [];
	_prices_ragman = _prices_ragman + [];
};



systemChat format ["%1:%2 - %3:%4 - %5:%6 - %7:%8 - %9:%10", count _inventory_pavlov,count _prices_pavlov, count _inventory_adams,count _prices_adams, count _inventory_boris,count _prices_boris, count _inventory_surgeon,count _prices_surgeon, count _inventory_dimitri,count _prices_dimitri];
//_money = player getVariable ["money",1000];
private _localPlayerUID = getPlayerUID player;
_money = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"_money", 1];
_funds ctrlSetText (str _money + " CR");


traderItems = [];
traderPrices = [];
allItemsPool = ["CUP_arifle_M4A1", "CUP_arifle_M4A3_black", "CUP_arifle_M4A1_MOE_short_black", "CUP_arifle_M4A1_MOE_short_wdl", "CUP_arifle_M4A1_MOE_black", "CUP_arifle_M4A1_MOE_wdl", "CUP_arifle_M4A1_SOMMOD_black", "CUP_arifle_M4A1_SOMMOD_hex", "CUP_arifle_M4A1_SOMMOD_ctrg", "CUP_arifle_M4A1_SOMMOD_ctrgt", "CUP_arifle_M4A1_SOMMOD_tan", "CUP_arifle_M4A1_SOMMOD_green", "CUP_arifle_M4A1_SOMMOD_Grip_black", "CUP_arifle_M4A1_SOMMOD_Grip_hex", "CUP_arifle_M4A1_SOMMOD_Grip_ctrg", "CUP_arifle_M4A1_SOMMOD_Grip_ctrgt", "CUP_arifle_M4A1_SOMMOD_Grip_tan", "CUP_arifle_M4A1_SOMMOD_Grip_green", "CUP_30Rnd_556x45_Stanag", "CUP_30Rnd_556x45_PMAG_QP", "CUP_30Rnd_556x45_PMAG_QP_Olive", "CUP_30Rnd_556x45_PMAG_QP_Tan", "rhs_mag_30Rnd_556x45_M855A1_PMAG", "rhs_mag_30Rnd_556x45_M855_PMAG", "rhs_mag_30Rnd_556x45_M855A1_PMAG_Tan", "rhs_mag_30Rnd_556x45_M855_PMAG_Tan", "CUP_30Rnd_556x45_X95", "arifle_SPAR_01_blk_F", "arifle_SPAR_01_khk_F", "arifle_SPAR_01_snd_F", "arifle_SPAR_01_GL_blk_F", "arifle_SPAR_01_GL_khk_F", "arifle_SPAR_01_GL_snd_F", "30Rnd_556x45_Stanag", "30Rnd_556x45_Stanag_Sand", "1Rnd_HE_Grenade_shell", "arifle_SPAR_02_blk_F", "arifle_SPAR_02_khk_F", "arifle_SPAR_02_snd_F", "150Rnd_556x45_Drum_Mag_F", "150Rnd_556x45_Drum_Sand_Mag_F", "arifle_SPAR_03_blk_F", "arifle_SPAR_03_khk_F", "arifle_SPAR_03_snd_F", "20Rnd_762x51_Mag", "arifle_MX_F", "30Rnd_65x39_caseless_mag", "arifle_MX_Black_F", "30Rnd_65x39_caseless_black_mag", "arifle_MXC_Black_F", "30Rnd_65x39_caseless_black_mag", "CUP_arifle_X95_Grippod", "CUP_30Rnd_556x45_X95", "CUP_arifle_Fort224_Grippod", "CUP_30Rnd_545x39_Fort224_M", "SMG_01_F", "30Rnd_45ACP_Mag_SMG_01", "CUP_smg_MP5A5_Rail_VFG", "CUP_30Rnd_9x19_MP5", "CUP_smg_MP7", "CUP_40Rnd_46x30_MP7", "SMG_02_F", "SMG_05_F", "30Rnd_9x21_Mag_SMG_02", "srifle_EBR_F", "20Rnd_762x51_Mag", "rhs_weap_M590_8RD", "rhs_weap_M590_5RD", "rhsusf_8Rnd_00Buck", "rhsusf_8Rnd_Slug", "CUP_sgun_M1014", "CUP_sgun_M1014_vfg", "CUP_sgun_M1014_Entry", "CUP_sgun_M1014_Entry_vfg", "CUP_6Rnd_12Gauge_Pellets_No4_Buck", "CUP_8Rnd_12Gauge_Slug", "CUP_8Rnd_12Gauge_HE", "hgun_P07_blk_F", "hgun_P07_F", "16Rnd_9x21_Mag", "CUP_arifle_AKM", "CUP_arifle_AKM_top_rail", "CUP_arifle_AKMN_railed", "rhs_10Rnd_762x39mm", "CUP_20Rnd_762x39_AMD63_M", "CUP_30Rnd_762x39_AK47_M", "rhs_30Rnd_762x39mm", "CUP_30Rnd_762x39_AK47_bakelite_M", "rhs_30Rnd_762x39mm_polymer", "rhs_30Rnd_762x39mm_bakelite", "rhssaf_30Rnd_762x39mm_M67", "CUP_40Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "rhs_75Rnd_762x39mm", "75Rnd_762x39_Mag_F", "CUP_75Rnd_TE4_LRT4_Green_Tracer_762x39_RPK_M", "CUP_arifle_AK74M", "CUP_arifle_AK74M_top_rail", "CUP_arifle_AK74M_railed", "CUP_arifle_AKS74U", "CUP_arifle_AKS74U_top_rail", "CUP_arifle_AKS74U_railed", "CUP_30Rnd_545x39_AK74M_M", "CUP_30Rnd_545x39_AK74_plum_M", "rhs_30Rnd_545x39_7N6M_AK", "rhs_30Rnd_545x39_7N10_AK", "rhs_30Rnd_545x39_7N10_2mag_AK", "rhs_45Rnd_545X39_7N6_AK", "rhs_45Rnd_545X39_7N6M_AK", "rhs_60Rnd_545X39_7N22_AK", "CUP_arifle_AK101", "CUP_arifle_AK101_top_rail", "CUP_arifle_AK101_railed", "CUP_arifle_AK102", "CUP_arifle_AK102_top_rail", "CUP_arifle_AK102_railed", "CUP_arifle_AK108", "CUP_arifle_AK108_top_rail", "CUP_arifle_AK108_railed", "CUP_30Rnd_556x45_AK", "CUP_arifle_AK103", "CUP_arifle_AK103_top_rail", "CUP_arifle_AK103_railed", "CUP_arifle_AK104", "CUP_arifle_AK104_top_rail", "CUP_arifle_AK104_railed", "CUP_arifle_AK109", "CUP_arifle_AK109_top_rail", "CUP_arifle_AK109_railed", "CUP_30Rnd_762x39_AK103_bakelite_M", "CUP_arifle_AK105", "CUP_arifle_AK105_top_rail", "CUP_arifle_AK105_railed", "CUP_arifle_AK107", "CUP_arifle_AK107_top_rail", "CUP_arifle_AK107_railed", "CUP_30Rnd_545x39_AK74M_M", "rhs_weap_ak103_zenitco01_b33", "rhs_weap_ak104_zenitco01_b33", "rhs_30Rnd_762x39mm_polymer", "rhs_weap_ak105_zenitco01_b33", "rhs_30Rnd_545x39_7N10_AK", "CUP_arifle_Sa58_sporter_compact", "CUP_arifle_Sa58_sporter_compact_rearris", "CUP_arifle_Sa58_Carbine_RIS_VFG", "CUP_30Rnd_Sa58_M", "CUP_arifle_Sa58_Carbine_RIS_VFG_woodland", "CUP_30Rnd_Sa58_woodland_M", "arifle_AK12_F", "arifle_AK12U_F", "30Rnd_762x39_AK12_Mag_F", "arifle_AK12_arid_F", "arifle_AK12U_arid_F", "30rnd_762x39_AK12_Arid_Mag_F", "arifle_AK12_lush_F", "arifle_AK12U_lush_F", "30rnd_762x39_AK12_Lush_Mag_F", "arifle_AK12_GL_F", "arifle_AK12_GL_arid_F", "arifle_AK12_GL_lush_F", "1Rnd_HE_Grenade_shell", "arifle_RPK12_F", "30Rnd_762x39_AK12_Mag_F", "75rnd_762x39_AK12_Mag_F", "arifle_RPK12_arid_F", "30Rnd_762x39_AK12_Arid_Mag_F", "75rnd_762x39_AK12_Arid_Mag_F", "arifle_RPK12_lush_F", "30Rnd_762x39_AK12_Lush_Mag_F", "75rnd_762x39_AK12_Lush_Mag_F", "CUP_srifle_VSSVintorez", "CUP_srifle_VSSVintorez_top_rail", "CUP_srifle_VSSVintorez_VFG_top_rail", "CUP_srifle_VSSVintorez_flash_top", "CUP_10Rnd_9x39_SP5_VSS_M", "CUP_arifle_AS_VAL", "CUP_arifle_AS_VAL_top_rail", "CUP_arifle_AS_VAL_VFG_top_rail", "CUP_arifle_AS_VAL_flash_top", "CUP_20Rnd_9x39_SP5_VSS_M", "CUP_arifle_SR3M_Vikhr", "CUP_arifle_SR3M_Vikhr_top_rail", "CUP_arifle_SR3M_Vikhr_VFG_top_rail", "CUP_30Rnd_9x39_SP5_VIKHR_M", "AGE_Vityaz", "AGE_Vityaz_C", "AGE_Vityaz_C_Grip", "AGE_Vityaz_V", "AGE_Vityaz_V_Grip", "30Rnd_9x21_Mag_SMG_02", "srifle_DMR_07_blk_F", "20Rnd_650x39_Cased_Mag_F", "sgun_HunterShotgun_01_F", "sgun_HunterShotgun_01_sawedoff_F", "2Rnd_12Gauge_Pellets", "2Rnd_12Gauge_Slug", "rhs_weap_Izh18", "rhsgref_1Rnd_00Buck", "rhsgref_1Rnd_Slug", "hgun_Pistol_01_F", "10Rnd_9x21_Mag", "hgun_Pistol_heavy_02_F", "6Rnd_45ACP_Cylinder", "optic_Aco", "optic_ACO_grn", "optic_Aco_smg", "optic_ACO_grn_smg", "optic_Holosight_blk_F", "optic_Holosight_smg_blk_F", "optic_Holosight", "optic_Holosight_smg", "optic_Holosight_arid_F", "optic_Holosight_lush_F", "rhsusf_acc_eotech_xps3", "rhsusf_acc_EOTECH", "rhsusf_acc_eotech_552", "rhsusf_acc_g33_xps3", "rhsusf_acc_g33_xps3_tan", "rhs_acc_ekp1", "rhs_acc_ekp8_02", "optic_MRCO", "optic_Hamr", "optic_Hamr_khk_F", "optic_ERCO_blk_F", "optic_ERCO_snd_F", "optic_ERCO_khk_F", "optic_Arco", "optic_Arco_arid_F", "optic_Arco_lush_F", "optic_Arco_AK_blk_F", "optic_Arco_AK_arid_F", "optic_Arco_AK_lush_F", "rhsusf_acc_ACOG_USMC", "rhsusf_acc_ACOG2_USMC", "rhsusf_acc_ACOG_RMR", "rhs_acc_pso1m2", "rhs_acc_pso1m21", "optic_KHS_blk", "optic_KHS_tan", "optic_DMS", "optic_LRPS", "optic_SOS", "optic_Nightstalker", "optic_NVS", "optic_TWS", "acc_flashlight", "acc_flashlight_smg_01", "acc_pointer_IR", "rhsusf_acc_M952V", "rhsusf_acc_anpeq16a", "rhsusf_acc_anpeq16a_top", "rhsusf_acc_wmx", "rhsusf_acc_wmx_bk", "rhsusf_acc_anpeq15_wmx_light", "rhsusf_acc_anpeq15_wmx", "rhsusf_acc_anpeq15_bk_light", "rhsusf_acc_anpeq15_bk", "rhs_acc_2dpZenit", "rhs_acc_2dpZenit_ris", "rhs_acc_perst3_2dp_light_h", "rhs_acc_perst3_2dp_h", "AGE_Inforce_White", "CUP_acc_ANPEQ_2_Flashlight_Black_L", "CUP_acc_ANPEQ_2_Flashlight_Coyote_L", "CUP_acc_ANPEQ_15_Flashlight_Black_L", "CUP_acc_ANPEQ_15_Flashlight_Tan_L", "CUP_acc_ANPEQ_15_Top_Flashlight_Black_L", "CUP_acc_ANPEQ_15_Top_Flashlight_Tan_L", "muzzle_snds_M", "muzzle_snds_m_snd_F", "muzzle_snds_m_khk_F", "muzzle_snds_H", "muzzle_snds_H_khk_F", "muzzle_snds_H_khk_F", "muzzle_snds_65_TI_blk_F", "muzzle_snds_B", "muzzle_snds_B_arid_F", "muzzle_snds_B_lush_F", "muzzle_snds_B_snd_F", "muzzle_snds_B_khk_F", "AGE_Muzzle_FA556_Black", "AGE_Muzzle_FA556AR_Black", "muzzle_snds_H_MG_blk_F", "rhsusf_acc_nt4_black", "rhsusf_acc_nt4_tan", "rhsusf_acc_rotex5_grey", "rhsusf_acc_rotex5_tan", "rhs_acc_pbs1", "rhs_acc_dtk4long", "rhs_acc_dtk4screws", "rhs_acc_dtk4short", "rhs_acc_tgpa", "rhs_acc_pbs4", "CUP_muzzle_snds_SR3M", "CUP_muzzle_snds_MP5", "CUP_muzzle_snds_MP7", "CUP_muzzle_snds_FAMAS", "CUP_muzzle_snds_XM8", "CUP_muzzle_snds_G36_black", "CUP_muzzle_snds_SCAR_H", "CUP_muzzle_snds_M16", "CUP_muzzle_snds_M16_coyote", "CUP_muzzle_snds_M16_desert", "CUP_muzzle_snds_M16_camo", "CUP_muzzle_TGPA", "CUP_muzzle_TGPA_Woodland", "CUP_muzzle_PBS4", "CUP_muzzle_snds_KZRZP_AK762_woodland", "CUP_muzzle_snds_socom762rc", "rhsusf_acc_aac_762sd_silencer", "rhsusf_acc_aac_762sdn6_silencer", "rhsusf_acc_aac_scarh_silencer", "CUP_muzzle_Bizon", "AGE_Muzzle_FA762SS_Black", "bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_01_F_khk", "bipod_02_F_blk", "bipod_02_F_arid", "bipod_02_F_lush", "bipod_03_F_blk", "rhsusf_acc_kac_grip", "rhsusf_acc_rvg_blk", "rhsusf_acc_rvg_de", "rhsusf_acc_tdstubby_blk", "rhsusf_acc_tdstubby_tan", "rhsusf_acc_grip3", "rhsusf_acc_grip3_tan", "rhs_acc_grip_rk6", "rhs_acc_grip_rk2", "AGE_PK0", "AGE_PK1", "AGE_PK2", "FirstAidKit", "Medikit", "rvg_bacon", "rvg_rice", "rvg_beans", "rvg_spirit", "rvg_franta", "rvg_milk", "rvg_plasticBottlePurified", "rvg_canteen", "rvg_antiRad", "rvg_canOpener", "rvg_purificationTablets", "rvg_ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS", "ChemicalDetector_01_watch_F", "Binocular", "Rangefinder", "H_HelmetB_light", "H_HelmetB_light_black", "H_HelmetB_light_desert", "H_HelmetB_light_grass", "H_HelmetB_light_sand", "H_HelmetB_light_snakeskin", "H_HelmetB", "H_HelmetB_black", "H_HelmetB_desert", "H_HelmetB_grass", "H_HelmetB_sand", "H_HelmetB_snakeskin", "H_HelmetSpecB", "H_HelmetSpecB_blk", "H_HelmetSpecB_paint2", "H_HelmetSpecB_paint1", "H_HelmetSpecB_sand", "H_HelmetSpecB_snakeskin", "H_HelmetHBK_F", "H_HelmetHBK_headset_F", "H_HelmetHBK_ear_F", "AGE_Fast_Black", "AGE_Fast_Black_A_L", "AGE_Fast_Black_H", "AGE_Fast_Black_H_A_L", "AGE_Fast_Black_P", "AGE_Fast_Black_P_A_L", "AGE_Fast_Painted", "AGE_Fast_Painted_A_L", "AGE_Fast_Painted_H", "AGE_Fast_Painted_H_A_L", "AGE_Fast_Painted_P", "AGE_Fast_Painted_P_A_L", "AGE_Fast_Tan", "AGE_Fast_Tan_A_L", "AGE_Fast_Tan_H", "AGE_Fast_Tan_H_A_L", "AGE_Fast_Tan_P", "AGE_Fast_Tan_P_A_L", "rhsusf_opscore_bk_pelt", "rhsusf_opscore_fg_pelt", "rhsusf_opscore_ut_pelt", "TRYK_H_PASGT_BLK", "TRYK_H_PASGT_COYO", "TRYK_H_PASGT_OD", "H_HelmetB_TI_tna_F", "H_HelmetB_TI_arid_F", "rhs_6b26_green", "rhs_6b26_bala_green", "rhs_6b26_ess_bala_green", "rhs_6b26_digi", "rhs_6b26_digi_bala", "rhs_6b26_digi_ess_bala", "rhs_6b26", "rhs_6b26_bala", "rhs_6b26_ess_bala", "rhs_6b27m_green", "rhs_6b27m_green_bala", "rhs_6b27m_green_ess_bala", "rhs_6b27m_digi", "rhs_6b27m_digi_bala", "rhs_6b27m_digi_ess_bala", "rhs_6b27m", "rhs_6b27m_bala", "rhs_6b27m_ess_bala", "rhs_6b27m_ml", "rhs_6b27m_ml_bala", "rhs_6b27m_ML_ess_bala", "rhs_6b28_green", "rhs_6b28_green_bala", "rhs_6b28_green_ess_bala", "rhs_6b28", "rhs_6b28_bala", "rhs_6b28_ess_bala", "rhs_6b28_flora", "rhs_6b28_flora_bala", "rhs_6b28_flora_ess_bala", "rhs_6b47_bare", "rhs_6b47", "rhs_6b47_6m2_1", "rhs_6b47_bala", "rhs_6b7_1m", "rhs_6b7_1m_bala1", "rhs_6b7_1m_bala2", "rhs_6b7_1m_ess_bala", "rhs_6b7_1m_emr", "rhs_6b7_1m_bala1_emr", "rhs_6b7_1m_bala2_emr", "rhs_6b7_1m_emr_ess_bala", "rhs_6b7_1m_flora", "rhs_6b7_1m_bala1_flora", "rhs_6b7_1m_bala2_flora", "rhs_6b7_1m_olive", "rhs_6b7_1m_bala1_olive", "rhs_6b7_1m_bala2_olive", "rhs_altyn", "rhs_altyn_bala", "rhs_altyn_visordown", "rhsusf_hgu56p_visor_mask_smiley", "rhsusf_hgu56p_visor_mask_skull", "rhsusf_hgu56p_visor_mask_pink", "V_PlateCarrier1_rgr_noflag_F", "V_PlateCarrier2_rgr_noflag_F", "V_PlateCarrier1_blk", "V_PlateCarrier2_blk", "TRYK_V_ArmorVest_CBR", "TRYK_V_ArmorVest_cbr2", "TRYK_V_ArmorVest_Brown", "TRYK_V_ArmorVest_Brown2", "TRYK_V_ArmorVest_green", "TRYK_V_ArmorVest_green2", "TRYK_V_ArmorVest_coyo", "TRYK_V_ArmorVest_coyo2", "TRYK_V_ArmorVest_tan", "TRYK_V_ArmorVest_tan2", "V_Chestrig_blk", "V_Chestrig_rgr", "V_Chestrig_khk", "V_Chestrig_oli", "V_TacVestIR_blk", "V_SmershVest_01_F", "V_SmershVest_01_radio_F", "V_CarrierRigKBT_01_Olive_F", "V_CarrierRigKBT_01_EAF_F", "V_CarrierRigKBT_01_light_Olive_F", "V_CarrierRigKBT_01_light_EAF_F", "V_CarrierRigKBT_01_heavy_Olive_F", "V_CarrierRigKBT_01_heavy_EAF_F", "V_TacVest_blk", "V_TacVest_brn", "V_TacVest_camo", "V_TacVest_khk", "V_TacVest_oli", "V_I_G_resistanceLeader_F", "V_BandollierB_blk", "V_BandollierB_cbr", "V_BandollierB_rgr", "V_BandollierB_khk", "V_BandollierB_oli", "V_TacChestrig_cbr_F", "V_TacChestrig_grn_F", "V_TacChestrig_oli_F", "AGE_TV110_AK_Black", "AGE_TV110_AK_Holster_Black", "AGE_TV110_SMG_Black", "AGE_TV110_SMG_Holster_Black", "AGE_TV110_AK_Coyote", "AGE_TV110_AK_Holster_Coyote", "AGE_TV110_SMG_Coyote", "AGE_TV110_SMG_Holster_Coyote", "AGE_TV110_AK_MultiCam", "AGE_TV110_AK_Holster_MultiCam", "AGE_TV110_SMG_MultiCam", "AGE_TV110_SMG_Holster_MultiCam", "AGE_WAS_AK_MultiCam", "AGE_WAS_AK_Holster_MultiCam", "AGE_WAS_Light_AK_MultiCam", "AGE_WAS_Medium_AK_MultiCam", "AGE_WAS_Heavy_AK_MultiCam", "rhsusf_mbav", "rhsusf_mbav_light", "rhsusf_mbav_rifleman", "V_EOD_coyote_F", "V_EOD_olive_F",  "rhs_6b2", "rhs_6b3", "rhs_6b5", "rhs_6b5_khaki", "rhs_6b43", "rhs_6b45_light", "rhs_6b45_rifleman", "rhs_6b45_rifleman_2", "rhs_6b13_Flora", "rhs_6b13_Flora_6sh92", "rhs_6b13_EMR", "rhs_6b13_EMR_6sh92", "rhs_6b23", "rhs_6b23_6sh116", "rhs_6b23_6sh116_od", "rhs_6b23_digi", "rhs_6b23_6sh116", "rhs_6b23_digi_6sh92_spetsnaz2", "rhs_6b23_6sh116_flora", "rhsgref_6b23_khaki_rifleman", "rhs_6sh117_rifleman", "B_AssaultPack_blk", "B_AssaultPack_cbr", "B_AssaultPack_rgr", "B_AssaultPack_khk", "B_AssaultPack_sgg", "B_AssaultPack_mcamo", "B_AssaultPack_tna_F", "B_Kitbag_cbr", "B_Kitbag_rgr", "B_Kitbag_mcamo", "B_Kitbag_sgg", "B_Kitbag_tan", "TRYK_B_Kitbag_blk", "B_Carryall_cbr", "B_Carryall_khk", "B_Carryall_mcamo", "B_Carryall_oli", "B_Carryall_oucamo", "TRYK_B_Carryall_blk", "B_Bergen_mcamo_F", "B_FieldPack_blk", "B_FieldPack_cbr", "B_FieldPack_khk", "B_FieldPack_oli", "TRYK_B_Coyotebackpack_BLK", "TRYK_B_Coyotebackpack", "TRYK_B_Coyotebackpack_OD", "AGE_Camelback_Coyote", "AGE_F2Bergen_Multicam",  "G_AirPurifyingRespirator_01_F", "G_AirPurifyingRespirator_02_black_F", "G_AirPurifyingRespirator_02_olive_F", "G_AirPurifyingRespirator_02_sand_F", "G_RegulatorMask_F", "Mask_M40", "Mask_M40_OD", "NVGoggles_OPFOR", "NVGoggles", "NVGoggles_INDEP", "O_NVGoggles_grn_F", "rvg_O_NVGoggles_grn_F", "NVGogglesB_blk_F", "NVGogglesB_grn_F", "NVGogglesB_gry_F", "rhsusf_ANPVS_14", "rhsusf_ANPVS_15", "rhs_1PN138", "rhs_acc_dtkrpk", "rhs_acc_pgs64", "rhs_acc_dtkakm", "rhs_acc_uuk", "rhs_acc_ak5", "rhs_acc_dtk", "rhs_acc_dtk1", "rhs_acc_dtk2", "rhs_acc_dtk3", "rhs_acc_dtk1983", "rvg_money", "Item_Money_bunch", "Item_Money_roll", "rhs_weap_l1a1_wood", "rhs_weap_l1a1", "rhsgref_acc_falMuzzle_l1a1", "rhs_mag_20Rnd_762x51_m80_fnfal", "rhs_weap_m38", "rhsgref_5Rnd_762x54_m38", "srifle_DMR_06_hunter_F", "10Rnd_Mk14_762x51_Mag", "hgun_PDW2000_F", "30Rnd_9x21_Mag", "AGE_CryeG3_G_BlackMCam", "U_O_R_Gorka_01_camo_F", "arifle_TRG20_F", "arifle_TRG21_F", "rhs_mag_9x19mm_7n21_20", "rhsusf_20Rnd_762x51_m80_Mag", "rhs_weap_m4a1_carryhandle", "rhs_weap_m4a1_carryhandle_mstock", "rhs_weap_m4a1_blockII", "rhs_weap_m4a1_blockII_bk", "rhs_weap_m4a1_blockII_M203_bk", "rhs_weap_m4a1_blockII_KAC_bk", "rhs_mag_30Rnd_556x45_M855A1_Stanag", "rhs_mag_M441_HE", "rhs_mag_m576", "rhsusf_acc_SF3P556", "rhsusf_acc_SFMB556", "rhs_weap_akm", "rhs_weap_akms", "rhs_weap_akmn", "rhs_weap_akms_gp25", "rhs_weap_ak103", "rhs_weap_ak104", "rhs_weap_ak105", "rhs_weap_ak74", "rhs_weap_aks74u", "rhs_weap_aks74un", "rhs_weap_ak74m", "rhs_weap_aks74", "rhs_weap_aks74_2", "rhs_weap_aks74n", "rhs_weap_aks74n_2", "rhs_weap_aks74_gp25", "rhs_weap_savz58p", "rhs_weap_savz58v", "rhs_30Rnd_762x39mm_Savz58", "rhs_weap_m70b1", "rhs_weap_m70ab2", "rhs_weap_m70b1n", "rhs_weap_m70b3n", "rhs_weap_m92", "rhs_weap_m21a", "rhs_weap_m21s", "CUP_muzzle_mfsup_Zendl", "CUP_muzzle_mfsup_Zendl_desert", "CUP_muzzle_mfsup_Zendl_woodland", "EFT_KeyCard", "EFT_KeyCard_Blue", "EFT_KeyCard_Green", "EFT_KeyCard_Yellow", "EFT_KeyCard_Red", "EFT_KeyCard_Violet", "rhs_weap_pm63", "CUP_smg_saiga9", "CUP_10Rnd_9x19_Saiga9", "CUP_arifle_SIAGE_MK03_Wood_top_rail", "CUP_10Rnd_762x39_SaigaMk03_M", "arifle_SDAR_F", "20Rnd_556x45_UW_mag",
"rhs_weap_asval", "rhs_20rnd_9x39mm_SP5", "rhs_weap_vss", "rhs_10rnd_9x39mm_SP5", "rhs_30Rnd_545x39_7N6M_plum_AK", "rhsgref_30rnd_556x45_m21"] + _inventory_adams + _inventory_boris + _inventory_dimitri + _inventory_pavlov + _inventory_ragman + _inventory_surgeon;
allPricesPool = [38814,
40160,
41290,
41420,
43890,
44020,
48631,
48956,
48956,
48956,
48956,
48956,
53181,
53506,
53506,
53506,
53506,
53506,
8139,
9467,
9467,
9467,
9467,
9467,
9467,
9467,
9467,
40114,
40504,
40504,
91641,
91966,
91966,
8139,
8139,
16281,
42714,
43039,
43039,
32579,
32579,
48631,
48956,
48956,
9777,
36223,
78118,
36223,
78118,
29767,
78118,
30086,
9467,
29436,
7532,
26686,
5666,
26639,
5554,
26814,
5912,
25944,
24197,
5554,
58726,
7532,
25164,
23021,
1570,
3262,
20164,
22764,
17564,
20164,
1570,
3262,
6501,
17947,
17947,
6479,
33727,
37149,
39809,
2807,
5535,
7538,
7538,
7538,
7538,
7538,
7538,
9478,
12992,
12992,
12992,
39208,
43013,
45767,
29406,
32260,
34325,
6098,
6098,
6098,
6098,
6098,
8139,
8139,
10217,
43824,
47900,
50632,
32868,
35926,
37974,
33843,
36901,
38949,
8160,
44277,
48134,
50843,
33208,
37451,
39885,
45290,
49060,
51460,
7538,
31162,
34904,
37313,
44113,
47738,
50178,
6098,
51039,
39885,
7538,
37313,
6098,
27552,
31337,
39400,
7538,
39725,
7538,
48874,
36655,
7538,
49199,
36980,
8139,
49199,
36980,
8139,
79202,
79527,
79527,
8133,
53567,
7538,
9761,
53892,
8139,
10782,
53892,
8139,
10782,
52075,
53462,
55212,
58544,
6916,
52725,
54112,
55862,
59194,
7290,
39544,
41896,
41409,
44395,
25295,
27786,
30350,
28436,
31000,
6010,
1625,
7807,
19512,
17562,
1052,
1614,
17884,
1357,
1619,
16268,
2608,
34132,
3906,
12189,
12189,
12189,
12189,
12838,
12838,
12838,
12838,
12968,
12968,
12838,
12838,
12838,
12838,
12838,
12838,
12838,
14197,
20924,
21249,
22371,
22371,
22371,
21579,
21899,
21899,
21579,
21899,
21899,
26292,
26292,
26292,
18936,
19813,
29804,
29804,
24448,
26937,
21073,
122497,
81302,
136791,
4879,
4879,
7764,
7764,
7764,
7764,
4879,
4879,
12903,
12903,
7764,
7764,
4879,
4879,
12903,
12903,
4879,
12903,
12903,
12903,
12903,
12903,
12903,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
17733,
10733,
10733,
10733,
10733,
10733,
10733,
10733,
10733,
3179,
3179,
3179,
3179,
3179,
3179,
3179,
3179,
3179,
3179,
3179,
3179,
7493,
32772,
7310,
7310,
7310,
7310,
7310,
7310,
7310,
8610,
42722,
3511,
98,
0,
0,
0,
0,
37213,
48776,
9215,
19097,
14008,
14008,
14008,
14008,
14008,
14008,
15990,
15990,
15990,
15990,
15990,
15990,
18005,
18005,
18005,
18005,
18005,
18005,
15990,
17225,
20735,
16088,
20638,
24538,
16088,
20638,
24538,
16088,
20638,
24538,
16088,
20638,
24538,
16088,
20638,
24538,
16088,
20638,
24538,
20540,
20540,
20540,
15990,
15990,
15990,
53040,
53040,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14024,
14073,
13975,
14008,
14105,
14056,
14008,
14056,
14056,
14105,
14008,
14056,
14056,
14105,
14008,
14056,
14056,
14008,
14056,
14056,
38935,
38968,
38935,
13000,
13000,
13000,
27243,
48244,
27243,
48244,
27243,
48244,
27243,
48244,
27243,
48244,
27243,
48244,
27243,
48244,
6626,
6626,
6626,
6626,
6728,
6626,
6626,
28543,
28543,
28815,
28815,
33508,
33508,
6681,
6681,
6681,
6681,
6681,
6681,
4617,
4617,
4617,
4617,
4617,
6631,
6631,
6631,
27243,
27568,
27243,
27568,
27243,
27568,
27243,
27568,
27243,
27568,
27243,
27568,
27243,
27568,
29843,
30626,
32056,
60515,
60645,
60905,
37356,
37356,
20716,
38006,
54256,
54256,
59215,
59995,
60255,
60255,
59215,
59215,
59215,
59215,
38006,
38006,
38006,
38006,
38006,
38006,
38006,
38006,
6598,
5948,
5948,
5948,
5948,
5948,
5948,
5948,
7313,
7313,
7313,
7313,
7313,
7313,
9279,
9279,
9279,
9279,
9279,
9279,
22738,
7378,
7378,
7378,
7378,
9173,
9173,
9173,
13910,
22267,
260,
260,
260,
260,
260,
260,
260,
9750,
9750,
9750,
9750,
9750,
19500,
19500,
19500,
9750,
9750,
9750,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
30258,
30967,
0,
7168,
26658,
6832,
40615,
4915,
22767,
6235,
0,
0,
36846,
34915,
5866,
9764,
38814,
38814,
48631,
48631,
48631,
48631,
8139,
8133,
3608,
0,
0,
33727,
30707,
34379,
79202,
44277,
33208,
31162,
32939,
29406,
30037,
39208,
32879,
32895,
33643,
33643,
79202,
32623,
32155,
7532,
32812,
32130,
32812,
32812,
24609,
32061,
30755,
0,
0,
0,
65000,
81250,
97500,
113750,
130000,
162500,
34377,
20896,
2058,
26836,
3127,
26018,
8182,
52725,
7289,
52075,
4092,
6097,
8139] + _prices_adams + _prices_boris + _prices_dimitri + _prices_pavlov + _prices_ragman + _prices_surgeon;

switch _trader do
{
	case "Pavlov":
	{
		_trader_pic ctrlSetText (_pics select 0);
		_trader_name ctrlSetText _trader;

		traderItems = _inventory_pavlov;
		traderPrices = _prices_pavlov;
	};
	case "Surgeon":
	{
		_trader_pic ctrlSetText (_pics select 1);
		_trader_name ctrlSetText _trader;

		traderItems = _inventory_surgeon;
		traderPrices = _prices_surgeon;
	};
	case "Dimitri":
	{
		_trader_pic ctrlSetText (_pics select 2);
		_trader_name ctrlSetText _trader;

		traderItems = _inventory_dimitri;
		traderPrices = _prices_dimitri;
	};
	case "Adams":
	{
		_trader_pic ctrlSetText (_pics select 3);
		_trader_name ctrlSetText _trader;

		traderItems = _inventory_adams;
		traderPrices = _prices_adams;
	};
	case "Boris":
	{
		_trader_pic ctrlSetText (_pics select 4);
		_trader_name ctrlSetText _trader;

		traderItems = _inventory_boris;
		traderPrices = _prices_boris;
	};
	case "Ragman":
	{
		_trader_pic ctrlSetText (_pics select 5);
		_trader_name ctrlSetText _trader;

		traderItems = _inventory_ragman;
		traderPrices = _prices_ragman;
	};
};
{
	_itemName = "";
	_itemIcon = "";
	if (isClass (configFile >> "CfgWeapons" >> _x )) then
	{
		_itemName =  getText (configFile >> "CfgWeapons" >> _x >> "displayName");
		_itemIcon =  getText (configFile >> "CfgWeapons" >> _x >> "picture");
	};
	if (isClass (configFile >> "CfgGlasses" >> _x )) then
	{
		_itemName =  getText (configFile >> "CfgGlasses" >> _x >> "displayName");
		_itemIcon =  getText (configFile >> "CfgGlasses" >> _x >> "picture");
	};
	if (isClass (configFile >> "CfgMagazines" >> _x )) then
	{
		_itemName =  getText (configFile >> "CfgMagazines" >> _x >> "displayName");
		_itemIcon =  getText (configFile >> "CfgMagazines" >> _x >> "picture");
	};
	if (isClass (configFile >> "CfgVehicles" >> _x ) && !isClass (configFile >> "CfgWeapons" >> _x )) then
	{
		_itemName =  getText (configFile >> "CfgVehicles" >> _x >> "displayName");
		_itemIcon =  getText (configFile >> "CfgVehicles" >> _x >> "picture");
	};
	_stash_trader lbAdd _itemName;
	_stash_trader lbSetPicture [_foreachindex,_itemIcon];
	_stash_trader lbSetPictureColor [_foreachindex, [1, 1, 1, 1]];
} forEach traderItems;

[] call rad_fnc_stashRefresh;

buy_amount = 1;



_stash_trader ctrlAddEventHandler ["LBSelChanged",
{
	_menu = findDisplay 69421;
	_list = _menu displayCtrl 100;
	_price = _menu displayCtrl 201;
	_price ctrlSetText ("Price: " + str ((traderPrices select (lbCurSel _list)) * buy_amount));
}];
_stash_player ctrlAddEventHandler ["LBSelChanged",
{
	_menu = findDisplay 69421;
	_list = _menu displayCtrl 101;
	_price = _menu displayCtrl 202;
	_funds = _menu displayCtrl 6;
	//_money = player getVariable ["money",1000];
	private _localPlayerUID = getPlayerUID player;
	_money = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"_money", 1];
	_inventory = (weaponsItems (player getVariable "stashCrate") + itemCargo (player getVariable "stashCrate") + magazinesAmmoCargo (player getVariable "stashCrate"));
	_totalPrice = 0;
	_crate = (player getVariable "stashCrate");
	if (count (weaponCargo _crate + itemCargo _crate + magazineCargo _crate) > 0) then {
	_toSell = (_inventory select (lbCurSel _list));
	if (typeName _toSell == "ARRAY") then
	{
		if (count _toSell > 2) then
		{
			{
				_item = _x;
				if (typeName _item == "ARRAY") then //Check if it's a magazine
				{
					if (count _item > 0) then
					{
						_item = _x select 0;
						_ammoMax = getNumber (configfile >> "CfgMagazines" >> _item >> "count");
						_ammo = _x select 1;
						if (_item in allItemsPool) then {_totalPrice = _totalPrice + round ((allPricesPool select (allItemsPool find _item)) * (_ammo / _ammoMax))} else {_totalPrice = _totalPrice + round (35 * (_ammo / _ammoMax))};
					};
				} else
				{
					if (_item != "") then
					{
						if (_item in allItemsPool) then {_totalPrice = _totalPrice + (allPricesPool select (allItemsPool find _item))} else {if (_forEachIndex == 0) then {_totalPrice = _totalPrice + 550} else {_totalPrice = _totalPrice + 60}};
					};
				};
			} forEach _toSell;
		} else
		{
			if (count _toSell != 0) then
			{
				_item = _toSell select 0;
				_ammoMax = getNumber (configfile >> "CfgMagazines" >> _item >> "count");
				_ammo = _toSell select 1;
				if (_item in allItemsPool) then {_totalPrice = _totalPrice + round ((allPricesPool select (allItemsPool find _item)) * (_ammo / _ammoMax))} else {_totalPrice = _totalPrice + round (35 * (_ammo / _ammoMax))};
			};
		};
	} else
	{
		_item = _toSell;
		if (_item in allItemsPool) then {_totalPrice = _totalPrice + (allPricesPool select (allItemsPool find _item))} else {_totalPrice = _totalPrice + 60};
	};};
	_price ctrlSetText ("Price: " + str _totalPrice);
}];





(_menu displayCtrl 103) ctrlAddEventHandler ["MouseButtonDown",
{
	if (buy_amount > 1) then
	{
		_menu = findDisplay 69421;
		_list = _menu displayCtrl 100;
		_price = _menu displayCtrl 201;
		buy_amount = buy_amount - 1;
		(_menu displayCtrl 105) ctrlSetText ("Amount: " + str buy_amount);
		_price ctrlSetText ("Price: " + str ((traderPrices select (lbCurSel _list)) * buy_amount));

	};
}];
(_menu displayCtrl 104) ctrlAddEventHandler ["MouseButtonDown",
{
	_menu = findDisplay 69421;
	_list = _menu displayCtrl 100;
	_price = _menu displayCtrl 201;
	buy_amount = buy_amount + 1;
	(_menu displayCtrl 105) ctrlSetText ("Amount: " + str buy_amount);
	_price ctrlSetText ("Price: " + str ((traderPrices select (lbCurSel _list)) * buy_amount));
}];
(_menu displayCtrl 102) ctrlAddEventHandler ["MouseButtonClick",
{
	_menu = findDisplay 69421;
	_list = _menu displayCtrl 100;
	_funds = _menu displayCtrl 6;
	_totalPrice = (traderPrices select (lbCurSel _list)) * buy_amount;
	//_money = player getVariable ["money",1000];
	private _localPlayerUID = getPlayerUID player;
	_money = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"_money", 1];
	if (_money >= _totalPrice) then
	{
		if (isClass (configFile >> "CfgVehicles" >> (traderItems select (lbCurSel _list)))) then
		{
			(player getVariable "stashCrate") addBackpackCargoGlobal [traderItems select (lbCurSel _list),buy_amount];
		} else {(player getVariable "stashCrate") addItemCargoGlobal [traderItems select (lbCurSel _list),buy_amount];};
		_money = _money - _totalPrice;
		_funds ctrlSetText (str _money + " CR");
		//player setVariable ["money",_money];
		private _localPlayerUID = getPlayerUID player;
		missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money", _money];
		// experimental
		private _myContainers = [player getVariable "stashCrate"];
		{
				[_x] execVM "scripts\saveTransaction.sqf";
		}
		forEach _myContainers;
		[] call rad_fnc_stashRefresh;
		hint "Item(s) Purchased!";
	} else {hint "Not enough funds!"};
}];
(_menu displayCtrl 106) ctrlAddEventHandler ["MouseButtonClick",
{
	_menu = findDisplay 69421;
	_list = _menu displayCtrl 101;
	_price = _menu displayCtrl 202;
	_funds = _menu displayCtrl 6;
	//_money = player getVariable ["money",1000];
	private _localPlayerUID = getPlayerUID player;
	_money = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"_money", 1];
	_inventory = (weaponsItems (player getVariable "stashCrate") + itemCargo (player getVariable "stashCrate") + magazinesAmmoCargo (player getVariable "stashCrate"));
	_toSell = (_inventory select (lbCurSel _list));
	_totalPrice = 0;
	if (typeName _toSell == "ARRAY") then
	{
		if (count _toSell > 2) then
		{
			{
				_item = _x;
				if (typeName _item == "ARRAY") then //Check if it's a magazine
				{
					if (count _item > 0) then
					{
						_item = _x select 0;
						_ammoMax = getNumber (configfile >> "CfgMagazines" >> _item >> "count");
						_ammo = _x select 1;
						if (_item in allItemsPool) then {_totalPrice = _totalPrice + round ((allPricesPool select (allItemsPool find _item)) * (_ammo / _ammoMax))} else {_totalPrice = _totalPrice + round (35 * (_ammo / _ammoMax))};
					};
				} else
				{
					if (_item != "") then
					{
						if (_item in allItemsPool) then {_totalPrice = _totalPrice + (allPricesPool select (allItemsPool find _item))} else {if (_forEachIndex == 0) then {_totalPrice = _totalPrice + 550} else {_totalPrice = _totalPrice + 60}};
					};
				};
			} forEach _toSell;
		} else
		{
			if (count _toSell != 0) then
			{
				_item = _toSell select 0;
				_ammoMax = getNumber (configfile >> "CfgMagazines" >> _item >> "count");
				_ammo = _toSell select 1;
				if (_item in allItemsPool) then {_totalPrice = _totalPrice + round ((allPricesPool select (allItemsPool find _item)) * (_ammo / _ammoMax))} else {_totalPrice = _totalPrice + round (35 * (_ammo / _ammoMax))};
			};
		};
	} else
	{
		_item = _toSell;
		if (_item in allItemsPool) then {_totalPrice = _totalPrice + (allPricesPool select (allItemsPool find _item))} else {_totalPrice = _totalPrice + 60};
	};
	//player setVariable ["money", _money + _totalPrice];
	private _localPlayerUID = getPlayerUID player;
	missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money", _money+_totalPrice];
	private _myContainers = [player getVariable "stashCrate"];
	{
			[_x] execVM "scripts\saveTransaction.sqf";
	}
	forEach _myContainers;
	_funds ctrlSetText (str (_money + _totalPrice) + " CR");
	[_toSell] call rad_fnc_stashRemove;
}];

_stash_trader lbSetCurSel 0;
_stash_player lbSetCurSel 0;
