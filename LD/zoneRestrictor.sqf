//usage zoneR = [nameOfTrigger] execVM "zoneRestrictor.sqf";

_triggerActivated = _this select 0;
if !(player in (list _triggerActivated)) exitWith {};

systemChat "THIS AREA IS OUT OF BOUNDS, RETURN TO THE PLAYABLE AREA IMMEDIATLEY!";
cutText ["YOU HAVE 15 SECONDS TO RETURN TO THE PLAYABLE AREA", "plain", 0];
titleFadeout 5;

sleep 10;
if (player in (list _triggerActivated)) then
{
    player setDamage 1;
    systemChat "YOU DID NOT RETURN TO PLAYABLE AREA AND HAVE SUFFERED THE CONSEQUENCES";
} else {
        systemChat "YOU HAVE SUCCESFULLY RETURNED TO THE PLAYABLE AREA";};
;