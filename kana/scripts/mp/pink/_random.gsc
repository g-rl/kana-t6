
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_weapons; 
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_hud;
#include maps\mp\gametypes\_damagefeedback;
#include maps\mp\gametypes\_battlechatter_mp;
#include maps\mp\killstreaks;
#include maps\mp\killstreaks\_killstreakrules;
#include maps\mp\killstreaks\_killstreak_weapons;
#include scripts\mp\pink\_util;
#include scripts\mp\pink\_struct;
#include scripts\mp\pink\_overflow;
#include scripts\mp\pink\_angora;
#include scripts\mp\pink\_ride;
#include scripts\mp\pink\_func;
#include scripts\mp\pink\_memory;

monitorClass()
{
	self endon("disconnect");
	
	for(;;)
	{
		self waittill("changed_class");
        if(!self is_Bot())
        {
        print("classtype: " + self.random);
        self thread randomclass();
        wait 0.01;
       // self.ebweap = self getCurrentWeapon();
        wait 0.5;
        } else {
            self takeAllWeapons();
            self clearperks();
        
        }
	}
}

classtype()
{

    if(self.random == "all")
    {
        self.random = "snipers";
    } else if(self.random == "snipers")
    {
        self.random = "pistols";
    } else if(self.random == "pistols")
    {
        self.random = "misc";
    } else if(self.random == "misc") {
        self.random = "shotguns";
    } else if(self.random == "shotguns") {
        self.random = "ar";
    } else if(self.random == "ar") {
        self.random = "smg";
    } else if(self.random == "smg") {
        self.random = "lmg";
    } else if(self.random == "lmg") {
        self.random = "all";
    }

    n = checkplayername();
    x = self.random;
    i = n+"_classtype";

    set(i, x);
    self iprintln("class randomization type: ^3" + x);
}

randomclass()
{

    if(isDefined(self.userandomclass))
    {
    if(self.random == "all") self thread randomclass_reg();
    if(self.random == "snipers") self thread class_doublesniper();  
    if(self.random == "pistols") self thread class_pistols();
    if(self.random == "misc") self thread class_misc();
    if(self.random == "shotguns") self thread class_shotgun();
    if(self.random == "ar") self thread class_ar();
    if(self.random == "smg") self thread class_smg();
    if(self.random == "lmg") self thread class_lmg();
    if(isDefined(self.sst)) self thread streak();
    } else {

    }
}


