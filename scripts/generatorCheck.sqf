if (missionNamespace getVariable "generatorActive" == true) then
{
	private _generatorTimer = time - (missionNamespace getVariable "generatorTimer");
	private _usedFuel = round (_generatorTimer * .00694); //Units per second of fuel used.
	private _availableFuel = missionNameSpace getVariable "availableGeneratorFuel";
	private _currentFuel = _availableFuel - _usedFuel;
	
	if (_currentFuel < 0) then
	{
		_currentFuel = 0;
		missionNamespace setVariable ["generatorActive",False];
		
		private _playerRPG = profileNamespace getVariable ["EFTVar_"+(getPlayerUID Player)+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False,10]]]];
		
		//Hideout light operation
		private _bunkerLight = [];

		switch (str player) do
		{
		case "player_0": {_bunkerLight = [l2_1_0, l2_2_0, l2_3_0, l3_1_0, l3_2_0];};
		case "player_1": {_bunkerLight = [l2_1_1, l2_2_1, l2_3_1, l3_1_1, l3_2_1];};
		case "player_2": {_bunkerLight = [l2_1_2, l2_2_2, l2_3_2, l3_1_2, l3_2_2];};
		case "player_3": {_bunkerLight = [l2_1_3, l2_2_3, l2_3_3, l3_1_3, l3_2_3];};
		case "player_4": {_bunkerLight = [l2_1_4, l2_2_4, l2_3_4, l3_1_4, l3_2_4];};
		case "player_5": {_bunkerLight = [l2_1_5, l2_2_5, l2_3_5, l3_1_5, l3_2_5];};
		case "player_6": {_bunkerLight = [l2_1_6, l2_2_6, l2_3_6, l3_1_6, l3_2_6];};
		case "player_7": {_bunkerLight = [l2_1_7, l2_2_7, l2_3_7, l3_1_7, l3_2_7];};
		case "player_8": {_bunkerLight = [l2_1_8, l2_2_8, l2_3_8, l3_1_8, l3_2_8];};
		case "player_9": {_bunkerLight = [l2_1_9, l2_2_9, l2_3_9, l3_1_9, l3_2_9];};
		case "player_10": {_bunkerLight = [l2_1_10, l2_2_10, l2_3_10, l3_1_10, l3_2_10];};
		case "player_11": {_bunkerLight = [l2_1_11, l2_2_11, l2_3_11, l3_1_11, l3_2_11];};
		};
	
		{
			_x enableSimulation false;
		}forEach _bunkerLight;				
		
		//Bitcoin Farm Reset
		private _RPGVar = ((_playerRPG select 3) select 7)select 1;
		if !(_RPGVar == 0) then
		{
			switch (str player) do
			{
			case "player_0": {[bf1_4_0,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_1": {[bf1_4_1,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_2": {[bf1_4_2,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_3": {[bf1_4_3,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_4": {[bf1_4_4,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_5": {[bf1_4_5,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_6": {[bf1_4_6,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_7": {[bf1_4_7,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_8": {[bf1_4_8,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_9": {[bf1_4_9,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_10": {[bf1_4_10,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			case "player_11": {[bf1_4_11,_RPGVar] execVM "scripts\bitcoinF.sqf";};
			};
		};	
	};
	missionNamespace setVariable ["availableGeneratorFuel", _currentFuel];
};