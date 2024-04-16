//aufa scrip
#include <YSI-Coding\y_hooks>
//radial menu with textdraw aufa
new Text: RadialAufa[17];
//selecttable radial menu aufa
new Text: DOKUMENAUFA;
new Text: INVENAUFA;
new Text: HPAUFA;
new Text: VOICEAUFA;
new Text: VEHAUFA;
new Text: TOYSAUFA;
new Text: TAGIHANAUFA;
new Text: CLOSEAUFAR;

CreateTDPanelAufa(playerid)
{
	//radial menu aufa
	RadialAufa[0] = TextDrawCreate(258.000, 189.000, "LD_DRV:brboat");
	TextDrawTextSize(RadialAufa[0], 14.000, 18.000);
	TextDrawAlignment(RadialAufa[0], 1);
	TextDrawColor(RadialAufa[0], -1);
	TextDrawSetShadow(RadialAufa[0], 0);
	TextDrawSetOutline(RadialAufa[0], 0);
	TextDrawBackgroundColor(RadialAufa[0], 255);
	TextDrawFont(RadialAufa[0], 4);
	TextDrawSetProportional(RadialAufa[0], 1);

	RadialAufa[1] = TextDrawCreate(253.000, 209.000, "DOKUMEN");
	TextDrawLetterSize(RadialAufa[1], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[1], 1);
	TextDrawColor(RadialAufa[1], -1);
	TextDrawSetShadow(RadialAufa[1], 1);
	TextDrawSetOutline(RadialAufa[1], 1);
	TextDrawBackgroundColor(RadialAufa[1], -7601921);
	TextDrawFont(RadialAufa[1], 1);
	TextDrawSetProportional(RadialAufa[1], 1);

	RadialAufa[2] = TextDrawCreate(258.000, 224.000, "HUD:radar_saveGame");
	TextDrawTextSize(RadialAufa[2], 15.000, 16.000);
	TextDrawAlignment(RadialAufa[2], 1);
	TextDrawColor(RadialAufa[2], -1);
	TextDrawSetShadow(RadialAufa[2], 0);
	TextDrawSetOutline(RadialAufa[2], 0);
	TextDrawBackgroundColor(RadialAufa[2], 255);
	TextDrawFont(RadialAufa[2], 4);
	TextDrawSetProportional(RadialAufa[2], 1);

	RadialAufa[3] = TextDrawCreate(251.000, 242.000, "INVENTORY");
	TextDrawLetterSize(RadialAufa[3], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[3], 1);
	TextDrawColor(RadialAufa[3], -1);
	TextDrawSetShadow(RadialAufa[3], 1);
	TextDrawSetOutline(RadialAufa[3], 1);
	TextDrawBackgroundColor(RadialAufa[3], -7601921);
	TextDrawFont(RadialAufa[3], 1);
	TextDrawSetProportional(RadialAufa[3], 1);

	RadialAufa[4] = TextDrawCreate(292.000, 225.000, "HUD:radar_dateDisco");
	TextDrawTextSize(RadialAufa[4], 14.000, 14.000);
	TextDrawAlignment(RadialAufa[4], 1);
	TextDrawColor(RadialAufa[4], -1);
	TextDrawSetShadow(RadialAufa[4], 0);
	TextDrawSetOutline(RadialAufa[4], 0);
	TextDrawBackgroundColor(RadialAufa[4], 255);
	TextDrawFont(RadialAufa[4], 4);
	TextDrawSetProportional(RadialAufa[4], 1);

	RadialAufa[5] = TextDrawCreate(285.000, 241.000, "HANPHONE");
	TextDrawLetterSize(RadialAufa[5], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[5], 1);
	TextDrawColor(RadialAufa[5], -1);
	TextDrawSetShadow(RadialAufa[5], 1);
	TextDrawSetOutline(RadialAufa[5], 1);
	TextDrawBackgroundColor(RadialAufa[5], -7601921);
	TextDrawFont(RadialAufa[5], 1);
	TextDrawSetProportional(RadialAufa[5], 1);

	RadialAufa[6] = TextDrawCreate(300.000, 260.000, "LD_BEAT:chit");
	TextDrawTextSize(RadialAufa[6], -3.000, 28.000);
	TextDrawAlignment(RadialAufa[6], 1);
	TextDrawColor(RadialAufa[6], -1);
	TextDrawSetShadow(RadialAufa[6], 0);
	TextDrawSetOutline(RadialAufa[6], 0);
	TextDrawBackgroundColor(RadialAufa[6], 255);
	TextDrawFont(RadialAufa[6], 4);
	TextDrawSetProportional(RadialAufa[6], 1);

	RadialAufa[7] = TextDrawCreate(302.000, 260.000, "LD_BEAT:chit");
	TextDrawTextSize(RadialAufa[7], -6.000, 10.000);
	TextDrawAlignment(RadialAufa[7], 1);
	TextDrawColor(RadialAufa[7], -1);
	TextDrawSetShadow(RadialAufa[7], 0);
	TextDrawSetOutline(RadialAufa[7], 0);
	TextDrawBackgroundColor(RadialAufa[7], 255);
	TextDrawFont(RadialAufa[7], 4);
	TextDrawSetProportional(RadialAufa[7], 1);

	RadialAufa[8] = TextDrawCreate(291.000, 281.000, "VOICE");
	TextDrawLetterSize(RadialAufa[8], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[8], 1);
	TextDrawColor(RadialAufa[8], -1);
	TextDrawSetShadow(RadialAufa[8], 1);
	TextDrawSetOutline(RadialAufa[8], 1);
	TextDrawBackgroundColor(RadialAufa[8], -7601921);
	TextDrawFont(RadialAufa[8], 1);
	TextDrawSetProportional(RadialAufa[8], 1);

	RadialAufa[9] = TextDrawCreate(326.000, 258.000, "HUD:radar_impound");
	TextDrawTextSize(RadialAufa[9], 19.000, 16.000);
	TextDrawAlignment(RadialAufa[9], 1);
	TextDrawColor(RadialAufa[9], -1);
	TextDrawSetShadow(RadialAufa[9], 0);
	TextDrawSetOutline(RadialAufa[9], 0);
	TextDrawBackgroundColor(RadialAufa[9], 255);
	TextDrawFont(RadialAufa[9], 4);
	TextDrawSetProportional(RadialAufa[9], 1);

	RadialAufa[10] = TextDrawCreate(322.000, 278.000, "VEH PANEL");
	TextDrawLetterSize(RadialAufa[10], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[10], 1);
	TextDrawColor(RadialAufa[10], -1);
	TextDrawSetShadow(RadialAufa[10], 1);
	TextDrawSetOutline(RadialAufa[10], 1);
	TextDrawBackgroundColor(RadialAufa[10], -7601921);
	TextDrawFont(RadialAufa[10], 1);
	TextDrawSetProportional(RadialAufa[10], 1);

	RadialAufa[11] = TextDrawCreate(325.000, 296.000, "HUD:radar_gangN");
	TextDrawTextSize(RadialAufa[11], 17.000, 16.000);
	TextDrawAlignment(RadialAufa[11], 1);
	TextDrawColor(RadialAufa[11], -1);
	TextDrawSetShadow(RadialAufa[11], 0);
	TextDrawSetOutline(RadialAufa[11], 0);
	TextDrawBackgroundColor(RadialAufa[11], 255);
	TextDrawFont(RadialAufa[11], 4);
	TextDrawSetProportional(RadialAufa[11], 1);

	RadialAufa[12] = TextDrawCreate(327.000, 315.000, "TOYS");
	TextDrawLetterSize(RadialAufa[12], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[12], 1);
	TextDrawColor(RadialAufa[12], -1);
	TextDrawSetShadow(RadialAufa[12], 1);
	TextDrawSetOutline(RadialAufa[12], 1);
	TextDrawBackgroundColor(RadialAufa[12], -7601921);
	TextDrawFont(RadialAufa[12], 1);
	TextDrawSetProportional(RadialAufa[12], 1);

	RadialAufa[13] = TextDrawCreate(365.000, 295.000, "$");
	TextDrawLetterSize(RadialAufa[13], 0.439, 1.999);
	TextDrawAlignment(RadialAufa[13], 1);
	TextDrawColor(RadialAufa[13], -1);
	TextDrawSetShadow(RadialAufa[13], 1);
	TextDrawSetOutline(RadialAufa[13], 1);
	TextDrawBackgroundColor(RadialAufa[13], -7601921);
	TextDrawFont(RadialAufa[13], 1);
	TextDrawSetProportional(RadialAufa[13], 1);

	RadialAufa[14] = TextDrawCreate(359.000, 315.000, "TAGIHAN");
	TextDrawLetterSize(RadialAufa[14], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[14], 1);
	TextDrawColor(RadialAufa[14], -1);
	TextDrawSetShadow(RadialAufa[14], 1);
	TextDrawSetOutline(RadialAufa[14], 1);
	TextDrawBackgroundColor(RadialAufa[14], -7601921);
	TextDrawFont(RadialAufa[14], 1);
	TextDrawSetProportional(RadialAufa[14], 1);

	RadialAufa[15] = TextDrawCreate(367.000, 200.000, "X");
	TextDrawLetterSize(RadialAufa[15], 0.799, 2.599);
	TextDrawAlignment(RadialAufa[15], 1);
	TextDrawColor(RadialAufa[15], -1);
	TextDrawSetShadow(RadialAufa[15], 1);
	TextDrawSetOutline(RadialAufa[15], 1);
	TextDrawBackgroundColor(RadialAufa[15], -7601921);
	TextDrawFont(RadialAufa[15], 1);
	TextDrawSetProportional(RadialAufa[15], 1);

	RadialAufa[16] = TextDrawCreate(369.000, 221.000, "CLOSE");
	TextDrawLetterSize(RadialAufa[16], 0.150, 0.899);
	TextDrawAlignment(RadialAufa[16], 1);
	TextDrawColor(RadialAufa[16], -1);
	TextDrawSetShadow(RadialAufa[16], 1);
	TextDrawSetOutline(RadialAufa[16], 1);
	TextDrawBackgroundColor(RadialAufa[16], -7601921);
	TextDrawFont(RadialAufa[16], 1);
	TextDrawSetProportional(RadialAufa[16], 1);



    //selecttabel radial menu aufa
	DOKUMENAUFA = TextDrawCreate(250.000, 188.000, "LD_BUM:blkdot");
	TextDrawTextSize(DOKUMENAUFA, 31.000, 31.000);
	TextDrawAlignment(DOKUMENAUFA, 1);
	TextDrawColor(DOKUMENAUFA, -7601921);
	TextDrawSetShadow(DOKUMENAUFA, 0);
	TextDrawSetOutline(DOKUMENAUFA, 0);
	TextDrawBackgroundColor(DOKUMENAUFA, 255);
	TextDrawFont(DOKUMENAUFA, 4);
	TextDrawSetProportional(DOKUMENAUFA, 1);
	TextDrawSetSelectable(DOKUMENAUFA, 1);

	INVENAUFA = TextDrawCreate(250.000, 222.000, "LD_BUM:blkdot");
	TextDrawTextSize(INVENAUFA, 31.000, 31.000);
	TextDrawAlignment(INVENAUFA, 1);
	TextDrawColor(INVENAUFA, -7601921);
	TextDrawSetShadow(INVENAUFA, 0);
	TextDrawSetOutline(INVENAUFA, 0);
	TextDrawBackgroundColor(INVENAUFA, 255);
	TextDrawFont(INVENAUFA, 4);
	TextDrawSetProportional(INVENAUFA, 1);
	TextDrawSetSelectable(INVENAUFA, 1);

	HPAUFA = TextDrawCreate(283.000, 222.000, "LD_BUM:blkdot");
	TextDrawTextSize(HPAUFA, 31.000, 31.000);
	TextDrawAlignment(HPAUFA, 1);
	TextDrawColor(HPAUFA, -7601921);
	TextDrawSetShadow(HPAUFA, 0);
	TextDrawSetOutline(HPAUFA, 0);
	TextDrawBackgroundColor(HPAUFA, 255);
	TextDrawFont(HPAUFA, 4);
	TextDrawSetProportional(HPAUFA, 1);
	TextDrawSetSelectable(HPAUFA, 1);

	VOICEAUFA = TextDrawCreate(283.000, 258.000, "LD_BUM:blkdot");
	TextDrawTextSize(VOICEAUFA, 31.000, 31.000);
	TextDrawAlignment(VOICEAUFA, 1);
	TextDrawColor(VOICEAUFA, -7601921);
	TextDrawSetShadow(VOICEAUFA, 0);
	TextDrawSetOutline(VOICEAUFA, 0);
	TextDrawBackgroundColor(VOICEAUFA, 255);
	TextDrawFont(VOICEAUFA, 4);
	TextDrawSetProportional(VOICEAUFA, 1);
	TextDrawSetSelectable(VOICEAUFA, 1);

	VEHAUFA = TextDrawCreate(319.000, 258.000, "LD_BUM:blkdot");
	TextDrawTextSize(VEHAUFA, 31.000, 31.000);
	TextDrawAlignment(VEHAUFA, 1);
	TextDrawColor(VEHAUFA, -7601921);
	TextDrawSetShadow(VEHAUFA, 0);
	TextDrawSetOutline(VEHAUFA, 0);
	TextDrawBackgroundColor(VEHAUFA, 255);
	TextDrawFont(VEHAUFA, 4);
	TextDrawSetProportional(VEHAUFA, 1);
	TextDrawSetSelectable(VEHAUFA, 1);

	TOYSAUFA = TextDrawCreate(319.000, 295.000, "LD_BUM:blkdot");
	TextDrawTextSize(TOYSAUFA, 31.000, 31.000);
	TextDrawAlignment(TOYSAUFA, 1);
	TextDrawColor(TOYSAUFA, -7601921);
	TextDrawSetShadow(TOYSAUFA, 0);
	TextDrawSetOutline(TOYSAUFA, 0);
	TextDrawBackgroundColor(TOYSAUFA, 255);
	TextDrawFont(TOYSAUFA, 4);
	TextDrawSetProportional(TOYSAUFA, 1);
	TextDrawSetSelectable(TOYSAUFA, 1);

	TAGIHANAUFA = TextDrawCreate(355.000, 295.000, "LD_BUM:blkdot");
	TextDrawTextSize(TAGIHANAUFA, 31.000, 31.000);
	TextDrawAlignment(TAGIHANAUFA, 1);
	TextDrawColor(TAGIHANAUFA, -7601921);
	TextDrawSetShadow(TAGIHANAUFA, 0);
	TextDrawSetOutline(TAGIHANAUFA, 0);
	TextDrawBackgroundColor(TAGIHANAUFA, 255);
	TextDrawFont(TAGIHANAUFA, 4);
	TextDrawSetProportional(TAGIHANAUFA, 1);
	TextDrawSetSelectable(TAGIHANAUFA, 1);

	CLOSEAUFAR = TextDrawCreate(361.000, 198.000, "LD_BUM:blkdot");
	TextDrawTextSize(CLOSEAUFAR, 31.000, 31.000);
	TextDrawAlignment(CLOSEAUFAR, 1);
	TextDrawColor(CLOSEAUFAR, -7601921);
	TextDrawSetShadow(CLOSEAUFAR, 0);
	TextDrawSetOutline(CLOSEAUFAR, 0);
	TextDrawBackgroundColor(CLOSEAUFAR, 255);
	TextDrawFont(CLOSEAUFAR, 4);
	TextDrawSetProportional(CLOSEAUFAR, 1);
	TextDrawSetSelectable(CLOSEAUFAR, 1);
}

