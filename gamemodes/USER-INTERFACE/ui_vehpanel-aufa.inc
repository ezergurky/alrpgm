//punya AUFAA

#include "YSI-Coding\y_hooks"
//aufa scrip panel veh
new PlayerText: AUFAPANELVEH[MAX_PLAYERS][33];
//veh panel aufaaa
new PlayerText: CLOSERUQVEH[MAX_PLAYERS];
new PlayerText: MESIN[MAX_PLAYERS];
new PlayerText: LAMPU[MAX_PLAYERS];
new PlayerText: KAP[MAX_PLAYERS];
new PlayerText: BAGASi[MAX_PLAYERS];
new PlayerText: KUNCIVEH[MAX_PLAYERS];

CreateTdpanelVehAufa(playerid)
{
    //aufa veh panel
	AUFAPANELVEH[playerid][0] = CreatePlayerTextDraw(playerid, 323.000, 223.000, "X");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][0], 0.458, 2.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][0], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][0], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][0], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][0], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][0], -12254977);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][0], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][0], 1);

	AUFAPANELVEH[playerid][1] = CreatePlayerTextDraw(playerid, 319.000, 201.000, "MESIN");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][1], 0.200, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][1], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][1], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][1], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][1], 1);

	AUFAPANELVEH[playerid][2] = CreatePlayerTextDraw(playerid, 352.000, 241.000, "LAMPU");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][2], 0.200, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][2], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][2], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][2], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][2], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][2], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][2], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][2], 1);

	AUFAPANELVEH[playerid][3] = CreatePlayerTextDraw(playerid, 341.000, 281.000, "KAP");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][3], 0.200, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][3], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][3], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][3], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][3], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][3], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][3], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][3], 1);

	AUFAPANELVEH[playerid][4] = CreatePlayerTextDraw(playerid, 302.000, 281.000, "KUNCI");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][4], 0.200, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][4], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][4], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][4], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][4], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][4], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][4], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][4], 1);

	AUFAPANELVEH[playerid][5] = CreatePlayerTextDraw(playerid, 283.000, 240.000, "BAGASi");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][5], 0.200, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][5], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][5], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][5], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][5], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][5], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][5], 1);

	AUFAPANELVEH[playerid][6] = CreatePlayerTextDraw(playerid, 311.000, 266.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][6], 10.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][6], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][6], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][6], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][6], 1);

	AUFAPANELVEH[playerid][7] = CreatePlayerTextDraw(playerid, 315.000, 272.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][7], -9.000, -3.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][7], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][7], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][7], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][7], 1);

	AUFAPANELVEH[playerid][8] = CreatePlayerTextDraw(playerid, 309.000, 275.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][8], -2.000, -3.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][8], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][8], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][8], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][8], 1);

	AUFAPANELVEH[playerid][9] = CreatePlayerTextDraw(playerid, 324.000, 188.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][9], 13.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][9], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][9], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][9], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][9], 1);

	AUFAPANELVEH[playerid][10] = CreatePlayerTextDraw(playerid, 322.000, 188.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][10], 1.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][10], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][10], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][10], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][10], 1);

	AUFAPANELVEH[playerid][11] = CreatePlayerTextDraw(playerid, 332.000, 182.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][11], 1.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][11], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][11], -1953920513);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][11], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][11], 1);

	AUFAPANELVEH[playerid][12] = CreatePlayerTextDraw(playerid, 338.000, 188.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][12], 1.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][12], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][12], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][12], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][12], 1);

	AUFAPANELVEH[playerid][13] = CreatePlayerTextDraw(playerid, 340.000, 268.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][13], 13.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][13], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][13], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][13], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][13], 1);

	AUFAPANELVEH[playerid][14] = CreatePlayerTextDraw(playerid, 345.000, 274.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][14], 3.000, 3.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][14], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][14], -1953920513);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][14], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][14], 1);

	AUFAPANELVEH[playerid][15] = CreatePlayerTextDraw(playerid, 287.000, 228.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][15], 13.000, 10.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][15], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][15], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][15], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][15], 1);

	AUFAPANELVEH[playerid][16] = CreatePlayerTextDraw(playerid, 290.000, 228.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][16], 6.000, 3.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][16], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][16], -1953920513);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][16], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][16], 1);

	AUFAPANELVEH[playerid][17] = CreatePlayerTextDraw(playerid, 351.000, 225.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][17], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][17], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][17], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][17], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][17], 1);

	AUFAPANELVEH[playerid][18] = CreatePlayerTextDraw(playerid, 360.000, 225.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][18], 12.000, 12.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][18], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][18], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][18], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][18], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][18], 1);

	AUFAPANELVEH[playerid][19] = CreatePlayerTextDraw(playerid, 355.000, 231.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][19], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][19], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][19], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][19], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][19], 1);

	AUFAPANELVEH[playerid][20] = CreatePlayerTextDraw(playerid, 364.000, 231.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][20], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][20], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][20], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][20], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][20], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][20], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][20], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][20], 1);

	AUFAPANELVEH[playerid][21] = CreatePlayerTextDraw(playerid, 365.000, 232.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][21], 2.000, 2.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][21], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][21], 255);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][21], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][21], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][21], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][21], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][21], 1);

	AUFAPANELVEH[playerid][22] = CreatePlayerTextDraw(playerid, 356.000, 232.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][22], 2.000, 2.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][22], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][22], 255);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][22], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][22], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][22], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][22], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][22], 1);

	AUFAPANELVEH[playerid][23] = CreatePlayerTextDraw(playerid, 356.000, 228.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][23], 13.000, 1.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][23], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][23], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][23], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][23], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][23], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][23], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][23], 1);

	AUFAPANELVEH[playerid][24] = CreatePlayerTextDraw(playerid, 322.000, 156.000, "/");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][24], 0.300, 1.500);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][24], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][24], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][24], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][24], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][24], -1);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][24], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][24], 1);

	AUFAPANELVEH[playerid][25] = CreatePlayerTextDraw(playerid, 325.000, 156.000, "/");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][25], 0.300, 1.500);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][25], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][25], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][25], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][25], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][25], -12254977);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][25], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][25], 1);

	AUFAPANELVEH[playerid][26] = CreatePlayerTextDraw(playerid, 334.000, 156.000, "/");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][26], -0.368, 1.500);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][26], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][26], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][26], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][26], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][26], -12254977);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][26], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][26], 1);

	AUFAPANELVEH[playerid][27] = CreatePlayerTextDraw(playerid, 334.000, 166.000, "-");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][27], -0.388, 0.799);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][27], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][27], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][27], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][27], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][27], -12254977);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][27], 2);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][27], 1);

	AUFAPANELVEH[playerid][28] = CreatePlayerTextDraw(playerid, 329.000, 166.000, "-");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][28], -0.388, 0.799);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][28], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][28], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][28], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][28], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][28], -12254977);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][28], 2);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][28], 1);

	AUFAPANELVEH[playerid][29] = CreatePlayerTextDraw(playerid, 335.000, 156.000, "ASIALANE");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][29], 0.140, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][29], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][29], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][29], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][29], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][29], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][29], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][29], 1);

	AUFAPANELVEH[playerid][30] = CreatePlayerTextDraw(playerid, 335.000, 164.000, "VEH PANEL");
	PlayerTextDrawLetterSize(playerid, AUFAPANELVEH[playerid][30], 0.140, 0.999);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][30], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][30], -1);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][30], 1);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][30], 1);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][30], 150);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][30], 1);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][30], 1);

	AUFAPANELVEH[playerid][31] = CreatePlayerTextDraw(playerid, 311.000, 273.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][31], -2.000, -3.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][31], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][31], -12254977);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][31], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][31], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][31], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][31], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][31], 1);

	AUFAPANELVEH[playerid][32] = CreatePlayerTextDraw(playerid, 314.000, 268.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, AUFAPANELVEH[playerid][32], 4.000, 5.000);
	PlayerTextDrawAlignment(playerid, AUFAPANELVEH[playerid][32], 1);
	PlayerTextDrawColor(playerid, AUFAPANELVEH[playerid][32], -1953920513);
	PlayerTextDrawSetShadow(playerid, AUFAPANELVEH[playerid][32], 0);
	PlayerTextDrawSetOutline(playerid, AUFAPANELVEH[playerid][32], 0);
	PlayerTextDrawBackgroundColor(playerid, AUFAPANELVEH[playerid][32], 255);
	PlayerTextDrawFont(playerid, AUFAPANELVEH[playerid][32], 4);
	PlayerTextDrawSetProportional(playerid, AUFAPANELVEH[playerid][32], 1);

	//lanjutan veh panel aufa
	CLOSERUQVEH[playerid] = CreatePlayerTextDraw(playerid, 312.000, 212.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, CLOSERUQVEH[playerid], 33.000, 41.000);
	PlayerTextDrawAlignment(playerid, CLOSERUQVEH[playerid], 1);
	PlayerTextDrawColor(playerid, CLOSERUQVEH[playerid], -1953920513);
	PlayerTextDrawSetShadow(playerid, CLOSERUQVEH[playerid], 0);
	PlayerTextDrawSetOutline(playerid, CLOSERUQVEH[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, CLOSERUQVEH[playerid], 255);
	PlayerTextDrawFont(playerid, CLOSERUQVEH[playerid], 4);
	PlayerTextDrawSetProportional(playerid, CLOSERUQVEH[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, CLOSERUQVEH[playerid], 1);

	MESIN[playerid] = CreatePlayerTextDraw(playerid, 313.000, 172.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, MESIN[playerid], 33.000, 41.000);
	PlayerTextDrawAlignment(playerid, MESIN[playerid], 1);
	PlayerTextDrawColor(playerid, MESIN[playerid], -1953920513);
	PlayerTextDrawSetShadow(playerid, MESIN[playerid], 0);
	PlayerTextDrawSetOutline(playerid, MESIN[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, MESIN[playerid], 255);
	PlayerTextDrawFont(playerid, MESIN[playerid], 4);
	PlayerTextDrawSetProportional(playerid, MESIN[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, MESIN[playerid], 1);

	LAMPU[playerid] = CreatePlayerTextDraw(playerid, 345.000, 213.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, LAMPU[playerid], 33.000, 41.000);
	PlayerTextDrawAlignment(playerid, LAMPU[playerid], 1);
	PlayerTextDrawColor(playerid, LAMPU[playerid], -1953920513);
	PlayerTextDrawSetShadow(playerid, LAMPU[playerid], 0);
	PlayerTextDrawSetOutline(playerid, LAMPU[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, LAMPU[playerid], 255);
	PlayerTextDrawFont(playerid, LAMPU[playerid], 4);
	PlayerTextDrawSetProportional(playerid, LAMPU[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, LAMPU[playerid], 1);

	KAP[playerid] = CreatePlayerTextDraw(playerid, 330.000, 253.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, KAP[playerid], 33.000, 41.000);
	PlayerTextDrawAlignment(playerid, KAP[playerid], 1);
	PlayerTextDrawColor(playerid, KAP[playerid], -1953920513);
	PlayerTextDrawSetShadow(playerid, KAP[playerid], 0);
	PlayerTextDrawSetOutline(playerid, KAP[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, KAP[playerid], 255);
	PlayerTextDrawFont(playerid, KAP[playerid], 4);
	PlayerTextDrawSetProportional(playerid, KAP[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KAP[playerid], 1);

	BAGASi[playerid] = CreatePlayerTextDraw(playerid, 277.000, 211.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, BAGASi[playerid], 33.000, 41.000);
	PlayerTextDrawAlignment(playerid, BAGASi[playerid], 1);
	PlayerTextDrawColor(playerid, BAGASi[playerid], -1953920513);
	PlayerTextDrawSetShadow(playerid, BAGASi[playerid], 0);
	PlayerTextDrawSetOutline(playerid, BAGASi[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, BAGASi[playerid], 255);
	PlayerTextDrawFont(playerid, BAGASi[playerid], 4);
	PlayerTextDrawSetProportional(playerid, BAGASi[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, BAGASi[playerid], 1);

	KUNCIVEH[playerid] = CreatePlayerTextDraw(playerid, 296.000, 253.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, KUNCIVEH[playerid], 33.000, 41.000);
	PlayerTextDrawAlignment(playerid, KUNCIVEH[playerid], 1);
	PlayerTextDrawColor(playerid, KUNCIVEH[playerid], -1953920513);
	PlayerTextDrawSetShadow(playerid, KUNCIVEH[playerid], 0);
	PlayerTextDrawSetOutline(playerid, KUNCIVEH[playerid], 0);
	PlayerTextDrawBackgroundColor(playerid, KUNCIVEH[playerid], 255);
	PlayerTextDrawFont(playerid, KUNCIVEH[playerid], 4);
	PlayerTextDrawSetProportional(playerid, KUNCIVEH[playerid], 1);
	PlayerTextDrawSetSelectable(playerid, KUNCIVEH[playerid], 1);
}

CMD:vpanel(playerid, params[])
{
		//click panel aufa
		PlayerTextDrawShow(playerid, CLOSERUQVEH[playerid]);
		PlayerTextDrawShow(playerid, MESIN[playerid]);
		PlayerTextDrawShow(playerid, LAMPU[playerid]);
		PlayerTextDrawShow(playerid, KAP[playerid]);
		PlayerTextDrawShow(playerid, BAGASi[playerid]);
		PlayerTextDrawShow(playerid, KUNCIVEH[playerid]);
		//body panel aufa
 		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][0]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][1]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][2]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][3]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][4]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][5]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][6]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][7]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][8]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][9]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][10]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][11]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][12]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][13]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][14]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][15]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][16]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][17]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][18]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][19]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][20]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][21]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][22]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][23]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][24]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][25]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][26]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][27]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][28]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][29]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][30]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][31]);
		PlayerTextDrawShow(playerid, AUFAPANELVEH[playerid][32]);
		SelectTextDraw(playerid, 0xFF0000FF);
		return 1;
}


