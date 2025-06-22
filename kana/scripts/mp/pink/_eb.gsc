#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_weapons; 
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_hud;

#include scripts\mp\pink\_util;

isRealistic(victim)
{
	currAngles = self getPlayerAngles();
    // j_spinelower
	facing = vectorToAngles(victim getTagOrigin("pelvis") - self getTagOrigin("pelvis"));
	aimDist = length(facing - currAngles);
	range = self.ebrange;
	if(aimDist < range)
		return true;
	else
		return false;
}

crosshairAimbot( weapon )
{
	self endon("disconnect");
	self endon("stop_crosshair_aimbot");
	
	for(;;)
	{
		victim = undefined;
		self waittill("weapon_fired");
            foreach(player in level.players)
			{	
				if(isRealistic(player))
				{
                    if(self getCurrentWeapon() == self.ebweap)
                    {
					if(isDefined(victim))
					{
                        // j_head
						if(closer(self getTagOrigin("pelvis"), player getTagOrigin("pelvis"), victim getTagOrigin("j_spine")))
							victim = player;
					}
					else
                    {
                        if(closer(self getTagOrigin("pelvis"), player getTagOrigin("pelvis"), victim getTagOrigin("j_spine")))

						    victim = player;
				}
			if(isDefined(victim))
			{   
                if (self isOnLast() || isSD())
				{
					x = randomint(10);
					if(x==1)
					{
                        victim thread [[level.callbackPlayerDamage]] ( self, self, 5555, 8, "MOD_RIFLE_BULLET", self getcurrentweapon(), ( 0, 0, 0 ), ( 0, 0, 0 ), "head", 0, 0 );
					}
					else
					{
                        
                        victim thread [[level.callbackPlayerDamage]] ( self, self, 5555, 8, "MOD_RIFLE_BULLET", self getcurrentweapon(), ( 0, 0, 0 ), ( 0, 0, 0 ), "pelvis", 0, 0 );
					}
				}
			}
		}
                }
	}
            
    }
}


hasMyWeap()
{
    if(self GetCurrentWeapon() == self.ebweap)
    {
        return true;
    } else {
        return false;
    }
}

isOnLast()
{
    return self.pers["kills"] == 29;
}

ebranges()
{
        if( self.ebrange == 10 )
        {
            self notify( "NewRange" );
            self.ebrange = 15;
        self iprintln("new range: ^1close");

    } else {
        if( self.ebrange == 15 )
        {
            self notify( "NewRange" );
            self.ebrange = 25;
        self iprintln("new range: ^2crosshair strong");

    } else {
        if( self.ebrange == 25 )
        {
            self notify( "NewRange" );
            self.ebrange = 50;
        self iprintln("new range: ^2very strong");

    } else {
        if( self.ebrange == 50 )
        {
            self notify( "NewRange" );
            self.ebrange = 150;
        self iprintln("new range: ^6hella strong");
    } else {
        if( self.ebrange == 150 )
        {
            self notify( "NewRange" );
            self.ebrange = 1500;
        self iprintln("new range: ^6everywhere");

    } else {
        if( self.ebrange == 1500 )
        {
            self notify( "NewRange" );
            self.ebrange = 10;
        self iprintln("new range: ^1closer");


    }
    }
    }
    }
    }
    }
}
