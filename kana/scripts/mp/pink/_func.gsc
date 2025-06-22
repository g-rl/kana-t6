
#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_weapons; 
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_hud;
#include maps\mp\killstreaks\_supplydrop;
#include maps\mp\killstreaks\_ai_tank;
#include maps\mp\killstreaks\_airsupport;
#include maps\mp\killstreaks\_dogs;
#include maps\mp\killstreaks\_radar;
#include maps\mp\killstreaks\_emp;
#include maps\mp\killstreaks\_helicopter;
#include maps\mp\killstreaks\_helicopter_guard;
#include maps\mp\killstreaks\_helicopter_gunner;
#include maps\mp\killstreaks\_killstreakrules;
#include maps\mp\killstreaks\_killstreak_weapons;
#include maps\mp\killstreaks\_missile_drone;
#include maps\mp\killstreaks\_missile_swarm;
#include maps\mp\killstreaks\_planemortar;
#include maps\mp\killstreaks\_rcbomb;
#include maps\mp\killstreaks\_remote_weapons;
#include maps\mp\killstreaks\_remotemissile;
#include maps\mp\killstreaks\_remotemortar;
#include maps\mp\killstreaks\_qrdrone;
#include maps\mp\killstreaks\_spyplane;
#include maps\mp\killstreaks\_straferun;
#include maps\mp\killstreaks\_turret_killstreak;
#include maps\mp\killstreaks\_killstreaks;

#include scripts\mp\pink\_angora;
#include scripts\mp\pink\_random;
#include scripts\mp\pink\_ride;
#include scripts\mp\pink\_func;
#include scripts\mp\pink\_util;
#include scripts\mp\pink\_struct;
#include scripts\mp\pink\_overflow;
#include scripts\mp\pink\_memory;
#include scripts\mp\pink\_map;
#include scripts\mp\pink\main;

newprestige_msg(x)
{
    self thread newprestige(x);
    self iprintln("prestige set to ^3" + x);
    n = checkplayername();
    set(n+"_prestige", x);
}

useclass()
{
    n = checkplayername();

    if(!isDefined(self.userandomclass))
    {
        set(n+"_useclass", 0);
        self.userandomclass = true;
        self iprintln("using random classes");
    } else {
        set(n+"_useclass", 1);
        self.userandomclass = undefined;
        self iprintln("using custom classes");
    }
}


newprestige(dd)
{
	self notify("stoprandoms");

    if(self is_Bot()) rank = 55;
	else rank = getrank();

	self.pers["customrank"] = true;
	self.pers["newpres"] = dd;

	self setRank(rank, dd);
	self maps\mp\gametypes\_rank::syncxpstat();
    n = checkplayername();
    set(n+"_prestige", dd);

}

init_afterhit()
{

        self.afterhit[0] = SpawnStruct();
        self.afterhit[0].weap = "tar21_mp";
        self.afterhit[0].on = false;

        self.afterhit[1] = SpawnStruct();
        self.afterhit[1].weap = "fhj18_mp";
        self.afterhit[1].on = false;

        self.afterhit[2] = SpawnStruct();
        self.afterhit[2].weap = "minigun_mp";
        self.afterhit[2].on = false;

        self.afterhit[3] = SpawnStruct();
        self.afterhit[3].weap = "fnp45_mp";
        self.afterhit[3].on = false;

        self.afterhit[4] = SpawnStruct();
        self.afterhit[4].weap = "beretta93r_mp";
        self.afterhit[4].on = false;

        self.afterhit[5] = SpawnStruct();
        self.afterhit[5].weap = "briefcase_bomb_mp";
        self.afterhit[5].on = false;

        self.afterhit[7] = SpawnStruct();
        self.afterhit[7].weap = "knife_held_mp";
        self.afterhit[7].on = false;
    
        self.afterhit[8] = SpawnStruct();
        self.afterhit[8].weap = "870mcs_mp";
        self.afterhit[8].on = false;

        self.afterhit[9] = SpawnStruct();
        self.afterhit[9].weap = "knife_ballistic_mp";
        self.afterhit[9].on = false;

        self.afterhit[10] = SpawnStruct();
        self.afterhit[10].weap = "vector_mp";
        self.afterhit[10].on = false;

        self.afterhit[11] = SpawnStruct();
        self.afterhit[11].weap = "crossbow_mp";
        self.afterhit[11].on = false;

        self.afterhit[12] = SpawnStruct();
        self.afterhit[12].weap = "ballista_mp";
        self.afterhit[12].on = false;

        self.afterhit[13] = SpawnStruct();
        self.afterhit[13].weap = "radar_mp";
        self.afterhit[13].on = false;

        self.afterhit[14] = SpawnStruct();
        self.afterhit[14].weap = "claymore_mp";
        self.afterhit[14].on = false;

     
        self.afterhit[15] = SpawnStruct();
        self.afterhit[15].weap = "rcbomb_mp";
        self.afterhit[15].on = false;   
        
        self.afterhit[16] = SpawnStruct();
        self.afterhit[16].weap = "defaultweapon_mp";
        self.afterhit[16].on = false;   


        self.afterhit[18] = SpawnStruct();
        self.afterhit[18].weap = "judge_dw_mp";
        self.afterhit[18].on = false;   

        self.afterhit[19] = SpawnStruct();
        self.afterhit[19].weap = "beretta93r_dw_mp";
        self.afterhit[19].on = false;   

        self.afterhit[20] = SpawnStruct();
        self.afterhit[20].weap = "type95_mp";
        self.afterhit[20].on = false;   

        self.afterhit[21] = SpawnStruct();
        self.afterhit[21].weap = "trophy_system_mp";
        self.afterhit[21].on = false;   

        self.afterhit[22] = SpawnStruct();
        self.afterhit[22].weap = "pda_hack_mp";
        self.afterhit[22].on = false;

        self.afterhit[24] = SpawnStruct();
        self.afterhit[24].weap = "claymore_mp";
        self.afterhit[24].on = false;

}



