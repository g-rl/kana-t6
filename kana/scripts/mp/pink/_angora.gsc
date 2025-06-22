// my util file

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

randomize(a)
{
	r = strTok(a, ","); // Rewrite later 
	random = RandomInt(r.size);
	final = r[random];
	return final;
}

simplefreeze()
{
    self freezecontrols(1);
    wait 0.5;
    self freezecontrols(0);
}


monitors() {
    self endon("disconnect");
    self endon("game_ended");
    self endon("death");
    for(;;) 
    {
        if(pressed("UP")) 
        { 
            if(isDefined(self.userandomclass))
            {
            self thread randomclass();
            idle(0.3);
            }
        }

        if(self getStance() == "crouch") 
        {
        if(pressed("DOWN") && isDefined(self.togride)) { 
            self thread rideable();
            idle(2);
         }
         if(pressed("MELEE") && isDefined(self.canswapbind)) { 
                self thread canswaps();
                idle(1);
         }
         if(pressed("LEFT")) { 
                self thread saveclass();
                self iprintln("class ^2saved");
                idle(1);
        }

        if(pressed("RIGHT") && isDefined(self.pers["myclass"]))
        {
        self thread loadclass();     
        idle(1);
             } else {    
         }
        
        
        }
        if(self getStance() == "prone") 
        {
        if(pressed("RIGHT")) { 
            self thread streak();
            idle(1);
        }

        
        }
        wait .01;
    
    }

}


// rewrite this soon hopefully
streak()
{
    self maps\mp\gametypes\_globallogic_score::_setplayermomentum(self,9999);
}

idle(seconds)
{
    wait seconds;
}


pr(talking)
{
    self iPrintLn(talking);
}

smartprint(txt)
{
    gg = rt();
    if(!isDefined(self.txting))
    {
    self.txting = true;
    self iprintln(txt);
    wait gg;
    self space();
    } else {
        wait gg;
        self smartprint(txt);
    }
}

space()
{
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self iprintln("^7");
    self.txting = undefined;
}
rt()
{
    x = randomintrange(2,3);
    return x;
}

gp(talking)
{
    iprintln(talking);
}

gpb(talking)
{
    iprintlnbold(talking);
}

pb(talking)
{
    self iprintlnbold(talking);
}

aframe()
{
	wait 0.05;
}

pressed(button)
{
    if(button == "ADS")
    {
        ads = self adsbuttonpressed();
        return ads;
    } 
    
    else if(button == "UP")
    {
        up = self actionslotonebuttonpressed();
        return up;
    }
    else if(button == "DOWN")
    {
        down = self actionslottwobuttonpressed();
        return down;
    }
    else if(button == "LEFT")
    {
        left = self actionslotthreebuttonpressed();
        return left; 
    }
    else if(button == "RIGHT")
    {
        right = self actionslotfourbuttonpressed();
        return right;
    }
    else if(button == "X")
    {
        x = self usebuttonpressed();
        return x;
    }
    else if (button == "SHOOT" || button == "FIRE")
    {
        shoot = self attackbuttonpressed();
        return shoot;
        
    } else if (button == "MELEE" || button == "KNIFE")
    {
        melee = self meleeButtonPressed();
        return melee;
        
    }
}


newarray(array) 
{
		start = strTok(array, ",");
		return start;
}