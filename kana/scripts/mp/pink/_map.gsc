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

configureBouncers() {
	level addBouncerLocation("mp_carrier", (-5869.32, -1251.69, 58.8896));
	level addBouncerLocation("mp_carrier", (-6569.56, 1055.23, -57.6328));
	level addBouncerLocation("mp_carrier", (-762.902, -921.292, 276.207));
	level addBouncerLocation("mp_carrier", (-2753.44, 100.673, 110.065));
	level addBouncerLocation("mp_carrier", (-5448.15, -1545.53, -38.1261));
	level addBouncerLocation("mp_carrier", (-3329.33, -7.02706, 161.16));
	level addBouncerLocation("mp_carrier", (-5110.69, 223.847, 98.6783));
	level addBouncerLocation("mp_castaway", (1678.24, -315.807, 286.729));
	level addBouncerLocation("mp_castaway", (2109.52, -48.3979, 70.125));
	level addBouncerLocation("mp_castaway", (2021.49, -454.213, 71.125));
	level addBouncerLocation("mp_castaway", (29.1859, 704.604, 101.001));
	level addBouncerLocation("mp_castaway", (-1265.03, -850.196, 82.4742));
	level addBouncerLocation("mp_castaway", (40.861, 757.741, 103.125));
	level addBouncerLocation("mp_concert", (327.362, 1204.67, -16.6191));
	level addBouncerLocation("mp_concert", (50.8952, 794.905, 76.216));
	level addBouncerLocation("mp_dig", (-1185.83, 163.949, 122.787));
	level addBouncerLocation("mp_dig", (-93.1596, 911.844, 76.6268));
	level addBouncerLocation("mp_dig", (724.805, -772.809, 102.154));
	level addBouncerLocation("mp_dig", (755.956, 128.902, 95.125));
	level addBouncerLocation("mp_dig", (-200.111, 269.628, 128.056));
	level addBouncerLocation("mp_dockside", (-319.06, 906.621, -34.8969));
	level addBouncerLocation("mp_dockside", (-2056.36, 1153.39, -129.19));
	level addBouncerLocation("mp_dockside", (-2002.36, 2754.96, -104.736));
	level addBouncerLocation("mp_dockside", (1163.25, 8.23151, -53.6211));
	level addBouncerLocation("mp_dockside", (465.854, 1321.92, -31.0279));
	level addBouncerLocation("mp_dockside", (-55.8482, -1076.97, -1.58364));
	level addBouncerLocation("mp_dockside", (-626.18, -234.708, 44.1158));
	level addBouncerLocation("mp_dockside", (891.558, 2128.47, -68.375));
	level addBouncerLocation("mp_downhill", (945.949, 2121.06, 1202.29));
	level addBouncerLocation("mp_drone", (-1185.17, -96.9786, 130.125));
	level addBouncerLocation("mp_drone", (-1192.98, 468.517, 130.125));
	level addBouncerLocation("mp_drone", (-127.115, 1449.06, 152.225));
	level addBouncerLocation("mp_drone", (-51.3629, 2223.73, 257.862));
	level addBouncerLocation("mp_drone", (-1551.94, -1377.94, 155.41));
	level addBouncerLocation("mp_express", (-165.438, 1242.08, 114.976));
	level addBouncerLocation("mp_express", (-171.246, -1227.32, 109.012));
	level addBouncerLocation("mp_express", (1919.79, 298.494, -18.5894));
	level addBouncerLocation("mp_express", (-603.541, -2185.02, -186.844));
	level addBouncerLocation("mp_express", (-556.298, 2293.02, -180.698));
	level addBouncerLocation("mp_express", (2010.45, -309.666, -13.0873));
	level addBouncerLocation("mp_express", (-198.249, 1879.46, -88.1925));
	level addBouncerLocation("mp_express", (4110.83, -298.675, 1405.83));
	level addBouncerLocation("mp_express", (326.743, -1131.71, 118.176));
	level addBouncerLocation("mp_express", (340.326, 1124.27, 118.318));
	level addBouncerLocation("mp_frostbite", (389.624, -1160.66, 77.2828));
	level addBouncerLocation("mp_frostbite", (-7.23485, 1327.73, -5.71517));
	level addBouncerLocation("mp_frostbite", (-860.465, -274.565, 191.244));
	level addBouncerLocation("mp_hijacked", (-677.832, 502.536, 76.7944));
	level addBouncerLocation("mp_hijacked", (-1875.03, 174.359, -8.21555));
	level addBouncerLocation("mp_hijacked", (-3016.54, 354.68, -88.647));
	level addBouncerLocation("mp_hijacked", (-3462.78, 14.4914, -260.875));
	level addBouncerLocation("mp_hijacked", (-1116.98, 885.131, -138.277));
	level addBouncerLocation("mp_hijacked", (51.1912, -84.3549, 152.137));
	level addBouncerLocation("mp_hijacked", (-1900.63, -173.859, 24.9772));
	level addBouncerLocation("mp_hydro", (360.674, 302.896, -209.105));
	level addBouncerLocation("mp_hydro", (-1511.59, 403.235, -240.612));
	level addBouncerLocation("mp_hydro", (1864.64, -769.789, 217.382));
	level addBouncerLocation("mp_hydro", (934.478, -1347.2, 328.61));
	level addBouncerLocation("mp_hydro", (-1915.64, -765.288, 205.846));
	level addBouncerLocation("mp_hydro", (2228.99, 309.356, 97.305));
	level addBouncerLocation("mp_hydro", (-39.3439, 288.397, -559.12));
	level addBouncerLocation("mp_la", (-425.108, 3392.53, -92.5703));
	level addBouncerLocation("mp_la", (-1277.5, 2554.69, 8.92019));
	level addBouncerLocation("mp_la", (1053.66, 3828.33, -2.27279));
	level addBouncerLocation("mp_magma", (15.9012, -937.444, -459.933));
	level addBouncerLocation("mp_magma", (-702.486, 597.329, -352.009));
	level addBouncerLocation("mp_magma", (2091.69, -231.291, -483.231));
	level addBouncerLocation("mp_magma", (-1935.83, -1222.25, -449.83));
	level addBouncerLocation("mp_meltdown", (1132.9, 285.241, -17.3398));
	level addBouncerLocation("mp_meltdown", (522.85, 813.721, -35.8652));
	level addBouncerLocation("mp_mirage", (881.089, 2941.14, 38.178));
	level addBouncerLocation("mp_mirage", (2401.86, 663.401, 59.4867));
	level addBouncerLocation("mp_mirage", (1605.45, 429.71, -22.8654));
	level addBouncerLocation("mp_mirage", (-393.488, 2406.41, 104.125));
	level addBouncerLocation("mp_mirage", (337.643, 2352.43, 64.0161));
	level addBouncerLocation("mp_mirage", (-1711.19, 375.726, 17.4037));
	level addBouncerLocation("mp_mirage", (1300.4, 2502.64, 195.257));
	level addBouncerLocation("mp_nightclub", (-19145.8, 466.807, -117.393));
	level addBouncerLocation("mp_nightclub", (-15975.9, 3641.24, -120.169));
	level addBouncerLocation("mp_nightclub", (-16708.9, 2636.69, -158.066));
	level addBouncerLocation("mp_nightclub", (-18144.3, 1210.14, -157.272));
	level addBouncerLocation("mp_overflow", (1591.68, -262.179, 120.017));
	level addBouncerLocation("mp_overflow", (-421.62, -12.5147, 35.079));
	level addBouncerLocation("mp_overflow", (-312.417, 755.129, 122.129));
	level addBouncerLocation("mp_overflow", (-1759.82, -503.997, 67.7398));
	level addBouncerLocation("mp_overflow", (-585.841, 44.2521, 44.0753));
	level addBouncerLocation("mp_overflow", (141.134, -432.585, 40.165));
	level addBouncerLocation("mp_overflow", (1567.41, -379.423, 36.4487));
	level addBouncerLocation("mp_pod", (-553.271, -314.119, 417.353));
	level addBouncerLocation("mp_pod", (-1302.41, 119.485, 251.064));
	level addBouncerLocation("mp_pod", (184.923, -250.056, 356.731));
	level addBouncerLocation("mp_raid", (6735.57, 5403.97, -36.5784));
	level addBouncerLocation("mp_raid", (387.044, 2803.57, 237.429));
	level addBouncerLocation("mp_raid", (1780.71, 1136.94, 152.593));
	level addBouncerLocation("mp_raid", (1379.35, 1300.22, 189.093));
	level addBouncerLocation("mp_raid", (2724.25, 4746.19, 127.526));
	level addBouncerLocation("mp_raid", (4912.51, 2439.8, -49.3976));
	level addBouncerLocation("mp_raid", (-719.588, 3063.3, 192.601));
	level addBouncerLocation("mp_raid", (-429.849, 3948.35, 78.6358));
	level addBouncerLocation("mp_rush", (750.359, 1085.72, 88.4795));
	level addBouncerLocation("mp_skate", (517.716, 354.567, 201.11));
	level addBouncerLocation("mp_skate", (1306.03, -1365.87, 214.125));
	level addBouncerLocation("mp_skate", (1416.38, 49.6625, 208.125));
	level addBouncerLocation("mp_socotra", (735.985, 588009, 153.6));
	level addBouncerLocation("mp_socotra", (-128.414, 1224.07, 304.656));
	level addBouncerLocation("mp_socotra", (-594.962, 1243.15, 385.349));
	level addBouncerLocation("mp_socotra", (1615.58, 128.801, 159.625));
	level addBouncerLocation("mp_socotra", (-1383.76, 85.9977, -193.481));
	level addBouncerLocation("mp_studio", (-15.2681, 884.518, 73.1459));
	level addBouncerLocation("mp_studio", (655.715, -150.013, -80.5712));
	level addBouncerLocation("mp_studio", (1052.97, 1779.61, 68.8118));
	level addBouncerLocation("mp_studio", (1149.76, 922.288, 76.2402));
	level addBouncerLocation("mp_studio", (1683.29, 2161.44, -36.8706));
	level addBouncerLocation("mp_studio", (971.355, 1741.71, 17.5968));
	level addBouncerLocation("mp_studio", (345.663, -1709.77, 199.046));
	level addBouncerLocation("mp_studio", (3919.53, -119.045, 403.339));
	level addBouncerLocation("mp_takeoff", (-217.445, 2933.2, 156.454));
	level addBouncerLocation("mp_takeoff", (373.593, 1722.32, 16.8059));
	level addBouncerLocation("mp_takeoff", (1511.1, 2016.67, 161.237));
	level addBouncerLocation("mp_takeoff", (246.924, 593.511, 68.125));
	level addBouncerLocation("mp_takeoff", (-1071.17, 2490.46, -11.875));
	level addBouncerLocation("mp_takeoff", (-655.641, 398.871, 77.049));
	level addBouncerLocation("mp_takeoff", (122.389, 3062.22, 62.125));
	level addBouncerLocation("mp_takeoff", (-1355.64, 243.641, 196.314));
	level addBouncerLocation("mp_turbine", (-594.55, 1205.95, 576.884));
	level addBouncerLocation("mp_turbine", (-165.55, 1396.12, 317.715));
	level addBouncerLocation("mp_turbine", (-1663.42, -3790.13, 569.599));
	level addBouncerLocation("mp_turbine", (393.785, 3442, -4.01387));
	level addBouncerLocation("mp_turbine", (-37.1907, 1829.53, 302.811));
	level addBouncerLocation("mp_turbine", (189.754, -1568.41, 296.139));
	level addBouncerLocation("mp_turbine", (643.258, 940.354, 193.707));
	level addBouncerLocation("mp_turbine", (-1785.15, 1534.05, 416.275));
	level addBouncerLocation("mp_turbine", (413.663, 3444.61, 38.7675));
	level addBouncerLocation("mp_turbine", (657.933, 1942.85, 75.125));
	level addBouncerLocation("mp_turbine", (-69.449, 642.207, 375.125));
	level addBouncerLocation("mp_turbine", (62.5778, 4406.45, -95.007));
	level addBouncerLocation("mp_turbine", (569.211, -1813.91, 204.228));
	level addBouncerLocation("mp_turbine", (-594.55, 1205.95, 576.884));
	level addBouncerLocation("mp_uplink", (3310.83, -1049.48, 405.992));
	level addBouncerLocation("mp_uplink", (3847.88, -6564.59, 2056.52));
	level addBouncerLocation("mp_uplink", (1866.47, 270.677, 142.411));
	level addBouncerLocation("mp_uplink", (3310.83, -1049.48, 405.992));
	level addBouncerLocation("mp_uplink", (1866.47, 270.677, 142.411));
	level addBouncerLocation("mp_vertigo", (802.676, -828.732, 154.654));
	level addBouncerLocation("mp_vertigo", (-1862.66, 481.326, 7.34311));
	level addBouncerLocation("mp_vertigo", (-1169.12, -1543.57, 80.2503));
	level addBouncerLocation("mp_vertigo", (3590.15, 2681.12, -399.875));
	level addBouncerLocation("mp_vertigo", (-1059.93, -2038.51, -21.206));
	level addBouncerLocation("mp_vertigo", (4912.97, 2770.48, -397.122));
	level addBouncerLocation("mp_vertigo", (739.925, 2476.92, 6.96895));
	level addBouncerLocation("mp_vertigo", (-1085.64, -1532.36, -6.28314));
	level addBouncerLocation("mp_village", (-667.357, 659.533, 76.0886));
	level addBouncerLocation("mp_village", (-318.761, -428.357, 44.4782));
	level addBouncerLocation("mp_village", (-1596.69, -1065.6, 51.5064));
	level addBouncerLocation("mp_village", (-767.976, 1518.36, 8.125));
	level addBouncerLocation("mp_village", (740.437, 763.512, 115.969));
	level addBouncerLocation("mp_village", (-1868.01, 359.537, 95.458));
}