riotshieldPlacement() 
{
    level endon("game_ended");

    for(;;) 
    {
        level waittill("riotshield_planted", owner);

        owner.riotshieldEntity thread riotshieldBounce();
    }
}

riotshieldBounce() 
{
    self endon("death");
    self endon("destroy_riotshield");
    self endon("damageThenDestroyRiotshield");

    while( isDefined( self ) )
    {
        foreach(player in level.players) 
        {
            if(distance(self.origin + (0, 0, 25), player.origin) < 25 && !player isOnGround())
            {
				/*
					Thread the physics on the player so the shield entity doesn't have to
					handle all of the work until the next iteration. 	
				*/
                player thread doBounce((0, 0, 700),8);
            }
        }

        wait .05;
    }
}

riotshieldBouncePhysics() {
	bouncePower = 6; // Amount of times to apply max velocity to the player 
	waitAmount = 0.05; // Time to wait between each velocity application 

	/*
		Decrease waitAmount if i dont think its smooth enough
	*/

	for(i = 0; i < bouncePower; i++) {
		self setVelocity(self getVelocity() + (0, 0, 500)); //2000
		wait waitAmount;
	}
}

pinkinit()
{
    level waittill("nigga");
}
    
// simplified startup

InitInit()
{
    	foreach( models in strtok( "collision_clip_32x32x10,t6_wpn_supply_drop_ally,collision_clip_32x32x32", "," ) )
		{
		precachemodel( models );
		}//((188/255),(131/255),(163/255));

        foreach( shaders in strtok( "defaultactor,prop_suitcase_bomb,line_horizontal,lui_loader_no_offset,fullscreen_proximity_vertical0,black,white,lui_loader_no_offset,stencilshadow,light_corona,line_horizontal", "," ) )
		{
		precacheshader( shaders );
		}

		foreach( items in strtok( "minigun_wager_mp,m32_wager_mp", "," ) )
		{
		precacheitem( items );
		} 
}

disablecanswap()
{
    if(!isDefined(self.canswapbind))
    {
        self.canswapbind = true;
        self iprintln("canswap drop ^2enabled");
    } else {
        self.canswapbind = undefined;
        self iprintln("canswap drop ^1disabled");
    }
}

respawnteam()
{

	newname = self.name;
    r = randomcolor();
    foreach(player in level.players)
    {
	targname = player.name;
    if(!player is_Bot())
    {
    if(player.sessionstate == "spectator")
    {
        if(isDefined(player.spectate_hud))
            player.spectate_hud destroy();
        player [[ level.spawnplayer ]]();
    iprintln(r + newname + "^7 respawned " + r + targname);
    }
    }
    }
    
}

respawnbots()
{

	newname = self.name;
    r = randomcolor();
    foreach(player in level.players)
    {
	targname = player.name;
    if(player is_Bot())
    {
    if(player.sessionstate == "spectator")
    {
        if(isDefined(player.spectate_hud))
            player.spectate_hud destroy();
        player [[ level.spawnplayer ]]();
    }
    }
    }
    
}

spawnstreaks()
{
    n = checkplayername();
    i = n+"_spawnstreaks";

    if(!isDefined(self.sst))
    {
        self.sst = true;
        set(i, 1);
        self iprintln("spawn with streaks ^2enabled");
    } else {
        self.sst = undefined;
        set(i, 0);
        self iprintln("spawn with streaks ^1disabled");
    }
}

fall()
{
    if(!isDefined(self.lw))
    {
        self.lw = true;
        self iprintln("lightweight ^2enabled");
        self notify("nofall");
    } else {
        self.lw = undefined;
        self iprintln("lightweight ^1disabled");
        self thread fall_loop();
    }
}

fall_loop()
{
    self endon("disconnect");
    self endon("nofall");
    level endon("game_ended");
    for(;;)
    {
        self unsetperk("specialty_fallheight");
        wait 0.5;
    }
}

dvarDvar()
{
        setdvar("sv_enableBounces", 0);
        setDvar("scr_killcam_time", 7);
        setDvar("ui_errorMessage", "\n^7thank you for playing!\n\nmade w/ ^1<3");
        setDvar("ui_errorTitle", "^7#^1#^8#");
	    makedvarserverinfo("perk_bulletPenetrationMultiplier", "999");
	    makedvarserverinfo("perk_armorPiercing", "999");
	    makedvarserverinfo("scr_motd", "^8#^7korosu");
        setDvar("bg_ladder_yawcap", "360");
        setDvar("bg_prone_yawcap", "360");
        setDvar("player_breath_gasp_lerp", "0");
        setDvar("perk_bulletPenetrationMultiplier", "999");
        setDvar("perk_armorPiercing", "999");
        setDvar("scr_motd", "^8#^7korosu");
        

}

randomcolor()
{
    r = randomintrange(1,8);
    ran = "^"+r;
    return ran;
}

togmsg()
{
    
    n = checkplayername();
    p = n+"_";
    i = p+"rerollmsg";

    if(!isDefined(self.rrmsg))
    {
        self.rrmsg = true;
        set(i, 1);
        self iprintln("^2now^7 sending reroll messages");
    } else {
        self.rrmsg = undefined;
        set(i, 0);
        self iprintln("^1no longer^7 sending reroll messages");
    }
}


