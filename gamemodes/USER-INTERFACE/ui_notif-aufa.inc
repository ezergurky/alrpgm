enum eNotify
{
	NotifyIcon,
	NotifyMessage[320],
	NotifyLoading,
	NotifySize
}
new InfoNotify[MAX_PLAYERS][7][eNotify];
new MaxPlayerNotify[MAX_PLAYERS];
new PlayerText:TextDrawNotifikasi[MAX_PLAYERS][7*10];
new IndexNotify[MAX_PLAYERS];
new LoadingNotif[MAX_PLAYERS];

function HideNotify(playerid)
{
	if(!IndexNotify[playerid]) return 1;
	--IndexNotify[playerid];
	MaxPlayerNotify[playerid]--;
	for(new i=-1;++i<10;) PlayerTextDrawDestroy(playerid, TextDrawNotifikasi[playerid][(IndexNotify[playerid]*10)+i]);
	return 1;
}

stock InfoMsg(playerid, pesan[])
{
  PlayerPlaySound(playerid, 5205 , 0.0, 0.0, 0.0);
  ShowNotify(playerid, pesan, 1);
  return 1;
}
stock ErrorMsg(playerid, pesan[])
{
  PlayerPlaySound(playerid, 5206 , 0.0, 0.0, 0.0);
  ShowNotify(playerid, pesan, 2);
  return 1;
}
stock SuccesMsg(playerid, pesan[])
{
  PlayerPlaySound(playerid, 5203 , 0.0, 0.0, 0.0);
  ShowNotify(playerid, pesan, 3);
  return 1;
}
stock SyntaxMsg(playerid, pesan[])
{
  PlayerPlaySound(playerid, 5205 , 0.0, 0.0, 0.0);
  ShowNotify(playerid, pesan, 4);
  return 1;
}

stock WarningMsg(playerid, pesan[])
{
  PlayerPlaySound(playerid, 5205, 0.0, 0.0, 0.0);
  ShowNotify(playerid, pesan, 5);
  return 1;
}
//ini cmd untuk test notifnya
CMD:testinfo(playerid, params[])
{
	InfoMsg(playerid, "Aufa Ganteng");
}
CMD:testeror(playerid, params[])
{
	ErrorMsg(playerid, "Aufa Ganteng");
}
CMD:testsukses(playerid, params[])
{
	SuccesMsg(playerid, "Aufa Ganteng");
}
CMD:testsyntax(playerid, params[])
{
	SyntaxMsg(playerid, "Aufa Ganteng");
}
stock ShowNotify(const playerid, const string:message[], const icon)
{
	if(MaxPlayerNotify[playerid] == 7) return 1;
	MaxPlayerNotify[playerid]++;
	for(new x=-1; ++x <IndexNotify[playerid];)
	{
		for(new i=-1;++i<9;) PlayerTextDrawDestroy(playerid, TextDrawNotifikasi[playerid][(x*10) + i]);
		InfoNotify[playerid][IndexNotify[playerid]-x] = InfoNotify[playerid][(IndexNotify[playerid]-x)-1];
	}
    PlayerPlaySound(playerid, 1056, 0.0, 0.0, 0.0);
	format(InfoNotify[playerid][0][NotifyMessage], 320, "%s", message);
	InfoNotify[playerid][0][NotifyIcon] = icon;
	InfoNotify[playerid][0][NotifySize] = 3;
	
	++IndexNotify[playerid];
	new Float:new_x=0.0;
	for(new x=-1;++x<IndexNotify[playerid];)
	{
		CreateNotify(playerid, x, x * 10, new_x);
		new_x += (InfoNotify[playerid][x][NotifySize]*7.25)+25.0;
		new Float:Value = LoadingNotif[playerid]*101.0/100;
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][x], Value, 23.4);
	}
	SetTimerEx("HideNotify", 10000, false, "i", playerid);
	return 1;
}