configureTeleporters() {
	level addTeleporterLocation("mp_bridge", (1454.63, -256.77, -110.07), (3660.65, 594.724, -13.875));
	level addTeleporterLocation("mp_bridge", (-1378.73, -674.369, -45.3488), (-3582.92, -711.254, 223.125));
	level addTeleporterLocation("mp_bridge", (-78.8736, -672.342, 296.867), (-6491.29, -1808.77, 4026.2));
	level addTeleporterLocation("mp_carrier", (-5098.79, 946.838, 127.494), (-196.766, -1238.27, 267.875));
	level addTeleporterLocation("mp_carrier", (-3314.15, -31.1308, 44.3557), (-3022.36, 1343.47, -67.875));
	level addTeleporterLocation("mp_carrier", (-3737.94, 826.125, -302.875), (-4919.4, -1391.48, -163.875));
	level addTeleporterLocation("mp_concert", (1469.09, 2618.9, 24.125), (2534.7, 1510.78, 0.125));
	level addTeleporterLocation("mp_dig", (-1760.87, 1382.75, 38.7532), (-769.017,  2417.24, 398.725));
	level addTeleporterLocation("mp_drone", (-1550.31, -1788.05, 118.794), (-1806.97, -4451.73, 166.955));
	level addTeleporterLocation("mp_express", (-665.725, -178.686, 133.08), (-2730.13, 4714.09, 1276.89));
	level addTeleporterLocation("mp_express", (2368.86, -1.77934, -120.875), (259.358, 2610.38, 164.489));
	level addTeleporterLocation("mp_express", (-40.1131, 1023.38, 32.4359), (-45.4042, -2342.41, 150.294));
	level addTeleporterLocation("mp_express", (1743.5, 847.2, 147.527), (7667.64, 373.652, 1204.13));
	level addTeleporterLocation("mp_express", (350.741, 2146.95, 172.125), (4590.22, 5924.31, 1065.18));
	level addTeleporterLocation("mp_frostbite", (-403.087, 482.32, 113.125), (-2581.58, -795.632, 71.7134));
	level addTeleporterLocation("mp_hydro", (-1293.46, -1042.37, 374), (-2768.39, 835.662, 153.303));
	level addTeleporterLocation("mp_hydro", (2086.79, -186.203, 198.818), (2726.43, 839.444, 156.147));
	level addTeleporterLocation("mp_la", (-1365.7, -1048.39, -257.875), (-205.215, -2204.73, 115.125));
	level addTeleporterLocation("mp_la", (-312.217, 4640.66, -177.95), (1494.71, 3954.12, 133.125));
	level addTeleporterLocation("mp_magma", (136.083, -792.236, -628.875), (3951.9, -907.222, -462.875));
	level addTeleporterLocation("mp_meltdown", (989.105, 3965.3, -74.6114), (765.952, 7263.95, -60.9067));
	level addTeleporterLocation("mp_nightclub", (-15438.7, 3714.49, -188.755), (-14132, 3294.6, -240.875));
	level addTeleporterLocation("mp_overflow", (2249.04, -266.392, 82.8117), (-1861.88, -1735.89, -31.875));
	level addTeleporterLocation("mp_overflow", (-1745.9, -600.964, 5.79485), (-1861.88, -1735.89, -31.875));
	level addTeleporterLocation("mp_raid", (3269.13, 2182.71, 228.997), (4590.22, 5924.31, 1065.18));
	level addTeleporterLocation("mp_raid", (334.353, 3003.36, 258.286), (7300.14, 3986.51, 667.584));
	level addTeleporterLocation("mp_raid", (1729.97, 5068.48, 212.981), (-3911.69, 4744.53, 1895.03));
	level addTeleporterLocation("mp_studio", (65.0136, -355.873, -125.972), (777.705, -1207.24, 255.442));
	level addTeleporterLocation("mp_studio", (-14.5276, 1464.29, -53.7684), (618.33, 657.723, 261.902));
	level addTeleporterLocation("mp_studio", (1051.63, 316.586, -131.881), (9013.13, -612.218, 1086.63));
	level addTeleporterLocation("mp_turbine", (-259.641, 3978.14, 89.125), (-1095.23, -4805.82, 639.125));
	level addTeleporterLocation("mp_turbine", (628.97, 4252.23, -233.975), (-902.787, 1457.28, 832.125));
	level addTeleporterLocation("mp_turbine", (844.823, -1010.75, 392.208), (3147.96, -121.224, 818.978));
	level addTeleporterLocation("mp_turbine", (1387.98, 1814.18, 169.572), (-1443.23, -4748.53, 3287.52));
	level addTeleporterLocation("mp_turbine", (-200.688, 3167.76, 465.732), (2972.67, 6600, 3287.77));
	level addTeleporterLocation("mp_uplink", (1601.11, 309.603, 167.906), (1910.9, -313.71, 718.125));
	level addTeleporterLocation("mp_uplink", (2861.36, 1311.64, 382.125), (3025.87, 3465.82, 179.441));
	level addTeleporterLocation("mp_uplink", (1860.4, -313.913, 324.125), (4021.54, -6878.62, 2184.13));
	level addTeleporterLocation("mp_vertigo", (374.946, -1869.68, 30.2995), (4204.84, -2350.42, -319.875));
	level addTeleporterLocation("mp_vertigo", (317.475, 2966.64, -1598.88), (4212.31, 3221.66, -319.875));
	level addTeleporterLocation("mp_vertigo", (731.17, 0.0923847, 5.90708), (4217.83, 375.609, 1856.13));
    level addTeleporterLocation("mp_skate", (518.484, -455.334, 231.625), (-2541.36, -713.258, 476.988));
    level addTeleporterLocation("mp_takeoff", (-478.77, 158.573, 87.565), (-382.271, 4974.28, 115.426));
    level addTeleporterLocation("mp_dockside", (-1350.18, -202.359, -67.875), (-5208.79, 3705.67, 1037.35));
    level addTeleporterLocation("mp_skate", (-2541.36, -585.058, 476.988), (-6010.97, -5431.69, 2101.10));
    level addTeleporterLocation("mp_skate", (1311.14, -1757.63, 510.162), (10987.2, -2741.81, 2731.86));
}

