FMJ = +fmj
Dual Band = +ir
Laser = +steadyaim
Long Barrel = +extbarrel
Suppressor = +silencer
Select Fire = +sf
Tactical Knife = +tacknife
Dual Wield = +dw
Fast Mags = +dualclip
Extended Mags = +extclip
Grenade Launcher = +gl
Iron Sights = +is
Reflex = +reflex
EOTech = +holo
Rapid Fire = +rf
Ballistic CPU = +swayreduc
Tri Bolt = +stackfire
Quickdraw = +fastads
Grip = +grip
Stock = +stalker
Acog = +acog
Zoom = +vzoom
Target Finder = +rangefinder
Hybrid Optic=  +dualoptic
MMS = +mms

self takeallweapons();
self getcurrentweapon();
self getcurrentweaponaltweapon();
self getcurrentoffhand();
self isusingoffhand();
self hasweapon("weapon_name");
self giveWeapon("weapon_name");

if(self sprintbuttonpressed()) self iprintln("SPRINT");
if(self inventorybuttonpressed()) self iprintln("INVENTORY");
if(self secondaryoffhandbuttonpressed()) self iprintln("[{+smoke}]");
if(self fragbuttonpressed()) self iprintln("[{+frag}]");
if(self stancebuttonpressed()) self iprintln("[{+stance}]");
if(self jumpbuttonpressed()) self iprintln("[{+gostand}]");
if(self meleebuttonpressed()) self iprintln("[{+melee}]");
if(self adsbuttonpressed()) self iprintln("[{+speed_throw}]");
if(self actionslotfourbuttonpressed()) self iprintln("[{+actionslot 4}]");
if(self actionslotthreebuttonpressed()) self iprintln("[{+actionslot 3}]");
if(self actionslottwobuttonpressed()) self iprintln("[{+actionslot 2}]");
if(self actionslotonebuttonpressed()) self iprintln("[{+actionslot 1}]");
if(self attackbuttonpressed()) self iprintln("[{+attack}]");
if(self changeseatbuttonpressed()) self iprintln("[{+switchseat}]");
if(self usebuttonpressed()) self iprintln("[{+usereload}]");

//SMG:
mp7_mp
pdw57_mp
vector_mp
insas_mp
qcw05_mp
evoskorpion_mp
peacekeeper_mp

//Assault Rifle:
tar21_mp
type95_mp
sig556_mp
sa58_mp
hk416_mp
scar_mp
saritch_mp
xm8_mp
an94_mp

//Shotgun:
870mcs_mp
saiga12_mp
ksg_mp
srm1216_mp

//LMG:
mk48_mp
qbb95_mp
lsat_mp
hamr_mp

//SNIPER:
svu_mp
dsr50_mp
ballista_mp
as50_mp

//PISTOL:
kard_dw_mp
fnp45_dw_mp
fiveseven_dw_mp
judge_dw_mp
beretta93r_dw_mp
fiveseven_mp
fnp45_mp
beretta93r_mp
judge_mp
kard_mp

//LAUNCHER:
m32_mp
smaw_mp
fhj18_mp
usrpg_mp

//SPECIAL:
knife_mp
knife_held_mp
minigun_mp
riotshield_mp
crossbow_mp
knife_ballistic_mp

//BOMB:
briefcase_bomb_mp
briefcase_bomb_defuse_mp

//MAP SPECIFIC:
vcs_controller_mp //NukeTown 2025

//NADES & EQUIPMENT:

//lethal:
frag_grenade_mp
sticky_grenade_mp
hatchet_mp
bouncingbetty_mp
satchel_charge_mp
claymore_mp

//tactical:
concussion_grenade_mp
willy_pete_mp
sensor_grenade_mp
emp_grenade_mp
proximity_grenade_aoe_mp
proximity_grenade_mp
pda_hack_mp
flash_grenade_mp
trophy_system_mp
tactical_insertion_mp

//MISC:
none
defaultweapon_mp
scavenger_item_mp
scavenger_item_hack_mp
explosive_bolt_mp
smoke_center_mp
destructible_car_mp
explodable_barrel_mp
dogs_mp
dog_bite_mp

