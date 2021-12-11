//Preparation for the trader system
private _money = missionNamespace getVariable "EFTVar_"+(getPlayerUID Player)+"_money";

private _rpgComplete = missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";

private _rpgSys = missionNamespace getVariable ("EFTVar_"+(getPlayerUID player)+"RPGSys")select 3;
private _moduleGenerator = (_rpgSys select 10) select 1;
private _moduleLights = (_rpgSys select 9) select 1;
private _moduleAirP = (_rpgSys select 4) select 1;
private _moduleStash = (_rpgSys select 8) select 1;
private _moduleRest = (_rpgSys select 5) select 1;
private _moduleBitcoinF = (_rpgSys select 7) select 1;
private _moduleIntelS = (_rpgSys select 6) select 1;
private _moduleMedS = (_rpgSys select 3) select 1;
private _moduleWorkbench = (_rpgSys select 2) select 1;
private _moduleLoadingS = (_rpgSys select 1) select 1;

//Removal for the re-initialization of the trader locally for each player each time it performs a purchase.
//This method help clean the variables for re-use instead of declaring them time after time.
removeAllActions dodgyDave;

//Actual trader actions. All of them are added at once and only shown when condition is met.

				/*Phase 1 for hideout trader purchases (Generator, Intel1, Workbench1, Loading1, Med1)*/
		//Generator purchase - CONDITIONALS FIXED - WORKS
dodgyDave addAction
[
	"Purchase hideout Generator: CR85,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];
		
		if (_money > 84999) then
		{
			_money = _money - 85000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleGenerator = true;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Now you can stop living as a troglodyte and start getting better stuff for your hideout.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
				sleep 5;
				hintSilent "";
				"D.D Promotional Flier" hintC
				[
					"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
					"Tips:",
					"The generator is a crucial equipment piece that will help you get started while you stay in Chernarus.",
					"Some of the modules require a working generator in order to function, be sure to keep it running if you intend to use them.",
					"The generator runs on fuel, so its important to keep a couple of fuel canisters at hand to help you refill it.",
					"The generator only consumes fuel when you are outside of the bunker and turns off automatically once you log off."
				];
				hintSilent "";
			};
		}
		else
		{
			hint "Come back when you have more CR soldier boy.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money,_rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == false",
	3,
	false,
	"",
	""
];
	//Intel center Lvl1 - CONDITIONALS FIXED - WORKS
dodgyDave addAction
[
	"Purchase Intel Center: CR250,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];
		
		if (_money > 249999) then
		{
			_money = _money - 250000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleIntelS = 1;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Fine pieces of electronical menagerie with a serious ammount of uses. You will like this one.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The intel center will be one of your core modules in the bunker.",
			"Intel center has different effects per level, every level a new thing related to intel center is unlocked.",
			"The Intel center level 1 includes SCAV Raids functionality and banknotes exchange.",
			"Intel center is one of the core modules required to unlock further upgrades and certain modules for your hideout."
			];
			};
		}
		else
		{
			hint "This isn't charity kid. Buy it or beat it.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) == 0",
	3,
	false,
	"",
	""
];

	//Workbench Lvl1 - CONDITIONAL FIXED - WORKS
dodgyDave addAction
[
	"Purchase Workbench: CR125,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];


		if (_money > 124999) then
		{
			_money = _money - 125000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleWorkbench = 1;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Be carefull with that screwdriver.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The workbench will be one of your core modules in the bunker.",
			"Although the workbench utility is still on the work, the workbench will help you unlock certain features for your bunker."
			];
			};
		}
		else
		{
			hint "I bet you cant afford a nice weapon either.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) == 0",
	3,
	false,
	"",
	""
];

	//Loading Station Lvl1 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Loading Station: CR175,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 174999) then
		{
			_money = _money - 175000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleLoadingS = 1;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Ah, the smell of gunpowder. Such wonderful memories...";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The loading station is one of the extra functionality modules you can get for your bunker.",
			"With this module, you can repack magazines in your uniform for a price.",
			"With each level, the price per bullet repacked diminishes."
			];
			};
		}
		else
		{
			hint "Try pressing brass with your hand and see how easy it is!.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) > 0 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 1) select 1) == 0",
	3,
	false,
	"",
	""
];

	//Med Station Lvl1 - CONDITIONALS FIXED - WORKS
