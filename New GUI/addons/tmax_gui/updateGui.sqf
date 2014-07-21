disableSerialization;
private ["_display", "_bloodval", "_foodval", "_waterVal", "_temperatureVal", "_bloodval", "_display", "_bloodCtrl", "_foodCtrl", "_waterCtrl", "_temperatureCtrl", "_fpsCtrl", "_battleCtrl", "_painCtrl", "_infectedCtrl", "_bleedingCtrl", "_boneCtrl", "_killedZ", "_killedB", "_killedN", "_killedH", "_GPSCtrl", "_GPSTextCtrl", "_upTimeCtrl", "_hrs", "_humanityCtrl", "_humanityTextCtrl", "_humanity", "_humanityIcon", "_visualCtrl", "_audibleCtrl"];
//================================================
_foodVal = 		1 - (dayz_hunger / SleepFood);
_thirstVal = 	1 - (dayz_thirst / SleepWater);
_array = [_foodVal,_thirstVal];
//================================================
_bloodVal 		= floor (r_player_blood / r_player_bloodTotal * 100);
_foodVal 		= floor ((1 - dayz_hunger / SleepFood) * 100);
_waterVal 		= floor ((1 - dayz_thirst / SleepWater) * 100);
_temperatureVal = ceil (36.6*dayz_temperatur/42);

_combatVal =	1 - dayz_combat; // May change later to be a range of red/green to loosely indicate 'time left in combat'

if (uiNamespace getVariable ["DZ_displayUI", 0] == 1) exitWith {
	_array
};

if (_bloodVal < 0) then {_bloodVal = 0}; // no more -21k of blood :D

_display = uiNamespace getVariable 'DAYZ_GUI_display';

_bloodCtrl = _display displayCtrl 7202;
_foodCtrl = _display displayCtrl 7204;
_waterCtrl = _display displayCtrl 7206;
_temperatureCtrl = _display displayCtrl 7208;
_fpsCtrl = _display displayCtrl 7210;

_battleCtrl = _display displayCtrl 7211;
_bleedingCtrl = _display displayCtrl 7212;
_infectedCtrl = _display displayCtrl 7213;
_painCtrl = _display displayCtrl 7214;
_boneCtrl = _display displayCtrl 7215;

_killedZ = _display displayCtrl 7217;
_killedB = _display displayCtrl 7219;
_killedN = _display displayCtrl 7221;
_killedH = _display displayCtrl 7230;

_GPSCtrl = _display displayCtrl 7223;
_GPSTextCtrl = _display displayCtrl 7224;
_upTimeCtrl = _display displayCtrl 7226;
_humanityCtrl = _display displayCtrl 7227;
_humanityTextCtrl = _display displayCtrl 7228;
_audibleCtrl = _display displayCtrl 7232;
_visualCtrl = _display displayCtrl 7234;
//==================================== MAIN ============================================
_bloodCtrl ctrlSetText format ["%1%2", _bloodVal, "%"];
_foodCtrl ctrlSetText format ["%1%2", _foodVal, "%"];
_waterCtrl ctrlSetText format ["%1%2", _waterVal, "%"];
_temperatureCtrl ctrlSetText str(_temperatureVal);
_fpsCtrl ctrlSetText str(floor diag_fps);
//==================================== STATUS ==========================================
if (dayz_combat > 0) then {_battleCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_battle.paa";} else {_battleCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_battle_d.paa";};
if (r_player_injured) then {_bleedingCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_bleeding.paa";} else {_bleedingCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_bleeding_d.paa";};
if (r_player_infected) then {_infectedCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_infected.paa";} else {_infectedCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_infected_d.paa";};
if (r_player_inpain) then {_painCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_pain.paa";} else {_painCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_pain_d.paa";};
if (r_fracture_legs) then {_boneCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_bone.paa";} else {_boneCtrl ctrlSetText "addons\tmax_gui\tmax_hud_status_bone_d.paa";};
//==================================== KILLED ==========================================
_killedZ ctrlSetText str(player getVariable["zombieKills", 0]);
_killedB ctrlSetText str(player getVariable["banditKills", 0]);
_killedN ctrlSetText str(player getVariable["humanKills", 0]);
_killedH ctrlSetText str(player getVariable["headshots", 0]);
//==================================== MISC ==========================================
if ("ItemGPS" in weapons player) then {
	_GPSCtrl ctrlShow true;
	_GPSTextCtrl ctrlShow true;
	_GPSTextCtrl ctrlSetText str(mapGridPosition position player);	
} else {
	_GPSCtrl ctrlShow false;
	_GPSTextCtrl ctrlShow false;
};
_hrs = floor (serverTime/60/60);
_upTimeCtrl ctrlSetText format ["%1h %2m", _hrs, floor (serverTime/60-60*_hrs)]; //????

_humanity = player getVariable ["humanity", 0];
_humanityTextCtrl ctrlSetText str(_humanity);

_humanityIcon = "addons\tmax_gui\tmax_hud_neutral.paa";
if (_humanity > 5000) then {_humanityIcon = "addons\tmax_gui\tmax_hud_hero.paa"};
if (_humanity < -5000) then {_humanityIcon = "addons\tmax_gui\tmax_hud_bandit.paa"};
_humanityCtrl ctrlSetText _humanityIcon;

_audibleCtrl ctrlSetText format ["%1m", floor dayz_disAudial];
_visualCtrl ctrlSetText format ["%1m", floor dayz_disVisual];

_array