configurePlatforms() {
	level addPlatformLocation("mp_skate", (10987.2, -2741.81, 2731.86), 12, 12);
	level addPlatformLocation("mp_skate", (-6010.97, -5431.69, 2101.10), 9, 9);
    level addPlatformLocation("mp_nuketown_2020", (-1443.23, -4748.53, 3287.52), 3, 3);
    level addPlatformLocation("mp_nuketown_2020", (-5859.98, -5232.7, 2089.6), 3, 3);
	level addPlatformLocation("mp_express", (7667.64, 373.652, 1204.13), 11, 11);
	level addPlatformLocation("mp_express", (4101.6, 5661.94, 1060.05), 11, 11);
    level addPlatformLocation("mp_dockside", (-5403.44, 3561.75, 1016.15), 5, 5);
    level addPlatformLocation("mp_raid", (7131.05, 3937.01, 649.925), 5, 5);
    level addPlatformLocation("mp_raid", (-3911.69, 4744.53, 1895.03), 2, 3);
	level addPlatformLocation("mp_turbine", (2972.67, 6600, 3287.77), 3, 3);
	level addPlatformLocation("mp_turbine", (-1443.23, -4748.53, 3287.52), 3, 3);
    level addPlatformLocation("mp_bridge", (-6735.36, -1800.07, 4021.07), 4, 25);
}

