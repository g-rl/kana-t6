
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_weapons; 
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_killcam;
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
#include scripts\mp\pink\_afterhits;

init()
{ 
    startup();
	//thread overflowfix();    
}

onconnect()
{
    for(;;) 
    {
        level waittill( "connecting", player );
        player thread onspawned();
        player thread matchbonusthread();
        player thread monitorClass(); 
		player thread overflowFixInit();
        game["strings"]["change_class"] = undefined; 
        

        if(!isDefined(player.pers["luckynumber"]))
        {
        v = randomintrange(0,12000); 
        player.pers["luckynumber"] = v;
        }
    }
}

onspawned() 
{
    self endon("disconnect");
    level endon("game_ended");

    self.mc = "^1"; 
    self.menuName = "#kana";
    self.inmenu = false;
    self.stopThreading = false;
    self.first = undefined;
    self.pers["myclass"] = undefined;
    self.infoBar = [];
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
	self.infoBar["normalOpen"] = "[{+actionslot 2}] / [{+actionslot 1}] = scroll    [{+usereload}] = select    [{+stance}] = back    [{+melee}] = exit";
	self.infoBar["invertedOpen"] = "[{+attack}] / [{+speed_throw}] = scroll    [{+usereload}] = select    [{+stance}] = back    [{+melee}] = exit";

    init_afterhit();

    for(;;)
    {

        self waittill("spawned_player");

       // if(self is_bot()) self setClantag("2");

        if(!self is_Bot())
        {

        if( !self.stopThreading )
        {
            self playerSetup();
            self.stopThreading = true;
        }

        self freezecontrols(false);

        self thread equipment15cooldown(); 
        self thread MW2EndGame1();
        self thread spawndvar();
        
        self.pers["unstuck_origin"] = self.origin;
        r = randomfloatrange(0.6,1.95);
        self.ebrange = r;

		if(self.isFirstSpawn == true)
		{

			self.isFirstSpawn = false;
            self.lw = true;
            self.sst = undefined;
            self.timescaler = undefined;
            self.ahtime = 0.75;
            self.userandomclass = true;
            self.forcerolls = "claymore_mp";
            self.forcerolls1 = "frag_grenade_mp";

            self thread thinker();

            if(self hoster() && !isDefined(self.notdeadyet) && isSD())
            {
				self thread sd_bot_manager();
	           // level thread cratesaving();
                
            }
		} 


        self thread monitors();
        self thread rpgride();
        self thread randomclass();
        if(isDefined(self.pers["myclass"])) self thread loadclass();
        self last();

        } else {
        self thread newprestige(randomintrange(0,16));
        self thread fixbots();
        }
        self notify("nigga");
        self newspawn();
     }

}

startup()
{

    initInit();
    dvarDvar();

    

    //pink_strings();
    level.phase = 2.0;
    level.esps = "hud_remote_missile_target";
	level.icontest = "line_horizontal";
    level.kctype = "game_ended";   
    level.callDamage = level.callbackPlayerDamage;
    level.callbackPlayerDamage = ::overwriteDamage;
    
    level configureBouncers();
    level configureTeleporters();
    level configurePlatforms();

	level thread skyNoMore();
    level thread removeNewBarriers();   
    level thread riotshieldPlacement();
    level thread createMapEdits();
    level thread onconnect();  

    autobotspawnfunctioning();
}


pink_strings()
{
	game["strings"]["pregameover"] = "^6Pink";
	game["strings"]["waiting_for_teams"] = "^6Starting Pack";
	game["strings"]["intermission"] = "^6Pink";
	game["strings"]["draw"] = "^6Pink";
	game["strings"]["round_draw"] = "^6Pink";
	game["strings"]["round_win"] = "^6Pink";
	game["strings"]["round_loss"] = "^6Pink";
	game["strings"]["victory"] = "^6Pink";
	game["strings"]["defeat"] = "^6Pink";
	game["strings"]["game_over"] = "^6Pink";
	game["strings"]["halftime"] = "^6Pink";
	game["strings"]["overtime"] = "^6Pink";
	game["strings"]["roundend"] = "^6Pink";
	game["strings"]["intermission"] = "^6Pink";
	game["strings"]["side_switch"] = "^6Pink";
	game["strings"]["MATCH_BEGINS_IN"] = "^6Starting Pack";
	game["strings"]["match_starting_in"] = "^6Starting Pack";
    game["strings"]["change_class"] = undefined; 

}
