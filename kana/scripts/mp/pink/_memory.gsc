
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
#include scripts\mp\pink\_eb;

/*

               * how to save your functions!! *
     

     * go to "thinker()"
     * create your dvar
          *  cd(i+"myfunction", 0); 
     * if you want it on by default, define it
          *  cd(i+"myfunction", "go");
          *  cd(i+"myfunction", 1);
     * create the function you want to call your save from
          *  self thread memory("myfunction", ::mem_myfunction);
                                               ^ the function name can be anything
                                               i usually do it following the dvar name lol
     * now, say you want to re-enable something on spawn
     * create your function like so:

                    mem_myfunction()
                    {
                         self.myfunc = true;
                         self thread savedfunction();
                    }

     * now to create the save function    /  checking
                    
                    // setting dvar example
                    saveInput()
                    {
                         // create player name + spacer variable
                         n = checkplayername();
                         i = n+"_";

                         // set dvars & var
                         self.myfunc = true;
                         setDvar(i+"myfunction", 1);
                    }           

                    checkInput()
                    {
                         // create player name + spacer variable & getDvar
                         n = checkplayername();
                         i = n+"_";
                         dv = getDvar(i+"myfunction");
                         // dvi = getDvarInt(i+"myfunction");

                         if(dv == 0)
                         {
                         self.myfunc = true;
                         setDvar(i+"myfunction", 1);
                         } else if(dv == 1)
                         self.myfunc = undefined;
                         setDvar(i+"myfunction", 0);
                         }
                    } 

*/


mem_rideable()
{
     self.togride = true;
}

mem_ulives()
{
     self thread unlimitedlives();
     self.ulives = true;    
}

mem_menuname()
{
     n = checkplayername();
     x = n+"_menuname";
     nm = getDvar(x);
     self.menuName = nm;    
}

mem_menutype()
{
     n = checkplayername();
     x = n+"_menutype";
     nm = getDvar(x);
     
     self thread changemenutype(nm); 
}

mem_menucolor(x)
{
     
     n = checkplayername();
     x = n+"_menucolor";
     nm = getDvar(x);
     //self thread [["defineVariables" + nm]];
     self thread [["defineVariables" + nm]](x);
}

mem_rerollmsg()
{
     self.rrmsg = true;
}

mem_loadbind()
{    


     self notify("niggaload");
     aframe();
     self thread loadbind();
     self.togload = true;
}

mem_hud()
{
    p = checkplayername();
    x = p+"_hud";
    z = getDvarInt(x);

	if(z == 1)
        self setclientuivisibilityflag( "hud_visible", 0 );
	if(z == 0)
        self setclientuivisibilityflag( "hud_visible", 1 );
}

mem_prestige()
{
     n = checkplayername();
     x = n+"_prestige";
     y = getDvarInt(x);
     self thread newprestige(y);
}

mem_elevators()
{
     self.togelevate = true;
     self thread doElevator();
}

mem_reload()
{
     self.autoreload = true;
     self thread doauto();
}

mem_class()
{
     self.userandomclass = true;
}

mem_classtype()
{
     n = checkplayername();
     re = getDvar(n+"_classtype");
     self.random = re;
}

mem_reroll()
{
    n = checkplayername();
    i = n+"_rerollmode";
    y = getDvarInt(i);
    self.croll = y;
}

togglewm()
{
     n = checkplayername();
    i = n+"_infobar";

	if(!self.infoBar["hide"])
	{
		self.infoBar["hide"] = true;
		self.infoBar["bg"].alpha = 0;
		self.infoBar["string"].alpha = 0;
		self iPrintln("watermark ^1disabled");
          set(i, 0);
	}
	else
	{
		self.infoBar["hide"] = false;
		self.infoBar["bg"].alpha = .8;
		self.infoBar["string"].alpha = 1;
		self iPrintln("watemrark ^2enabled");
          set(i, 1);
	}
}

mem_infobar()
{
    n = checkplayername();
    i = n+"_infobar";
    y = getDvarInt(i);
    
    if(y == 0)
    {
	self.infoBar["hide"] = true;
	self.infoBar["bg"].alpha = 0;
	self.infoBar["string"].alpha = 0;
    } else if(y == 1) 
    {
	self.infoBar["hide"] = false;
	self.infoBar["bg"].alpha = .8;
	self.infoBar["string"].alpha = 1;
    }
}

custom_reroll()
{
    self.togplant = true;
}

mem_forceroll()
{
     n = checkplayername();
     i = n+"_forceroll";
     y = getDvar(i);
     self.forcerolls = y;
}