addBouncerLocation(map, location) {
    if (!isDefined(level.bounceLocs)) {
        level.bounceLocs = [];
    }

    if (!isDefined(level.bounceLocs[map])) {
        level.bounceLocs[map] = [];
    }

    arr_size = level.bounceLocs[map].size;
    level.bounceLocs[map][arr_size] = location;
}

getBouncerCount(map) {
    return level.bounceLocs[map].size;
}

addTeleporterLocation(map, origin, destination) {
	/*
		Need to go back and optimize this.
		What the hell was I thinking?

		EDIT: Not even I know.. messy ass code

	*/
	if(!isDefined(level.teleportLocs)) {
		level.teleportLocs = [];
	}
	
	if(!isDefined(level.teleportLocs[map])) {
		level.teleportLocs[map] = [];
		level.teleportLocs[map]["origins"] = [];
		level.teleportLocs[map]["destinations"] = [];
	}
	
	arr_size = level.teleportLocs[map]["origins"].size;
	level.teleportLocs[map]["origins"][arr_size] = origin;
	level.teleportLocs[map]["destinations"][arr_size] = destination;
}

getTeleporterCount(map) {
	return level.teleportLocs[map]["origins"].size;
}

getPlatformCount(map) {
	return level.platformLocs[map]["origins"].size;
}

