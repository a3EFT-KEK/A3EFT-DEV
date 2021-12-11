params ["_callerPlayer","_RPGVar"];

private _hideoutControl = _RPGVar select 3;
private _playerLayer = "";

Switch (str _callerPlayer) do
{
	case "player_0": {_playerLayer = "Player 0"};
	case "player_1": {_playerLayer = "Player 1"};
	case "player_2": {_playerLayer = "Player 2"};
	case "player_3": {_playerLayer = "Player 3"};
	case "player_4": {_playerLayer = "Player 4"};
	case "player_5": {_playerLayer = "Player 5"};
	case "player_6": {_playerLayer = "Player 6"};
	case "player_7": {_playerLayer = "Player 7"};
	case "player_8": {_playerLayer = "Player 8"};
	case "player_9": {_playerLayer = "Player 9"};
	case "player_10": {_playerLayer = "Player 10"};
	case "player_11": {_playerLayer = "Player 11"};
};

if (typeName _hideoutControl == "ARRAY") then
{
	{
		If (typeName _x == "ARRAY") then
		{
			private _controlModule = _x select 0;
			private _controlModuleLevel = _x select 1;

			switch (_controlModule) do
			{
				case "LoadingS": // Loading station fuctional level 1 only**
				{
					switch (_controlModuleLevel) do
					{
						case 0:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[ls1_1_0,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[ls1_1_1,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[ls1_1_2,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[ls1_1_3,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[ls1_1_4,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[ls1_1_5,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[ls1_1_6,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[ls1_1_7,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[ls1_1_8,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[ls1_1_9,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[ls1_1_10,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[ls1_1_11,1],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[ls1_1_0,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[ls1_1_1,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[ls1_1_2,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[ls1_1_3,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[ls1_1_4,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[ls1_1_5,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[ls1_1_6,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[ls1_1_7,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[ls1_1_8,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[ls1_1_9,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[ls1_1_10,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[ls1_1_11,2],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Loading Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[ls1_1_0,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[ls1_1_1,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[ls1_1_2,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[ls1_1_3,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[ls1_1_4,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[ls1_1_5,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[ls1_1_6,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[ls1_1_7,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[ls1_1_8,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[ls1_1_9,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[ls1_1_10,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[ls1_1_11,3],"scripts\loadStation.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
					};
				};

				case "Workbench":
				{
					switch (_controlModuleLevel) do
					{
						case 0:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Workbench Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
						};
					};
				};

				case "MedS":
				{
					switch (_controlModuleLevel) do
					{
						case 0:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Med Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
						};
					};
				};

				case "AirP":
				{
					switch (_controlModuleLevel) do
					{
						case false:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Air Purifier "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case true:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Air Purifier "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
						};

					};
				};

				case "RestS":
				{
					switch (_controlModuleLevel) do
					{
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[lt_1_0],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[lt_1_1],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[lt_1_2],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[lt_1_3],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[lt_1_4],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[lt_1_5],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[lt_1_6],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[lt_1_7],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[lt_1_8],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[lt_1_9],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[lt_1_10],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[lt_1_11],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									lt_1_0 hideObjectGlobal false;
									[[lt_1_0],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									lt_1_1 hideObjectGlobal false;
									[[lt_1_1],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									lt_1_2 hideObjectGlobal false;
									[[lt_1_2],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									lt_1_3 hideObjectGlobal false;
									[[lt_1_3],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									lt_1_4 hideObjectGlobal false;
									[[lt_1_4],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									lt_1_5 hideObjectGlobal false;
									[[lt_1_5],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									lt_1_6 hideObjectGlobal false;
									[[lt_1_6],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									lt_1_7 hideObjectGlobal false;
									[[lt_1_7],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									lt_1_8 hideObjectGlobal false;
									[[lt_1_8],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									lt_1_9 hideObjectGlobal false;
									[[lt_1_9],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									lt_1_10 hideObjectGlobal false;
									[[lt_1_10],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									lt_1_11 hideObjectGlobal false;
									[[lt_1_11],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Rest Station Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									lt_1_0 hideObjectGlobal true;
									[[lt_3_0],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									lt_1_1 hideObjectGlobal true;
									[[lt_3_1],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									lt_1_2 hideObjectGlobal true;
									[[lt_3_2],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									lt_1_3 hideObjectGlobal true;
									[[lt_3_3],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									lt_1_4 hideObjectGlobal true;
									[[lt_3_4],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									lt_1_5 hideObjectGlobal true;
									[[lt_3_5],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									lt_1_6 hideObjectGlobal true;
									[[lt_3_6],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									lt_1_7 hideObjectGlobal true;
									[[lt_3_7],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									lt_1_8 hideObjectGlobal true;
									[[lt_3_8],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									lt_1_9 hideObjectGlobal true;
									[[lt_3_9],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									lt_1_10 hideObjectGlobal true;
									[[lt_3_10],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									lt_1_11 hideObjectGlobal true;
									[[lt_3_11],"scripts\traderLaptop.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
					};
				};

				case "IntelS": // Intel Center functional level 1 only**, Configed to function with generator**
				{
					switch (_controlModuleLevel) do
					{
						case 0:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
								[[ic1_1_0],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_0,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
								[[ic1_1_1],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_1,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 2": 
								{
								[[ic1_1_2],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_2,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
								[[ic1_1_3],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_3,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
								[[ic1_1_4],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_4,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
								[[ic1_1_5],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_5,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
								[[ic1_1_6],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_6,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
								[[ic1_1_7],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_7,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
								[[ic1_1_8],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_8,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
								[[ic1_1_9],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_9,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
								[[ic1_1_10],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_10,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
								[[ic1_1_11],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_11,1],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
								[[ic1_1_0],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_0,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
								[[ic1_1_1],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_1,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 2": 
								{
								[[ic1_1_2],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_2,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
								[[ic1_1_3],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_3,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
								[[ic1_1_4],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_4,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
								[[ic1_1_5],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_5,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
								[[ic1_1_6],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_6,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
								[[ic1_1_7],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_7,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
								[[ic1_1_8],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_8,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
								[[ic1_1_9],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_9,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
								[[ic1_1_10],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_10,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
								[[ic1_1_11],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_11,2],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Intel Center Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
								[[ic1_1_0],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_0,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
								[[ic1_1_1],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_1,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 2": 
								{
								[[ic1_1_2],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_2,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
								[[ic1_1_3],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_3,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
								[[ic1_1_4],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_4,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
								[[ic1_1_5],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_5,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
								[[ic1_1_6],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_6,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
								[[ic1_1_7],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_7,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
								[[ic1_1_8],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_8,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
								[[ic1_1_9],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_9,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
								[[ic1_1_10],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_10,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
								[[ic1_1_11],"scripts\scavRaid.sqf"] remoteExec ["execVM",_callerPlayer];
								[[ic1_6_11,3],"scripts\moneyBox.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
					};
				};

				case "BitcoinF": //Bitcoin farm All functional levels done**, Configed to function with generator**
				{
					switch (_controlModuleLevel) do
					{
						case 0:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[bf1_4_0,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[bf1_4_1,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[bf1_4_2,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[bf1_4_3,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[bf1_4_4,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[bf1_4_5,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[bf1_4_6,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[bf1_4_7,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[bf1_4_8,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[bf1_4_9,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[bf1_4_10,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[bf1_4_11,1],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[bf1_4_0,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[bf1_4_1,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[bf1_4_2,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[bf1_4_3,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[bf1_4_4,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[bf1_4_5,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[bf1_4_6,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[bf1_4_7,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[bf1_4_8,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[bf1_4_9,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[bf1_4_10,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[bf1_4_11,2],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};

						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 1 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Bitcoin Farm Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
							
							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[bf1_4_0,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 1": 
								{
									[[bf1_4_1,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];								
								};
								case "Player 2": 
								{
									[[bf1_4_2,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 3": 
								{
									[[bf1_4_3,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 4": 
								{
									[[bf1_4_4,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 5": 
								{
									[[bf1_4_5,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 6": 
								{
									[[bf1_4_6,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 7": 
								{
									[[bf1_4_7,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 8": 
								{
									[[bf1_4_8,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 9": 
								{
									[[bf1_4_9,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 10": 
								{
									[[bf1_4_10,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
								case "Player 11": 
								{
									[[bf1_4_11,3],"scripts\bitcoinF.sqf"] remoteExec ["execVM",_callerPlayer];
								};
							};
						};
					};
				};

				case "Stash":
				{
					switch (_controlModuleLevel) do
					{
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Stash Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Stash Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Stash Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Stash Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Stash Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Stash Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
						};
					};
				};

				case "LightsB": //Configed to function with generator**
				{
					switch (_controlModuleLevel) do
					{
						case 1:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Light Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Light Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 2:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Ligth Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Ligth Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case 3:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Light Lvl 2 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							private _ObjectLayerControl = getMissionLayerEntities ("Light Lvl 3 "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;
						};
					};
				};

				case "Generator": //Generator functionality added**
				{
					switch (_controlModuleLevel) do
					{
						case false:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Generator "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal true;
							}
							forEach _ObjectLayerControl;
						};
						case true:
						{
							private _ObjectLayerControl = getMissionLayerEntities ("Generator "+_playerLayer);
							_ObjectLayerControl =_ObjectLayerControl select 0;
							{
								_x hideObjectGlobal false;
							}
							forEach _ObjectLayerControl;

							switch (_playerLayer) do 
							{
								case "Player 0": 
								{
									[[g_0],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 1": 
								{
									[[g_1],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]								
								};
								case "Player 2": 
								{
									[[g_2],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 3": 
								{
									[[g_3],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 4": 
								{
									[[g_4],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 5": 
								{
									[[g_5],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 6": 
								{
									[[g_6],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 7": 
								{
									[[g_7],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 8": 
								{
									[[g_8],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 9": 
								{
									[[g_9],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 10": 
								{
									[[g_10],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
								case "Player 11": 
								{
									[[g_11],"scripts\generatorUtility.sqf"] remoteExec ["execVM",_callerPlayer]
								};
							};
						};
					};
				};
			};
		};
	}forEach _hideoutControl;
}
else
{
["Player variables are outdated, please wipe your data."] remoteExec ["hint",_callerPlayer];
};