//KILLSTREAKS:
cobra_20mm_mp
inventory_supplydrop_mp
supplydrop_mp
ai_tank_drone_rocket_mp
ai_tank_drone_gun_mp
killstreak_ai_tank_mp
inventory_ai_tank_drop_mp
ai_tank_drop_mp
radar_mp
counteruav_mp
radardirection_mp
emp_mp
cobra_20mm_comlink_mp
heli_gunner_rockets_mp
littlebird_guard_minigun_mp
helicopter_comlink_mp
helicopter_guard_mp
helicopter_player_gunner_mp
chopper_minigun_mp
inventory_minigun_mp
inventory_m32_mp
missile_drone_projectile_mp
inventory_missile_drone_mp
missile_drone_mp
missile_swarm_projectile_mp
missile_swarm_mp
planemortar_mp
rc_car_weapon_mp
rcbomb_mp
remote_missile_missile_mp
remote_missile_bomblet_mp
remote_missile_mp
remote_mortar_missile_mp
remote_mortar_mp
qrdrone_turret_mp
killstreak_qrdrone_mp
straferun_gun_mp
straferun_rockets_mp
straferun_mp
auto_gun_turret_mp
microwave_turret_mp
killstreak_remote_turret_mp
autoturret_mp
turret_drop_mp
microwaveturret_mp
microwaveturret_drop_mp

//PERKS:
self clearperks();
self setperk("specialty_additionalprimaryweapon");
self setperk("specialty_armorpiercing");
self setperk("specialty_armorvest");
self setperk("specialty_bulletaccuracy");
self setperk("specialty_bulletdamage");
self setperk("specialty_bulletflinch");
self setperk("specialty_bulletpenetration");
self setperk("specialty_deadshot");
self setperk("specialty_delayexplosive");
self setperk("specialty_detectexplosive");
self setperk("specialty_disarmexplosive");
self setperk("specialty_earnmoremomentum");
self setperk("specialty_explosivedamage");
self setperk("specialty_extraammo");
self setperk("specialty_fallheight");
self setperk("specialty_fastads");
self setperk("specialty_fastequipmentuse");
self setperk("specialty_fastladderclimb");
self setperk("specialty_fastmantle");
self setperk("specialty_fastmeleerecovery");
self setperk("specialty_fastreload");
self setperk("specialty_fasttoss");
self setperk("specialty_fastweaponswitch");
self setperk("specialty_finalstand");
self setperk("specialty_fireproof");
self setperk("specialty_flakjacket");
self setperk("specialty_flashprotection");
self setperk("specialty_gpsjammer");
self setperk("specialty_grenadepulldeath");
self setperk("specialty_healthregen");
self setperk("specialty_holdbreath");
self setperk("specialty_immunecounteruav");
self setperk("specialty_immuneemp");
self setperk("specialty_immunemms");
self setperk("specialty_immunenvthermal");
self setperk("specialty_immunerangefinder");
self setperk("specialty_killstreak");
self setperk("specialty_longersprint");
self setperk("specialty_loudenemies");
self setperk("specialty_marksman");
self setperk("specialty_movefaster");
self setperk("specialty_nomotionsensor");
self setperk("specialty_noname");
self setperk("specialty_nottargetedbyairsupport");
self setperk("specialty_nokillstreakreticle");
self setperk("specialty_nottargettedbysentry");
self setperk("specialty_pin_back");
self setperk("specialty_pistoldeath");
self setperk("specialty_proximityprotection");
self setperk("specialty_quickrevive");
self setperk("specialty_quieter");
self setperk("specialty_reconnaissance");
self setperk("specialty_rof");
self setperk("specialty_scavenger");
self setperk("specialty_showenemyequipment");
self setperk("specialty_stunprotection");
self setperk("specialty_shellshock");
self setperk("specialty_sprintrecovery");
self setperk("specialty_showonradar");
self setperk("specialty_stalker");
self setperk("specialty_twogrenades");
self setperk("specialty_twoprimaries");
self setperk("specialty_unlimitedsprint");