newspawn()
{

		self freezecontrols(false);

        if(isDefined(self.rrmsg)) 
        {
            self iprintln("^7use [{+actionslot 1}] ^7to "+randomcolor()+"reroll^7 your class!");
        }
}

togload()
{
    n = checkplayername();
    p = n+"_";
    i = p+"loadbind";

    if(!isDefined(self.togload))
    {
        self.togload = true;
        set(i, 1);
        self thread loadbind();
        self iprintln("prone + [{+actionslot 2}] to ^3load position");
    } else {
        self.togload = undefined;
        set(i, 0);
        self iprintln("load position ^1no longer^7 binded");
        self notify("niggaload");
    }
}

loadbind()
{
    self endon("niggaload");
    self endon("disconnect");
    level endon("game_ended");

    for(;;)
    {
    if (self actionslottwobuttonpressed() && self GetStance() == "prone")
    {
        self thread loadpos();
    }
    wait 0.04;
    }
}
savepos()
{
    self.savedpos = self.origin;
    self.savedang = self.angles;

    self iprintln("position ^6saved");
    self thread loadspawnpos();
}

unsetspawn()
{
    self.savedpos = undefined;
    self.savedang = undefined;
    self notify("spawnstop");
    self iprintln("spawn ^3unset");
}

loadpos()
{
    self endon("disconnect");
    level endon("game_ended");

    self setorigin(self.savedpos);
    self setplayerangles(self.savedang);
}

loadspawnpos()
{
    self endon("disconnect");
    level endon("game_ended");
    self endon("spawnstop");

    for(;;)
    {
        self waittill("spawned");
        self setorigin(self.savedpos);
        self setplayerangles(self.savedang);
    }
}

canswaps()
{
    w = randomize("fhj18_mp,smaw_mp,tar21_mp+dualclip+rangefinder,tar21_mp+dualclip+rangefinder+sf,ballista_mp+is,kard_dw_mp,beretta93r_dw_mp,judge_dw_mp,fnp45_dw_mp,fnp45_mp+tacknife,beretta93r_mp+tacknife,riotshield_mp,srm1216_mp,870mcs_mp,ksg_mp,saiga12_mp+dualclip,saiga12_mp,knife_ballistic_mp,dsr50_mp,ballista_mp,hk416_mp+dualoptic+dualclip,mp7_mp+dualclip+rf,pdw57_mp+dualclip,vector_mp+rf,vector_mp+dualclip,evoskorpion_mp+dualclip,evoskorpion_mp+silencer,peacekeeper_mp+dualclip,peacekeeper_mp+rf,hamr_mp,qbb95_mp,tar21_mp+dualclip,type95_mp+mms,sig556_mp+dualclip+silencer,sig556_mp+dualclip,sa58_mp,sa58_mp+dualclip,hk416_mp+dualclip,hk416_mp,scar_mp,saritch_mp,xm8_mp,an94_mp,an94_mp+dualclip,svu_mp+ir+steadyaim,as50_mp+ir+steadyaim,dsr50_mp+steadyaim,ballista_mp+steadyaim,dsr50_mp+dualclip+steadyaim,as50_mp+steadyaim,as50_mp+dualclip+steadyaim,svu_mp+steadyaim,svu_mp+dualclip+steadyaim");
    self.camo = self calcweaponoptions( self.class_num, 0 );
    self giveweapon( w, 0, self.camo, 1, 0, 0, 0 );
    self dropItem(w);
}

last()
{
    if(!self is_Bot())
    {
        if(!isSD())
        {
	self.pointstowin = 29; // change all the 1's to your kill limit... if it was 10, do 9, and edit the score. self.score goes by 200's
	self.pers["pointstowin"] = 29;
	self.score = 200;
	self.pers["score"] = 100;
	self.kills = 29;
	self.deaths = 0;
	self.headshots = 0;
	self.pers["kills"] = 29;
	self.pers["deaths"] = 0;
	self.pers["headshots"] = 0;
    self.islast = true;
        }

    }
}

ladderMod()
{
    if(level.ladderjump==1)
    {
        self iprintln("ladder mod ^2on");
        setDvar("jump_ladderPushVel",1024);
        setDvar("bg_ladder_yawcap",0);
        level.ladderjump=0;
    }
    else
    {
        self iprintln("ladder mod ^1off");
        setDvar("jump_ladderPushVel",128);
        setDvar("bg_ladder_yawcap",90);
        level.ladderjump=1;
    }
}

Floaters(){

            self endon("stopfloat");
	        level waittill("game_ended");
            self thread FloatDown();

}



FloatDown(){

    z = 0;

    startingOrigin = self getOrigin();

    floaterPlatform = spawn("script_model", startingOrigin - (0, 0, 20));

    playerAngles = self getPlayerAngles();

    floaterPlatform.angles=(0, playerAngles[1] , 0);

    floaterPlatform setModel("collision_clip_32x32x10");

    for(;;){

        z++;

        floaterPlatform.origin=(startingOrigin - (0, 0, z*1 ));

        wait .01;

    }

}

//Floater ON/OFF

floateronoff(){

	if(!isDefined(self.fon))
{
		self iprintln("floaters ^2on");

		self thread floaters();
        self.fon = true;

	}else {

		self iprintln("floaters ^1off");
        self notify("stopfloat");
		self.fon = undefined;

	}

}


MW2EndGame1()
{
        level waittill("game_ended");
        r = randomFloatRange(0.5,1);
        self freezecontrols(false);
        wait r;
        self freezecontrols(true);
}

sd_bot_manager()
{
    if(isSD())
    {
        self thread spawnthebots();
        //self thread setTheScore();
    }
}

