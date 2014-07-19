// T-Max, 19 july 2014

private ["_primaries", "_secondaries", "_toolbelt", "_magazines", "_backpacks", "_tmax_fnc_randWeapon", "_tmax_fnc_randToolbelt", "_tmax_fnc_randMagazine", "_cnt"];
// Если не хотите оружие какого-то типа - оставляйте пустой массив.
DefaultWeapons = [];
DefaultMagazines = [];
DefaultBackpack = "";
// массив - [оружие, тип боеприпасов, минимальное кол-во рожков, максимальное кол-во рожков, вероятность выпадения боеприпасов]
_primaries = [

];

// массив - [оружие, тип боеприпасов, минимальное кол-во рожков, максимальное кол-во рожков, вероятность выпадения боеприпасов]
_secondaries = [
	["Makarov", "8Rnd_9x18_Makarov", 1, 3, 0.75],
	["MakarovSD", "8Rnd_9x18_MakarovSD", 1, 3, 0.50],
	["Colt1911", "7Rnd_45ACP_1911", 1, 3, 0.75],
	["M9", "15Rnd_9x19_M9", 1, 2, 0.75],
	["M9SD", "15Rnd_9x19_M9SD", 1, 2, 0.75]
];
// массив - [предмет, вероятность выпадения]
_toolbelt = [
	["ItemMatchbox", 0.5],
	["ItemHatchet", 0.1],
	["ItemKnife", 0.7],
	["NVGoggles", 0.03],
	["ItemCompass", 0.2],
	["ItemGps", 0.01],
	["ItemMap", 1],
	["ItemToolbox", 0.5]
];

// массив - [предмет, минимальное кол-во, максимальное, вероятность выпадения]
_magazines = [
	["ItemMorphine", 1, 2, 0.3],
	["ItemPainkiller", 1, 2, 0.5],
	["ItemWaterbottleBoiled", 1, 1, 1],
	["FoodSteakCooked", 1, 1, 1],
	["ItemBandage", 1, 4, 0.25]
];

//http://epochmod.gamepedia.com/Backpacks
_backpacks = [
	"DZ_Patrol_Pack_EP1",
	"DZ_Assault_Pack_EP1",
	"DZ_Czech_Vest_Puch",
	"DZ_TerminalPack_EP1",
	"DZ_ALICE_Pack_EP1",
	"DZ_TK_Assault_Pack_EP1"
];
//====================================================================================================================
_tmax_fnc_randWeapon = {
	private ["_wpn", "_ammo", "_min", "_max", "_chance", "_rand"];
	diag_log format ["T-Max, randwpn: %1", _this];
	_wpn = _this select 0;
	_ammo = _this select 1;
	_min = _this select 2;
	_max = _this select 3;
	_chance = _this select 4;
	
	DefaultWeapons = DefaultWeapons + [_wpn];
	for [{_i = 0}, {_i < _max}, {_i = _i + 1}] do {
		if (_i < _min) then {_rand = 0;} else {_rand = random 1;};
		
		if (_rand <= _chance) then {
			DefaultMagazines = DefaultMagazines + [_ammo];
		};
	};
};
_tmax_fnc_randToolbelt = {
	private ["_item", "_chance", "_rand"];
	
	_item = _this select 0;
	_chance = _this select 1;	
	_rand = random 1;
		
	if (_rand <= _chance) then {
		DefaultWeapons = DefaultWeapons + [_item];
	};
};
_tmax_fnc_randMagazine = {
	private ["_item", "_min", "_max", "_chance", "_rand"];
	
	_item = _this select 0;
	_min = _this select 1;
	_max = _this select 2;
	_chance = _this select 3;
	
	for [{_i = 0}, {_i < _max}, {_i = _i + 1}] do {
		if (_i < _min) then {_rand = 0;} else {_rand = random 1;};
		
		if (_rand <= _chance) then {
			DefaultMagazines = DefaultMagazines + [_item];
		};
	};
};
//--------------------------------------------------------------------------------------------------------------------
// primary
_cnt = count _primaries;
if (_cnt > 0) then {
	(_primaries select (floor random _cnt)) call _tmax_fnc_randWeapon;
};

