params ["_objectCaller","_loadingSLvl"];
private _repackRate = 0;

switch (_loadingSLvl) do 
{
case 1: {_repackRate = 150;};
case 2: {_repackRate = 125;};
case 3: {_repackRate = 100;};
};

removeAllActions _objectCaller;

_objectCaller addAction 
[
	"Load empty mags in uniform.",  
	{ 	
		params["_target","_caller","_actionId","_arguments"];
		_arguments params ["_repackRate"];
		
		private _money = missionNamespace getVariable ["EFTVar_"+(getplayerUID player)+"_money",250];
		private _magsInventory = magazinesAmmo [player,true];
		private _chargedMoney = 0;
		private _accumulatedMoney = 0;
		
		if ((count _magsInventory) > 0) then
		{
			{
				private _magCapacity = getNumber (configFile >> "CfgMagazines" >> _x select 0 >> "count");
				_chargedMoney = (_magCapacity-(_x select 1)) * _repackRate;
				
				if ((_x select 1) < _magCapacity && _money > _chargedMoney) then
				{	
					player removeItem (_x select 0);
					player addMagazine [(_x select 0),_magCapacity];
					_accumulatedMoney = _accumulatedMoney + _chargedMoney;
					_money = _money - _chargedMoney;
					missionNamespace setVariable ["EFTVar_"+(getplayerUID player)+"_money",_money];
				};
			}forEach _magsInventory;
			
			private _magCompare = magazinesAmmo [player,true];
			if !(_magCompare isEqualTo _magsInventory) then 
			{
				hint format ["The magazine(s) repacking costed you %1 CR.",_accumulatedMoney];
			}
			else
			{
				if (_chargedMoney > 0) then
				{
					hint "Not enough CR to process with the repacking.";
				}
				else
				{
					hint "Mags in uniform are already loaded.";
				};
			};
		}
		else
		{
			Hint "No magazines to reload in the uniform;"
		};
	},
	_repackRate,
	1.5,
	false,
	false,
	"",
	"true",
	1.5,
	false,
	"",
	""
];