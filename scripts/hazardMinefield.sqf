params ["_triggerToPop"];

for "_i" from 1 to 4 do
{
_mineSign = createVehicle ["Sign_DangerMines_ACR", position _triggerToPop, [], 150, "NONE"];
};

for "_i" from 1 to (random [10,15,20]) do
{
	_charge = createMine ["APERSBoundingMine",position _triggerToPop, [], 100];
};