addPlatformLocation( map, origin, width, length )
{
    if( level.script != map ) 
        return;
    platform = [];    
    for(e=0;e<width;e++) for(a=0;a<length;a++)
    {
        platform[platform.size] = spawn( "script_model", origin + (a*64,e*64,0) ); 
        platform[platform.size-1] setModel( "collision_clip_64x64x10" );
    }
    return platform; //for easy managment outside of this func
}



skyNoMore()
{
    entArray = getEntArray();
    for (index = 0; index < entArray.size; index++)
    {
        if( isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] > 180 )
            entArray[index].origin = (0, 0, 9999999);
    }
}

removeNewBarriers() {
    level waittill("prematch_over");
    if (getDvar("mapname") == "mp_bridge") { // lower barrier for detour
        entArray = getEntArray();
        for (index = 0; index < entArray.size; index++) {
            if (isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] < level.mapCenter[2]) {
                entArray[index].origin += (0, 0, -1300); //1 unit is 0.0254 meters so 1000 will be 25 meters
            }
        }
    }
    if (getDvar("mapname") == "mp_hydro") { // lower barrier for hydro
        entArray = getEntArray();
        for (index = 0; index < entArray.size; index++) {
            if (isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] < level.mapCenter[2]) {
                entArray[index].origin += (0, 0, -1200); //1 unit is 0.0254 meters so 1000 will be 25 meters
            }
        }
    }
    if (getDvar("mapname") == "mp_uplink") { // lower barrier for uplink
        entArray = getEntArray();
        for (index = 0; index < entArray.size; index++) {
            if (isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] < level.mapCenter[2]) {
                entArray[index].origin += (0, 0, -450); //1 unit is 0.0254 meters so 1000 will be 25 meters
            }
        }
    }
    if (getDvar("mapname") == "mp_vertigo") { // lower barrier for vertigo
        entArray = getEntArray();
        for (index = 0; index < entArray.size; index++) {
            if (isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] < level.mapCenter[2]) {
                entArray[index].origin += (0, 0, -1000); //1 unit is 0.0254 meters so 1000 will be 25 meters
            }
        }
    }
    if (getDvar("mapname") == "mp_carrier") { // lower barrier for carrier
        entArray = getEntArray();
        for (index = 0; index < entArray.size; index++) {
            if (isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] < level.mapCenter[2]) {
                entArray[index].origin += (0, 0, -150); //1 unit is 0.0254 meters so 1000 will be 25 meters
            }
        }
    }
    if (getDvar("mapname") == "mp_socotra") { // lower barrier for yemen
        entArray = getEntArray();
        for (index = 0; index < entArray.size; index++) {
            if (isSubStr(entArray[index].classname, "trigger_hurt") && entArray[index].origin[2] < level.mapCenter[2]) {
                entArray[index].origin += (0, 0, -700); //1 unit is 0.0254 meters so 1000 will be 25 meters
            }
        }
    }
}