hook public OnPlayerClickTextDraw(playerid, Text:clickedid)
{
	//radial menu aufa
	if(clickedid == CLOSEAUFAR) //keluar
	{
    	for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
	}
    if(clickedid == INVENAUFA) //inventory
    {
       callcmd::i(playerid, "");
	   {
    	for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
	}
    }
    if(clickedid == HPAUFA) //hp
    {
       callcmd::h(playerid, "");
	   {
    	for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
	}
    }
    if(clickedid == DOKUMENAUFA) //dokumen
    {
       DisplayDokumen(playerid);
       {
    	for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
		CancelSelectTextDraw(playerid);
       }
    }
    if(clickedid == VOICEAUFA) //voice
    {
       ShowPlayerDialog(playerid, DIALOG_VOICE, DIALOG_STYLE_LIST, "Radial Menu | {7fffd4}Asia Lane", "Berbisik\nNormal\nTeriak", "Pilih", "Kembali");
        {
        for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
		CancelSelectTextDraw(playerid);
       }
    }
    if(clickedid == TOYSAUFA) //toys
    {
       callcmd::toys(playerid);
	   {
    	for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
		CancelSelectTextDraw(playerid);
	}
    }
    if(clickedid == TAGIHANAUFA) //tagihan
    {
       callcmd::mybill(playerid);
	   {
    	for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == VEHAUFA) //veh panel
	{
		callcmd::vpanel(playerid);
		for(new i = 0; i < 16; i++)
        {
            TextDrawHideForPlayer(playerid, RadialAufa[i]);
            CancelSelectTextDraw(playerid);
        }
		TextDrawHideForPlayer(playerid, CLOSEAUFAR);
        TextDrawHideForPlayer(playerid, INVENAUFA);
		TextDrawHideForPlayer(playerid, HPAUFA);
		TextDrawHideForPlayer(playerid, DOKUMENAUFA);
		TextDrawHideForPlayer(playerid, VOICEAUFA);
		TextDrawHideForPlayer(playerid, TOYSAUFA);
		TextDrawHideForPlayer(playerid, TAGIHANAUFA);
		TextDrawHideForPlayer(playerid, VEHAUFA);
	}
    }
}
//command
CMD:aufapanel(playerid, params[])
{
		//click panel aufa
		TextDrawShowForPlayer(playerid, CLOSEAUFAR);
		TextDrawShowForPlayer(playerid, INVENAUFA);
		TextDrawShowForPlayer(playerid, HPAUFA);
		TextDrawShowForPlayer(playerid, DOKUMENAUFA);
		TextDrawShowForPlayer(playerid, VOICEAUFA);
		TextDrawShowForPlayer(playerid, TOYSAUFA);
		TextDrawShowForPlayer(playerid, TAGIHANAUFA);
		TextDrawShowForPlayer(playerid, VEHAUFA);
		//body panel aufa
		for(new i = 0; i < 16; i++)
        {
            TextDrawShowForPlayer(playerid, RadialAufa[i]);
            SelectTextDraw(playerid, 0xFF0000FF);
        }
		return 1;
}