stock CreateNotify(const playerid, index, i, const Float:new_x)
{
	new lines = InfoNotify[playerid][index][NotifySize];
	new Float:x = (lines * 10) + new_x;
	new Float:posisibaru = x-30.0;
	if(InfoNotify[playerid][index][NotifyIcon] == 1)
	{
		TextDrawNotifikasi[playerid][i] = CreatePlayerTextDraw(playerid, 1000.000000, 108.500000+posisibaru, "");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.425000, 1.400000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 538.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 882433023);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
		
		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 273.000000, 364.000000+posisibaru, "ld_bum:blkdot");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 101.000000, 23.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 566060031);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 876228863);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 17.500000, 20.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 541.500000, 106.500000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 14.750000, 17.750000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 882433023);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 547.000000, 108.500000+posisibaru, "i");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.425000, 1.400000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 556.000000, 113.500000+posisibaru, "INFO");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.229167, 1.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 882433023);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 542.000000, 123.000000+posisibaru, InfoNotify[playerid][index][NotifyMessage]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.150000, 0.700000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 633.500000, 494.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
	}
	if(InfoNotify[playerid][index][NotifyIcon] == 2)
	{
		TextDrawNotifikasi[playerid][i] = CreatePlayerTextDraw(playerid, 1000.000000, 108.500000+posisibaru, "");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.425000, 1.400000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 538.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -600488449);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 876228863);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 17.500000, 20.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 541.500000, 106.500000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 14.750000, 17.750000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -600488449);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 545.500000, 110.250000+posisibaru, "X");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.300000, 0.999999);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 556.000000, 113.500000+posisibaru, "KESALAHAN");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.229167, 1.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -600488449);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 542.000000, 123.000000+posisibaru, InfoNotify[playerid][index][NotifyMessage]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.150000, 0.700000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 633.500000, 494.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
		
		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 273.000000, 364.000000+posisibaru, InfoNotify[playerid][index][NotifyLoading]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 101.000000, 23.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -7232257);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
	}
	if(InfoNotify[playerid][index][NotifyIcon] == 3)
	{
		TextDrawNotifikasi[playerid][i] = CreatePlayerTextDraw(playerid, 1000.000000, 108.500000+posisibaru, "");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.425000, 1.400000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 538.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 448568575);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 876228863);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 17.500000, 20.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 541.500000, 106.500000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 14.750000, 17.750000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 448568575);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 545.500000, 112.250000+posisibaru, "/");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.620833, 0.649998);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 550.000000, 114.250000+posisibaru, "/");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], -0.433332, 0.499998);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 556.000000, 113.500000+posisibaru, "SUKSES");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.229167, 1.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 448568575);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 542.000000, 123.000000+posisibaru, InfoNotify[playerid][index][NotifyMessage]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.150000, 0.700000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 633.500000, 494.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
		
		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 273.000000, 364.000000+posisibaru, InfoNotify[playerid][index][NotifyLoading]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 101.000000, 23.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -7232257);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
	}
	if(InfoNotify[playerid][index][NotifyIcon] == 4)
	{
		TextDrawNotifikasi[playerid][i] = CreatePlayerTextDraw(playerid, 1000.000000, 108.500000+posisibaru, "");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.425000, 1.400000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 538.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -238809089);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 876228863);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 17.500000, 20.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 541.500000, 106.500000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 14.750000, 17.750000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -238809089);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 546.500000, 109.500000+posisibaru, "!");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.391665, 1.199996);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 556.000000, 113.500000+posisibaru, "SYNTAX");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.229167, 1.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -238809089);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 542.000000, 123.000000+posisibaru, InfoNotify[playerid][index][NotifyMessage]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.150000, 0.700000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 633.500000, 494.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
		
		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 273.000000, 364.000000+posisibaru, InfoNotify[playerid][index][NotifyLoading]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 101.000000, 23.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -7232257);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
	}
	if(InfoNotify[playerid][index][NotifyIcon] == 5)
	{
		TextDrawNotifikasi[playerid][i] = CreatePlayerTextDraw(playerid, 1000.000000, 108.500000+posisibaru, "");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.425000, 1.400000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 538.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -427941121);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_DUAL:white");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 96.000000, 45.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], 876228863);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 540.000000, 105.000000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 17.500000, 20.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 541.500000, 106.500000+posisibaru, "LD_BEAT:chit");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 14.750000, 17.750000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -427941121);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 546.500000, 109.500000+posisibaru, "!");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.391665, 1.199996);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 556.000000, 113.500000+posisibaru, "WARNING");
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.229167, 1.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 400.000000, 17.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -427941121);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);

		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 542.000000, 123.000000+posisibaru, InfoNotify[playerid][index][NotifyMessage]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.150000, 0.700000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 633.500000, 494.000000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -1);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
		
		TextDrawNotifikasi[playerid][++i] = CreatePlayerTextDraw(playerid, 273.000000, 364.000000+posisibaru, InfoNotify[playerid][index][NotifyLoading]);
		PlayerTextDrawFont(playerid, TextDrawNotifikasi[playerid][i], 4);
		PlayerTextDrawLetterSize(playerid, TextDrawNotifikasi[playerid][i], 0.600000, 2.000000);
		PlayerTextDrawTextSize(playerid, TextDrawNotifikasi[playerid][i], 101.000000, 23.500000);
		PlayerTextDrawSetOutline(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetShadow(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawAlignment(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawColor(playerid, TextDrawNotifikasi[playerid][i], -7232257);
		PlayerTextDrawBackgroundColor(playerid, TextDrawNotifikasi[playerid][i], 255);
		PlayerTextDrawBoxColor(playerid, TextDrawNotifikasi[playerid][i], 50);
		PlayerTextDrawUseBox(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetProportional(playerid, TextDrawNotifikasi[playerid][i], 1);
		PlayerTextDrawSetSelectable(playerid, TextDrawNotifikasi[playerid][i], 0);
		PlayerTextDrawShow(playerid, TextDrawNotifikasi[playerid][i]);
	}
	return true;
}