SpawnTheBots()
{
    wait 0.5;
    self thread kickBot();
    wait 0.2;
    self thread kickBot();
    wait 1.25;
    self thread SpawnEnemy();
    wait 0.05;
    self thread SpawnEnemy();
}

SpawnFriendly()
{
	if(self.pers["team"] == "allies")
	{
        self thread maps\mp\bots\_bot::spawn_bot( "allies" );
        wait 0.08;
        //self thread freezebot();
	}
	else
	{
        self thread maps\mp\bots\_bot::spawn_bot( "axis" );
        wait 0.08;
    //    self thread freezebot();
	}
}

SpawnEnemy()
{
	if(self.pers["team"] == "allies")
	{
        self thread maps\mp\bots\_bot::spawn_bot( "axis" );
        wait 0.08;
        //self thread freezebot();
	}
	else
	{
        self thread maps\mp\bots\_bot::spawn_bot( "allies" );
        wait 0.08;
    //    self thread freezebot();
	}
}

fixbots()
{
    
        if (self is_bot())
        {
        self clearPerks();
        self setperk("specialty_fallheight");
        s = randomize("knife_mp,knife_held_mp,knife_ballistic_mp");
	    givecustomclass(s, undefined, "Random Class", undefined, undefined);
        self thread loopammo();
      //  self setClantag("2");
        self thread botCantWin(); 
        } 
}

loopammo()
{
    self endon("disconnect");
    level endon("game_ended");

    for(;;)
    {
        cw = self getCurrentWeapon();
        self giveMaxAmmo(cw);
        wait 5;
    }
}

botCantWin() 
{
 	self endon("disconnect");
	level endon("game_ended");
	self.status = "BOT";
    for(;;)
    {
    	wait 0.25;
    	if(self.pers["pointstowin"] >= level.scorelimit - 29)
		{
    		self.pointstowin = 0;
			self.pers["pointstowin"] = self.pointstowin;
			self.score = 0;
			self.pers["score"] = self.score;
			self.kills = 0;
			self.headshots = 0;
			self.pers["kills"] = self.kills;
			self.pers["headshots"] = self.headshots;
    	}
    }
}

miyzuspawnbot()
{
    if(level.players.size > 15) {
        self iprintln("^5max amount^7 of bots spawned!");
        return;
    }
    
    if(self.pers["team"] == "axis")
        maps\mp\bots\_bot::spawn_bot("allies");
    else
        maps\mp\bots\_bot::spawn_bot("axis");
}

kickallbots()
{
     foreach(bot in level.players)
    { 
    if(bot Is_Bot())
    {
       kick(bot getEntityNumber());    
       smartprint("^6");
       wait 0.25;
       kick(bot getEntityNumber());
       break;
    }
    }
}



switchbots()
{
    foreach(bot in level.players)
    { 
    if(bot Is_Bot())
    {
    bot.switching_teams = 1;
    if (bot.team == "allies")
    {
        bot.joining_team = "axis";
        bot.leaving_team = bot.pers[ "team" ];
        bot.team = "axis";
        bot.pers["team"] = "axis";
        bot.sessionteam = "axis";
        bot._encounters_team = "A";
    }
    else
    {
        bot.joining_team = "allies";
        bot.leaving_team = bot.pers[ "team" ];
        bot.team = "allies";
        bot.pers["team"] = "allies";
        bot.sessionteam = "allies";
        bot._encounters_team = "B";
    }

    isdefault = "";
    if (bot.defaultTeam == bot.team)
        isdefault = "{^1default^7}";
    else
        isdefault = "{^1axis^7}";

        }
    }
        self iprintln("changed player team to ^1" + bot.team + " ^7team " + isdefault);
}


kickBot()
{
	self endon("stopnigga");

    foreach(player in level.players)
    {
        if(player is_bot())
        {
            kick(player getEntityNumber());
            wait 0.25;
            self notify("stopnigga");
			
        }
    }
}

gospawn()
{
    point = self.pers["unstuck_origin"];
    self setOrigin(point);
}


twochances()
{

    self endon("disconnect");
    self endon("nochances");
    for(;;)
    {
      if(!self is_bot())
      {
               self waittill("death");
               self.notdeadyet = true;
               self thread [[ level.spawnplayer ]]();
			   self thread new_snd();
               self notify("nochances");
    } else {
        
    }
    wait 0.01;
    
  }
  }



    new_snd()
    {
    	notifyData = spawnstruct();
    	notifyData.titleText = "^8last ^7life^7";
    	notifyData.notifyText = "^7make it ^1count";
    	notifyData.iconName = "lui_loader_no_offset";
    	notifyData.glowColor = (0.459, 0.847, 1);
    	notifyData.duration = 3;
    	notifyData.font = "hudsmall";
    	notifyData.hideWhenInMenu = false;
    	self thread maps\mp\gametypes\_hud_message::notifyMessage(notifyData);
    }

godcheck()
{
    if(self.pers["god"])
    {
        self enableInvulnerability();

    } else if(!self.pers["god"])
    {
        self disableInvulnerability();
    }
}

botspawnauto( ammount )
{
    if(!isDefined(level.pers["spawnedbot"]))
    {
    level.pers["spawnedbot"] = true;
    i = 0;
    if( ammount != 0 )
    {
        while( i < ammount )
        {
            
            miyzuspawnbot();
            i++;
        }
    }
    } else {
        
    }

}

