//punya aufa

new PlayerText: Alttdruq[MAX_PLAYERS][10];

CreateTdAltRuq(playerid)
{
    Alttdruq[playerid][0] = CreatePlayerTextDraw(playerid, 7.000, 206.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][0], 90.000, 16.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][0], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][0], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][0], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][0], 1);

    Alttdruq[playerid][1] = CreatePlayerTextDraw(playerid, 93.000, 204.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][1], 8.000, 10.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][1], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][1], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][1], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][1], 1);

    Alttdruq[playerid][2] = CreatePlayerTextDraw(playerid, 93.000, 214.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][2], 8.000, 10.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][2], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][2], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][2], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][2], 1);

    Alttdruq[playerid][3] = CreatePlayerTextDraw(playerid, 96.000, 207.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][3], 4.000, 13.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][3], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][3], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][3], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][3], 1);

    Alttdruq[playerid][4] = CreatePlayerTextDraw(playerid, 4.000, 208.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][4], 4.000, 13.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][4], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][4], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][4], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][4], 1);

    Alttdruq[playerid][5] = CreatePlayerTextDraw(playerid, 3.000, 204.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][5], 8.000, 10.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][5], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][5], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][5], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][5], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][5], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][5], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][5], 1);

    Alttdruq[playerid][6] = CreatePlayerTextDraw(playerid, 3.000, 214.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][6], 8.000, 10.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][6], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][6], -7601921);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][6], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][6], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][6], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][6], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][6], 1);

    Alttdruq[playerid][7] = CreatePlayerTextDraw(playerid, 24.000, 207.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, Alttdruq[playerid][7], 4.000, 13.000);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][7], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][7], 0);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][7], 0);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][7], 255);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][7], 4);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][7], 1);

    Alttdruq[playerid][8] = CreatePlayerTextDraw(playerid, 5.000, 207.000, "[ALT]");
    PlayerTextDrawLetterSize(playerid, Alttdruq[playerid][8], 0.190, 1.199);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][8], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][8], -1);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][8], 1);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][8], 1);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][8], 150);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][8], 1);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][8], 1);

    Alttdruq[playerid][9] = CreatePlayerTextDraw(playerid, 30.000, 207.000, "Untuk Mengambil pekerjaan");
    PlayerTextDrawLetterSize(playerid, Alttdruq[playerid][9], 0.140, 1.399);
    PlayerTextDrawAlignment(playerid, Alttdruq[playerid][9], 1);
    PlayerTextDrawColor(playerid, Alttdruq[playerid][9], -1);
    PlayerTextDrawSetShadow(playerid, Alttdruq[playerid][9], 1);
    PlayerTextDrawSetOutline(playerid, Alttdruq[playerid][9], 1);
    PlayerTextDrawBackgroundColor(playerid, Alttdruq[playerid][9], 150);
    PlayerTextDrawFont(playerid, Alttdruq[playerid][9], 1);
    PlayerTextDrawSetProportional(playerid, Alttdruq[playerid][9], 1);
}


stock Altruqtd(playerid, string[], time)//Time in Sec.
{
	new validtime = time*1000;

	if (PlayerInfo[playerid][altruq])
	{
	    KillTimer(PlayerInfo[playerid][altruqq]);
	}
	PlayerTextDrawSetString(playerid, AltTD[playerid][9], string);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][0]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][1]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][2]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][3]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][4]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][5]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][6]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][7]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][8]);
	PlayerTextDrawShow(playerid, Alttdruq[playerid][9]);
    PlayerPlaySound(playerid, 1057 , 0.0, 0.0, 0.0);
	PlayerInfo[playerid][altruq] = true;
	PlayerInfo[playerid][altruqq] = SetTimerEx("HideTdAltRuq", validtime, false, "d", playerid);
	return 1;
}
function HideTdAltRuq(playerid)
{
	if (!PlayerInfo[playerid][altruq])
	    return 0;

	PlayerInfo[playerid][altruq] = false;
	return HideAltruq(playerid);
}

stock HideAltruq(playerid)
{
    PlayerTextDrawHide(playerid, Alttdruq[playerid][0]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][1]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][2]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][3]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][4]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][5]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][6]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][7]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][8]);
	PlayerTextDrawHide(playerid, Alttdruq[playerid][9]);
	return 1;
}