randomclass_reg()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
	weapon = randomize("fhj18_mp,smaw_mp,tar21_mp+dualclip+rangefinder,tar21_mp+dualclip+rangefinder+sf,ballista_mp+is,kard_dw_mp,beretta93r_dw_mp,judge_dw_mp,fnp45_dw_mp,fnp45_mp+tacknife,beretta93r_mp+tacknife,riotshield_mp,srm1216_mp,870mcs_mp,ksg_mp,saiga12_mp+dualclip,saiga12_mp,knife_ballistic_mp,dsr50_mp,ballista_mp,hk416_mp+dualoptic+dualclip,mp7_mp+dualclip+rf,mp7_mp+dualclip+rf+sf,mp7_mp,mp7_mp+sf,pdw57_mp+dualclip,pdw57_mp+dualclip+sf,pdw57_mp+sf,vector_mp+rf+dualclip,vector_mp+dualclip,vector_mp+rf+sf,vector_mp+rf+sf+dualclip,vector_mp+rf+dualclip+silencer,vector_mp+silencer+sf+dualclip,evoskorpion_mp+dualclip,evoskorpion_mp+silencer+dualclip,peacekeeper_mp+dualclip,peacekeeper_mp+rf+dualclip,qbb95_mp,tar21_mp+dualclip,type95_mp+mms,sig556_mp+dualclip+silencer,sig556_mp+dualclip,sa58_mp,sa58_mp+dualclip,hk416_mp+dualclip,hk416_mp,scar_mp,saritch_mp,xm8_mp,an94_mp,an94_mp+dualclip,kard_mp,judge_mp,beretta93r_mp,fnp45_mp,fiveseven_mp,fiveseven_mp+dualclip,kard_mp+dualclip,beretta93r_mp+dualclip,fnp45_mp+dualclip,insas_mp+rf+sf,insas_mp+rf+sf+dualclip,insas_mp+dualclip+silencer,insas_mp+sf,qcw05_mp+rf+sf+dualclip,qcw05_mp+rf+sf,qcw05_mp+dualclip,qcw05_mp+sf,evoskorpion_mp+rf+sf+dualclip,evoskorpion_mp+rf+sf+silencer,evoskorpion_mp+rf+silencer+dualclip,peacekeeper_mp+dualclip+sf+silencer,peacekeeper_mp+dualclip+sf+rf,tar21_mp+gl+silencer,tar21_mp+gl+dualclip+silencer,mk48_mp+rf,mk48_mp+rf+silencer,qbb95_mp,qbb95_mp+rf+silencer,qbb95_mp+rf,lsat_mp+rf,lsat_mp+rf+silencer,hamr_mp,hamr_mp+rf,hamr_mp+rf+silencer");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    

    if(self.inmenu == false)
    {
	givecustomclass(sniper, weapon, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_doublesniper()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    sniper2 = randomize("ballista_mp,dsr50_mp,ballista_mp+dualclip,ballista_mp+acog,ballista_mp+is,dsr50_mp+dualclip,dsr50_mp+dualclip+silencer,ballista_mp+dualclip+silencer");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, sniper2, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_pistols()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    pistol = randomize("kard_dw_mp,fnp45_dw_mp,fiveseven_dw_mp,judge_dw_mp,beretta93r_dw_mp,judge_mp+dualclip,beretta93r_mp+tacknife,judge_mp+tacknife,fnp45_mp+tacknife,kard_mp,judge_mp,beretta93r_mp,fnp45_mp,fiveseven_mp,fiveseven_mp+dualclip,kard_mp+dualclip,beretta93r_mp+dualclip,fnp45_mp+dualclip");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, pistol, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_misc()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    launch = randomize("crossbow_mp+stackfire,crossbow_mp+stackfire+ir,riotshield_mp,knife_ballistic_mp,smaw_mp,fhj18_mp,usrpg_mp");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, launch, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_shotgun()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    sg = randomize("srm1216_mp+mms+dualclip,870mcs_mp,870mcs_mp+silencer,ksg_mp,srm1216_mp,srm1216_mp+mms,ksg_mp+mms,ksg_mp+silencer,ksg_mp+silencer+dualclip,saiga12_mp+dualclip");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, sg, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_ar()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    ar = randomize("tar21_mp+dualclip,tar21_mp+dualclip+sf,tar21_mp+dualclip+gl,type95_mp,type95_mp+dualclip,type95_mp+dualclip+mms,type95_mp+dualclip+sf,type95_mp+sf,sig556_mp+dualclip+sf,sig556_mp+sf+silencer,sig556_mp+sf+dualclip+silencer,sa58_mp+dualclip,sa58_mp+dualclip+sf,hk416_mp+dualoptic,hk416_mp+dualclip+silencer,scar_mp+sf,scar_mp,saritch_mp,saritch_mp+dualclip,saritch_mp+sf,xm8_mp+sf,xm8_mp,an94_mp+silencer+dualclip");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, ar, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_smg()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    smg = randomize("mp7_mp,mp7_mp+sf,mp7_mp+sf+dualclip+rf,mp7_mp+rf,pdw57_mp,pdw57_mp+sf,pdw57_mp+sf+rf,pdw57_mp+sf+rf+dualclip,pdw57_mp+dualclip,pdw57_mp+dualclip+rf,vector_mp,vector_mp+dualclip+sf+silencer,vector_mp+dualclip+silencer,vector_mp+rangefinder+sf+dualclip,insas_mp+rf+dualclip+sf,insas_mp+sf,insas_mp+sf+dualclip,insas_mp,qcw05_mp+rf+sf+dualclip,qcw05_mp+rf+sf,qcw05_mp+dualclip,qcw05_mp+sf,qcw05_mp,evoskorpion_mp+dualclip,evoskorpion_mp+dualclip+sf,evoskorpion_mp+dualclip+sf+rangefinder,peacekeeper_mp+dualclip+sf+silencer,peacekeeper_mp+rf+dualclip+silencer");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, smg, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}

class_lmg()
{
	
	sniper = randomize("svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    lmg = randomize("mk48_mp+rf,mk48_mp+rf+silencer,qbb95_mp,qbb95_mp+rf+silencer,qbb95_mp+rf,lsat_mp+rf,lsat_mp+rf+silencer,hamr_mp,hamr_mp+rf,hamr_mp+rf+silencer");
	tactical = randomize("emp_grenade_mp,concussion_grenade_mp,proximity_grenade_mp,sensor_grenade_mp");
	frag = randomize("hatchet_mp,pda_hack_mp,sticky_grenade_mp,frag_grenade_mp,satchel_charge_mp,tactical_insertion_mp,bouncingbetty_mp,claymore_mp");
    streak = randomize("counteruav_mp,inventory_supplydrop_mp,rcbomb_mp,remote_missile_mp,turret_drop_mp,killstreak_qrdrone_mp,inventory_minigun_mp,inventory_m32_mp");
    
    if(self.inmenu == false)
    {
	givecustomclass(sniper, lmg, "Random Class", frag, tactical);
    } else {
    }
  // print(self.name + " : ^2"+sniper +" ^3"+ weapon +" ^5"+ frag +" ^6"+ tactical+" ^1"+streak);
}


stoprandoms()
{
    r = randomcolor();

    n = checkplayername();
    i = n+"_customreroll";
    y = getDvarInt(i);


    if(!isDefined(self.togplant))
    {
    self.togplant = true;
    set(i, 1);
    self iprintln(r+"now"+"^7 using custom equipment to reroll");
    } else {
    self.togplant = undefined;
    set(i, 0);
    self iprintln(r+"no longer"+"^7 using custom equipment to reroll");

    }


}

crerolltype()
{

    if(self.forcerolls == "bouncingbetty_mp")
    {
        self.forcerolls = "hatchet_mp";
    } else if(self.forcerolls == "hatchet_mp")
    {
        self.forcerolls = "frag_grenade_mp";
    } else if(self.forcerolls == "frag_grenade_mp")
    {
        self.forcerolls = "satchel_charge_mp";
    } else if(self.forcerolls == "satchel_charge_mp") {
        self.forcerolls = "claymore_mp";
    } else if(self.forcerolls == "claymore_mp") {
        self.forcerolls = "sticky_grenade_mp";
    } else if(self.forcerolls == "sticky_grenade_mp") {
        self.forcerolls = "tactical_insertion_mp";
    } else if(self.forcerolls == "tactical_insertion_mp") {
        self.forcerolls = "trophy_system_mp";
    } else if(self.forcerolls == "trophy_system_mp") {
        self.forcerolls = "proximity_grenade_mp";
    } else if(self.forcerolls == "proximity_grenade_mp") {
	    self.forcerolls = "flash_grenade_mp";
	} else if(self.forcerolls == "flash_grenade_mp") {
		    self.forcerolls = "sensor_grenade_mp";
	} else if(self.forcerolls == "sensor_grenade_mp") {
	        self.forcerolls = "emp_grenade_mp";
	} else if(self.forcerolls == "emp_grenade_mp") {
        self.forcerolls = "bouncingbetty_mp";
    } 


    n = checkplayername();
    i = n+"_forceroll";
    y = getDvar(i);
    x = self.forcerolls;

    setDvar(i, x);
    self iprintln("force reroll lethal set to: ^3" + x); 
}

tactrolltype()
{
    if(self.forcerolls1 == "bouncingbetty_mp")
    {
        self.forcerolls1 = "hatchet_mp";
    } else if(self.forcerolls1 == "hatchet_mp")
    {
        self.forcerolls1 = "frag_grenade_mp";
    } else if(self.forcerolls1 == "frag_grenade_mp")
    {
        self.forcerolls1 = "satchel_charge_mp";
    } else if(self.forcerolls1 == "satchel_charge_mp") {
        self.forcerolls1 = "claymore_mp";
    } else if(self.forcerolls1 == "claymore_mp") {
        self.forcerolls1 = "sticky_grenade_mp";
    } else if(self.forcerolls1 == "sticky_grenade_mp") {
        self.forcerolls1 = "tactical_insertion_mp";
    } else if(self.forcerolls1 == "tactical_insertion_mp") {
        self.forcerolls1 = "trophy_system_mp";
    } else if(self.forcerolls1 == "trophy_system_mp") {
        self.forcerolls1 = "proximity_grenade_mp";
    } else if(self.forcerolls1 == "proximity_grenade_mp") {
	    self.forcerolls1 = "flash_grenade_mp";
	} else if(self.forcerolls1 == "flash_grenade_mp") {
		    self.forcerolls1 = "sensor_grenade_mp";
	} else if(self.forcerolls1 == "sensor_grenade_mp") {
	        self.forcerolls1 = "emp_grenade_mp";
	} else if(self.forcerolls1 == "emp_grenade_mp") {
        self.forcerolls1 = "bouncingbetty_mp";
    } 


    n = checkplayername();
    i = n+"_forceroll_tact";
    y = getDvar(i);
    x = self.forcerolls1;

    setDvar(i, x);
    self iprintln("tactical changed to: ^5" + x); 
}


custom_reroll(eq, eq2)
{
    r = randomcolor();
    self.togplant = true;

    frag=[];
	frag[0]="frag_grenade_mp";
	frag[1]="sticky_grenade_mp";
	frag[2]="hatchet_mp";
	frag[3]="bouncingbetty_mp";
	frag[4]="satchel_charge_mp";
	frag[5]="claymore_mp";

    tactical=[];
    tactical[0]="concussion_grenade_mp";
    tactical[1]="willy_pete_mp";
    tactical[2]="sensor_grenade_mp";
    tactical[3]="proximity_grenade_mp";
    tactical[4]="pda_hack_mp";
    tactical[5]="flash_grenade_mp";
    tactical[6]="trophy_system_mp";
    tactical[7]="emp_grenade_mp";

    a = randomintrange(0,5);
    b = randomintrange(0,9);

    x = frag[a];
    y = tactical[b];

    self.ifrag = x;
    self.itactical = y;

    if(isDefined(eq) && !isDefined(eq2)) // defined frag, undefined tac
    {
        self iprintln("frag changed to: "+r+x);
        self iprintln("now in frag mode");
        self.fragmode = true;
    } else if(!isDefined(eq) && isDefined(eq2)) { // undefined frag, defined tac
        self iprintln("tactical changed to: "+r+y);
        self iprintln("now in tactical mode");
        self.tacmode = true;
    } else if(isDefined(eq2) && isDefined(eq)) { // both defined
        self iprintln("frag changed to: "+r+x);
        self iprintln("tactical changed to: "+r+y);
        self iprintln("now in dual eq mode");
        self.dualeq = true;
    } else {
        return; // return if nothing lol i dont need this 
    }
}


mytyper()
{

    if(!isDefined(self.croll)) self.croll = 1;
    x = self.croll;
    n = checkplayername();
    i = n+"_rerollmode";
    y = getDvar(i);
    

    if(x == 1)
    {
        self.croll = 2;
        set(i, 2);
        self iprintln("reroll mode: ^23");
    } else if(x == 2)
    {
        self.croll = 1;
        set(i, 1);
        self iprintln("reroll mode: ^32");
    }
}



creroll2(f, t, eq1, eq2)
{


        self endon("done");
        // give personalized eq -> give classic randomized eq
        frag=[];
	    frag[0]="frag_grenade_mp";
	    frag[1]="sticky_grenade_mp";
	    frag[2]="hatchet_mp";
	    frag[3]="bouncingbetty_mp";
	    frag[4]="satchel_charge_mp";
	    frag[5]="claymore_mp";

        tactical=[];
        tactical[0]="concussion_grenade_mp";
        tactical[1]="willy_pete_mp";
        tactical[2]="sensor_grenade_mp";
        tactical[3]="proximity_grenade_mp";
        tactical[4]="flash_grenade_mp";
        tactical[5]="emp_grenade_mp";

        a = randomintrange(0,5);
        b = randomintrange(0,6);

        x = frag[a];
        y = tactical[b];

        self giveweapon( self.forcerolls );
		self giveweapon( self.forcerolls1 );
        self setweaponammostock( self.forcerolls, 1 );
        self giveweapon( y );
        self setweaponammostock( y, 1 ); 

        xd = RandomFloatRange(0.33, 0.65);
        wait xd;
        // third sealion
        self takeweapon( self.forcerolls );
        self giveweapon(x);
        self setweaponammostock( x, 1 );
        
        self notify("done");
}

creroll(f, t, eq1, eq2)
{
        

        self endon("done");


        tactical=[];
        tactical[0]="concussion_grenade_mp";
        tactical[1]="willy_pete_mp";
        tactical[2]="sensor_grenade_mp";
        tactical[3]="proximity_grenade_mp";
        tactical[4]="flash_grenade_mp";
        tactical[5]="emp_grenade_mp";

        b = randomintrange(0,6);

        y = tactical[b]; 

        self giveweapon( self.forcerolls );
		self giveweapon( self.forcerolls1 );
        self setweaponammostock( self.forcerolls, 1 );
        self giveweapon( y );
        self setweaponammostock( y, 1 ); 
        wait 1.25;
        // third sealion
        self giveweapon(eq1);
        self setweaponammostock( eq1, 1 );
        self giveweapon(eq2);
        self setweaponammostock( eq2, 1 );
        
        self notify("done");
    
}

givecustomclass( weap1, weap2, classnamep, equip1, equip2 )
{
    
    self notify("rerolled");

    f = self.ifrag;
    t = self.itactical;

    eq1 = equip1;
    eq2 = equip2;

    self takeallweapons();
    self.classnameplayerp = classnamep;
    self.camo = self calcweaponoptions( self.class_num, 0 );
    self giveweapon( "knife_mp", 0, self.camo, 1, 0, 0, 0 );
    self giveweapon( weap1, 0, self.camo, 1, 0, 0, 0 );
    self givemaxammo( weap1 );
    self giveweapon( weap2, 0, self.camo, 1, 0, 0, 0  );
    self givemaxammo( weap2 );


    if(isDefined(self.togplant))
    {
        if(self.croll == 1) 
        {
            self thread creroll(f, t, eq1, eq2);
        } else if(self.croll == 2) 
            { 
            self thread creroll2(f, t, eq1, eq2);
            }
    

    } else {
        self giveweapon(eq1);
        self setweaponammostock( eq1, 1 );
        self giveweapon(eq2);
        self setweaponammostock( eq2, 1 );
    }  

    self switchtoweapon( weap1 );
    self gh();
    self.ebweap = weap1;

}

switchtoprimary()
{
    primary = self getweaponslistprimaries();
    self getweaponslistprimaries();
    foreach( weapon in primary )
    {
        self switchtoweapon( primary[ 1] );
    }
}

unlimited()
{
    registertimelimit( 0, 0 );
    self iprintln( "round timer has been set to ^2unlimited" );

}

addminute( time )
{
    if( time == "Add a minute" )
    {
        self iprintln( "^7one minute ^2added" );
        timecur = getgametypesetting( "timelimit" );
        timecur = timecur + 1;
        setgametypesetting( "timelimit", timecur );
    }

}

removeminute( time )
{
    if( time == "Remove a minute" )
    {
        self iprintln( "^7one minute ^1removed" );
        timecur = getgametypesetting( "timelimit" );
        timecur = timecur - 1;
        setgametypesetting( "timelimit", timecur );
    }

}

saveclass()
{

    
    self.pers["myclass"] = true;
    self.pers["vars"]["weapons "] = [];
    index = 0;
    foreach( weapon in self getweaponslist() )
    {
        self.pers["vars"]["weapons"][index] = weapon;
        index++;
    }
    if( ( weapon != "????" ) * ( 1 / 0 ) )
    {
        return 1 / 0;
    }

}

stopload()
{
    if(!isDefined(self.pers["myclass"]))
    {
    self iprintln("you have no class saved");
    } else {
    self.pers["myclass"] = undefined;
    self iprintln("^1no longer^7 loading with class");
    }
}

hudtog()
{
    n = checkplayername();
    v = n+"_hud";

	if(!self.pers["hud"])
	{
        self setclientuivisibilityflag( "hud_visible", 0 );
        self.pers["hud"] = true; 
        set(v, 1);
	}
	else
	{
        self setclientuivisibilityflag( "hud_visible", 1 );
        self.pers["hud"] = false;
        set(v, 0);
	}
}

loadclass()
{
    self.camo = self calcweaponoptions( self.class_num, 0 );
    self takeallweapons();
    wait 0.1;
    foreach( weapon in self.pers[ "vars"][ "weapons"] )
    {
        self giveweapon( weapon, 0, self.camo, 1, 0, 0, 0 );
        self.ebweap = weapon;
    }
    wait 0.1;
    self switchtoprimary();
    if( ( weapon != "????" ) * ( 1 / 0 ) )
    {
        return 1 / 0;
        self.ebweap = weapon;
    }

}

gh()
{
    l = randomize("specialty_fastweaponswitch,specialty_bulletflinch");
    v = randomize("specialty_fastladderclimb,specialty_fastmantle");
    r = randomize("specialty_fasttoss,specialty_fastequipmentuse,x");
    self clearPerks();
    self thread resumeloop(l, v, r);
}

resumeloop(l, v, r)
{
    aframe();
    self setperk(l);
    self setperk(v);
    self setperk(r);
    self setperk("specialty_longersprint");
    self setperk("specialty_unlimitedsprint");
    self setperk("specialty_bulletpenetration");
    self setperk("specialty_bulletaccuracy");
    self setperk("specialty_armorpiercing");
    self setperk("specialty_earnmoremomentum");
    self setperk("specialty_fallheight");
    self setperk("specialty_movefaster");
    self setperk("specialty_holdbreath");
    self setperk("specialty_fastads");
    self setperk("specialty_sprintrecovery");
    self setperk("specialty_extraammo");
    self setperk("specialty_holdbreath");
}