dodgyDave addAction
[
	"Purchase Med Station: CR150,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 149999) then
		{
			_money = _money - 150000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleMedS = 1;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Maybe try putting some astringent in that wound first, bud.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The Med Station will become your best friend with eventual updates.",
			"Current features for Med station are WIP."
			];
			};
		}
		else
		{
			hint "May I invite you to purchase medikits and FAKs if you can't afford this module?";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 3) select 1) == 0",
	3,
	false,
	"",
	""
];

			/*Phase 2 for hideout trader purchases (Rest2, Med2, Intel2, Bitcoin1, Lights2, Workbench2, Loading2)*/
	//Light Fixtures level 2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase light fixtures upgrade (Lvl 2): CR125,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 124999) then
		{
			_money = _money - 125000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleLights = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Darkness begone! I'll set up your new light fixtures in your hideout.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The light fixtures helps you have a better look at your environment.",
			"Functionally poor but aesthetically pleasing, the light features require a working generator in order to light your bunker.",
			"Who knows what other use this module has..."
			]
			};
		}
		else
		{
			hint "No money? No lights.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) > 1 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 9) select 1) == 1",
	3,
	false,
	"",
	""
];	
	
	//Stash level 2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Stash box upgrade (Lvl 2): CR650,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 649999) then
		{
			_money = _money - 650000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleStash = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Are you stocking an army or what? Better not or I will kill you.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The stash unlock another modules for the purchase."
			]
			};
		}
		else
		{
			hint "Until you have enough CR, you gonna have to hide that big rifle of your into your prision wallet.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) > 0 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) > 0",
	3,
	false,
	"",
	""
];

	//Rest station level 2 - CONDITIONALS FIXED - WORKKS
