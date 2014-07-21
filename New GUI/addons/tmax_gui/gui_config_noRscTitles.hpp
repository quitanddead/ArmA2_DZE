class TmaxText 
{
	type = 0;
	text = "";
	x=0.92*safeZoneW + safeZoneX; //*safeZoneW + safeZoneX
	w=0.07*safeZoneW; // /safeZoneW
	h=0.03; // //safeZoneH
	style = 0x100+0x01; 
	font = Zeppelin32;
	SizeEx = 0.03;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
};
class TmaxPic : TmaxText
{
	style=48;
	w=0.03/safeZoneW;
	h=0.03/safeZoneH;
};
class TmaxPic_main : TmaxPic
{
	x=0.925*safeZoneW + safeZoneX;
};
class TmaxText_main : TmaxText
{
	x=0.905*safeZoneW + safeZoneX; //*safeZoneW + safeZoneX
};
class TmaxPic_status : TmaxPic
{
	x=0.975*safeZoneW + safeZoneX;
};
class TmaxPic_killed : TmaxPic
{
	x=0.95*safeZoneW + safeZoneX;
};
class TmaxPic_misc : TmaxPic
{
	x=0.92*safeZoneW + safeZoneX;
};
class playerStatusGUI
{
	idd=7200;
	movingEnable=0;
	duration=100000;
	name="statusBorder";
	onLoad="uiNamespace setVariable ['DAYZ_GUI_display', _this select 0]; player_updateGui = compile preprocessFileLineNumbers ""addons\tmax_gui\updateGui.sqf"";";
	class Controls
	{
		class Main_Health: TmaxPic_main // MAIN
		{
			idc=7201;
			y=0.84*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_main_health.paa";
		};
		class Main_Health_text: TmaxText_main
		{
			idc=7202;
			y=0.84*safeZoneH + safeZoneY;				
			text="100%";
		};
		class Main_Food: TmaxPic_main
		{
			idc=7203;
			y=0.87*safeZoneH + safeZoneY;			
			text="addons\tmax_gui\tmax_hud_main_food.paa";
		};
		class Main_Food_text: TmaxText_main
		{
			idc=7204;
			y=0.87*safeZoneH + safeZoneY;				
			text="100%";
		};
		class Main_Water: TmaxPic_main
		{
			idc=7205;
			y=0.9*safeZoneH + safeZoneY;			
			text="addons\tmax_gui\tmax_hud_main_water.paa";
		};
		class Main_Water_text: TmaxText_main
		{
			idc=7206;
			y=0.9*safeZoneH + safeZoneY;				
			text="100%";
		};
		class Main_Temperature: TmaxPic_main
		{
			idc=7207;
			y=0.93*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_main_temperature.paa";
		};
		class Main_Temperature_text: TmaxText_main
		{
			idc=7208;
			y=0.93*safeZoneH + safeZoneY;			
			text="36.6%";
		};
		class Main_FPS: TmaxPic_main
		{
			idc=7209;
			y=0.96*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_main_fps.paa";
		};
		class Main_FPS_text: TmaxText_main
		{
			idc=7210;
			y=0.96*safeZoneH + safeZoneY;			
			text="0";
		};
		class Status_Battle: TmaxPic_status // STATUSES
		{
			idc=7211;
			y=0.84*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_status_battle_d.paa";
		};
		class Status_Bleeding: TmaxPic_status
		{
			idc=7212;
			y=0.87*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_status_bleeding_d.paa";
		};
		class Status_Infected: TmaxPic_status
		{
			idc=7213;
			y=0.9*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_status_infected_d.paa";
		};
		class Status_Pain: TmaxPic_status
		{
			idc=7214;
			y=0.93*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_status_pain_d.paa";
		};
		class Status_Bone: TmaxPic_status
		{
			idc=7215;
			y=0.96*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_status_bone_d.paa";
		};
		class Killed_Zombies: TmaxPic_killed // KILLED
		{
			idc=7216;
			y=0.78*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_zombie.paa";
		};
		class Killed_Zombies_text: TmaxText
		{
			idc=7217;
			y=0.78*safeZoneH + safeZoneY;				
			text="0";
		};
		class Killed_Bandits: TmaxPic_killed
		{
			idc=7218;
			y=0.75*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_bandit.paa";
		};
		class Killed_Bandits_text: TmaxText
		{
			idc=7219;
			y=0.75*safeZoneH + safeZoneY;				
			text="0";
		};
		class Killed_Neutrals: TmaxPic_killed
		{
			idc=7220;
			y=0.72*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_neutral.paa";
		};
		class Killed_Neutrals_text: TmaxText
		{
			idc=7221;
			y=0.72*safeZoneH + safeZoneY;				
			text="0";
		};
		class Killed_Headshots: TmaxPic_killed
		{
			idc=7229;
			y=0.69*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_headshot.paa";
		};
		class Killed_Headshots_text: TmaxText
		{
			idc=7230;
			y=0.69*safeZoneH + safeZoneY;				
			text="0";
		};
		class Killed_All: TmaxPic_status
		{
			idc=7222;
			y=0.66*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_killed.paa";
		};
		class Misc_Audible: TmaxPic_misc // MISC
		{
			idc=7231;
			y=0.6*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_misc_audible.paa";
		};
		class Misc_Audible_text: TmaxText
		{
			idc=7232;
			y=0.6*safeZoneH + safeZoneY;				
			text="0";
		};
		class Misc_Visible: TmaxPic_misc
		{
			idc=7233;
			y=0.57*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_misc_visibility.paa";
		};
		class Misc_Visible_text: TmaxText
		{
			idc=7234;
			y=0.57*safeZoneH + safeZoneY;				
			text="0";
		};
		class Misc_UpTime: TmaxPic_misc
		{
			idc=7225;
			y=0.54*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_misc_uptime.paa";
		};
		class Misc_UpTime_text: TmaxText
		{
			idc=7226;
			y=0.54*safeZoneH + safeZoneY;				
			text="0:00";
		};
		class Misc_Humanity: TmaxPic_misc
		{
			idc=7227;
			y=0.51*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_neutral.paa";
		};
		class Misc_Humanity_text: TmaxText
		{
			idc=7228;
			y=0.51*safeZoneH + safeZoneY;				
			text="0";
		};
		class Misc_GPS: TmaxPic_misc
		{
			idc=7223;
			y=0.48*safeZoneH + safeZoneY;				
			text="addons\tmax_gui\tmax_hud_misc_gps.paa";
		};
		class Misc_GPS_text: TmaxText
		{
			idc=7224;
			y=0.48*safeZoneH + safeZoneY;				
			text="------";
		};
	};
};