createMapEdits() {
    current_map = level.script;

    // Spawn bouncers 
    if (isDefined(level.bounceLocs[current_map])) {
        for (bouncer_index = 0; bouncer_index < getBouncerCount(current_map); bouncer_index++) {
            self thread createBounce(50, (0, 0, 700), 8, undefined, true, level.bounceLocs[current_map][bouncer_index]);
        }
    }

    // Spawn teleporters 
    if(isDefined(level.teleportLocs[current_map])) {
    	for(tele_index = 0; tele_index < getTeleporterCount(current_map); tele_index++) {
    		self thread teleporter(level.teleportLocs[current_map]["origins"][tele_index], level.teleportLocs[current_map]["destinations"][tele_index]);
    	}
    }

	//level thread monicrate();
	
    // Spawn platforms 
    if(isDefined(level.platformLocs[current_map])) {
        platcount = getPlatformCount(current_map);
        for(plat_index = 0; plat_index < platcount; plat_index++) {
            platform = level.platformLocs[current_map][plat_index];

            location = platform["location"];
            width = platform["width"];
            height = platform["height"];

             self thread spawnPlatform(location, width, height);
        }
    }
}

spawnPlatform(location, width, height, angles) {
	/*
		The "angles" param is optional because it points the
		crates in a wacky direction. Could be cool for something
		down the road.
	*/

	for(y = 0; y < height; y++) { // Columns of crates 
		for(x = 0; x < width; x++) { // Rows of crates 
			crate = spawn("script_model", location + (x * 40, y * 75, 0));
            crate setModel("t6_wpn_supply_drop_ally");
			// crate hide();
            if(isDefined(angles)) {
                crate.angles = angles;
            }
		}
	}
}

