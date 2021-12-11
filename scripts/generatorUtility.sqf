params ["_objectCaller"];

removeAllActions _objectCaller;
missionNamespace getVariable ["availableGeneratorFuel",10];
missionNamespace setVariable ["generatorActive",false];

_objectCaller addAction 
[
	"Start power generator.",  
	{ 			
		missionNamespace setVariable ["generatorTimer",time];
		missionNamespace setVariable ["generatorActive",true];
		private _bunkerLight = [];
		
		switch (str player) do 
		{
			case "player_0": 
			{
				_bunkerLight = [l2_1_0, l2_2_0, l2_3_0, l3_1_0, l3_2_0];
			};
			case "player_1": 
			{
				_bunkerLight = [l2_1_1, l2_2_1, l2_3_1, l3_1_1, l3_2_1];
			};
			case "player_2": 
			{
				_bunkerLight = [l2_1_2, l2_2_2, l2_3_2, l3_1_2, l3_2_2];
			};
			case "player_3": 
			{
				_bunkerLight = [l2_1_3, l2_2_3, l2_3_3, l3_1_3, l3_2_3];
			};
			case "player_4": 
			{
				_bunkerLight = [l2_1_4, l2_2_4, l2_3_4, l3_1_4, l3_2_4];
			};
			case "player_5": 
			{
				_bunkerLight = [l2_1_5, l2_2_5, l2_3_5, l3_1_5, l3_2_5];
			};
			case "player_6": 
			{
				_bunkerLight = [l2_1_6, l2_2_6, l2_3_6, l3_1_6, l3_2_6];
			};
			case "player_7": 
			{
				_bunkerLight = [l2_1_7, l2_2_7, l2_3_7, l3_1_7, l3_2_7];
			};
			case "player_8": 
			{
				_bunkerLight = [l2_1_8, l2_2_8, l2_3_8, l3_1_8, l3_2_8];
			};
			case "player_9": 
			{
				_bunkerLight = [l2_1_9, l2_2_9, l2_3_9, l3_1_9, l3_2_9];
			};
			case "player_10": 
			{
				_bunkerLight = [l2_1_10, l2_2_10, l2_3_10, l3_1_10, l3_2_10];
			};
			case "player_11": 
			{
				_bunkerLight = [l2_1_11, l2_2_11, l2_3_11, l3_1_11, l3_2_11];
			};
		};
		
		{
			_x enableSimulation true;
		}forEach _bunkerLight;
		
	},
	nil,
	1.5,
	false,
	false,
	"",
	"(missionNamespace getVariable 'availableGeneratorFuel') > 1 && (missionNamespace getVariable 'generatorActive' == false)",
	3,
	false,
	"",
	""
];

_objectCaller addAction 
[
	"Refuel power generator.",  
	{ 	
		if ("rvg_canisterFuel" in (uniformItems player + vestItems player + backpackItems player)) then 
		{
		private _currentFuel = missionNamespace getVariable "availableGeneratorFuel";
		_currentFuel = _currentFuel + 33.3;
			If (_currentFuel > 100) then
			{
				_currentFuel = 100;
			};
		missionNamespace setVariable ["availableGeneratorFuel",_currentFuel];
		player removeItem "rvg_canisterFuel";
		player addItem "rvg_canisterFuel_Empty";
		hint "Refuel succesful!";
		}
		else
		{
		hint "You need a full fuel canister to do this.";
		}
	},
	nil,
	1.5,
	false,
	false,
	"",
	"(missionNamespace getVariable 'availableGeneratorFuel') < 100",
	3,
	false,
	"",
	""
];

_objectCaller addAction 
[
	"Check fuel in power generator.",  
	{ 	
		private _currentFuel = missionNamespace getVariable "availableGeneratorFuel";
		
		if ( _currentFuel == 100) then
		{hint "The tank of the generator is at full capacity.";};
		
		if ( _currentFuel > 74 && _currentFuel < 100) then
		{hint "The tank of the generator looks almost full.";};
		
		if ( _currentFuel > 49 && _currentFuel < 75) then
		{hint "The tank of the generator is close to half capacity.";};
		
		if ( _currentFuel > 24 && _currentFuel < 50) then
		{hint "The tank of the generator still has space for much more fuel.";};
		
		if ( _currentFuel > 1 && _currentFuel < 25) then
		{hint "The tank of the generator is almost empty.";};
		
		if ( _currentFuel == 0) then
		{hint "The tank of the generator is empty.";};
	},
	nil,
	1.5,
	false,
	false,
	"",
	"true",
	3,
	false,
	"",
	""
];