// secondary
_cnt = count _secondaries;
if (_cnt > 0) then {
	(_secondaries select (floor random _cnt)) call _tmax_fnc_randWeapon;
};

// toolbelt
_cnt = count _toolbelt;
if (_cnt > 0) then {
	{
		_x call _tmax_fnc_randToolbelt;
	} forEach _toolbelt;
};

// Magazines
_cnt = count _magazines;
if (_cnt > 0) then {
	{
		_x call _tmax_fnc_randMagazine;
	} forEach _magazines;
};

// backpack
_cnt = count _backpacks;
if (_cnt > 0) then {
	DefaultBackpack = _backpacks select (floor random _cnt);
};

/*===================================================== EPOCH LIST =====================================================
---------------- Одежда  ----------------
Skin_Bandit1_DZ
Skin_Bandit2_DZ
Skin_BanditW1_DZ
Skin_BanditW2_DZ
Skin_Camo1_DZ
Skin_CZ_Soldier_Sniper_EP1_DZ
Skin_CZ_Special_Forces_GL_DES_EP1_DZ
Skin_Drake_Light_DZ
Skin_FR_OHara_DZ
Skin_FR_Rodriguez_DZ
Skin_Functionary1_EP1_DZ
Skin_Graves_Light_DZ
Skin_GUE_Commander_DZ
Skin_GUE_Soldier_2_DZ
Skin_GUE_Soldier_CO_DZ
Skin_GUE_Soldier_Crew_DZ
Skin_GUE_Soldier_MG_DZ
Skin_GUE_Soldier_Sniper_DZ
Skin_Ins_Soldier_GL_DZ
Skin_Pilot_EP1_DZ
Skin_Priest_DZ
Skin_Rocker1_DZ
Skin_Rocker2_DZ
Skin_Rocker3_DZ
Skin_Rocker4_DZ
Skin_Rocket_DZ
Skin_RU_Policeman_DZ
Skin_Sniper1_DZ
Skin_Soldier1_DZ
Skin_Soldier_Bodyguard_AA12_PMC_DZ
Skin_Soldier_Sniper_PMC_DZ
Skin_Soldier_TL_PMC_DZ
Skin_SurvivorW3_DZ
Skin_SurvivorWcombat_DZ
Skin_SurvivorWdesert_DZ
Skin_SurvivorWpink_DZ
Skin_SurvivorWurban_DZ
Skin_TK_INS_Soldier_EP1_DZ
Skin_TK_INS_Warlord_EP1_DZ

---------------- Рюкзаки ----------------

DZ_ALICE_Pack_EP1
DZ_Assault_Pack_EP1
DZ_Backpack_EP1
DZ_British_ACU
DZ_CivilBackpack_EP1
DZ_CompactPack_EP1
DZ_Czech_Vest_Puch
DZ_GunBag_EP1
DZ_LargeGunBag_EP1
DZ_TerminalPack_EP1
DZ_TK_Assault_Pack_EP1


---------------- Оружие ----------------

AKS_74_kobra
AKS_74_U
AK_47_M
AK_74
AK_107_PSO
BAF_AS50_scoped
BAF_L85A2_RIS_Holo
BAF_L85A2_RIS_SUSAT
BAF_LRR_scoped
Binocular
bizon_silenced
Colt1911
Crossbow
Crossbow_DZ
DMR
DMR_DZ
DMR_DZ2
DMR_DZ3
FN_FAL
FN_FAL_ANPVS4
G36A_camo
G36C
G36C_camo
G36K_camo
G36_C_SD_camo
glock17_EP1
huntingrifle
LeeEnfield
M4A1
M4A1_Aim
M4A1_AIM_SD_camo
M4A1_HWS_GL_camo
M4A3_CCO_EP1
M9
M9SD
M14_EP1
M16A2
M16A2GL
M16A4_ACG
M24
M40A3
m107_DZ
M240_DZ
M249_DZ
M1014
Makarov
MakarovSD
Mk_48_DZ
MP5SD
MR43
Part
Pecheneg_DZ
Remington870_lamp
revolver_EP1
Sa58P_EP1
Sa58V_CCO_EP1
Sa58V_EP1
Sa58V_RCO_EP1
Sa61_EP1
SCAR_H_LNG_Sniper_SD
SVD_CAMO
UZI_EP1
UZI_SD_EP1
Winchester1866

Javelin
SMAW
Stinger

---------------- Боеприпасы ----------------

1Rnd_HE_M203
1Rnd_Smoke_M203
2Rnd_shotgun_74Pellets
2Rnd_shotgun_74Slug
5Rnd_86x70_L115A1
5Rnd_762x51_M24
5x_22_LR_17_HMR
6Rnd_45ACP
7Rnd_45ACP_1911
8Rnd_9x18_Makarov
8Rnd_9x18_MakarovSD
8Rnd_B_Beneli_74Slug
8Rnd_B_Beneli_Pellets
10x_303
15Rnd_9x19_M9
15Rnd_9x19_M9SD
15Rnd_W1866_Slug
17Rnd_9x19_glock17
20Rnd_762x51_DMR
20Rnd_B_765x17_Ball
30m_plot_kit:
30Rnd_9x19_MP5
30Rnd_9x19_MP5SD
30Rnd_9x19_UZI_SD
30Rnd_545x39_AK
30Rnd_556x45_Stanag
30Rnd_556x45_StanagSD
30Rnd_762x39_AK47
100Rnd_762x51_M240
100Rnd_762x54_PK
200Rnd_556x45_M249
WoodenArrow

FlareGreen_M203
FlareWhite_M203
HandGrenade_west
PipeBomb
SmokeShell
SmokeShellGreen
SmokeShellRed


----------------  Мусор, если кому надо :D  ----------------

ItemSodaEmpty
ItemTrashRazor
ItemTrashToiletpaper
TrashJackDaniels
TrashTinCan


----------------  Инструменты  ----------------

Binoculars
Binocular_Vector
ItemCompass
ItemCrowbar
ItemEtool
ItemFishingPole
ItemFlashlight
ItemFlashlightRed
ItemGPS
ItemHatchet
ItemKnife
ItemMachete
ItemMap
ItemMatchbox
ItemShovel
ItemToolbox
ItemWatch
NVGoggles

HandChemBlue
HandChemGreen
HandChemRed
HandRoadFlare

ItemFuelBarrel
ItemFuelBarrelEmpty
ItemFuelPump
ItemGenerator
ItemJerrycan
ItemJerrycanEmpty
ItemOilBarrel


---------------- Деньги ----------------

ItemAluminumBar10oz
ItemBriefcase10oz
ItemBriefcase30oz
ItemBriefcase40oz
ItemBriefcase50oz
ItemBriefcase60oz
ItemBriefcase70oz
ItemBriefcase80oz
ItemBriefcase90oz
ItemBriefcase100oz
ItemBriefcaseEmpty
ItemCopperBar
ItemCopperBar10oz
ItemGoldBar
ItemGoldBar10oz
ItemSilverBar
ItemSilverBar10oz
ItemTinBar
ItemTinBar10oz


---------------- Еда ----------------

FoodBioMeat
FoodCanBakedBeans
FoodCanFrankBeans
FoodCanPasta
FoodCanSardines
FoodCanUnlabeled
FoodEdible
FoodMRE
FoodNutmix
FoodPistachio
FoodSteakCooked
FoodSteakRaw
ItemZombieParts

ItemSodaCoke
ItemSodaMdew
ItemSodaOrangeSherbet
ItemSodaPepsi
ItemSodaRbull
ItemWaterbottle
ItemWaterbottleUnfilled

---------------- Медикаменты ----------------

ItemAntibiotic
ItemBandage
ItemBloodbag
ItemEpinephrine
ItemHeatPack
ItemMorphine
ItemPainkiller

---------------- Запчасти\строительство ----------------

CinderBlocks
ItemCanvas
ItemComboLock
ItemKeyKit
ItemLightBulb
ItemLockbox
ItemSandbag
ItemTankTrap
ItemWire
MortarBucket
PartEngine
PartFueltank
PartGeneric
PartGlass
PartPlankPack
PartVRotor
PartWheel
PartWoodPile

ItemTent
ItemTentDomed
ItemTentDomed2
ItemTentOld
*/