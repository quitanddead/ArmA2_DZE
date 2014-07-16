disableSerialization;

private ["_oldWpn", "_newWpn", "_backpack", "_wpnDump", "_cnt", "_muzzles", "_num", "_obj"];

[] call tmax_fnc_clearActions;

if (DZE_ActionInProgress) exitWith {cutText ["Another action in progress...", "PLAIN DOWN"];};

_obj = nearestObjects [position player, AllPlayers, 5];
_cnt = 0;
{
	if (alive _x) then { _cnt = _cnt + 1; };
} forEach _obj;

if (_cnt > 1) exitWith {cutText ["Anti-Dupe: Can't change weapon while somebody near you...", "PLAIN DOWN"];};

_oldWpn = (_this select 3) select 0; 
_newWpn = (_this select 3) select 1;
_backpack = unitbackpack player;
_wpnDump = getWeaponCargo _backpack;

if (!(_newWpn in (_wpnDump select 0))) exitWith {cutText ["Can't find requested weapon in backpack :C", "PLAIN DOWN"];};

DZE_ActionInProgress = true;
player setVariable ["tmax_weapons", [_oldWpn] + (_wpnDump select 0), true];

// Let's add current player weapon to new player backpack
_num = (_wpnDump select 0) find _oldWpn;
if (_num >= 0) then {  //increase if current weapon already in backpack.
	_numberArray = _wpnDump select 1;
	_numberArray set [_num, (_numberArray select _num) + 1];
	_wpnDump set [1, _numberArray];
}
else // add if weapon not present
{
	_wpnDump set [0, (_wpnDump select 0) + [_oldWpn]];
	_wpnDump set [1, (_wpnDump select 1) + [1]];
};
// Let's delete new weapon from new backpack
_num = (_wpnDump select 0) find _newWpn;
_numberArray = _wpnDump select 1;
if (_numberArray select _num > 1) then { // decrease if more than 1 weapon
	_numberArray set [_num, (_numberArray select _num) - 1];
	_wpnDump set [1, _numberArray];
}
else
{
	_numberArray set [_num, 0];
	_wpnDump set [1, _numberArray];
};

clearWeaponCargoGlobal _backpack;

{
	_cnt = (_wpnDump select 1) select _forEachIndex;
	if (_cnt > 0) then {
		_backpack addWeaponCargoGlobal [_x, _cnt];
	};
} forEach (_wpnDump select 0);

player removeWeapon _oldWpn;
player playActionNow "Gear";
playsound format ["z_open_backpack_%1", floor (random 5)];

sleep 0.95;

player addWeapon _newWpn;
_muzzles = getArray(configFile >> "cfgWeapons" >> _newWpn >> "muzzles"); 
if (count _muzzles > 1) then {
	player selectWeapon (_muzzles select 0);
}
else {
	player selectWeapon _newWpn;
};

call dayz_forceSave;
DZE_ActionInProgress = false;

sleep 2;
player setVariable ["tmax_weapons", [], true];