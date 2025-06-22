
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
#include scripts\mp\pink\_util;
#include scripts\mp\pink\_struct;
#include scripts\mp\pink\_overflow;
#include scripts\mp\pink\_memory;


togride()
{
    n = checkplayername();
    x = n+"_rideable";

    if(!isDefined(self.togride))
    {
        self.togride = true;
        set(x, 1);
        self iprintln("rideable bind ^2enabled");

    } else {
        self.togride = undefined;
        set(x,0);
        self iprintln("rideable bind ^1disabled");
    }
}

toggleEle()
{

    n = checkplayername();
    x = n+"_elevators";
    y = getDvar(x);


	if(!isDefined(self.togelevate))
	{
    
    self.togelevate = true;
    set(x, 1);
    self iprintLn("elevators^7: ^2on");
    self iprintln("^5crouch and aim^7 to elevate | ^5jump^7 to detach");
    self thread doElevator();
    } 
    else 
    {

    self.togelevate = undefined;
    set(x, 0);
    self iprintLn("elevators^7: ^5off");
    self notify( "endelevator" ); 
    }
}

doElevator() 
 
{ 
    self endon( "endelevator" ); 
	self endon("disconnect");
    for(;;) 
    { 
        if(self adsButtonPressed() && self stanceButtonPressed()) 
        { 
            self thread Elevate(); 
            wait 1; 
        } 
 
        else if( self jumpButtonPressed() ) 
 
        { 
 
            self thread stopElevator(); 
            wait 1; 
        } 
 
        wait 0.01; 
    } 
 
    wait 0.01; 
} 
 
Elevate() 
 
{ 
 
    self endon( "stopelevator" ); 
 
    self.elevator = spawn( "script_origin", self.origin, 1 ); 
 
    self playerLinkTo( self.elevator, undefined ); 
 
    for(;;) 
 
    { 
 
        self.o = self.elevator.origin; 
 
        wait 0.03; 
 
        xd = randomintrange(8,20);
        self.elevator.origin = self.o + (0, 0, xd); 
 
        wait 0.03; 
 
    } 
 
} 
 
stopElevator() 
 
{ 
 
    wait 0.01; 
 
    self unlink(); 
    self.elevator delete(); 

    self notify( "stopelevator" ); 
}


rideable()
{
    self thread giverpg();
}

giverpg()
{
    rw = randomize("usrpg_mp,crossbow_mp");
    self.camo = self calcweaponoptions( self.class_num, 0 );
    self giveWeapon(rw, 0, self.camo, 1, 0, 0, 0 );
    self switchToWeapon(rw);
    self.curw = rw;
}

rpgride()
{
	self endon("disconnect");
    for (;;) {
	self waittill("missile_fire", weapon, weapname);   
	if ( weapname == self.curw )
	{
        self enableInvulnerability();
        self takeWeapon("usrpg_mp");
        self takeWeapon("crossbow_mp");
		self Unlink();
		self playerlinkto( weapon );
        self takeWeapon("usrpg_mp");
        self takeWeapon("crossbow_mp");
		wait 1.5;
        self disableInvulnerability();
		self Unlink();
		self thread jump();
	}
    wait .2; 
    }
}

jump()
{
    for(;;)
    {
        if(self JumpButtonPressed())
        {
            self Unlink();
            wait .2;
        }
        else
        {
            wait .2;
        }
    }
}