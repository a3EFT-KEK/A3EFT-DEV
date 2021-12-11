params ["_objectCaller","_intelCenterLvl"];
private _exchangeRate = 0;

switch (_intelCenterLvl) do
{
	case 1: {_exchangeRate = 76};
	case 2: {_exchangeRate = 109};
	case 3: {_exchangeRate = 142;};
};

_objectCaller addAction  
["Exchange Banknotes",  
	{ 
		params ["_target","_caller","_actionId","_exchangeRate"];
		private _itemArray = [];  
		private _localPlayerUID = getPlayerUID Player;  
		private _newMoney = 0;  
		private _oldMoney = missionNamespace getVariable "EFTVar_"+_localPlayerUID+"_money";  
		  
		_itemArray = vestItems Player + uniformItems Player + backpackItems Player;  
		  
		{  
			if (_x == "rvg_money") then   
			  {  
				  _newMoney = _newMoney + 1;  
				  Player removeItemFromBackpack "rvg_money";  
				  Player removeItemFromVest "rvg_money";  
				  Player removeItemFromUniform "rvg_money";  
			  };  
		}forEach _itemArray;  
		  
		_newMoney = (_newMoney * _exchangeRate)+ _oldMoney;  
		missionNamespace setVariable ["EFTVar_"+_localPlayerUID+"_money",_newMoney]; 
		if (_newMoney > _oldMoney) then 
		{ 
		hint format ["Deposit successful. Your new balance is %1.",_newMoney]; 
		} 
		else 
		{ 
		hint "Try again when you have banknotes in any of your pockets."; 
		}; 
	},
_exchangeRate,
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