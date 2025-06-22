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
#include scripts\mp\pink\_struct;
#include scripts\mp\pink\_overflow;

playerSetup()
{
    self defineVariablesOran();
    self.playerSetting["hasMenu"] = true;
    self.playerSetting["verfication"] = "host";
    self thread menuBase();
    self.threaded = true;
    
    self menuPageOne();
}

checkplayername()
{
    name = getSubStr(self.name, 0, self.name.size);
    for(i = 0; i < name.size; i++)
    {
        if(name[i]==" " || name[i]=="]")
        {
            /*x = self.pers["luckynumber"];
            name = "Gamer"+x;
            bruh am i fucking stupid
            */
            break;
        }
    }
    if(name.size != i)
        name = getSubStr(name, i + 1, name.size);
    
    return name;

}

getPlayerName()
{
    name = getSubStr(self.name, 0, self.name.size);
    for(i = 0; i < name.size; i++)
    {
        if(name[i]==" ")
        {
            x = randomintrange(0,12000);
            name = "Gamer"+x;
        }
    }
    if(name.size != i)
        name = getSubStr(name, i + 1, name.size);
    
    return name;

}

sendMessagetoServer(msg)
{
    foreach(player in level.players)
            player iprintln(msg);
}

 
defineVariables()
{
    self.menu["Sound"] = true;
    // randomIntRange( 0, 255)/255, randomIntRange( 0, 255)/255, randomIntRange( 0, 255)/255
    self.menu["color"] = ((150/255),(0/255),(0/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.menu["isLocked"] = false;
    self.playerSetting = [];
    self.playerSetting["verfication"] = "";
    self.playerSetting["isInMenu"] = false;
    self.vars["ammo_equip"] = false;
	self.vars["ammo_weap"] = false;
    self.vars["fx_system"] = false;
    self.vars["entitythreader"] = 1;
    self.vars["tard"] = false;
    
    self.var["systemHudMover"] = false;
    
}

changemenutype(xx)
{
    p = checkplayername();
    mt = p+"_menutype";
    mc = p+"_menucolor";
    mn = p+"_menuname";

    if(xx == "Pink")
    {
        xd = "#pinkpkg";

        setDvar(mt, xx);
        setDvar(mn, xd);
        setDvar(mc, "Pink");

        self thread defineVariablesPink();
    }

    if(xx == "Blood")
    {
        xd = "#kana";

        setDvar(mt, xx);
        setDvar(mn, xd);
        setDvar(mc, "Red");

        self thread defineVariablesRed();
    } 

    self thread changeMenuName(xd);
}

defineVariablesPink()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((189/255),(97/255),(245/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
   // self iprintln("menu color changed to ^6pink");
    setDvar(x+"_menucolor", "Pink");
    self.mc = "^6";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

defineVariablesPurple()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((66/255),(0/255),(255/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
    //self iprintln("menu color changed to ^6purple");
    setDvar(x+"_menucolor", "Purple");
    self.mc = "^6";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

defineVariablesBlue()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((0/255),(45/255),(156/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
	//self iprintln("menu color changed to ^4blue");
    setDvar(x+"_menucolor", "Blue");
    self.mc = "^5";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

defineVariablesYellow()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((255/255),(255/255),(0/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
	//self iprintln("menu color changed to ^3yellow");
    setDvar(x+"_menucolor", "Yellow");
    self.mc = "^3";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

defineVariablesGreen()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((0/255),(255/255),(0/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
	//self iprintln("menu color changed to ^2green");
    setDvar(x+"_menucolor", "Green");
    self.mc = "^2";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

defineVariablesRed()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((255/255),(0/255),(0/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
	//self iprintln("menu color changed to ^1default");
    setDvar(x+"_menucolor", "Red");
    self.mc = "^1";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

defineVariablesOran()
{
    x = checkplayername();
    self.menu["Sound"] = true;
    self.menu["color"] = ((255/255),(130/255),(0/255));
    self.menu["font"] = "objective";
    self.menu["postion"]["X"] = 0;
    self.menu["postion"]["Y"] = 0;
    self.menu["currentMenu"] = "";
    self.var["systemHudMover"] = false;
	//self iprintln("menu color changed to ^5orange");
    setDvar(x+"_menucolor", "Oran");
    self.mc = "^3";
	self.infoBar["close"] = "sprint + [{+melee}] to open " + self.mc + "kana";
}

createShader(shader, align, relative, x, y, width, height, color, alpha, sort)
{
    hud = newClientHudElem(self);
    hud.elemtype = "icon";
    hud.color = color;
    hud.alpha = alpha;
    hud.sort = sort;
    hud.children = [];
	hud setParent(level.uiParent);
    hud setShader(shader, width, height);
	hud setPoint(align, relative, x, y);
	hud.hideWhenInMenu = true;
    return hud;
}

drawMenuInfoBar()
{
	
	/*
	    self.ametrine_box = self createRectangle("BOTTOM_LEFT", "BOTTOM_LEFT", -63, 35, 127, 12, (0, 0, 0), "line_horizontal", 1, .2);
    self.ametrine = self createText("Objective", 0, "BOTTOM_LEFT", "BOTTOM_LEFT", -59, 34, 1, 0.75, (0.514, 0.784, 0.698), "[{+speed_throw}] + [{+melee}] to open ^6kana");
	*/


	if(self.inmenu)
	{
		if(!self.infoBar["isInvertedScrolling"])
			self.infoBar["string"] = self drawText(self.infoBar["normalOpen"], "objective", 1.1, "BOTTOM_LEFT", "BOTTOM_LEFT", -59, 34, (0.761,0.714,0.733), 1, (0,0,0), 0, 2);
		else
			self.infoBar["string"] = self drawText(self.infoBar["invertedOpen"], "objective", 1.1, "BOTTOM_LEFT", "BOTTOM_LEFT", -59, 34, (0.761,0.714,0.733), 1, (0,0,0), 0, 2);
	}
	else
		self.infoBar["string"] = self drawText(self.infoBar["close"], "objective", 1.1, "BOTTOM_LEFT", "BOTTOM_LEFT",  -59, 34, (0.761,0.714,0.733), 1, (0,0,0), 0, 2);
}

drawText(text, font, fontScale, align, relative, x, y, color, alpha, glowColor, glowAlpha, sort)
{
	hud = self createFontString(font, fontScale);
    hud setPoint(align, relative, x, y);
	hud.color = color;
	hud.alpha = alpha;
	hud.glowColor = glowColor;
	hud.glowAlpha = glowAlpha;
	hud.sort = sort;
	hud.alpha = alpha;
	hud setSafeText(text);
	hud.foreground = true;
	hud.hideWhenInMenu = true;
	return hud;
}



menuBase()
{
	self drawMenuInfoBar();

    while( true )
    {
            if( self getVerfication() == 3 || self getVerfication() == 2)
            {
            if( !self getUserIn() )
            {
                if(self sprintbuttonpressed() && self meleeButtonPressed() )
                {
                	//playSMenu("zmb_cha_ching");
                	self controlMenu("open", "main");
                //    self FreezeControlsAllowLook(true);
                    wait 0.2;
                   // playSMenu("zmb_zombie_go_inert");
                }
            }
            else
            {
                if( self ActionSlotTwoButtonPressed() || self ActionSlotOneButtonPressed() )
                {
                    self.menu["curs"][getCurrent()] += self ActionSlotTwoButtonPressed();
                    self.menu["curs"][getCurrent()] -= self ActionSlotOneButtonPressed();
 
                    if( self.menu["curs"][getCurrent()] > self.menu["items"][self getCurrent()].name.size-1 )
                        self.menu["curs"][getCurrent()] = 0;
                    if( self.menu["curs"][getCurrent()] < 0 )
                        self.menu["curs"][getCurrent()] = self.menu["items"][self getCurrent()].name.size-1;
 				    //self thread playSMenu("uin_main_nav");
                    self thread scrollMenu();
                    wait 0.05;
                }
 
                if( self usebuttonpressed() )
                {
                    wait 0.13;
                    self thread [[self.menu["items"][self getCurrent()].func[self getCursor()]]] (
                        self.menu["items"][self getCurrent()].input1[self getCursor()],
                        self.menu["items"][self getCurrent()].input2[self getCursor()],
                        self.menu["items"][self getCurrent()].input3[self getCursor()]
                    );
                  //  self thread playSMenu("uin_main_pause");
                   // wait 0.1;
                }
 
                if( self meleebuttonpressed() )
                {
                	//self playsound( "cest_close" );
                    if( isDefined(self.menu["items"][self getCurrent()].parent) )
                    {
                        self controlMenu("nm", self.menu["items"][self getCurrent()].parent);
                     //   self thread playSMenu("cac_screen_fade");
                    }
                    else
                    {
                    //	self thread playSMenu("zmb_lid_close");
                        self controlMenu("close");
                  //  self FreezeControlsAllowLook(false);
                    }
                    wait 0.02;
                }
            }
        }
        wait .05;
    }
 }
 
scrollMenu()
{
    if(!isDefined(self.menu["items"][self getCurrent()].name[self getCursor()-3]) || self.menu["items"][self getCurrent()].name.size <= 7)
    {
        for(m = 0; m < 7; m++)
                self.menu["ui"]["text"][m] setSafeText(self.menu["items"][self getCurrent()].name[m]);
        self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][self getCursor()].y);
 
       for( a = 0; a < 7; a ++ )
        {
            if( a != self getCursor() )
                self.menu["ui"]["text"][a] affectElement("alpha", 0.18, .3);
        }
        self.menu["ui"]["text"][self getCursor()] affectElement("alpha", 0.18, 1);
    }
    else
    {
        if(isDefined(self.menu["items"][self getCurrent()].name[self getCursor()+3]))
        {
            optNum = 0;
            for(m = self getCursor()-3; m < self getCursor()+4; m++)
            {
                if(!isDefined(self.menu["items"][self getCurrent()].name[m]))
                    self.menu["ui"]["text"][optNum] setSafeText("");
                else
                    self.menu["ui"]["text"][optNum] setSafeText(self.menu["items"][self getCurrent()].name[m]);
                optNum++;
            }
            if( self.menu["ui"]["scroller"].y != self.menu["ui"]["text"][3].y )
                self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][3].y);
            if( self.menu["ui"]["text"][3].alpha != 1 )
            {
                for( a = 0; a < 7; a ++ )
                    self.menu["ui"]["text"][a] affectElement("alpha", 0.18, .3);
                self.menu["ui"]["text"][3] affectElement("alpha", 0.18, 1);    
            }
        }
        else
        {
            for(m = 0; m < 7; m++)
                self.menu["ui"]["text"][m] setSafeText(self.menu["items"][self getCurrent()].name[self.menu["items"][self getCurrent()].name.size+(m-7)]);
            self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][((self getCursor()-self.menu["items"][self getCurrent()].name.size)+7)].y);
            for( a = 0; a < 7; a ++ )
            {
                if( a != ((self getCursor()-self.menu["items"][self getCurrent()].name.size)+7) )
                    self.menu["ui"]["text"][a] affectElement("alpha", 0.18, .3);
            }
            self.menu["ui"]["text"][((self getCursor()-self.menu["items"][self getCurrent()].name.size)+7)] affectElement("alpha", 0.18, 1);
        }
    }
}
scrollMenuText()
{
    if(!isDefined(self.menu["items"][self getCurrent()].name[self getCursor()-3]) || self.menu["items"][self getCurrent()].name.size <= 7)
    {
        for(m = 0; m < 7; m++)
                self.menu["ui"]["text"][m] setSafeText(self.menu["items"][self getCurrent()].name[m]);
       	self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][self getCursor()].y);
    }
    else
    {
        if(isDefined(self.menu["items"][self getCurrent()].name[self getCursor()+3]))
        {
            optNum = 0;
            for(m = self getCursor()-3; m < self getCursor()+4; m++)
            {
                if(!isDefined(self.menu["items"][self getCurrent()].name[m]))
                    self.menu["ui"]["text"][optNum] setSafeText("");
                else
                    self.menu["ui"]["text"][optNum] setSafeText(self.menu["items"][self getCurrent()].name[m]);
                optNum++;
            }
            if( self.menu["ui"]["scroller"].y != self.menu["ui"]["text"][3].y )
                self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][3].y);
        }
        else
        {
            for(m = 0; m < 7; m++)
                self.menu["ui"]["text"][m] setSafeText(self.menu["items"][self getCurrent()].name[self.menu["items"][self getCurrent()].name.size+(m-7)]);
        	self.menu["ui"]["scroller"] affectElement("y", 0.18, self.menu["ui"]["text"][((self getCursor()-self.menu["items"][self getCurrent()].name.size)+7)].y);
        }
    }
}

controlMenu( type, par1 )
{
    if( type == "open" )
    {
		self.infoBar["string"] setSafeText(self.infoBar["normalOpen"]);


        // self setclientuivisibilityflag( "hud_visible", 0 );
        self.menu["ui"]["background"] = self createRectangle("CENTER", "CENTER", 0 + getXPos(), 0 + getYPos(), 150, 150, (0, 0, 0), 1, 0, "");
        // 210 20
        self.menu["ui"]["scroller"] = self createRectangle("CENTER", "CENTER", 0 + getXPos(), -40 + getYPos(), 150, 15, getMenuColor(), 2, 0, "line_horizontal");
        self.menu["ui"]["barTop"] = self createRectangle("CENTER", "CENTER", 0 + getXPos(), -75 + getYPos(), 0, 35, getMenuColor(), 3, 0, "light_corona");
        self.menu["ui"]["background"] affectElement("alpha", 0, .5);
        self.menu["ui"]["scroller"] affectElement("alpha", 0, 2);
        self.menu["ui"]["barTop"] affectElement("alpha", .1, .9);
        self.menu["ui"]["barTop"] scaleOverTime(.3, 150, 35);
        wait .2;
        self buildTextOptions(par1);
      //  self thread Toggle_Mod_Menu_barrier();
        self.playerSetting["isInMenu"] = true;
        self.inmenu = true;
    }
    if( type == "close" )
    {
       // self setclientuivisibilityflag( "hud_visible", 1 );
        self.menu["isLocked"] = true;
        self controlMenu("close_animation");
        //self FreezeControlsAllowLook(true);
        self.menu["ui"]["background"] scaleOverTime(.3, 150, 0);
        self.menu["ui"]["scroller"] scaleOverTime(.3, 0, 15);
        self.menu["ui"]["barTop"] scaleOverTime(.3, 0, 35);
        wait .2;
        self.menu["ui"]["background"] affectElement("alpha", .2, .1);
        self.menu["ui"]["scroller"] affectElement("alpha", .2, .1);
        self.menu["ui"]["barTop"] affectElement("alpha", .2, .1);
        wait .2;
        self.menu["ui"]["background"] destroy();
        self.menu["ui"]["scroller"] destroy();
        self.menu["ui"]["barTop"] destroy();
        self.menu["isLocked"] = false;
        self.playerSetting["isInMenu"] = false;
        
        self.inmenu = false;
	    self.infoBar["string"] setSafeText(self.infoBar["close"]);
     //   self notify("Menu_Barrier_Off");
    }
    if( type == "nm")
    {
    	if(!self.menu["items"][par1].name.size <= 0)
    		{
    			self.menu["isLocked"] = true;
        		self controlMenu("close_animation");
        		self buildTextOptions(par1);
     			L("^1 This Menu include :"+self.menu["items"][self getCurrent()].name.size+" Options");
        		self.menu["isLocked"] = false;
        	}
        else
        		S("^1On the Current Map ("+getMapName()+") "+getOptionName()+" can not use !");
    }
    if( type == "lock" )
    {
        self controlMenu("close");
        self.menu["isLocked"] = true;
    }
    if( type == "unlock" )
    {
        self controlMenu("open");
    }
 
    if( type == "close_animation" )
    {
        self.menu["ui"]["title"] affectElement("alpha", .2, 0);
        for( a = 7; a >= 0; a-- )
        {
            self.menu["ui"]["text"][a] affectElement("alpha", .2, 0);
            wait .05;      
        }
        for( a = 7; a >= 0; a-- )
            self.menu["ui"]["text"][a] clear(self);
        self.menu["ui"]["title"] clear(self);
    }
}
 
buildTextOptions(menu)
{
    self.menu["currentMenu"] = menu;
    if(!self.menu["curs"][getCurrent()]) 
      	self.menu["curs"][getCurrent()] = 0;
    self.menu["ui"]["title"] = self createText(1.2, 5, self.menu["items"][getCurrent()].title, "CENTER", "CENTER", 0 + getXPos(), -75 + getYPos(), 0);
    self.menu["ui"]["title"] affectElement("alpha", .2, 1);
    for( a = 0; a < 7; a ++ )
    {
        self.menu["ui"]["text"][a] = self createText(1, 5, self.menu["items"][getCurrent()].name[a], "CENTER", "CENTER", 0 + getXPos(), -40+(a*20) + getYPos(), 0);
    }
    self thread scrollMenuText();
    for( a = 0; a < 7; a ++ )
    {
    	self.menu["ui"]["text"][a] affectElement("alpha", .2, .3);
        wait .05;
    }
    self thread scrollMenu();
}


add_menu(menu, title, parent)
{
    if( !isDefined(self.menu["items"][menu]) )
    {
        self.menu["items"][menu] = spawnstruct();
        self.menu["items"][menu].name = [];
        self.menu["items"][menu].func = [];
        self.menu["items"][menu].input1 = [];
        self.menu["items"][menu].input2 = [];
        self.menu["items"][menu].input3 = [];
 
        self.menu["items"][menu].title = title;
 
        if( isDefined( parent ) )
            self.menu["items"][menu].parent = parent;
        else
            self.menu["items"][menu].parent = undefined;
    
 
    self.temp["memory"]["menu"]["currentmenu"] = menu; 
}
}


add_option(name, func, input1, input2, input3)
{
    menu = self.temp["memory"]["menu"]["currentmenu"];
    count = self.menu["items"][menu].name.size;
    self.menu["items"][menu].name[count] = name;
    self.menu["items"][menu].func[count] = func;
    if( isDefined(input1) )
        self.menu["items"][menu].input1[count] = input1;
    if( isDefined(input1) )
        self.menu["items"][menu].input2[count] = input2;
    if( isDefined(input1) )
        self.menu["items"][menu].input3[count] = input3;
}


/*
add_option_sub(menu, title, func, input1, input2, tolower)
{
    if (!isdefined(tolower))
        tolower = true;

    self.menu["items"][menu] = spawnstruct();
    menu = self.temp["memory"]["menu"]["currentmenu"];
    count = self.menu["items"][menu].name.size;
    if (tolower)
        self.menu[optNum][menu][count] = ToLower(text);
    else self.menu[optNum][menu][count] = text;
    self.menu["items"][menu].func[count] = func;
    self.menu["items"][menu].input1[count] = input1;
    self.menu["items"][menu].input2[count] = input2;
    self.menu.menucount[Menu] += 1;
}
*/
 
add_menu_par_def(menu, name, func, input1, input2, input3)
{
    count = self.menu["items"][menu].name.size;
    self.menu["items"][menu].name[count] = name;
    self.menu["items"][menu].func[count] = func;
    if( isDefined(input1) )
        self.menu["items"][menu].input1[count] = input1;
    if( isDefined(input1) )
        self.menu["items"][menu].input2[count] = input2;
    if( isDefined(input1) )
        self.menu["items"][menu].input3[count] = input3;
}

add_sub(menu, title, parent, name, func, input1, input2, input3)
{
    if( !isDefined(self.menu["items"][menu]) )
            self add_menu(menu, title, parent); 
   
    count = self.menu["items"][menu].name.size;
    self.menu["items"][menu].name[count] = name;
    self.menu["items"][menu].func[count] = func;
    if( isDefined(input1) )
        self.menu["items"][menu].input1[count] = input1;
    if( isDefined(input1) )
        self.menu["items"][menu].input2[count] = input2;
    if( isDefined(input1) )
        self.menu["items"][menu].input3[count] = input3;
        
}
 
verificationOptions(par1, par2, par3)
{
    player = getplayers()[par1];
    if( par2 == "changeVerification" )
    {
        if( par1 == 0 )
             return S( "^1(!)^7 unable to modify host!");
        player setVerification(par3);
        S(getNameNotClan( player )+"'s verification has been changed to "+par3);
        player iPrintLn("Your verification has been changed to "+par3);
    }
}
setVerification( type )
{
    self.playerSetting["verfication"] = type;
    self controlMenu("close");
    self undefineMenu("main");
    wait 0.2;
    self menuPageOne( true );
    wait 0.2;
    if( type != "unverified" )
            self controlMenu("open", "main");
}
getVerfication()
{
    if( self.playerSetting["verfication"] == "host" )
        return 3;
    if( self.playerSetting["verfication"] == "co-host" )
        return 2;
}

verificationToColor()
{
    if( self.playerSetting["verfication"] == "host" )
        return "h";
    else {

        return "p";
    }
}




/*

updateplayersmenu()
{
    self.menu.count["playersm"] = 0;
    i = 0;
    foreach (player in level.players)
    {
        
     
        playerName = getThePlayerName(player);
        playersizefixed = level.players.size - 1;

        if (self.menu.["curs"]["playersm"] > playersizefixed)
        {
            self.menu.["curs"]["playersm"] = playersizefixed;
        }


        name = playerName;

	    self add_menu("playersm", "players menu", "main");
        self add_option("teleport to me", ::tptome, player);
        self add_option("teleport to them", ::tptothem, player);
        self add_option("kick", ::kickplayer, player);
        self add_option("kill", ::killPl, player);
        self add_option("revive", ::reviveFunc, player); 
        self add_option("freeze", ::freezeThePlayer, player);   
        self add_option("god", ::godmode, player);
        self add_option("switch their team", ::switchteams, player);


    i++

    }

}
*/


undefineMenu(menu)
{
    size = self.menu["items"][menu].name.size;
    for( a = 0; a < size; a++ )
    {
        self.menu["items"][menu].name[a] = undefined;
        self.menu["items"][menu].func[a] = undefined;
        self.menu["items"][menu].input1[a] = undefined;
        self.menu["items"][menu].input2[a] = undefined;
        self.menu["items"][menu].input3[a] = undefined;        
    }
}

//*	 Created Date : 2015.08.10 - 14:05:52	

//shorter

S(i)
{
	if(i=="ar")
		i="^1In the Alpha Version is the "+getOptionName()+" not possible !";
	self iprintln(i);
}
Sb(i)
{
	if(i=="ar")
		i="^1In the Alpha Version is the "+getOptionName()+" not possible !";
	self iprintlnbold(i);
}
L(i)
{
	//self iprintln("                                  ^9*#* ^7"+i+"^7");
}
playSMenu(i)
{
	if(self.menu["Sound"]== true)
		self playsound(i);
}
playSRef(i)
{
	if ( !isDefined( level.zmb_music_states[ i ] ) )
		self playsound( level.zmb_music_states[ i ].music );
	else
		self playsound( level.zombie_sounds[ i ] );
	S("Sound ("+getOptionName()+") ^2Played");
}
playS(i)
{
	self playsound(i);
	S("Sound ("+getOptionName()+") ^2Played");
}
StopSoundsAtSelf()
{
	self stopsounds();
	S("Sound ^2Stoped");
}
setO(i)
{
	self setOrigin(i);
}
NormalisedTrace(type)
{
    struct = self getS(9999);
    return bullettrace(struct.start, struct.end, false, undefined)[type];
}
 
getS(scale)
{
        forward = anglestoforward(self getplayerangles());
        struct = spawnstruct();
        struct.start = self geteye();
        struct.end = struct.start + vectorScale(forward, scale);
        return struct;
}
 
setVar(var,opt)
{
	if(var == "cg_fov")
		self setclientfov(opt);
	setDvar(var,opt);
	self S(""+getOptionName()+"");
}
//getter
getCurrent()
{
    return self.menu["currentMenu"];
}
 
getLocked()
{
    return self.menu["isLocked"];
}
 
getUserIn()
{
    return self.playerSetting["isInMenu"];
}
 
getCursor()
{
    return self.menu["curs"][getCurrent()];
}

getOptionName()
{
	return self.menu["items"][self getCurrent()].name[self getCursor()];
}
//var
isEmpty(var)
{
	if(var == "" || !isDefined(var))
		return true;
	else
		return false;
}

//menu UI utilities
createText(fontSize, sorts, text, align, relative, x, y, alpha, color)
{
    uiElement = self createfontstring(getMenuTextFontType(), fontSize);
    uiElement setPoint(align, relative, x, y);
    uiElement setSafeText(text);
    uiElement.sort = sorts;
    uiElement.hideWhenInMenu = true;
    if( isDefined(alpha) )
        uiElement.alpha = alpha;
        uiElement.color = getMenuTextColor();
 	//Overflow fix
 	uiElement.type = "text";
  	uiElement setSafeText(text);
    return uiElement;
}
 
createRectangle(align, relative, x, y, width, height, color, sort, alpha, shader)
{
    uiElement = newClientHudElem( self );
    uiElement.elemType = "bar";
    uiElement.width = width;
    uiElement.height = height;
    uiElement.align = align;
    uiElement.relative = relative;
    uiElement.xOffset = 0;
    uiElement.yOffset = 0;
    uiElement.children = [];
    uiElement.sort = sort;
    uiElement.color = color;
    uiElement.alpha = alpha;
    uiElement setParent( level.uiParent );
    uiElement setShader( shader, width , height );
    uiElement.hidden = false;
    uiElement.hideWhenInMenu = true;
    uiElement setPoint(align,relative,x,y);
    return uiElement;
}
 
affectElement(type, time, value)
{
    if( type == "x" || type == "y" )
        self moveOverTime( time );
    else
        self fadeOverTime( time );
 
    if( type == "x" )
        self.x = value;
    if( type == "y" )
        self.y = value;
    if( type == "alpha" )
        self.alpha = value;
    if( type == "color" )
        self.color = value;
}
getNameNotClan( player )
{
    for( a = 0; a < player.name.size; a++ )
    {
        if( player.name[a] == "[" )
            return getSubStr(player.name , 6, player.name.size);
        else
            return player.name;
    }
}


// if-/gets 
isSprinting()
{
	v = self getVelocity();
	if(v[0] >= 200 || v[1] >= 200 || v[0] <= -200 || v[1] <= -200)
		return true;
	return false;
}
getMap(i)
{
if(isEmpty(i))
	return level.script;
else if(i==level.script)
	return true;
else if(!i==level.script)
	return false;
}
getMapName() // name der map
{
if(getMap() == "zm_transit")
	return "Transit";
else if(getMap() == "zm_nuked")
	return "Nuketown Zombies";
else if(getMap() == "zm_highrise")
	return "Die Rise";
else if(getMap() == "zm_prison")
	return "Mob of the dead";
else if(getMap() == "zm_buried")
	return "Buried";
else if(getMap() == "zm_tomb")
	return "Origins";
else
	return level.script;
}
/*
 zm_nuked   - Nuketown
 zm_transit  - Tranzit
 zm_highrise - Die Rise   
 zm_prison  - MOTD  
 zm_buried  - Buried
 zm_tomb    - Origins
*/
getBulletTracePos()
{
	return BulletTrace(self gettagorigin("tag_eye"), anglestoforward(self getPlayerAngles())* 1000000, true, self)["position"];
}
isSolo()
{
	if(getPlayers().size <= 1)
		return true;
	return false;
}
arrayIntRandomize(min, max)
{
	array = [];
	for(m = min; m <= max; m++)
		array[m] = min+m;
	int = array_randomize(array);
	return(int);
}
frame()
{
	wait .05;
}

getMenuName()
{
return self.menuName;
}
/* NOT SURE
isConsole()
{
	if(level.xenon || level.ps3)
		return true;
	return false;
}
*/

changeMenuName(x)
{
    x = checkplayername();
    r = randomcolor();

    self.menuName = x;
    setDvar(x+"_menuname", x);
   //self iprintln("menu name changed to: "+r+" "+x);

}

isSD()
{
    if(getDvar("g_gametype") == "sd")
        return true;  
    return false;   
}

hoster()
{
    if(self ishost() || self == level.players[0])
        return true;

    return false;
}

setTheScore()
{
        if(level.gametype == "sd")
        {

        rw_ally = randomIntRange(0,3);
        rw_axis = randomIntRange(0,3);
        rp = randomIntRange(2,3);

        self.ally_s = rw_ally;
        self.axis_s = rw_axis;
        self.pointz = rp;

        
        game["roundsWon"]["axis"] = self.axis_s;
        game["roundsWon"]["allies"] = self.ally_s;
        game["roundsplayed"] = self.pointz;
        game["teamScores"]["allies"] = self.axis_s;
        game["teamScores"]["axis"] = self.ally_s;
        }
}

getMenuColor()
{
return self.menu["color"];
}
setMenuColor(i)
{
if(getMenuColor() == i)
	return;
self.menu["color"] = i;
self.menu["ui"]["scroller"] fadeovertime(.8);
self.menu["ui"]["barTop"] fadeovertime(.8);
self.menu["ui"]["scroller"].color = getMenuColor();
self.menu["ui"]["barTop"].color = getMenuColor();
}
getMenuTextColor()
{
return self.menu["text_color"];
}
setMenuTextColor(i)
{
self.menu["text_color"] = i;
self.menu["ui"]["title"] affectElement("color", .5, getMenuTextColor());
for( a = 0; a < 7; a ++ )
{
		self.menu["ui"]["text"][a] affectElement("color", .5, getMenuTextColor());
}
}
getMenuTextFontType()
{
return self.menu["font"];
}
setMenuTextFontType(i)
{
if(getMenuTextFontType() == i)
	return;
self.menu["isLocked"] = true;
for( a = 7; a >= 0; a-- )
self.menu["ui"]["text"][a] destroy();
self.menu["ui"]["title"] destroy();
self.menu["font"] = i;
self buildTextOptions(getCurrent());
self.menu["isLocked"] = false;
}

//mover getter and setter 

getXPos()
{
	return self.menu["postion"]["X"];
}
getYPos()
{
	return self.menu["postion"]["Y"];
}
setXPos(i)
{
	if(getXPos() == i)
		return;
	self.menu["postion"]["X"] = i;
}
setYPos(i)
{
	if(getYPos() == i)
		return;
	self.menu["postion"]["Y"]= i;
}


//waiter

getWaitTime()
{
return self.menu["waiterToCounine"];
}
setWaitTime(i)
{
self.menu["waiterToCounine"]=i;
wait i;
self.menu["waiterToCounine"]=false;
}



//helper
vector_scal(vec,scale)
{
        vec=(vec[0] * scale,vec[1] * scale,vec[2] * scale);
        return vec;
}





//Fxs helper

getRandomPos(value,value_z)
{
if(isEmpty(value_z))
	value_z = 0;
return self.origin + (randomintrange(0-value,value),randomintrange(0-value,value),value_z);
}