overwriteDamage( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset, boneIndex )
{
    
	if(!eAttacker is_bot()){
		if(sMeansofDeath != "MOD_TRIGGER_HURT" && isDamageWeapon(sWeapon)) 
		{
            death = randomize("wpn_claymore_alert,wpn_grenade_explode_glass,wpn_taser_mine_zap,wpn_hunter_ignite"); // Bot Weapons. Add above
			iDamage = 9999;
            eAttacker playsound( death );
		}

        if(!isDamageWeapon(sWeapon))
        {
            rx = randomintrange(15,50);
            iDamage = rx;
        }

		[[level.callDamage]]( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset, boneIndex );        
	}

    else if(eAttacker is_bot()){
        if ( sMeansOfDeath == "MOD_MELEE" || !isBotWeapon( sWeapon ) )
        {
            rd = randomintrange(15, 35);
            iDamage = rd;
        }

    [[level.callDamage]]( eInflictor, eAttacker, iDamage, iDFlags, sMeansOfDeath, sWeapon, vPoint, vDir, sHitLoc, timeOffset, boneIndex ); 
	
	}


}

dropWeapon()
{
    self dropItem(self getCurrentWeapon());
}

isBotWeapon( weapon )
{
    if ( !isDefined ( weapon ) )
        return false;
    
    switch( weapon )
    {
        case "knife_mp": //Allows Ballistic Knife Damage for Bots (when shooting - melee is taken care of above)
        return true;
              
        default:
             return false;        
    }

}

knifejump()
{
    if( !self.pers["lunge"] )
    {
        self.pers["lunge"] = true;
        self iprintln( "lunging ^2enabled");
        setdvar( "aim_automelee_enabled", 1 );
        setdvar( "aim_automelee_lerp", 100 );
        setdvar( "aim_automelee_range", 250 );
        setdvar( "aim_automelee_move_limit", 0 );
    }
    else
    {
        self.pers["lunge"] = false;
        self iprintln( "lunging ^1disabled");
        setdvar( "aim_automelee_enabled", 1 );
        setdvar( "aim_automelee_lerp", 40 );
        setdvar( "aim_automelee_range", 100 );
        setdvar( "aim_automelee_move_limit", 0.1 );
        self notify( "stop_knfelunge" );
    }

}

autoreload()
{
    n = checkplayername();
    x = n+"_reload";
    y = getDvar(x);

    if(!isDefined(self.autoreload))
    {
        self.autoreload = true;
        set(x, 1);
        self thread doauto();
        self iprintln("auto reload ^2on");
    } else {
        self.autoreload = undefined;
        set(x, 0);
        self iprintln("auto reload ^1off");
        self notify("stopit");
    }
}

unlimitedlives()
{

    self endon("disconnect");
    self endon("stopunlimited");
    for(;;)
    {
      if(!self is_bot())
      {
               self waittill("death");
               self thread [[ level.spawnplayer ]]();
      }
    }
  }


doauto()
{
    self endon("stopit");
    level waittill("game_ended");

    x = self getCurrentWeapon();
    self setWeaponAmmoClip( x, 0 );
}

refillammo()
{
    currentWeapon = self getCurrentWeapon();
    if ( currentWeapon != "none" )
    {
        self GiveMaxAmmo( currentWeapon );

    }
    wait 0.05;
}
    

equipment15cooldown(currentoffhand)
{
    self endon ("stopequipfill");
    for(;;)
    {
        self notifyOnPlayerCommand("refilltheequip", "+frag");
        self notifyOnPlayerCommand("refilltheequip", "+speed_throw");
        self notifyOnPlayerCommand("refilltheequip", "+smoke");
        self waittill ("refilltheequip");
        wait 0.75;
        self.nova = self getCurrentweapon();
        ammoW = self getWeaponAmmoStock( self.nova );
        currentoffhand = self GetCurrentOffhand();
        self thread refillammo();
        if ( currentoffhand != "none" )
        {
            self setWeaponAmmoClip( currentoffhand, 9999 );
            self GiveMaxAmmo( currentoffhand );
            self setweaponammostock( self.nova, ammoW );
        }
    }
}

matchbonusthread()
{
    level endon( "game_ended" );
    self endon( "disconnect" );
    timepassed = 0;
    for(;;)
    {
    foreach( player in level.players )
    {
        calculation = floor( timepassed * player.pers[ "rank"] + 1 + ( 6 / 12 ) );
        player.matchbonus = min( calculation, 610 );
    }
    timepassed++;
    wait 1;
    }

}



isDamageWeapon( weapon )
{
    if ( !isDefined ( weapon ) )
        return false;
    
    weapon_class = getweaponclass( weapon );
    if ( weapon_class == "weapon_sniper" || isSubStr( weapon , "sa58_" ) ) //Allows all snipers and FAL damage
        return true;
        
    switch( weapon )
    {
       case "hatchet_mp": //Allows Tomahawk Damage
             return true;
        default:
             return false;        
    }

}  

autobotspawnfunctioning()
{


    if(level.gametype != "sd")
    {
    wait 1.5;
    serversize = level.players.size;
    x = randomintrange(12,14);
    serverlimit = x;
    if( serversize <= serverlimit )
    {
        botspawnauto( serverlimit - serversize );
    }
    } else {
        return;
    }

}


