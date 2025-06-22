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
#include scripts\mp\pink\_overflow;
#include scripts\mp\pink\_afterhits;
#include scripts\mp\pink\_memory;
#include scripts\mp\main;
// menu layout

menuPageOne( menu )
{
    self add_menu("main", getMenuName());

    if( self getVerfication() > 0 )
    {
        self add_option(self.name + " settings", ::controlMenu, "nm", "settings"); 
        self add_option("customs", ::controlMenu, "nm", "customs"); 
        self add_option("class", ::controlMenu, "nm", "class type");
        self add_option("position", ::controlMenu, "nm", "position"); 
        self add_option("spawnables", ::controlMenu, "nm", "spawnables");
        self add_option("afterhits", ::controlMenu, "nm", "afterhits");
        self add_option("match", ::controlMenu, "nm", "match"); 
        self thread sdopt();
    }

    if( isDefined(menu) ) 
        return;

    self add_menu("settings", "settings", "main");
    self add_option("auto reload", ::autoreload);
    self add_option("fake elevators", ::toggleEle);
    self add_option("streaks", ::streak);
    self add_option("exo suits", ::toggle_exo);
    self add_option("better lunges", ::knifejump);
    self add_option("toggle hud", ::hudtog);
    self add_option("floaters", ::floateronoff);
    self add_option("ladder mod", ::laddermod);
    //self add_option("fall damage", ::fall);
    self add_option("drop canswap bind", ::disablecanswap);
   // self add_option("fix button monitoring", ::monitors);
    self add_option("watermark", ::togglewm);
    self thread sdopt2();
	self thread smoothhostonly();

    self add_menu("position", "position", "main");
    self add_option("save pos", ::savepos);
    self add_option("load pos", ::loadpos);
    self add_option("unset pos", ::unsetspawn);
    self add_option("load bind", ::togload);

    self add_menu("class type", "class type", "main");
    self add_option("toggles", ::controlMenu, "nm", "toggles");
    self add_option("use random classes", ::useclass);
    self add_option("change class type", ::classtype);
    self add_option("custom rerolls", ::controlMenu, "nm", "custom rerolls");
    self add_menu("custom rerolls", "custom rerolls", "class type");
    self add_option("toggle custom rerolls", ::stoprandoms);
    self add_option("reroll type", ::mytyper);
    self add_option("force reroll lethals", ::crerolltype);
	self add_option("change tactical equipment", ::tactrolltype);

    self add_menu("toggles", "toggles", "class type");
    self add_option("save class", ::saveclass);
    self add_option("load class", ::loadclass);
    self add_option("spawn with streaks", ::spawnstreaks); 
    self add_option("reroll messages", ::togmsg);
    self add_option("toggle rideable bind", ::togride); 
    self add_option("stop spawning w/ class", ::stopload);

    self add_menu("customs", "customs", "main");
    self add_option("spoof prestige", ::controlMenu, "nm", "spoof prestige"); 
	self add_option("change menu color", ::controlMenu, "nm", "change menu color"); 
    // self add_option("change menu type", ::controlMenu, "nm", "change menu type"); - uncomment once i fix menu name updating
    self add_menu("spoof prestige", "spoof prestige", "customs");
    self add_option("0", ::newprestige_msg, 0);
    self add_option("1", ::newprestige_msg, 1);
    self add_option("2", ::newprestige_msg, 2);
    self add_option("3", ::newprestige_msg, 3);
    self add_option("4", ::newprestige_msg, 4);
    self add_option("5", ::newprestige_msg, 5);
    self add_option("6", ::newprestige_msg, 6);
    self add_option("7", ::newprestige_msg, 7);
    self add_option("8", ::newprestige_msg, 8);
    self add_option("9", ::newprestige_msg, 9);
    self add_option("10", ::newprestige_msg, 10);
    self add_option("11", ::newprestige_msg, 11);
    self add_option("12", ::newprestige_msg, 12);
    self add_option("13", ::newprestige_msg, 13);
    self add_option("14", ::newprestige_msg, 14);
    self add_option("15", ::newprestige_msg, 15);
    self add_option("16", ::newprestige_msg, 16);
    self add_menu("change menu color", "change menu color", "customs");
    self add_option("pink", ::defineVariablesPink);
	self add_option("blue", ::defineVariablesBlue);
	self add_option("yellow", ::defineVariablesYellow);
	self add_option("green", ::defineVariablesGreen);
	self add_option("red", ::defineVariablesRed);
	self add_option("orange", ::defineVariablesOran);
	self add_option("purple", ::defineVariablesPurple);

    self add_menu("change menu type", "change menu type", "customs");
    self add_option("#pinkpkg", ::changemenutype, "Pink");
	self add_option("#kana", ::changemenutype, "Blood");

    self add_menu("match", "match", "main"); 

    self add_option("timescale", ::controlMenu, "nm", "timescale"); 
    self add_option("add minute", ::addminute);
    self add_option("remove minute", ::removeminute);   
    self add_option("unlimited time", ::unlimited);

    self add_menu("timescale", "timescale", "match");
    self add_option("change killcam mode", ::kctype);
    self add_option(".75", ::tscale, 0.75);
    self add_option(".50", ::tscale, 0.5);
    self add_option(".25", ::tscale, 0.25);

    self add_menu("spawnables", "spawnables", "main");
	self add_option("bounce to crosshair", ::spawnbounce);
	self add_option("vertical crate to crosshair", ::slidesnormal);
	self add_option("repeater crate to crosshair", ::spawnrepeater2);
	self add_option("care package stall", ::spawnstall );
	self add_option("repeater crate", ::spawnrepeater);

	self add_menu("afterhits", "afterhits", "main");
    self thread smoothahonly();
    self add_option("afterhit time", ::cycleah); 
    
    self add_option("mtar", ::afterhitweapon, self.afterhit[0]);
    self add_option("fhj", ::afterhitweapon, self.afterhit[1]);
    self add_option("death machine", ::afterhitweapon, self.afterhit[2]);
    self add_option("tac 45", ::afterhitweapon, self.afterhit[3]);
    self add_option("b23r", ::afterhitweapon, self.afterhit[4]);
    self add_option("bomb briefcase", ::afterhitweapon, self.afterhit[5]);
    self add_option("knife flip", ::afterhitweapon, self.afterhit[7]);
    self add_option("remington", ::afterhitweapon, self.afterhit[8]);
    self add_option("ballistic knives", ::afterhitweapon, self.afterhit[9]);
    self add_option("vector", ::afterhitweapon, self.afterhit[10]);
    self add_option("crossbow", ::afterhitweapon, self.afterhit[11]);
    self add_option("ballista", ::afterhitweapon, self.afterhit[12]); 
    self add_option("uav", ::afterhitweapon, self.afterhit[13]); 
    self add_option("claymore mala", ::afterhitweapon, self.afterhit[14]);  
    self add_option("ipad", ::afterhitweapon, self.afterhit[15]);  
    self add_option("default weapon", ::afterhitweapon, self.afterhit[16]);  
    self add_option("dual executioners", ::afterhitweapon, self.afterhit[18]);  
    self add_option("dual b23r", ::afterhitweapon, self.afterhit[19]);  
    self add_option("type 25", ::afterhitweapon, self.afterhit[20]);  
    self add_option("claymore", ::afterhitweapon, self.afterhit[24]);  

   // self add_menu("binds", "binds", "main");
   // self add_option("its working", ::test);
}

sdopt()
{
    if(isSD() && hoster())
    {
        self add_option("switch bot teams", ::switchbots);
    }
}

sdopt2()
{
    if(isSD())
    {
        self add_option("back to spawn", ::gospawn);
        self add_option("randomize rounds", ::setthescore);
        self add_option("respawn team", ::respawnteam);
    }
}

smoothhostonly()
{
	if(!self isHost())
	{
		self add_option("smooth anims", ::dosmooth);
	}
}

smoothahonly()
{
	if(!self isHost())
	{
		self add_option("smooth afterhits", ::smoothah);
	}
}

