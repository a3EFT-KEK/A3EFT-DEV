params["_type","_position","_stance"];
if(_position getVariable["Cooldown",false]) exitWith {};

switch(_type) do
{
    case "sniper":
    {
        _rank = "PRIVATE";
        _spawn = getposATL _position;
        _unit = "O_G_Survivor_F";
        _init = "ambushUnit_1 = this;";
        _unit createUnit [_spawn,creategroup [resistance,true],_init,0.85,"PRIVATE"];
        ambushUnit_1 setUnitPos _stance;
        ambushUnit_1 setPosATL getposATL _position;
        _units = ambushUnit_1 nearObjects ["CAManBase", 245];
        {
            if(isPlayer _x) exitWith
            {
                _dir = getDir _x * 3;
                ambushUnit_1 reveal [_x,0.8];
                ambushUnit_1 setDir _dir;
                ambushUnit_1 disableAI 'MOVE';
            };
        } foreach _units;

        _position setVariable["Cooldown",true,true];

        ambushUnit_1 addEventHandler ["FiredNear", {
        	params ["_unit", "_firer", "_distance", "_weapon", "_muzzle", "_mode", "_ammo", "_gunner"];
            _unit enableAI 'MOVE';
            _unit disableAI 'PATH';
        }];

        removeAllWeapons ambushUnit_1;
        removeAllItems ambushUnit_1;
        removeAllAssignedItems ambushUnit_1;
        removeUniform ambushUnit_1;
        removeVest ambushUnit_1;
        removeBackpack ambushUnit_1;
        removeHeadgear ambushUnit_1;
        removeGoggles ambushUnit_1;

        ambushUnit_1 linkItem "ItemMap";
        ambushUnit_1 linkItem "ItemCompass";
        ambushUnit_1 linkItem "ItemWatch";

        _loadoutRandom = selectRandom[1,2,3];
        if(_loadoutRandom == 1) then
        {
            ambushUnit_1 addWeapon "rhs_weap_svdp_wd";
            ambushUnit_1 addPrimaryWeaponItem "rhs_acc_pso1m21";
            ambushUnit_1 addPrimaryWeaponItem "rhs_10Rnd_762x54mmR_7N1";

            ambushUnit_1 forceAddUniform "rhs_uniform_gorka_r_g_gloves";
            ambushUnit_1 addVest "rhs_suspender_AK";

            for "_i" from 1 to 8 do {ambushUnit_1 addItemToVest "rhs_10Rnd_762x54mmR_7N1";};
            ambushUnit_1 addHeadgear "rhs_vkpo_cap";
            ambushUnit_1 addGoggles "rhsusf_shemagh2_gogg_grn";
        };

        if(_loadoutRandom == 2) then
        {
            ambushUnit_1 addWeapon "rhs_weap_m40a5";
            ambushUnit_1 addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4_2";
            ambushUnit_1 addPrimaryWeaponItem "rhsusf_5Rnd_762x51_AICS_m118_special_Mag";
            ambushUnit_1 forceAddUniform "U_O_R_Gorka_01_F";
            ambushUnit_1 addVest "rhs_6sh117_svd";

            for "_i" from 1 to 5 do {ambushUnit_1 addItemToUniform "FirstAidKit";};
            for "_i" from 1 to 13 do {ambushUnit_1 addItemToVest "rhsusf_5Rnd_762x51_AICS_m118_special_Mag";};
            ambushUnit_1 addHeadgear "rhs_6b47_bala";
            ambushUnit_1 addGoggles "rhsusf_oakley_goggles_blk";
        };

        if(_loadoutRandom == 3) then
        {
            ambushUnit_1 addWeapon "rhs_weap_m14";
            ambushUnit_1 addPrimaryWeaponItem "rhsusf_20Rnd_762x51_m80_Mag";

            ambushUnit_1 forceAddUniform "U_C_E_LooterJacket_01_F";

            ambushUnit_1 addItemToUniform "rhsusf_20Rnd_762x51_m80_Mag";
            for "_i" from 1 to 5 do {ambushUnit_1 addItemToUniform "20Rnd_762x51_Mag";};
            ambushUnit_1 addHeadgear "H_PASGT_neckprot_blue_press_F";
            ambushUnit_1 addGoggles "rvg_balaclava_2";
        };
    };

    case "scav_base":
    {
        _position setVariable["Cooldown",true,true];
        _type = "O_G_Survivor_F";
        _init = "scav_1 = this; doStop this; this setDir random (360);";
        _skill = 0.6;
        _group = createGroup [resistance,true];
        _rank = "PRIVATE";
        for "_i" from 1 to 7 do
        {
            _spawn = [_position, 3, 20] call BIS_fnc_findSafePos;
            _type createUnit [_spawn,_group,_init,_skill,_rank];
            [scav_1] call rvg_fnc_equip;
        };
        _crates = _position nearSupplies 50;
        {
            if(_x isKindOf "Thing") exitWith
            {
                _crate = _x;
                _crate allowdamage false;
                private _weapon = selectRandom rvg_weapons;
                _crate addMagazineCargo [selectRandom getArray(configFile >> "CfgWeapons" >> (_weapon) >> "magazines"), 3];
                _crate addWeaponCargoGlobal [_weapon, selectRandom[0,1,2,3]];
                _crate addBackpackCargoGlobal [selectRandom rvg_backpacks, selectRandom[0,1,1]];
                _crate addItemCargoGlobal [selectRandom rvg_items, selectRandom[2,3,4,5,6]];
                _crate addItemCargoGlobal [selectRandom rvg_vests, selectRandom[0,1]];
                _crate addItemCargoGlobal [selectRandom rvg_headGears, selectRandom[0,1]];
            }
        } foreach _crates;

    };


    case "garrison":
    {
        _init =
        "scav_1 = this;
        doStop this;
        this setDir random (360);";

        _type = "O_G_Survivor_F";
        _skill = 0.4;
        _group = createGroup [resistance,true];
        _rank = "PRIVATE";
        for "_i" from 1 to 5 do
        {
            _spawn = [_position, 1, 50] call BIS_fnc_findSafePos;
            _type createUnit [_spawn,_group,_init,_skill,_rank];
            [scav_1] call rvg_fnc_equip;
        };
        _position setVariable["Cooldown",true,true];

        _units = units group scav_1;
        _house = nearestBuilding scav_1;
        _house = _house buildingPos -1;
        _house = _house call BIS_fnc_arrayShuffle;
        if (count _units > count _house) then {_units resize (count _house);};
        {
             _x disableAI 'PATH';
             _x setUnitPos selectRandom ['UP','UP','MIDDLE'];
             _x setPos (_house select _forEachIndex);
        } foreach _units;

        _crates = _position nearSupplies 50;
        {
            if(_x isKindOf "Thing") exitWith
            {
                _crate = _x;
                _crate allowdamage false;
                private _weapon = selectRandom rvg_weapons;
                _crate addMagazineCargo [selectRandom getArray(configFile >> "CfgWeapons" >> (_weapon) >> "magazines"), 3];
                _crate addWeaponCargoGlobal [_weapon, selectRandom[0,1,2,3]];
                _crate addBackpackCargoGlobal [selectRandom rvg_backpacks, selectRandom[0,1,1]];
                _crate addItemCargoGlobal [selectRandom rvg_items, selectRandom[2,3,4,5,6]];
                _crate addItemCargoGlobal [selectRandom rvg_vests, selectRandom[0,1]];
                _crate addItemCargoGlobal [selectRandom rvg_headGears, selectRandom[0,1]];
            }
        } foreach _crates;
    };




    case "minefield":
    {
		_position setVariable["Cooldown",true,true];
        _mineSign = createVehicle ["Sign_DangerMines_ACR", position _position, [], 0, "NONE"];
        for "_i" from 1 to (random [4,8,12]) do
        {
            _charge = createMine ["APERSMine",position _position, [], 15];

        };
    };



    case "boss":
    {
        _group = createGroup [resistance,true];
        _skill = 1;
        _rank = "PRIVATE";
        _spawn = getposATL _position;
        _unit = "rhs_vdv_officer_armored";

        _unit createUnit [_spawn,_group,"hvt_1 = this;",0.5,"PRIVATE"];
        hvt_1 setposATL _spawn;

        _type = "rhs_vdv_rifleman";
        _init = "defendOfficer_1 = this;";
        _skill = 0.8;
        _rank = "PRIVATE";
        for "_i" from 1 to 8 do
        {
            _spawn = [hvt_1, 19, 30] call BIS_fnc_findSafePos;
            _type createUnit [_spawn,_group,_init,_skill,_rank];
            doStop defendOfficer_1;
            defendOfficer_1 setBehaviour "AWARE";
            0 = [defendOfficer_1] call rvg_fnc_equip;
        };

        [hvt_1] join defendOfficer_1;
        [hvt_1] join grpNull;
        doStop hvt_1;
        _position setVariable["Cooldown",true,true];

        _bossLoadout = selectRandom[1,2,3];
        if(_bossLoadout == 1) then
        {
            removeAllWeapons hvt_1;
            removeAllItems hvt_1;
            removeAllAssignedItems hvt_1;
            removeUniform hvt_1;
            removeVest hvt_1;
            removeBackpack hvt_1;
            removeHeadgear hvt_1;
            removeGoggles hvt_1;

            hvt_1 addWeapon "rhs_weap_akms";
            hvt_1 addPrimaryWeaponItem "rhs_acc_dtkakm";
            hvt_1 addPrimaryWeaponItem "rhs_30Rnd_762x39mm_bakelite";

            hvt_1 forceAddUniform "U_C_E_LooterJacket_01_F";
            hvt_1 addBackpack "rvg_messengerbag_3";

            for "_i" from 1 to 2 do {hvt_1 addItemToUniform "FirstAidKit";};
            hvt_1 addItemToUniform "rhs_30Rnd_762x39mm_bakelite";
            for "_i" from 1 to 5 do {hvt_1 addItemToBackpack "rhs_30Rnd_762x39mm_bakelite";};
            hvt_1 addGoggles "G_Bandanna_blk";

        };

        if(_bossLoadout == 2) then
        {
            removeAllWeapons hvt_1;
            removeAllItems hvt_1;
            removeAllAssignedItems hvt_1;
            removeUniform hvt_1;
            removeVest hvt_1;
            removeBackpack hvt_1;
            removeHeadgear hvt_1;
            removeGoggles hvt_1;

            hvt_1 addWeapon "rhs_weap_m16a4_carryhandle";
            hvt_1 addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";

            hvt_1 forceAddUniform "EFT_Uniform_Usec";
            hvt_1 addVest "rhs_6b45_grn";

            for "_i" from 1 to 5 do {hvt_1 addItemToUniform "FirstAidKit";};
            for "_i" from 1 to 3 do {hvt_1 addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
            for "_i" from 1 to 17 do {hvt_1 addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
            hvt_1 addHeadgear "rhs_altyn_bala";

        };

        if(_bossLoadout == 3) then
        {
            removeAllWeapons hvt_1;
            removeAllItems hvt_1;
            removeAllAssignedItems hvt_1;
            removeUniform hvt_1;
            removeVest hvt_1;
            removeBackpack hvt_1;
            removeHeadgear hvt_1;
            removeGoggles hvt_1;

            hvt_1 addWeapon "rhs_weap_ak105_zenitco01_b33";
            hvt_1 addPrimaryWeaponItem "rhs_acc_tgpa";
            hvt_1 addPrimaryWeaponItem "rhs_acc_okp7_picatinny";
            hvt_1 addPrimaryWeaponItem "rhs_30Rnd_545x39_7N10_AK";

            hvt_1 forceAddUniform "rhs_uniform_gorka_r_g_gloves";
            hvt_1 addVest "rhs_6b45";
            hvt_1 addBackpack "rhs_rk_sht_30_emr";

            hvt_1 addItemToUniform "FirstAidKit";
            for "_i" from 1 to 3 do {hvt_1 addItemToUniform "rhs_30Rnd_545x39_7N10_AK";};
            for "_i" from 1 to 4 do {hvt_1 addItemToBackpack "FirstAidKit";};
            for "_i" from 1 to 15 do {hvt_1 addItemToBackpack "rhs_30Rnd_545x39_7N10_AK";};
            for "_i" from 1 to 4 do {hvt_1 addItemToBackpack "MiniGrenade";};
            hvt_1 addHeadgear "rhs_altyn_visordown";
            hvt_1 addGoggles "rhs_balaclava";
        };
    };



    case "squad":
    {
        fnc_pmc_randomLoadout =
        {
            params["_unit","_side"];
            switch(_side) do
            {
                case "bear":
                {
                    removeAllWeapons _unit;
                    removeAllItems _unit;
                    removeAllAssignedItems _unit;
                    removeUniform _unit;
                    removeVest _unit;
                    removeBackpack _unit;
                    removeHeadgear _unit;
                    removeGoggles _unit;

                    _unit addWeapon "AGE_AK105_C";
                    _unit addPrimaryWeaponItem "AGE_Muzzle_FA556_Black";
                    _unit addPrimaryWeaponItem "AGE_Eotech_Black";
                    _unit addPrimaryWeaponItem "AGE_30Rnd_545x39mm_Mag";

                    _unit forceAddUniform "AGE_Fatigues_BlackMcam_Gloves";
                    _unit addVest "AGE_LV119_AK_Holster_MultiCam";

                    _unit addItemToUniform "FirstAidKit";
                    for "_i" from 1 to 2 do {_unit addItemToUniform "AGE_30Rnd_545x39mm_Mag";};
                    _unit addItemToUniform "rhs_mag_m67";
                    _unit addItemToUniform "rhs_mag_m18_yellow";
                    _unit addItemToUniform "rhs_mag_m18_red";
                    for "_i" from 1 to 3 do {_unit addItemToVest "FirstAidKit";};
                    for "_i" from 1 to 7 do {_unit addItemToVest "AGE_30Rnd_545x39mm_Mag";};
                    _unit addItemToVest "rhs_mag_m18_green";
                    _unit addItemToVest "rhs_mag_m18_purple";
                    _unit addItemToVest "rhs_grenade_mkii_mag";
                    _unit addHeadgear "AGE_LSHZ_Painted_H_A";
                    _unit addGoggles "AGE_Balaclava_MCam";

                    _unit linkItem "ItemMap";
                    _unit linkItem "ItemCompass";
                    _unit linkItem "ItemWatch";


                };

                case "usec":
                {
                    removeAllWeapons _unit;
                    removeAllItems _unit;
                    removeAllAssignedItems _unit;
                    removeUniform _unit;
                    removeVest _unit;
                    removeBackpack _unit;
                    removeHeadgear _unit;
                    removeGoggles _unit;

                    _unit addWeapon "rhs_weap_m4a1_mstock";
                    _unit addPrimaryWeaponItem "rhsusf_acc_anpeq15side";
                    _unit addPrimaryWeaponItem "rhsusf_acc_g33_xps3";
                    _unit addPrimaryWeaponItem "rhs_mag_30Rnd_556x45_M855A1_Stanag";
                    _unit addPrimaryWeaponItem "rhsusf_acc_grip2";

                    _unit forceAddUniform "AGE_G3_Uniform_MultiCam";
                    _unit addVest "AGE_WAS_AK_MultiCam";

                    _unit addItemToUniform "FirstAidKit";
                    _unit addItemToUniform "rhs_mag_m67";
                    _unit addItemToUniform "rhs_mag_m18_yellow";
                    _unit addItemToUniform "rhs_mag_m18_red";
                    for "_i" from 1 to 2 do {_unit addItemToUniform "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
                    for "_i" from 1 to 3 do {_unit addItemToVest "FirstAidKit";};
                    for "_i" from 1 to 8 do {_unit addItemToVest "rhs_mag_30Rnd_556x45_M855A1_Stanag";};
                    _unit addHeadgear "rhssaf_bandana_smb";
                    _unit addGoggles "G_Bandanna_tan";

                    _unit linkItem "ItemMap";
                    _unit linkItem "ItemCompass";
                    _unit linkItem "ItemWatch";
                };
            };
        };
        _position setVariable["Cooldown",true,true];
        _group = creategroup [east,true];
        _skill = 1;
        _rank = "PRIVATE";
        _spawn = [_position, 20, 80] call BIS_fnc_findSafePos;
        if(selectRandom[0,1] == 1) then
        {
            "rhs_vdv_rifleman" createUnit [_spawn,creategroup [resistance,true],"bear_sl = this; [this,'bear'] spawn fnc_pmc_randomLoadout;",0.5,"PRIVATE"];
            "rhs_vdv_rifleman" createUnit [bear_sl,group bear_sl,"[this,'bear'] call fnc_pmc_randomLoadout",1,"PRIVATE"];
            "rhs_vdv_rifleman" createUnit [bear_sl,group bear_sl,"[this,'bear'] call fnc_pmc_randomLoadout",1,"PRIVATE"];
            "rhs_vdv_rifleman" createUnit [bear_sl,group bear_sl,"[this,'bear'] call fnc_pmc_randomLoadout",1,"PRIVATE"];
            [group bear_sl, getPos bear_sl, 900] call BIS_fnc_taskPatrol;
        }
        else
        {
            "rhsusf_socom_marsoc_cso" createUnit [_spawn,creategroup [resistance,true],"usec_sl = this; [this,'usec'] spawn fnc_pmc_randomLoadout;",0.5,"PRIVATE"];
            "rhsusf_socom_marsoc_cso" createUnit [usec_sl,group usec_sl,"[this,'usec'] call fnc_pmc_randomLoadout",1,"PRIVATE"];
            "rhsusf_socom_marsoc_cso" createUnit [usec_sl,group usec_sl,"[this,'usec'] call fnc_pmc_randomLoadout",1,"PRIVATE"];
            "rhsusf_socom_marsoc_cso" createUnit [usec_sl,group usec_sl,"[this,'usec'] call fnc_pmc_randomLoadout",1,"PRIVATE"];
            [group usec_sl, getPos usec_sl, 900] call BIS_fnc_taskPatrol;
        };
    };
};

//temporary solution - NEEDS TO BE SEPARATED. this ONLY works for minefields.
    sleep 9000;
    _position setVariable["Cooldown",false];