hook public OnPlayerClickDynamicTextdraw(playerid, PlayerText:playertextid)
{
if(playertextid == CLOSERUQVEH[playerid]) //keluar
	{
    	for(new txd; txd < 33; txd++)
        {
            PlayerTextDrawHide(playerid, AUFAPANELVEH[playerid][txd]);
            CancelSelectTextDraw(playerid);
        }
		PlayerTextDrawHide(playerid, CLOSERUQVEH[playerid]);
		PlayerTextDrawHide(playerid, MESIN[playerid]);
		PlayerTextDrawHide(playerid, LAMPU[playerid]);
		PlayerTextDrawHide(playerid, KAP[playerid]);
		PlayerTextDrawHide(playerid, BAGASi[playerid]);
		PlayerTextDrawHide(playerid, KUNCIVEH[playerid]);
		CancelSelectTextDraw(playerid);
	}
	if(playertextid == MESIN[playerid]) // mesin
	{
    	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(!IsEngineVehicle(vehicleid))
			return Error(playerid, "Kamu tidak berada didalam kendaraan.");

		if(GetEngineStatus(vehicleid))
		{
			EngineStatus(playerid, vehicleid);
		}
		else
		{
			//Info(playerid, "Anda mencoba menyalakan mesin kendaraan..");
			//SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mencoba menghidupkan mesin kendaraan %s.", ReturnName(playerid, 0), GetVehicleNameByVehicle(GetPlayerVehicleID(playerid)));
			InfoTD_MSG(playerid, 4000, "Sedang menyalakan kendaraan...");
			SetTimerEx("EngineStatus", 3000, false, "id", playerid, vehicleid);
		}
	}
	else return Error(playerid, "Anda harus mengendarai kendaraan!");
	return 1;
	}
	if(playertextid == KAP[playerid]) // KAP
	{
    	new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);

    if(vehicleid == INVALID_VEHICLE_ID)
       	return Error(playerid, "Kamu tidak berada didekat Kendaraan apapun.");

    new Float:x, Float:y, Float:z;
    GetPlayerPos(playerid, x, y, z);
    switch (GetHoodStatus(vehicleid))
    {
     	case false:
      	{
      		SwitchVehicleBonnet(vehicleid, true);
       		InfoTD_MSG(playerid, 4000, "Vehicle Hood ~g~OPEN");
       	}
       	case true:
       	{
       		SwitchVehicleBonnet(vehicleid, false);
       		InfoTD_MSG(playerid, 4000, "Vehicle Hood ~r~CLOSED");
       	}
    }
	return 1;
	}
	if(playertextid == BAGASi[playerid]) // BAGASI
	{
    	new vehicleid = GetNearestVehicleToPlayer(playerid, 3.5, false);

   	if(vehicleid == INVALID_VEHICLE_ID)
   		return Error(playerid, "Kamu tidak berada didekat Kendaraan apapun.");

   	switch (GetTrunkStatus(vehicleid))
   	{
   		case false:
   		{
   			SwitchVehicleBoot(vehicleid, true);
   			InfoTD_MSG(playerid, 4000, "Vehicle Bagasi ~g~OPEN");
   		}
   		case true:
   		{
   			SwitchVehicleBoot(vehicleid, false);
   			InfoTD_MSG(playerid, 4000, "Vehicle Bagasi ~g~OPEN");
   		}
   	}
	return 1;
	}
	if(playertextid == KUNCIVEH[playerid]) // kunci
	{
    	static
		carid = -1;

	if((carid = Vehicle_Nearest(playerid)) != -1)
	{
		if(Vehicle_IsOwner(playerid, carid))
		{
    		if(!pvData[carid][cLocked])
    		{
    			pvData[carid][cLocked] = 1;

				new Float:X, Float:Y, Float:Z;
				InfoTD_MSG(playerid, 4000, "Kendaraan ini berhasil ~r~Dikunci!");
				GetPlayerPos(playerid, X, Y, Z);
				SwitchVehicleDoors(pvData[carid][cVeh], true);
			}
			else
			{
				pvData[carid][cLocked] = 0;
				new Float:X, Float:Y, Float:Z;
				InfoTD_MSG(playerid, 4000, "Kendaraan ini berhasil ~g~Terbuka!");
				GetPlayerPos(playerid, X, Y, Z);
				SwitchVehicleDoors(pvData[carid][cVeh], false);
			}
		}
			//else SendErrorMessage(playerid, "You are not in range of anything you can lock.");
	}
	else Error(playerid, "Kamu tidak berada didekat Kendaraan apapun yang ingin anda kunci.");
	}
	if(playertextid == LAMPU[playerid]) // LAMPU
	{
    new vehicleid = GetPlayerVehicleID(playerid);
	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(!IsEngineVehicle(vehicleid))
			return Error(playerid, "Kamu tidak berada didalam kendaraan.");

		switch(GetLightStatus(vehicleid))
		{
			case false:
			{
				SwitchVehicleLight(vehicleid, true);
			}
			case true:
			{
				SwitchVehicleLight(vehicleid, false);
			}
		}
	}
	else return Error(playerid, "Anda harus mengendarai kendaraan!");
	return 1;
	}
}