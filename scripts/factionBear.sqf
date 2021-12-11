private _localPlayerUID = getPlayerUID player;
private _playerRPGSys = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]];
private _playerFaction = (_playerRPGSys select 0);
private _playerOperator = (_playerRPGSys select 1);
private _playerStats = (_playerRPGSys select 2);
private _playerHideout = (_playerRPGSys select 3);

_playerFaction = ["Faction",2]; //The number for this section is according to the faction, for example, 0 for undefined, 1 for USEC, 2 for BEAR, 3 for SCAV
_playerOperator = ["Operator","BEAR Operative"]; //Needs to vary according to faction
_playerStats = ["Stats",6,7,4,3,6]; //Needs to vary according to faction

missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[_playerFaction, _playerOperator, _playerStats, _playerHideout]];
profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[_playerFaction, _playerOperator, _playerStats, _playerHideout]];

private _factionBWeapons = [["arifle_AK12_lush_F","30rnd_762x39_AK12_Lush_Mag_F"],["arifle_AK12U_lush_F","30rnd_762x39_AK12_Lush_Mag_F"],["arifle_RPK12_lush_F","75rnd_762x39_AK12_Lush_Mag_F"]];
private _factionBVest = ["AGE_TV110_AK_Black","AGE_TV110_AK_Holster_Black","V_CarrierRigKBT_01_light_Olive_F"];
private _factionBHeadwear = ["rhs_headband","rhssaf_bandana_smb","H_Bandanna_gry","H_MilCap_taiga","H_Bandanna_khk","H_Bandanna_sgg","H_Bandanna_cbr","rhs_beanie_green","rhs_beanie"];
private _playerWeapon = _factionBWeapons select random 2;

private _playerLoadout = [
	[
		_playerWeapon select 0,"", "", "",    // Primary weapon, (weapon items) silencer, pointer, optic
		[_playerWeapon select 1, 30],                                    // Loaded mag in primary muzzle, ammo count
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
		"U_O_R_Gorka_01_camo_F", // Uniform Type
		[    // Uniform Items
			[],    // Type, count
			[]
		]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
	],
	[    // Vest Info
		_factionBVest select random 2,    // Vest Type
		[    // Vest Items
			[_playerWeapon select 1,random 4, 30]
		]
	],
	[],    // Backpack Info (follows same layout as above for Uniform and Vest)
	_factionBHeadwear select random 7,                    // Helmet
	"",                        //Facewear glasses/bandanna etc
	["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
	["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
];

player setUnitLoadout _playerLoadout;
player setName "BEAR Operative";
systemChat "Bear executed";
