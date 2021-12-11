debug_console addAction 
[	"Save player stash and money",
	{
		private _localPlayerUID = getPlayerUID player;
		private _saveOnExit = missionNamespace getVariable "EFTVar_"+_localPLayerUID+"_stash";
		private _playerMoney = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"_money",1000];
		private _playerFuel = missionNamespace getVariable ["availableGeneratorFuel",10];
		private _playerRPG = missionNamespace getVariable ["EFTVar_"+_localPlayerUID+"RPGSys",[["Faction",0],["Operator","None"],["Stats",5,5,5,5,5],["Hideout",["LoadingS",0],["Workbench",0],["MedS",0],["AirP",false],["RestS",1],["IntelS",0],["BitcoinF",0],["Stash",1],["LightsB",1],["Generator",False,10]]]];
		
		_playerRPG = [_playerRPG select 0,_playerRPG select 1,_playerRPG select 2,[(_playerRPG select 3) select 0, (_playerRPG select 3) select 1, (_playerRPG select 3) select 2,(_playerRPG select 3) select 3,(_playerRPG select 3) select 4,(_playerRPG select 3) select 5,(_playerRPG select 3) select 6,(_playerRPG select 3) select 7, (_playerRPG select 3) select 8,(_playerRPG select 3) select 9, [((_playerRPG select 3) select 10) select 0, ((_playerRPG select 3) select 10) select 1, _playerFuel]]];
		
		profileNamespace setVariable ["EFTVar_"+_localPLayerUID+"_stash", _saveOnExit];
		profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money", _playerMoney];
		profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"_loadout",getUnitLoadout player];
		profileNamespace setVariable ["EFTVar_"+_localPlayerUID+"RPGSys",_playerRPG];
		systemChat "Save successful.";
	}
];