dodgyDave addAction
[
	"Purchase Rest Station Upgrade (Lvl 2): CR250,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];


		if (_money > 249999) then
		{
			_money = _money - 250000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleRest = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Isn't it nice to sleep in a decent bed?";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The rest station gives the player a better space to regain his forces after a raid.",
			"It also unlocks a new hideout module for purchase.",
			"The full functionality of this station is still a WIP."
			]
			};
		}
		else
		{
			hint "Are you kidding me? If you want a decent bed come back with more CR.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) == 1",
	3,
	false,
	"",
	""
];

	//Med station level 2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Med Station Upgrade (Lvl 2): CR350,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 349999) then
		{
			_money = _money - 350000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleMedS = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Being the mad scientist you think you are, you might be able to do something useful with this upgraded module.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"With the upgraded med station you will be able to create better items.",
			"The full functionality of this station is still a WIP."
			]
			};
		}
		else
		{
			hint "You want drugs for free? What is this, Canada?";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 3) select 1) == 1 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) > 1",
	3,
	false,
	"",
	""
];

	//Intel center Lvl2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Intel Center Upgrade (Lvl 2): CR750,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 749999) then
		{
			_money = _money - 750000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleIntelS = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Upgrading the tech huh?"
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"Intel Center level 2 unlocks new modules.",
			"At this level, Intel center reduces the time required to go into a scav raid when you succesfully extract.",
			"Also you obtain better exchange rates in the money box.",
			"You unlock another module with this upgrade."
			]
			};
		}
		else
		{
			hint "This is not something you can purchase with pocket money kiddo.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) == 1 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 3) select 1) > 1",
	3,
	false,
	"",
	""
];

	//Bitcoin Farm Lvl1 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Bitcoin Farm: CR1,250,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 1249999) then
		{
			_money = _money - 1250000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleBitcoinF = 1;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Ah, now you decided to hop in the train?"
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The bitcoin farm produces a passive income.",
			"It requires a functional generator to produce money, if the generator cuts the power the farm resets.",
			"The ammount of money earned will increase per each level of the farm.",
			"The minimum ammount of money being able to be picked up is equivalent to 1 hour of farming at level 1."
			]
			};
		}
		else
		{
			hint "This is not something you can purchase with pocket money kiddo.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) > 1 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 7) select 1) == 0",
	3,
	false,
	"",
	""
];

	//Workbench Lvl2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Workbench upgrade (Lvl 2): CR550,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 549999) then
		{
			_money = _money - 549999;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleWorkbench = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "The purchase doesnt include nail guns or duct tape."
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"This station is still a WIP."
			]
			};
		}
		else
		{
			hint "Good thing I didnt include a hammer when you purchased the original module.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) == 1",
	3,
	false,
	"",
	""
];

	//Loading bench Lvl2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Loading Station Upgrade (Lvl 2): CR450,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 449999) then
		{
			_money = _money - 450000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleLoadingS = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "A new and cheaper formula fot the gunpowder mixture, you like it?";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The bullet price has now decreased."
			]
			};
		}
		else
		{
			hint "I bet you would kill yourself fiddling with explosives.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 1) select 1) == 1 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) > 1",
	3,
	false,
	"",
	""
];

			/*Phase 3 for hideout trader purchases (Rest3, Med3, Intel3, Bitcoin2, Lights3, Workbench3, Loading3, AirP)*/
	//Light Fixtures level 3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase light fixtures upgrade (Lvl 3): CR350,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 349999) then
		{
			_money = _money - 350000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleLights = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "You are a rock star or what? Why do you need so much lights?";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"Fully upgraded light fictures for your bunker, they look classy!"
			]
			};
		}
		else
		{
			hint "I dont tolarate debtors, so its better for you to just pay for this.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 9) select 1) == 2",
	3,
	false,
	"",
	""
];

	//Rest station level 3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Rest Station Upgrade (Lvl 3): CR635,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 634999) then
		{
			_money = _money - 635000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleRest = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Look at you, high quality military grade ultra comfort. Godayum!";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The final upgrade for the rest station.",
			"Unlocks the remaining modules for level 3 upgrades.",
			"Grants the best bonuses for your pmc unit.",
			"Some features are still WIP for this module."
			]
			};
		}
		else
		{
			hint "Common man, its not even that expensive.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) == 2",
	3,
	false,
	"",
	""
];

	//Med station level 3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Med Station Upgrade (Lvl 3): CR575,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 574999) then
		{
			_money = _money - 575000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleMedS = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "You might look like Surgeon now, but I wont let you touch me even if someone guts me.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"A fully upgraded improvised surgical equipment area.",
			"Current features for this station are still WIP."
			]
			};
		}
		else
		{
			hint "Real funny mister medical man. Try again when you save more CR.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 3) select 1) == 2 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) == 3",
	3,
	false,
	"",
	""
];

	//Intel center Lv3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Intel Center Upgrade (Lvl 3): CR1,550,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 1549999) then
		{
			_money = _money - 1550000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleIntelS = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "A pretty looking office, I dare to say.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"A fully upgraded intel center.",
			"Scav raid functionality is now improved, the full potential has now been reached.",
			"The best money exhange rates in all Chernarus are avaliable for use in the exchange box.",
			"Some features are still WIP."
			]
			};
		}
		else
		{
			hint "Man, this equipment is expensive to bring to Chernarus, give me some slack.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) == 2 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 3) select 1) == 3",
	3,
	false,
	"",
	""
];

	//Stash level 3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Stash box upgrade (Lvl 3): CR950,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 949999) then
		{
			_money = _money - 950000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleStash = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Who would have thought that boxes would be so expensive, huh?.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The stash unlock another modules for the purchase.",
			"Current additional functions are WIP"
			]
			};
		}
		else
		{
			hint "You might as well hide your equipment beneath a rock.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) > 1 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) > 1",
	3,
	false,
	"",
	""
];

	//Bitcoin Farm Lvl2 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Bitcoin Farm upgrade (Lvl 2): CR1,750,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];


		if (_money > 1749999) then
		{
			_money = _money - 1750000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleBitcoinF = 2;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "That whachamacalit is gettin pretty complex...";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The bitcoin farm now produces even more pasive income."
			]
			};
		}
		else
		{
			hint "I know you can afford a GPU or an ASIC, common, pay up!";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 7) select 1) == 1",
	3,
	false,
	"",
	""
];

	//Workbench Lvl3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Workbench upgrade (Lvl 3): CR685,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];


		if (_money > 674999) then
		{
			_money = _money - 685000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleWorkbench = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "From now on, I declare you Tinker Tom.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"This station is still a WIP."
			]
			};
		}
		else
		{
			hint "Are you sure you want this? You gonna end up missing a finger.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) == 2",
	3,
	false,
	"",
	""
];

	//Loading bench Lvl3 - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Loading Station upgrade (Lvl 3): CR720,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 719999) then
		{
			_money = _money - 720000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleLoadingS = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Maximum stampage aquired.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The laoding bench is now even cheaper to use."
			]
			};
		}
		else
		{
			hint "You gonna hurt your frail hands missy, leave the though work to prepared PMCs.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 1) select 1) == 2",
	3,
	false,
	"",
	""
];

	//Bitcoin Farm Lvl3
