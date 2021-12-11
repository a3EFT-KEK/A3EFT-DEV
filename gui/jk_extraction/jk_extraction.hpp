// Author: JK aka. Warrior

class jk_extraction
{
	idd = -1;
	onLoad = "uiNamespace setVariable ['jk_extraction', _this select 0]";
	onUnload = "uiNamespace setVariable ['jk_extraction', objNull]";
	onDestroy = "uiNamespace setVariable ['jk_extraction', objNull]";
	fadein = 0.5;
	fadeout = 0.5;
	duration = 4.3;
	movingEnable = 0;
	controlsBackground[] = {};
	objects[] = {};
	class controls
	{
		class jk_extractionText
		{
			idc = 55554;
			type = 13;
			style = 2;
			x = (safeZoneX + (safeZoneWAbs / 2)) - (0.45 / 2);
			y = (safeZoneY + (safeZoneH * 0.75));
			h = 0.3;
			w = 0.6 * 3 / 4; //w == h
			shadow = 2;
			font = "PuristaMedium";
			size = 0.05;
			text="";
			colorBackground[] = {0, 0, 0, 0};
			class Attributes
			{
				align="center";
				valign="middle"
				color = "#5eff00";
                font = "PuristaMedium";
			};
		};
	};
};