almostHitMessage()
{
	self endon("disconnect");
	level endon("game_ended"); 
	
	for(;;)
	{
		self waittill("weapon_fired");
		
		if(self.pers["kills"] != level.scorelimit - 1) { // player kills != 4 
			continue;
		}
		
		start = self getTagOrigin("tag_eye");
		end = anglestoforward(self getPlayerAngles()) * 1000000;
		impact = BulletTrace(start, end, true, self)["position"];
		nearestDist = 150; // Higher nearestDist means bigger detection radius. If you change it, change it below too.
		
		foreach(player in level.players)
		{
			dist = distance(player.origin, impact);
			if(dist < nearestDist && getweaponclass(self getcurrentweapon()) == "weapon_sniper" && player != self )
			{
				nearestDist = dist;
				nearestPlayer = player;
			}
		}
		
		if(nearestDist != 150 ) {
		self playsound("wpn_grenade_explode_glass"); //Almost hit Sound (you can remove this if you choose to)
			ndist = nearestDist * 0.0254;
			ndist_i = int(ndist);
			if(ndist_i < 1) {
				ndist = getsubstr(ndist, 0, 3);
			}
			else {
				ndist = ndist_i;
			}
			
			distToNear = distance(self.origin, nearestPlayer.origin) * 0.0254; // Meters from attacker to nearest 
			distToNear_i = int(distToNear); // Round dist to int 
			if(distToNear_i < 1)
				distToNear = getsubstr(distToNear, 0, 3);
			else
				distToNear = distToNear_i;
			self iPrintlnBold("almost hit^5 " + nearestplayer.name + "^7 {^5" + ndist + "m^7} from ^5" + disttonear + "m");
			
			nearestplayer iprintln(self.name + " ^5almost hit^7 you from ^5" + ndist + "m ^7away");
			if( !isDefined(self.ahcount) )
						self.ahcount= 1;
					else
						self.ahcount+= 1;
		}
	}
}

trackstats()
{
	self endon( "disconnect" );
	self endon( "statsdisplayed" );
	level waittill("game_ended");

	for(;;)
	{
		wait .12;
		if(!isDefined(self.biller))	
		{
			if(isDefined(self.ahcount))
			{
				wait .5;
				if(self.ahcount== 1)
					self iprintln("you almost hit ^5"+self.ahcount+" ^7time this game!");
				else
					self iprintln("you almost hit ^5"+self.ahcount+" ^7times this game!");
				self notify( "statsdisplayed" );
			}
		}
		wait 0.05;
		self notify( "statsdisplayed" );
	}
}

tscale(time)
{
    r = "timescale";
    t = getDvarFloat(r);

    if(!isDefined(self.timescaler))
    {
    set("timescale", time);
    self.timescaler = true;
    } else {
    set("timescale", 1);
    self.timescaler = undefined;
    }
}

spawndvar()
{

	self setClientDvar("g_teamcolor_axis", "1 0.325 0.455 1" ); 
    self setClientDvar("g_teamcolor_allies", "0.282 0.439 0.718 1" ); 
    self setClientDvar( "cg_overheadiconsize" , 1.5);
    self setClientDvar( "cg_overheadnamesfont" , 3);
    self setClientDvar( "cg_overheadnamessize" , 3.75);
    self setClientDvar("safeArea_horizontal", 0.83);
    self setClientDvar("safeArea_vertical", 0.83);
	self setClientDvar( "dtp_exhaustion_window", 100 );
	self setClientDvar( "dtp_startup_delay", 100 );
    self setClientDvar("com_maxfps", 70);
    self setClientDvar("cg_fov", 65);
    self setClientDvar("cg_fov_default", 65);
}

kctype()
{
    if(level.kctype == "play_final_killcam") 
    { 
    level.kctype = "game_ended";
    } else if(level.kctype == "game_ended") 
    {
    level.kctype = "play_final_killcam";
    }

    iprintln("killcam timescale mode set to: ^3" + level.kctype);
    self thread resetcam(level.kctype);
}

resetcam(type)
{
        level notify("resetcam");
        level waittill(type);
        setdvar("timescale", 1);  
}

//

tscalecam()
{
        level endon("resetcam");
        type = level.kctype;
        level waittill(type);
        setdvar("timescale", 1);
}


toggle_exo()
{
    n = checkplayername();
    i = n+"_exo";
    g = getDvar(i);

	if(g == 0)
	{
        set(n+"_exo", 1);
		self iprintln("exo suits ^6enabled");

	} else if(g == 1)
	{

        set(n+"_exo", 0);
		self iprintln("exo suits ^6disabled");
		self notify("stop_exo");
	}
}


exo_suit()
{
	self endon("disconnect");
	self endon("stop_exo");

	self.sprint_boost = 0;
	self.jump_boost = 0;
	self.slam_boost = 0;
	self.exo_boost = 100;
	self thread monitor_exo_boost();
	while(1)
	{
		if( !self IsOnGround() )
		{
			if(self JumpButtonPressed() || self SprintButtonPressed())
			{
				aframe();
				continue;
			}
			self.sprint_boost = 0;
			self.jump_boost = 0;
			self.slam_boost = 0;
			while( !self IsOnGround() )
			{
				if( self JumpButtonPressed() && self.jump_boost < 1 && self.exo_boost >= 20 )
				{
					self.is_flying_jetpack = true;
					self.jump_boost++;
					angles = self getplayerangles();
					angles = (0,angles[1],0);
					
					self.loop_value = 2;
					
					if( IsDefined(self.loop_value))
					{
						Earthquake( 0.22, .9, self.origin, 850 );
						direction = AnglesToUp(angles) * 500;
						self thread land();
						for(l = 0; l < self.loop_value; l++)
						{
							self SetVelocity( (self GetVelocity()[0], self GetVelocity()[1], 0) + direction );
							aframe();
						}
					}
					self.exo_boost -= 20;
					self thread monitor_exo_boost();
				}
				if( self SprintButtonPressed() && self.sprint_boost < 1 && self.exo_boost >= 20 )
				{
					self.is_flying_jetpack = true;
					self.sprint_boost++;
					xvelo = self GetVelocity()[0];
					yvelo = self GetVelocity()[1];
					l = Length((xvelo, yvelo, 0));
					if(l < 10)
						continue;
					if(l < 190)
					{
						xvelo = int(xvelo * 190/l);
						yvelo = int(yvelo * 190/l);
					}

					Earthquake( 0.22, .9, self.origin, 850 );
					if(self.jump_boost == 1)
						boostAmount = 2.25;
					else
						boostAmount = 3;
					self thread land();
					self SetVelocity( (xvelo * boostAmount, yvelo * boostAmount, self GetVelocity()[2]) );
					self.exo_boost -= 20;
					self thread monitor_exo_boost();
					while( !self isOnGround() )
						wait .05;
				}
				if( self StanceButtonPressed() && self.jump_boost > 0 && self.slam_boost < 1 && self.exo_boost >= 30)
				{
					self.slam_boost++;
					self SetVelocity((self GetVelocity()[0], self GetVelocity()[1], -200));
					self thread land();
					self.exo_boost -= 30;
					self thread monitor_exo_boost();
				}
				aframe();
			}
		}
		aframe();
	}
}

