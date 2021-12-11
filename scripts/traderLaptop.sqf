params ["_objectCaller"];

removeAllActions _objectCaller;

[
    _objectCaller,
    "Open Trade Menu",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa",
    "_this distance _target < 3.5",
    "_caller distance _target < 3.5",
    {},
    {},
    {
        [_caller] spawn KEK_fnc_tradeMenu;
    },
    {},
    [],
    2,
    100,
    false,
    false
] remoteExec ["BIS_fnc_holdActionAdd", player, _objectCaller];