createBounce(radius, force, num, slide, invis, origin) {
    level endon("game_ended");

    if (!isDefined(origin)) {
    	origin = self.origin;
    }
        
    if (!isDefined(level.bounces))
        level.bounces = [];
    if (!isDefined(slide))
        level.bounces[level.bounces.size] = modelSpawner(origin - (0, 0, 10), "t6_wpn_supply_drop_ally", (0, 0, 0));
    else level.bounces[level.bounces.size] = modelSpawner(origin + (0, 0, 10), "t6_wpn_supply_drop_axis", (0, 0, 60));

    model = level.bounces[level.bounces.size - 1];
    if (isDefined(invis))
        model hide();

    wait .2;
    while (isDefined(model)) {
        foreach(player in level.players) {
            if (!isDefined(player.doingBounce) && distance(model.origin, player.origin) < radius && player meleeButtonPressed() && isDefined(slide))
                player thread doBounce(force, num, slide);
            else if (!isDefined(player.doingBounce) && distance(model.origin, player.origin) < radius && !isDefined(slide))
                player thread doBounce(force, num);
        }
        wait .05;
    }
}

doBounce(force, num, slide) {
    self endon("disconnect");
    level endon("game_ended");

    self.doingBounce = true;
    self setOrigin(self.origin);
    pVecF = anglesToForward(self getPlayerAngles());
    for (c = 0; c < num; c++) {
        if (isDefined(slide))
            self setVelocity((pVecF[0] * 200, pVecF[1] * 200, 400));
        else if (!isDefined(slide))
            self setVelocity(self getVelocity() + force);
        wait .05;
    }
    self.doingBounce = undefined;
}

teleporter(origin, destination) {
	level endon("game_ended");
	
	teleporter = spawn("script_model", origin);
	teleporter setModel("p_glo_scavenger_pack_obj");
    /*
        We don't need to store the return value of playfx... right?
    */
    playfx(level.teleporterFx, origin);
	
	for(;;) {
		foreach(player in level.players) {
			if(player isInPos(origin) && player meleeButtonPressed()) {
				player setOrigin(destination);
				wait 1;
			}
		}
		
		wait .05;
	}
}

modelSpawner(origin, model, angles, time) {
    if (isDefined(time))
        wait time;
    obj = spawn("script_model", origin);
    obj setModel(model);
    if (isDefined(angles))
        obj.angles = angles;
    return obj;
}


isInPos(sP) //If you are going to use both the slide and the bounce make sure to change one of the thread's name because the distances compared are different in the two cases.
{
    return distance(self.origin, sP) < 100;
}
