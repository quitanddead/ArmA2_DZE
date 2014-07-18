class TmaxText 
{
	type = 0;
	text = "";
	x=0.92*safeZoneW + safeZoneX; //*safeZoneW + safeZoneX
	w=0.07*safeZoneW;
	h=0.03;
	style = 0x100+0x01; 
	font = Zeppelin32;
	SizeEx = 0.03;
	colorText[] = {1,1,1,0.7};
	colorBackground[] = {0, 0, 0, 0};
	linespacing = 1;
};
class TmaxPic_l : TmaxText
{
	style=48;
	w=0.03*(safeZoneH/safeZoneW);
};
class TmaxPic_r : TmaxPic_l
{
	x=0.97*safeZoneW + safeZoneX;
};

class RscTitles 
{
	class playerStatusGUI
	{
		idd=7200;
		movingEnable=0;
		duration=100000;
		name="statusBorder";
		onLoad="uiNamespace setVariable ['DAYZ_GUI_display', _this select 0]; player_updateGui = compile preprocessFileLineNumbers ""addons\tmax_gui\updateGui.sqf"";";
		class Controls
		{
			class RscRedCross: TmaxPic_l // MAIN
			{
				idc=7201;
				y=0.84*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_health.paa";
			};
			class RscRedCross_text: TmaxText
			{
				idc=7202;
				y=0.84*safeZoneH + safeZoneY;				
				text="100%";
			};
			class RscFood: TmaxPic_l
			{
				idc=7203;
				y=0.87*safeZoneH + safeZoneY;			
				text="addons\tmax_gui\tmax_hud_food.paa";
			};
			class RscFood_text: TmaxText
			{
				idc=7204;
				y=0.87*safeZoneH + safeZoneY;				
				text="100%";
			};
			class RscWater: TmaxPic_l
			{
				idc=7205;
				y=0.9*safeZoneH + safeZoneY;			
				text="addons\tmax_gui\tmax_hud_water.paa";
			};
			class RscWater_text: TmaxText
			{
				idc=7206;
				y=0.9*safeZoneH + safeZoneY;				
				text="100%";
			};
			class RscTemperature: TmaxPic_l
			{
				idc=7207;
				y=0.93*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_temperature.paa";
			};
			class RscTemperature_text: TmaxText
			{
				idc=7208;
				y=0.93*safeZoneH + safeZoneY;			
				text="36.6%";
			};
			class RscFPS: TmaxPic_l
			{
				idc=7209;
				y=0.96*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_fps.paa";
			};
			class RscFPS_text: TmaxText
			{
				idc=7210;
				y=0.96*safeZoneH + safeZoneY;			
				text="0";
			};
			class RscBattle: TmaxPic_r // STATUSES
			{
				idc=7211;
				y=0.78*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_effect_battle_d.paa";
			};
			class RscBleeding: TmaxPic_l
			{
				idc=7212;
				y=0.75*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_effect_bleeding_d.paa";
			};
			class RscInfected: TmaxPic_r
			{
				idc=7213;
				y=0.75*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_effect_infected_d.paa";
			};
			class RscPain: TmaxPic_l
			{
				idc=7214;
				y=0.72*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_effect_pain_d.paa";
			};
			class RscBone: TmaxPic_r
			{
				idc=7215;
				y=0.72*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_effect_bone_d.paa";
			};
			class RscKilledZombies: TmaxPic_l // KILLED
			{
				idc=7216;
				y=0.66*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_killed_zombies.paa";
			};
			class RscKilledZombies_text: TmaxText
			{
				idc=7217;
				y=0.66*safeZoneH + safeZoneY;				
				text="0";
			};
			class RscKilledBandits: TmaxPic_l
			{
				idc=7218;
				y=0.63*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_killed_bandits.paa";
			};
			class RscKilledBandits_text: TmaxText
			{
				idc=7219;
				y=0.63*safeZoneH + safeZoneY;				
				text="0";
			};
			class RscKilledHero: TmaxPic_l
			{
				idc=7220;
				y=0.6*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_killed_hero.paa";
			};
			class RscKilledHero_text: TmaxText
			{
				idc=7221;
				y=0.6*safeZoneH + safeZoneY;				
				text="0";
			};
			class RscKilled: TmaxPic_r
			{
				idc=7222;
				y=0.57*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_killed.paa";
			};
			class RscGPS: TmaxPic_l
			{
				idc=7223;
				y=0.51*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_gps.paa";
			};
			class RscGPS_text: TmaxText
			{
				idc=7224;
				y=0.51*safeZoneH + safeZoneY;				
				text="------";
			};
			class RscUpTime: TmaxPic_l
			{
				idc=7225;
				y=0.48*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_uptime.paa";
			};
			class RscUpTime_text: TmaxText
			{
				idc=7226;
				y=0.48*safeZoneH + safeZoneY;				
				text="0:00";
			};
			class RscHumanity: TmaxPic_l
			{
				idc=7227;
				y=0.45*safeZoneH + safeZoneY;				
				text="addons\tmax_gui\tmax_hud_status_cap.paa";
			};
			class RscHumanity_text: TmaxText
			{
				idc=7228;
				y=0.45*safeZoneH + safeZoneY;				
				text="0";
			};
		};
	};
};