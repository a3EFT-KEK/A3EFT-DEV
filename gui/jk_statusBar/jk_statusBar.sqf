// Author: JK aka. Warrior

waitUntil {!(isNull (findDisplay 46))};
disableSerialization;

//preloadTitleRsc ["jk_statusBar", "PLAIN", 1, false];

[] spawn {

	_uid = getPlayerUID player;

	while {true} do {

		sleep 0.01;

		preloadTitleRsc ["jk_statusBar", "PLAIN", 1, false];
		_rscLayer = "jk_statusBar" call BIS_fnc_rscLayer;
		_rscLayer cutRsc ["jk_statusBar", "PLAIN", 1, false];

		// Variables
		_health = round ((1 - (damage player)) * 100);
		_hunger = player getVariable ["hunger", 100];
		_thirst = player getVariable ["thirst", 100];
		_weight = [(((loadAbs player)*0.1)/2.2), 2] call BIS_fnc_cutDecimals;

		// Colors
		_def_color = parseText "#ffffff";
		
			// HP Colors
			_hp_color = _def_color;
			_hp_color100 = parseText "#5eff00";
			_hp_color90 = parseText "#bbff00";
			_hp_color80 = parseText "#d0ff00";
			_hp_color70 = parseText "#ddff00";
			_hp_color60 = parseText "#f2ff00";
			_hp_color50 = parseText "#ffff00";
			_hp_color40 = parseText "#ffd500";
			_hp_color30 = parseText "#ffc400";
			_hp_color20 = parseText "#ff5e00";
			_hp_color10 = parseText "#ff3c00";
			_hp_color5 = parseText "#ff0000";
			_hp_color0 = parseText "#4d4d4d";

			// HP Colors Assignment
			switch (true) do
			{
				case (_health >= 100): {_hp_color = _hp_color100};
				case ((_health >= 90) && (_health < 100)): {_hp_color = _hp_color90};
				case ((_health >= 80) && (_health < 90)): {_hp_color = _hp_color80};
				case ((_health >= 70) && (_health < 80)): {_hp_color = _hp_color70};
				case ((_health >= 60) && (_health < 70)): {_hp_color = _hp_color60};
				case ((_health >= 50) && (_health < 60)): {_hp_color = _hp_color50};
				case ((_health >= 40) && (_health < 50)): {_hp_color = _hp_color40};
				case ((_health >= 30) && (_health < 40)): {_hp_color = _hp_color30};
				case ((_health >= 20) && (_health < 30)): {_hp_color = _hp_color20};
				case ((_health >= 10) && (_health < 20)): {_hp_color = _hp_color10};
				case ((_health >= 5) && (_health < 10)): {_hp_color = _hp_color5};
				case ((_health >= 0) && (_health < 5)): {_hp_color = _hp_color0};
			};

		// Data display
		((uiNamespace getVariable "jk_statusBar") displayCtrl 55554) ctrlSetStructuredText
		parseText format
		[
			"<t shadow='1' shadowColor='#000000' shadowOffset='0.075' color='%2' font='PuristaMedium'><img size='1.1' image='pictures\statusBar\health_icon.paa'/>%1</t>	
			<t shadow='1' shadowColor='#000000' shadowOffset='0.075' color='#79caf1' font='PuristaMedium'><img size='1.1' image='pictures\statusBar\hydration_icon.paa'/>%3</t>
			<t shadow='1' shadowColor='#000000' shadowOffset='0.075' color='#c6c391' font='PuristaMedium'><img size='1.1' image='pictures\statusBar\energy_icon.paa'/>%4</t>
			<t shadow='1' shadowColor='#000000' shadowOffset='0.075' color='#a0b8a4' font='PuristaMedium'><img size='1.1' image='pictures\statusBar\weight_icon.paa'/>%5kg</t>
			</t>",
			_health,	// 1
			_hp_color,	// 2
			_thirst,	// 3
			_hunger,	// 4
			_weight		// 5
		];
	};
};