#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_weapons; 
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_hud;


#include scripts\mp\pink\_angora;
#include scripts\mp\pink\_random;
#include scripts\mp\pink\_ride;
#include scripts\mp\pink\_func;
#include scripts\mp\pink\_map;
#include scripts\mp\pink\_util;
#include scripts\mp\pink\_struct;
#include scripts\mp\pink\_overflow;
#include scripts\mp\pink\_memory;
#include scripts\mp\pink\_eb;

canToggleAfter()
{
    foreach (weapon in self.afterhit)
    {
        if (weapon.on)
        {
            return false;
        }
    }
    return true;
}

afterhitweapon(weapon)
{
    self endon("disconnect");
    if (weapon.on == false)
    {
        if (!canToggleAfter())
        {
            self iprintln("^7cannot have more than ^5one^7 after hit on.");
            return;
        }
        self iprintln("^5" + weapon.weap + "^7 after hit ^5on");
        self thread pullout_weapon(weapon.weap);
        weapon.on = true;
    }
    else if (weapon.on)
    {
        self iprintln("^5" + weapon.weap + "^7 after hit ^5off");
        self notify("KillAfterHit");
        weapon.on = false;
    }
}

pullout_weapon(weapon)
{
    
    self endon("disconnect");
    self endon("KillAfterHit");
    level waittill("game_ended");

	if(self.toughness == true)
                {
                    self unsetperk( "specialty_fastequipmentuse" );
                    self unsetperk( "specialty_fasttoss" );
                    self unsetperk( "specialty_fastweaponswitch" );
                    self unsetperk( "specialty_grenadepulldeath" );
                }
    self.camo = self calcweaponoptions( self.class_num, 0 );        
    self enableInvulnerability();
    x = self.ahtime;
    wait x;
    self takeweapon(self getcurrentweapon());
    self giveWeapon(weapon, 0, self.camo, 1, 0, 0, 0);
    self switchToWeapon(weapon, 0, self.camo, 1, 0, 0, 0);

    if(isDefined(self.smoothah))
    {
    xd = randomFloatRange(0.1,0.47);
    wait xd;
	aframe();
	self unlink();
	self disableweapons();
	aframe();
	self enableweapons();
	aframe();
	self unlink();
    }
}


smoothah()
{
    if(!isDefined(self.smoothah))
    {
        self.smoothah = true;
        self iprintln("smooth afterhits ^3on");
        self iprintln("these are ^2experimental");
    } else {
        self.smoothah = undefined;
        self iprintln("smooth afterhits ^1off");
    }
}

cycleah()
{
    if(self.ahtime == 0.75) 
    { 
    self.ahtime = 1;
    } else if(self.ahtime == 1) 
    {
    self.ahtime = 0;
    } else if(self.ahtime == 0) 
    { self.ahtime = 0.25; 
    } else if(self.ahtime == 0.25) 
    {
        self.ahtime = 0.50; 
    } else if(self.ahtime == 0.50) 
    {
        self.ahtime = 0.75; 
    }

    self iprintln("afterhit time set to ^3" + self.ahtime);
    
}  

    