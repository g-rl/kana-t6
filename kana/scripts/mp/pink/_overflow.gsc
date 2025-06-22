#include maps\mp\_utility;
#include common_scripts\utility;
#include maps\mp\gametypes\_hud_util;
#include maps\mp\gametypes\_hud_message;
#include maps\mp\gametypes\_weapons; 
#include maps\mp\gametypes\_rank;
#include maps\mp\gametypes\_hud;
#include scripts\mp\pink\_util;
#include scripts\mp\pink\_struct;
#include scripts\mp\pink\_angora;
#include scripts\mp\pink\_random;
#include scripts\mp\pink\_ride;
#include scripts\mp\pink\_func;
#include scripts\mp\pink\_map;


addString(string)
{
    level.strings = string;
    level notify("string_added");
}

fixString() 
{
    self notify("new_string");
    self endon("new_string");
    while(isDefined(self)) 
    {
        level waittill("overflow_fixed");
        self setSafeText(self.string);
    }
}


overflowFixInit() 
{
    level.strings = [];
    level.overflowElem = createServerFontString("default", 1.5);
    level.overflowElem setSafeText("overflow");
    level.overflowElem.alpha = 0;
    level thread overflowFixMonitor();
}

overflowFixMonitor() 
{
    for(;;) 
    {
        level waittill("string_added");
        if(level.strings >= 45) 
        {
            level.overflowElem clearAllTextAfterHudElem();
            level.strings = [];
            level notify("overflow_fixed");
        }
        wait 0.05;
    }
}

setSafeText(text)
{
    self.string = text;
    self setText(text);
    self thread fixString();
    self addString(text);
}

overflowfix()
{
	level.test = createServerFontString("default",1.5);
	level.test setText("xTUL");
	level.test.alpha = 0;

	for(;;)
	{
		level waittill("textset");
		if(level.result >= 50)
		{
			level.test ClearAllTextAfterHudElem();
			level.result = 0;
		}
		wait .1;
	}
}

clear(player)
{
        if(self.type == "text")
                player deleteTextTableEntry(self.textTableIndex);
               
        self destroy();
}

deleteTextTableEntry(id)
{
        foreach(entry in self.textTable)
        {
                if(entry.id == id)
                {
                        entry.id = -1;
                        entry.stringId = -1;
                }
        }
}