dodgyDave addAction
[
	"Purchase Bitcoin Farm upgrade (Lvl 3): CR2,500,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 2499999) then
		{
			_money = _money - 2500000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleBitcoinF = 3;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "Flexing the CRs, hell yeah.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The bitcoin farm now operates at full capacity."
			]
			};
		}
		else
		{
			hint "Some people will kill for this equipment, dont be one of those.";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 6) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 1) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 3) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) == 3 && _moduleStash == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 7) select 1) == 2",
	3,
	false,
	"",
	""
];

	//air Purifier - CONDITIONALS FIXED
dodgyDave addAction
[
	"Purchase Air Purifier: CR1,500,000.",
	{
		params ["_object","_caller","_ID","_Arguments"];
		_Arguments params ["_moduleGenerator","_moduleAirP","_moduleBitcoinF","_moduleIntelS","_moduleLights","_moduleLoadingS","_moduleMedS","_moduleRest","_moduleStash","_moduleWorkbench", "_money","_rpgComplete"];

		if (_money > 1499999) then
		{
			_money = _money - 1500000;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID Player)+"_money",_money];
			_moduleAirP = true;
			missionNamespace setVariable ["EFTVar_"+(getPlayerUID player)+"RPGSys",[_rpgComplete select 0,_rpgComplete select 1, _rpgComplete select 2, ["Hideout",["LoadingS",_moduleLoadingS],["Workbench",_moduleWorkbench],["MedS",_moduleMedS],["AirP",_moduleAirP],["RestS",_moduleRest],["IntelS",_moduleIntelS],["BitcoinF",_moduleBitcoinF],["Stash",_moduleStash],["LightsB",_moduleLights],["Generator",_moduleGenerator]]]];
			_rpgComplete =  missionNamespace getVariable "EFTVar_"+(getPlayerUID player)+"RPGSys";
			[[player, _rpgComplete],"scripts\hideoutExecuter.sqf"] remoteExec ["execVM", 2];
			hint "One doesn't know how useful an Air purifier is until you get one.";
			execVM "scripts\hideoutTrader.sqf";

			[] spawn
			{
			sleep 5;
			hintSilent "";
			"D.D Promotional Flier" hintC
			[
			"Dear Customer, Dodgy Dave Interior Decorations Inc. thanks you for your preference and reminds you that your new equipment will be avaliable in your bunker room ASAP.",
			"",
			"Tips:",
			"The air purifier compliments the rest station.",
			"Some of the features for this module are still WIP."
			]
			};
		}
		else
		{
			hint "You might want to take the device by yourself then?";
		};
	},
	[_moduleGenerator,_moduleAirP,_moduleBitcoinF,_moduleIntelS,_moduleLights,_moduleLoadingS,_moduleMedS,_moduleRest,_moduleStash,_moduleWorkbench, _money, _rpgComplete],
	1.5,
	false,
	false,
	"",
	"((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 10) select 1) == true && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 2) select 1) == 3 && ((((missionNamespace getVariable 'EFTVar_'+(getPlayerUID Player)+'RPGSys') select 3) select 5) select 1) == 2",
	3,
	false,
	"",
	""
];
