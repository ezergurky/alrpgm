#include <YSI\y_hooks>
/* var */
new PlayerText: PROGRESSBAR[MAX_PLAYERS][20];
new LoadingPlayerBar[MAX_PLAYERS];
new TimerLoading[MAX_PLAYERS];
new ProgressTimer[MAX_PLAYERS][128];
/* Hide TD */
HideProgressBar(playerid)
{
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][0]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][1]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][2]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][3]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][4]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][5]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][6]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][7]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][8]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][9]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][10]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][11]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][12]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][13]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][14]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][15]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][16]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][17]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][18]);
	PlayerTextDrawHide(playerid, PROGRESSBAR[playerid][19]);
	return 1;
}
/* Create TD */
CreateProgress(playerid)
{
	PROGRESSBAR[playerid][0] = CreatePlayerTextDraw(playerid, 285.000, 413.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][0], 88.000, 18.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][0], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][0], 1009993776);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][0], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][0], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][0], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][0], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][0], 1);

	PROGRESSBAR[playerid][1] = CreatePlayerTextDraw(playerid, 300.000, 403.000, "Aufa Nih boss...");
	PlayerTextDrawLetterSize(playerid, PROGRESSBAR[playerid][1], 0.200, 0.999);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][1], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][1], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][1], 1);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][1], 1);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][1], 150);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][1], 1);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][1], 1);

	PROGRESSBAR[playerid][2] = CreatePlayerTextDraw(playerid, 287.000, 416.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][2], 84.000, 13.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][2], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][2], -16776961);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][2], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][2], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][2], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][2], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][2], 1);

	PROGRESSBAR[playerid][3] = CreatePlayerTextDraw(playerid, 252.000, 403.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][3], 36.000, 37.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][3], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][3], 1337495807);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][3], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][3], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][3], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][3], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][3], 1);

	PROGRESSBAR[playerid][4] = CreatePlayerTextDraw(playerid, 288.000, 417.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][4], 82.000, 10.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][4], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][4], -12254977);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][4], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][4], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][4], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][4], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][4], 1);

	PROGRESSBAR[playerid][5] = CreatePlayerTextDraw(playerid, 289.000, 418.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][5], 79.000, 9.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][5], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][5], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][5], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][5], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][5], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][5], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][5], 1);

	PROGRESSBAR[playerid][6] = CreatePlayerTextDraw(playerid, 290.000, 419.000, "LD_SPAC:white");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][6], 77.000, 7.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][6], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][6], -12254977);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][6], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][6], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][6], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][6], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][6], 1);

	PROGRESSBAR[playerid][7] = CreatePlayerTextDraw(playerid, 254.000, 406.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][7], 32.000, 31.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][7], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][7], 255);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][7], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][7], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][7], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][7], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][7], 1);

	PROGRESSBAR[playerid][8] = CreatePlayerTextDraw(playerid, 264.000, 412.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][8], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][8], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][8], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][8], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][8], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][8], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][8], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][8], 1);

	PROGRESSBAR[playerid][9] = CreatePlayerTextDraw(playerid, 261.000, 416.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][9], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][9], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][9], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][9], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][9], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][9], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][9], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][9], 1);

	PROGRESSBAR[playerid][10] = CreatePlayerTextDraw(playerid, 260.000, 421.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][10], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][10], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][10], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][10], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][10], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][10], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][10], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][10], 1);

	PROGRESSBAR[playerid][11] = CreatePlayerTextDraw(playerid, 268.000, 411.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][11], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][11], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][11], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][11], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][11], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][11], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][11], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][11], 1);

	PROGRESSBAR[playerid][12] = CreatePlayerTextDraw(playerid, 276.000, 420.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][12], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][12], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][12], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][12], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][12], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][12], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][12], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][12], 1);

	PROGRESSBAR[playerid][13] = CreatePlayerTextDraw(playerid, 272.000, 412.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][13], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][13], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][13], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][13], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][13], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][13], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][13], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][13], 1);

	PROGRESSBAR[playerid][14] = CreatePlayerTextDraw(playerid, 275.000, 415.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][14], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][14], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][14], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][14], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][14], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][14], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][14], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][14], 1);

	PROGRESSBAR[playerid][15] = CreatePlayerTextDraw(playerid, 262.000, 425.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][15], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][15], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][15], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][15], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][15], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][15], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][15], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][15], 1);

	PROGRESSBAR[playerid][16] = CreatePlayerTextDraw(playerid, 270.000, 427.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][16], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][16], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][16], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][16], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][16], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][16], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][16], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][16], 1);

	PROGRESSBAR[playerid][17] = CreatePlayerTextDraw(playerid, 274.000, 425.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][17], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][17], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][17], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][17], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][17], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][17], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][17], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][17], 1);

	PROGRESSBAR[playerid][18] = CreatePlayerTextDraw(playerid, 269.000, 420.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][18], 3.000, 3.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][18], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][18], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][18], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][18], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][18], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][18], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][18], 1);

	PROGRESSBAR[playerid][19] = CreatePlayerTextDraw(playerid, 266.000, 427.000, "LD_BEAT:chit");
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][19], 4.000, 4.000);
	PlayerTextDrawAlignment(playerid, PROGRESSBAR[playerid][19], 1);
	PlayerTextDrawColor(playerid, PROGRESSBAR[playerid][19], -1);
	PlayerTextDrawSetShadow(playerid, PROGRESSBAR[playerid][19], 0);
	PlayerTextDrawSetOutline(playerid, PROGRESSBAR[playerid][19], 0);
	PlayerTextDrawBackgroundColor(playerid, PROGRESSBAR[playerid][19], 255);
	PlayerTextDrawFont(playerid, PROGRESSBAR[playerid][19], 4);
	PlayerTextDrawSetProportional(playerid, PROGRESSBAR[playerid][19], 1);

	return 1;
}
/* Hook OnPlayerConnect */
hook OnPlayerConnect(playerid)
{
	CreateProgress(playerid);
	return 1;
}
/* Func */
ShowProgressbar(playerid, text[] = "", Times)
{	
	if(pData[playerid][pProgress] > 0) return 1;
	LoadingPlayerBar[playerid] = 0;
	pData[playerid][pProgress] = 1;
	new Float:Value = LoadingPlayerBar[playerid]*77.0/100;
	new Timer = Times*1000/100;
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][6], Value, 7.0);
	PlayerTextDrawSetString(playerid, PROGRESSBAR[playerid][1], text);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][0]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][1]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][2]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][3]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][4]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][5]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][6]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][7]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][8]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][9]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][10]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][11]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][12]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][13]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][14]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][15]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][16]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][17]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][18]);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][19]);
	TogglePlayerControllable(playerid, 0);
	TimerLoading[playerid] = SetTimerEx("UpdtLoading", Timer, true, "d", playerid);
	return 1;
}

stock UpdateLoading(playerid)
{
	new Float:Value = LoadingPlayerBar[playerid]*77.00/100;
	PlayerTextDrawTextSize(playerid, PROGRESSBAR[playerid][6], Value, 7.0);
	PlayerTextDrawShow(playerid, PROGRESSBAR[playerid][6]);
	return 1;
}

forward UpdtLoading(playerid);
public UpdtLoading(playerid)
{
	LoadingPlayerBar[playerid] += 1;
	UpdateLoading(playerid);
	if(LoadingPlayerBar[playerid] >= 100)
	{
		KillTimer(TimerLoading[playerid]);
		LoadingPlayerBar[playerid] = 0;
		pData[playerid][pProgress] = 0;
		HideProgressBar(playerid);
		SetTimerEx(ProgressTimer[playerid], 300, false, "d", playerid);
		TogglePlayerControllable(playerid, 1);
	}
	return 1;
}
CMD:testprog(playerid, params[])
{
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda sedang melakukan activity progress");
	ShowProgressbar(playerid, "Aufa Ganteng", 3);
	return 1;
}