params ["_objectCaller","_farmLevel"];

missionNamespace setVariable ["bitcoinOperation",true];
private _moneyLevel = 0;

switch (_farmLevel) do
{
case 1: {_moneyLevel = 3.4722;}; //12.5k per hour
case 2: {_moneyLevel = 5;}; // 18k per hour
case 3: {_moneyLevel = 6.944;}; //25k per hour
};

missionNamespace setVariable ["bitcoinFarmLevel",_moneyLevel];

removeAllActions _objectCaller;

_objectCaller addAction 
[
	"Start Bitcoin farm operation.",  
	{ 	
		params ["_target"];
		
		missionNamespace setVariable ["bitcoinStartTime",time];
		missionNamespace setVariable ["bitcoinOperation",false];
		missionNamespace setVariable ["bitcoinPickup",true];
		
		_target addAction 
		["Check bitcoinFarm.",   
			{ 
				params ["_target", "_actionId"];
				private _bTimer = missionNamespace getVariable ["bitcoinStartTime",time];
				missionNameSpace setVariable ["bitconEr",(time - _bTimer)*(missionNamespace getVariable "bitcoinFarmLevel")];
				hint format["The bitcoin farm yielded %1 CR at this moment.",round (missionNameSpace getVariable "bitconEr")];
				
				if (missionNameSpace getVariable "bitconEr" > 2000) then
				{
					if (missionNamespace getVariable "bitcoinPickup" == true) then
					{
						missionNamespace setVariable ["bitcoinPickup",false];
						_target addAction 
						["Collect earnings.",  
							{ 
								params ["_target", "_actionId"];
								private _money = missionNamespace getVariable ["EFTVar_"+(getPlayerUID player)+"_money",250];
								_money = round (_money+(missionNameSpace getVariable "bitconEr"));
								missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"_money",_money];
								missionNamespace setVariable ["bitcoinOperation",true];
								hint format["You collected %1 CR from the bitcoin farm operation.",round (missionNameSpace getVariable "bitconEr")];
								_target removeAction 1;
								_target removeAction 2;
							}
						];
					};
				}
				else
				{
				hint "You need to wait for the bitcoin farm to produce earnings!";
				};
			}
		];
	},
	nil,
	1.5,
	false,
	false,
	"",
	"missionNamespace getVariable 'bitcoinOperation' == true && (missionNamespace getVariable 'generatorActive') == true",
	1.5,
	false,
	"",
	""
];