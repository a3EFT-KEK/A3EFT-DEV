private _localPlayerUID = getPlayerUID player;
private _playerRPGSys = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False]]]];
private _playerFaction = (_playerRPGSys select 0);
private _playerOperator = (_playerRPGSys select 1);
private _playerStats = (_playerRPGSys select 2);
private _playerHideout = (_playerRPGSys select 3);

_playerFaction = ["Faction",1]; //The number for this section is according to the faction, for example, 0 for undefined, 1 for USEC, 2 for BEAR, 3 for SCAV
_playerOperator = ["Operator","USEC Operative"]; //Needs to vary according to faction
_playerStats = ["Stats",6,7,4,3,6]; //Needs to vary according to faction

missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[_playerFaction, _playerOperator, _playerStats, _playerHideout]];
profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[_playerFaction, _playerOperator, _playerStats, _playerHideout]];

private _factionUWeapons = [["arifle_SPAR_01_blk_F","30Rnd_556x45_Stanag"],["SMG_01_F","30Rnd_45ACP_Mag_SMG_01"],["arifle_SPAR_01_khk_F","30Rnd_556x45_Stanag"]];
private _factionUVest = ["V_PlateCarrier1_blk","V_PlateCarrier2_blk","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier2_rgr_noflag_F"];
private _factionUHeadwear = ["H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Cap_blk","TRYK_H_woolhat","TRYK_H_woolhat_br","TRYK_H_woolhat_cu","TRYK_H_woolhat_tan"];
private _playerWeapon = _factionUWeapons select random 2;

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
        "AGE_CryeG3_G_BlackMCam", // Uniform Type
        [    // Uniform Items
            [],    // Type, count
            []
        ]    // Magazines are Type, ammo, count - Arma version 1.64> is Type, count, ammo
    ],
    [    // Vest Info
        _factionUVest select random 2,    // Vest Type
        [    // Vest Items
            [_playerWeapon select 1,random 4, 30]
        ]
    ],
    [],    // Backpack Info (follows same layout as above for Uniform and Vest)
    _factionUHeadwear select random 7,                    // Helmet
    "",                        //Facewear glasses/bandanna etc
    ["", "", "", "", [], [], ""],    // Weapon Binocular (follows same layout as other weapons above)
    ["", "", "", "", "", ""]    // AssignedItems ItemGPS can also be a UAV Terminal
];

player setUnitLoadout _playerLoadout;
player setName "USEC Operative";
systemChat "USEC executed";