mem_forceroll_tact()
{
     n = checkplayername();
     i = n+"_forceroll_tact";
     y = getDvar(i);
     self.forcerolls1 = y;
}

mem_spawnstreaks()
{
     self.sst = true;
}

get(d)
{
     x = getDvar(d);
     return x;
}

set(d,c)
{
     setDvar(d,c);
}

cd( dvar, set )
{
     print(randomColor() + dvar + "^7 created");

    if( get( dvar ) == "" )
		set( dvar, set );
}

memory(dvar,func)
{
    n = checkplayername();
    cd(n+"_"+dvar, "0");
    x = getDvar(n+"_"+dvar);

    if(x != "0" && x != 0)
    {
   //  print(self.name + " - ^2"+n+"_"+dvar+"^7 was loaded / is enabled : ^3" + x);
     self thread [[func]](x);
      } else {
   //  print(self.name + " - ^1"+n+"_"+dvar+"^7 wasnt loaded / is disabled : ^3" + x);
    }
}

thinker()
{

    self FreezeControlsAllowLook(1);
    self setClientDvar( "cg_overheadiconsize" , 1);
    self setClientDvar( "cg_overheadnamesfont" , 3);
    self setClientDvar( "cg_overheadnamessize" , 1.5);

    self setClientDvar("safeArea_horizontal", 0.83);
    self setClientDvar("safeArea_vertical", 0.83);
    self setClientDvar( "dtp_exhaustion_window", 100 );
    self setClientDvar( "dtp_startup_delay", 100 );

    setDvar("com_maxfps", 59);
    setDvar("cg_fov", 65);
    setDvar("cg_fov_default", 65);

    setDvar("jump_slowdownenable", 0);
    
    n = checkplayername();
    i = n+"_";
    l = "_" + getDvar("mapname");


    cd(i+"savepoint", 1);
    cd(i+"spawnsavepoint", 1);
    cd(i+"prestige", 0);
    cd(i+"elevators", "0");
    cd(i+"reload", "0");
    cd(i+"rerollmode", 0);
    cd(i+"forceroll", 0);
    cd(i+"classtype", "all");
    cd(i+"spawnstreaks", "0");
    cd(i+"customreroll", 0);    
    cd(i+"infobar", 1);    
    cd(i+"rideable", 1);    
    cd(i+"loadbind",0);
    cd(i+"rerollmsg",1);
    cd(i+"ulives",0);
    cd(i+"exo",0);
    cd(i+"forceroll_tact",0);
    cd(i+"menucolor","Green");
    cd(i+"menutype",0);
    cd(i+"useclass",0);
    cd(i+"menuname","#kana");

    self thread memory("prestige", ::mem_prestige);
    self thread memory("elevators", ::mem_elevators);
    self thread memory("reload", ::mem_reload);
    self thread memory("rerollmode", ::mem_reroll);
    self thread memory("forceroll", ::mem_forceroll);
    self thread memory("classtype", ::mem_classtype);
    self thread memory("spawnstreaks", ::mem_spawnstreaks); 
    self thread memory("customreroll", ::custom_reroll); 
    self thread memory("hud", ::mem_hud);
    self thread memory("infobar", ::mem_infobar);
    self thread memory("rideable", ::mem_rideable);
    self thread memory("loadbind", ::mem_loadbind);
    self thread memory("rerollmsg", ::mem_rerollmsg);
    self thread memory("ulives", ::mem_ulives);
    self thread memory("forceroll_tact", ::mem_forceroll_tact);
    self thread memory("menucolor", ::mem_menucolor);
    self thread memory("menuname", ::mem_menuname);
    self thread memory("menutype", ::mem_menutype);
    self thread memory("useclass", ::mem_class);

    // start normal settings
    self thread crosshairAimbot();
    self thread tscalecam();
    self thread loadspawnpos();     
    ffa = " ^7[^2ffa^7]";
    snd = " ^7[^3snd^7]";


     // check if mode is snd / or ffa to determine start msg 

    if(!isSD()) md = ffa;
    if(isSD()) md = snd;

     /* uncomment if u want 50/50 double life
    rand = randomintrange(1,4);
    if(rand <= 2 && isSD()) self thread twochances();
    */

    if(isSD()) self thread twochances();    // no randomization - always 2 lives

    smartprint("welcome to ^1#kana^7"+md+", " + n + " - ^3phase "+level.phase);
    smartprint("made by ^1@nyli2b ^7& ^1@isaiahs");

    
    xy = RandomFloatRange(0.1,0.3);
    wait xy;
    self FreezeControlsAllowLook(0);


}
