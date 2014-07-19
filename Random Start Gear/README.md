### Random Start Gear

Installation:
Copy "addons" folder to root of your mission, then add to your init.sqf:
```
//T-Max RANDOM GEAR
if (!isDedicated) then {
	[] execVM "addons\random_loadout.sqf";
};
```
List of available weapons at bottom of addons\random_loadout.sqf
That's all.
GLHF