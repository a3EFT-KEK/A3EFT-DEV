/*
	Created By Silence (Silence#9762 on discord) for EFT project ArmA 3
*/

class EFTP_Selection_Menu
{
	idd=6100;
	class controls
	{
		class EFTP_Selection_Background: RscPicture
		{
			idc = 1200;
			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {0.1,0.1,0.1,0.5};
			colorBackground[] = {0.1,0.1,0.1,0.5};
			colorActive[] = {0.1,0.1,0.1,0.5};
		};
		class EFTP_Selection_Frame: RscFrame
		{
			idc = 1800;
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.4125 * safezoneW;
			h = 0.55 * safezoneH;
			colorText[] = {1,-1,-1,1};
			colorBackground[] = {1,-1,-1,1};
			colorActive[] = {1,-1,-1,1};
		};
		class EFTP_Selection_USECImage: RscPicture
		{
			idc = 1201;
			text = "USEC.paa";
			x = 0.335 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.12375 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class EFTP_Selection_BEARImage: RscPicture
		{
			idc = 1202;
			text = "BEAR.paa";
			x = 0.536093 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.22 * safezoneH;
		};
		class EFTP_Selection_BackstoryText: RscText
		{
			idc = 1001;
			text = "Select Your Origin Story"; //--- ToDo: Localize;
			x = 0.350469 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.299062 * safezoneW;
			h = 0.088 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			sizeEx = 4 * GUI_GRID_H;
		};
		class EFTP_Selection_SelectUSECButton: RscButtonNoBackground
		{
			idc = 1602;
			x = 0.329843 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.22 * safezoneH;
			colorText[] = {-1,-1,-1,0};
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
			tooltip = "Choose USEC"; //--- ToDo: Localize;
			action = "execVM 'scripts\factionUsec.sqf', closeDialog 2 ";
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class EFTP_Selection_SelectBEARButton: RscButtonNoBackground
		{
			idc = 1603;
			x = 0.536093 * safezoneW + safezoneX;
			y = 0.401 * safezoneH + safezoneY;
			w = 0.134062 * safezoneW;
			h = 0.22 * safezoneH;
			colorText[] = {-1,-1,-1,0};
			colorBackground[] = {-1,-1,-1,0};
			colorActive[] = {-1,-1,-1,0};
			tooltip = "Choose BEAR"; //--- ToDo: Localize;
			action = "execVM 'scripts\factionBear.sqf', closeDialog 2 ";
			//sizeEx = 1.5 * GUI_GRID_H;
		};
		class EFTP_Selection_SelectIconText: RscText
		{
			idc = 1002;
			text = "Select An Icon"; //--- ToDo: Localize;
			x = 0.407187 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.185625 * safezoneW;
			h = 0.077 * safezoneH;
			colorText[] = {1,1,1,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
			sizeEx = 4 * GUI_GRID_H;
		};

		class RscPicture_1204: RscPicture
		{
			idc = 1204;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.462 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1205: RscPicture
		{
			idc = 1205;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.680469 * safezoneW + safezoneX;
			y = 0.313 * safezoneH + safezoneY;
			w = 0.0257812 * safezoneW;
			h = 0.462 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1206: RscPicture
		{
			idc = 1206;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.29375 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.088 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1207: RscPicture
		{
			idc = 1207;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.649531 * safezoneW + safezoneX;
			y = 0.225 * safezoneH + safezoneY;
			w = 0.0567187 * safezoneW;
			h = 0.088 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1203: RscPicture
		{
			idc = 1203;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.319531 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0876563 * safezoneW;
			h = 0.077 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1209: RscPicture
		{
			idc = 1209;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.592812 * safezoneW + safezoneX;
			y = 0.698 * safezoneH + safezoneY;
			w = 0.0979687 * safezoneW;
			h = 0.077 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};
		class RscPicture_1208: RscPicture
		{
			idc = 1208;

			text = "#(argb,8,8,3)color(1,1,1,1)";
			x = 0.484531 * safezoneW + safezoneX;
			y = 0.302 * safezoneH + safezoneY;
			w = 0.020625 * safezoneW;
			h = 0.396 * safezoneH;
			colorText[] = {0,0,0,1};
			colorBackground[] = {0,0,0,1};
			colorActive[] = {0,0,0,1};
		};

	};
};