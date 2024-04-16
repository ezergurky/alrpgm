new PlayerText: NOTIFINFO[MAX_PLAYERS][8];

// notif system aufa scrip
//desain by aufa
//scripter aufa
CreateNotifyruq(playerid)
{
    NOTIFINFO[playerid][0] = CreatePlayerTextDraw(playerid, 547.000, 174.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, NOTIFINFO[playerid][0], 90.000, 25.000);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][0], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][0], 1687547391);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][0], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][0], 0);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][0], 255);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][0], 4);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][0], 1);

    NOTIFINFO[playerid][1] = CreatePlayerTextDraw(playerid, 541.000, 172.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, NOTIFINFO[playerid][1], 10.000, 13.000);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][1], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][1], 1687547391);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][1], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][1], 0);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][1], 255);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][1], 4);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][1], 1);

    NOTIFINFO[playerid][2] = CreatePlayerTextDraw(playerid, 541.000, 188.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, NOTIFINFO[playerid][2], 10.000, 13.000);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][2], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][2], 1687547391);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][2], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][2], 0);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][2], 255);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][2], 4);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][2], 1);

    NOTIFINFO[playerid][3] = CreatePlayerTextDraw(playerid, 543.000, 178.000, "LD_SPAC:white");
    PlayerTextDrawTextSize(playerid, NOTIFINFO[playerid][3], 8.000, 18.000);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][3], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][3], 1687547391);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][3], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][3], 0);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][3], 255);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][3], 4);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][3], 1);

    NOTIFINFO[playerid][4] = CreatePlayerTextDraw(playerid, 544.000, 178.000, "LD_BEAT:chit");
    PlayerTextDrawTextSize(playerid, NOTIFINFO[playerid][4], 13.000, 17.000);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][4], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][4], -1);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][4], 0);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][4], 0);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][4], 255);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][4], 4);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][4], 1);

    NOTIFINFO[playerid][5] = CreatePlayerTextDraw(playerid, 549.000, 182.000, "i");
    PlayerTextDrawLetterSize(playerid, NOTIFINFO[playerid][5], 0.240, 0.999);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][5], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][5], 1);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][5], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][5], 150);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][5], 1);

    NOTIFINFO[playerid][6] = CreatePlayerTextDraw(playerid, 559.000, 177.000, "INFO NOTIFIKASI");
    PlayerTextDrawLetterSize(playerid, NOTIFINFO[playerid][6], 0.119, 0.599);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][6], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][6], -1);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][6], 1);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][6], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][6], 150);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][6], 1);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][6], 1);

    NOTIFINFO[playerid][7] = CreatePlayerTextDraw(playerid, 559.000, 186.000, "Gps telah di tandai");
    PlayerTextDrawLetterSize(playerid, NOTIFINFO[playerid][7], 0.119, 0.899);
    PlayerTextDrawAlignment(playerid, NOTIFINFO[playerid][7], 1);
    PlayerTextDrawColor(playerid, NOTIFINFO[playerid][7], -1);
    PlayerTextDrawSetShadow(playerid, NOTIFINFO[playerid][7], 1);
    PlayerTextDrawSetOutline(playerid, NOTIFINFO[playerid][7], 1);
    PlayerTextDrawBackgroundColor(playerid, NOTIFINFO[playerid][7], 150);
    PlayerTextDrawFont(playerid, NOTIFINFO[playerid][7], 1);
    PlayerTextDrawSetProportional(playerid, NOTIFINFO[playerid][7], 1);
}

HideInforuq(playerid)
{
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][0]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][1]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][2]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][3]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][4]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][5]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][6]);
    PlayerTextDrawHide(playerid, NOTIFINFO[playerid][7]);
    return 1;
}

ShowInforuq(playerid, text[], time)
{
    PlayerTextDrawSetString(playerid, NOTIFINFO[playerid][7], text);
    PlayerPlaySound(playerid, 1057, 0.0, 0.0, 0.0);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][0]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][1]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][2]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][3]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][4]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][5]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][6]);
    PlayerTextDrawShow(playerid, NOTIFINFO[playerid][7]);
    SetTimer("notifruq", time, true);
    return 1;
}

forward notifruq(playerid);
public notifruq(playerid)
{
    HideInforuq(playerid);
    return 1;
}

CMD:ruqtes(playerid, params[])
{
    ShowInforuq(playerid, "Aufa Ganteng", 5000);
    return 1;
}