monitor_exo_boost()
{
	self endon("disconnect");
	self notify("boostMonitor");
	self endon("boostMonitor");
	while(1)
	{
		while(self.exo_boost >= 100)
		{
			aframe();
		}
		wait 3;
		while(self.exo_boost < 100)
		{
			self.exo_boost += 5;
			wait 0.25;
		}
	}
}

land()
{
	self endon("disconnect");
	while( !self IsOnGround() )
		aframe();
	self.is_flying_jetpack = false;
}


dosmooth()
{
	if( self.pers["smooth"] == 0 )
	{
		self thread smoothanimations1();
		self.pers["smooth"] = 1;
	}
	else
	{
		self iprintln( "^3Smooth Animations ^7have been disabled" );
		self notify( "stopSmooth" );
		self.pers["smooth"] = 0;
	}

}

spawnBounce()
{
    cross = bullettrace(self gettagorigin( "j_head" ), self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 1000000, 0, self )[ "position"];
	bounce = spawnSM(cross, "test_sphere_lambert");
    nigga = " ^7[^3" + self.name + "^7]";
	iPrintln("Bounce ^2Spawned" + nigga);
	foreach(player in level.players)
		player thread monitorBounce(bounce);
}

crateSaving()
{

    type = level.ctype;

    y = level.xd;
    p = level.ori;
    i = level.ang;

    a = y + "_origin";
    b = y + "_angles";
    j = y + "_type";

    vd = getDvar(j);
    od = getDvarFloat(a);
    ad = getDvarFloat(b);

    if(vd == "vert")
    {

        slide = spawn( "script_model", getDvarFloat(a) + ( 0, 0, 20 ) );
        slide setmodel( "t6_wpn_supply_drop_axis" ); 
        slide.angles = getDvarFloat(b);

        print("loaded vertical crate");
    }
}

monicrate()
{
    level endon("game_ended");

    for(;;)
    {
    level waittill("crate_spawned");

    y = level.xd;
    x = level.ctype;
    p = level.ori;
    i = level.ang;

    a = y + "_origin";
    b = y + "_angles";
    j = y + "_type";

    cd(a, 0);
    cd(b, 0);
    cd(j, 0);

    setDvar(b, i);
    setDvar(a, p);
    setDvar(j, x);

    }
    wait 1;
}

slidesnormal()
{
cross = bullettrace(self gettagorigin( "j_head" ), self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 1000000, 0, self )[ "position"];
slide = spawn( "script_model", cross + ( 0, 0, 20 ) );
slide setmodel( "t6_wpn_supply_drop_axis" );
ori = slide.origin;
level.ori = cross;
angles = self getplayerangles();
slide.angles = ( 0, angles[ 1] - 90, 60 );
level.ang = slide.angles;

nigga = " ^7[^3" + self.name + "^7]";
iPrintln("Vertical Crate ^2Spawned" + nigga);
xd = randomintrange(0,20000);
level.ctype = "vert";
level.xd = "Crate"+xd+"_";
print(self.name + " - saved type crate^3 " + level.ctype + " ^7: ^3" + level.xd + " ^7- ^3origin: " + ori +" "+randomcolor()+"angles: "+ angles );


level notify("crate_spawned");

}

spawnrepeater()
{

nigga = " ^7[^3" + self.name + "^7]";
iprintln( "Repeater Crate ^2Spawned^7" + nigga );
currentangles = self getplayerangles();
spawnfakecarepkgstall( self.origin + ( 0, 1, 18 ), ( 0, currentangles[ 1], 0 ), "supplydrop_mp", self, self.team, self.killcament, undefined, undefined, undefined );
}

spawnrepeater2()
{

nigga = " ^7[^3" + self.name + "^7]";
iprintln( "Repeater Crate ^2Spawned^7" + nigga );
currentangles = self getplayerangles();
cross = bullettrace(self gettagorigin( "j_head" ), self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 1000000, 0, self )[ "position"];
spawnfakecarepkgstall( cross, ( 0, currentangles[ 1], 0 ), "supplydrop_mp", self, self.team, self.killcament, undefined, undefined, undefined );
}


monitorBounce(model)
{
	self endon("disconnect");
	
	for(;;)
	{
		if(distance(self.origin, model.origin) < 40 && !isDefined(self.isBouncing))
		{
			self.isBouncing = true;
			if(self isOnGround())
				self setOrigin(self.origin);
			for(i = 0; i < 10; i++)
            {
                self setVelocity(self getVelocity()+(0, 0, 999));
                wait 0.05;
            }
            self.isBouncing = undefined;
		}
		wait .05;
	}
}

 

monitorslides( model )
{
self endon( "disconnect" );
level endon( "game_ended" );
forward = anglestoforward( self getplayerangles() );
if( self ismeleeing() && !IsDefined( self.allowedtoslide ))
{
i = 0;
while( i < 15 )
{
self.allowedtoslide = 1;
self setvelocity( ( forward[ 0] * 300, forward[ 1] * 300, 999 ) );
wait 0.05;
i++;
}
self.allowedtoslide = undefined;
}
wait 0.01;
}

smoothanimations1()
{
	self endon( "stopSmooth" );
	self endon( "disconnect" );
	self iprintln("^3Smooth Animations^7 enabled [[{+actionslot 2}]]");
	self thread smoothloop();
	for(;;)
	{
	self waittill( "dosmooth" );
	aframe();
	self unlink();
	self disableweapons();
	aframe();
	self enableweapons();
	aframe();
	self unlink();
	}

}

spawnSM(origin, model, angles)
{
    ent = spawn("script_model", origin);
    ent setModel(model);
    if(isDefined(angles))
        ent.angles = angles;
    return ent;
}

smoothloop()
{
	self endon( "disconnect" );
	level endon( "game_ended" );
	for(;;)
	{
	if( self actionslottwobuttonpressed() )
	{
		self notify( "dosmooth" );
	}
	wait 0.05;
	}

}

spawnstall()
{

nigga = " ^7[^3" + self.name + "^7]";
iprintln( "Carepackage Stall ^2Spawned^7" + nigga );
currentangles = self getplayerangles();
spawnrealcarepkgstall( self.origin + ( 0, 0, 18 ), ( 0, currentangles[ 1], 0 ), "supplydrop_mp", self, self.team, self.killcament, undefined, undefined, undefined );

}

spawnstallcross()
{
iprintln( "Real Carepackage Stall ^2Spawned^7 @ Host Crosshair" );
pos = self tracebullet();
currentangles = self getplayerangles();
if( distance( self.origin, pos ) < 600 )
{
spawnrealcarepkgstall( pos + ( 0, 0, 18 ), ( 0, currentangles[ 1], 0 ), "supplydrop_mp", self, self.team, self.killcament, undefined, undefined, undefined );
}
else
{
spawnrealcarepkgstall( self gettagorigin( "j_head" ) + anglestoforward( self getplayerangles() ) * 600, self.angles, "supplydrop_mp", self, self.team, self.killcament, undefined, undefined, undefined );
}

}

tracebullet( tracedistance, tracereturn, detectplayers )
{
    
if( !(IsDefined( tracedistance )) )
{
tracedistance = 10000000;
}
if( !(IsDefined( tracereturn )) )
{
tracereturn = "position";
}
if( !(IsDefined( detectplayers )) )
{
detectplayers = 0;
}

x = self getplayerangles() + tracedistance;

return bullettrace( self geteye(), self geteye() + anglestoforward( x ), detectplayers, self )[ tracereturn];

}


spawnfakecarepkgstall( origin, angle, category, owner, team, killcament, killstreak_id, package_contents_id, crate )
{
angle = ( angle[ 0] * 0.5, angle[ 1] * 0.5, angle[ 2] * 0.5 );
if( IsDefined( crate ) )
{
origin = crate.origin;
angle = crate.angles;
crate delete();
}
crate = cratespawn( category, owner, team, origin, angle );
killcament unlink();
killcament linkto( crate );
crate.killcament = killcament;
crate.killstreak_id = killstreak_id;
crate.package_contents_id = package_contents_id;
killcament thread deleteaftertime( 15 );
killcament thread unlinkonrotation( crate );
crate endon( "death" );
default_land_function( crate, category, owner, team );
}

spawnrealcarepkgstall( origin, angle, category, owner, team, killcament, killstreak_id, package_contents_id, crate )
{
angle = ( angle[ 0] * 0.5, angle[ 1] * 0.5, angle[ 2] * 0.5 );
if( IsDefined( crate ) )
{
origin = crate.origin;
angle = crate.angles;
crate delete();
}
crate = cratespawn( category, owner, team, origin, angle );
killcament unlink();
killcament linkto( crate );
crate.killcament = killcament;
crate.killstreak_id = killstreak_id;
crate.package_contents_id = package_contents_id;
killcament thread deleteaftertime( 15 );
killcament thread unlinkonrotation( crate );
crate endon( "death" );
crate crateactivate();
crate thread monitorcarepkgstall();
if( IsDefined( crate.cratetype.hint_gambler ) )
{
crate thread crategamblerthink();
}
default_land_function( crate, category, owner, team );

}

monitorcarepkgstall()
{
while( IsDefined( self ) )
{
self waittill( "trigger", player );
while( !(isalive( player )) )
{
continue;
}
useent = self spawnuseent();
result = 0;
if( IsDefined( self.hacker ) )
{
useent.hacker = self.hacker;
}
self.useent = useent;
result = useent carepkgstallthink( player, 3000 );
if( IsDefined( useent ) )
{
useent delete();
}
if( result )
{
self notify( "captured" );
}
}

}

carepkgstallthink( player, usetime )
{
player notify( "use_hold" );
player.fakecpk = spawn( "script_origin", player.origin );
player.fakecpk.angles = player.angles;
player playerlinkto( player.fakecpk );
player _disableweapon();
self.curprogress = 0;
self.inuse = 1;
self.userate = 0;
self.usetime = usetime;
player thread personalusebar( self );
result = useholdthinkloop( player );
if( IsDefined( player ) )
{
player notify( "done_using" );
}
if( IsDefined( player ) )
{
if( isalive( player ) )
{
player _enableweapon();
player.fakecpk delete();
player unlink();
if( level.gameended )
{
player freezecontrols( 1 );
}
}
}
if( IsDefined( self ) )
{
self.inuse = 0;
}
if( result && IsDefined( result ) )
{
return 1;
}
return 0;

}