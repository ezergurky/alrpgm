//scrip by aufa

#include "YSI-Coding\y_hooks"
new PlayerText: SPEDOAUFA[MAX_PLAYERS][6];
BuatTdSpeedometeraufa(playerid)
{
    SPEDOAUFA[playerid][0] = CreatePlayerTextDraw(playerid, 287.000, 425.000, "STATUS : MATI");
    PlayerTextDrawLetterSize(playerid, SPEDOAUFA[playerid][0], 0.189, 1.098);
    PlayerTextDrawAlignment(playerid, SPEDOAUFA[playerid][0], 1);
    PlayerTextDrawColor(playerid, SPEDOAUFA[playerid][0], -1);
    PlayerTextDrawSetShadow(playerid, SPEDOAUFA[playerid][0], 1);
    PlayerTextDrawSetOutline(playerid, SPEDOAUFA[playerid][0], 1);
    PlayerTextDrawBackgroundColor(playerid, SPEDOAUFA[playerid][0], 150);
    PlayerTextDrawFont(playerid, SPEDOAUFA[playerid][0], 1);
    PlayerTextDrawSetProportional(playerid, SPEDOAUFA[playerid][0], 1);

    SPEDOAUFA[playerid][1] = CreatePlayerTextDraw(playerid, 343.000, 425.000, "<!> HATI-HATI");
    PlayerTextDrawLetterSize(playerid, SPEDOAUFA[playerid][1], 0.189, 1.098);
    PlayerTextDrawAlignment(playerid, SPEDOAUFA[playerid][1], 1);
    PlayerTextDrawColor(playerid, SPEDOAUFA[playerid][1], -12254977);
    PlayerTextDrawSetShadow(playerid, SPEDOAUFA[playerid][1], 1);
    PlayerTextDrawSetOutline(playerid, SPEDOAUFA[playerid][1], 1);
    PlayerTextDrawBackgroundColor(playerid, SPEDOAUFA[playerid][1], 150);
    PlayerTextDrawFont(playerid, SPEDOAUFA[playerid][1], 1);
    PlayerTextDrawSetProportional(playerid, SPEDOAUFA[playerid][1], 1);

    SPEDOAUFA[playerid][2] = CreatePlayerTextDraw(playerid, 291.000, 406.000, "100");
    PlayerTextDrawLetterSize(playerid, SPEDOAUFA[playerid][2], 0.349, 1.899);
    PlayerTextDrawAlignment(playerid, SPEDOAUFA[playerid][2], 1);
    PlayerTextDrawColor(playerid, SPEDOAUFA[playerid][2], -1);
    PlayerTextDrawSetShadow(playerid, SPEDOAUFA[playerid][2], 1);
    PlayerTextDrawSetOutline(playerid, SPEDOAUFA[playerid][2], 1);
    PlayerTextDrawBackgroundColor(playerid, SPEDOAUFA[playerid][2], 255);
    PlayerTextDrawFont(playerid, SPEDOAUFA[playerid][2], 1);
    PlayerTextDrawSetProportional(playerid, SPEDOAUFA[playerid][2], 1);

    SPEDOAUFA[playerid][3] = CreatePlayerTextDraw(playerid, 316.000, 410.000, "KM/H");
    PlayerTextDrawLetterSize(playerid, SPEDOAUFA[playerid][3], 0.189, 1.098);
    PlayerTextDrawAlignment(playerid, SPEDOAUFA[playerid][3], 1);
    PlayerTextDrawColor(playerid, SPEDOAUFA[playerid][3], -10270721);
    PlayerTextDrawSetShadow(playerid, SPEDOAUFA[playerid][3], 1);
    PlayerTextDrawSetOutline(playerid, SPEDOAUFA[playerid][3], 1);
    PlayerTextDrawBackgroundColor(playerid, SPEDOAUFA[playerid][3], 150);
    PlayerTextDrawFont(playerid, SPEDOAUFA[playerid][3], 1);
    PlayerTextDrawSetProportional(playerid, SPEDOAUFA[playerid][3], 1);

    SPEDOAUFA[playerid][4] = CreatePlayerTextDraw(playerid, 360.000, 410.000, "BENSIN");
    PlayerTextDrawLetterSize(playerid, SPEDOAUFA[playerid][4], 0.189, 1.098);
    PlayerTextDrawAlignment(playerid, SPEDOAUFA[playerid][4], 1);
    PlayerTextDrawColor(playerid, SPEDOAUFA[playerid][4], 16744447);
    PlayerTextDrawSetShadow(playerid, SPEDOAUFA[playerid][4], 1);
    PlayerTextDrawSetOutline(playerid, SPEDOAUFA[playerid][4], 1);
    PlayerTextDrawBackgroundColor(playerid, SPEDOAUFA[playerid][4], 150);
    PlayerTextDrawFont(playerid, SPEDOAUFA[playerid][4], 1);
    PlayerTextDrawSetProportional(playerid, SPEDOAUFA[playerid][4], 1);

    SPEDOAUFA[playerid][5] = CreatePlayerTextDraw(playerid, 336.000, 406.000, "100");
    PlayerTextDrawLetterSize(playerid, SPEDOAUFA[playerid][5], 0.349, 1.899);
    PlayerTextDrawAlignment(playerid, SPEDOAUFA[playerid][5], 1);
    PlayerTextDrawColor(playerid, SPEDOAUFA[playerid][5], -1);
    PlayerTextDrawSetShadow(playerid, SPEDOAUFA[playerid][5], 1);
    PlayerTextDrawSetOutline(playerid, SPEDOAUFA[playerid][5], 1);
    PlayerTextDrawBackgroundColor(playerid, SPEDOAUFA[playerid][5], 255);
    PlayerTextDrawFont(playerid, SPEDOAUFA[playerid][5], 1);
    PlayerTextDrawSetProportional(playerid, SPEDOAUFA[playerid][5], 1);
}

hook public OnPlayerStateChange(playerid, newstate, oldstate)
{
    if(oldstate == PLAYER_STATE_DRIVER)
    {	
		if(GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CARRY || GetPlayerSpecialAction(playerid) == SPECIAL_ACTION_CUFFED)
            return RemovePlayerFromVehicle(playerid);/*RemoveFromVehicle(playerid);*/
		
			//HBE textdraw Simple
			PlayerTextDrawHide(playerid, HudAufa[playerid][39]);
 			PlayerTextDrawHide(playerid, HudAufa[playerid][40]);
		   	PlayerTextDrawHide(playerid, HudAufa[playerid][41]);
		   	PlayerTextDrawHide(playerid, HudAufa[playerid][42]);
		   	PlayerTextDrawHide(playerid, HudAufa[playerid][43]);
		   	PlayerTextDrawHide(playerid, HudAufa[playerid][44]);
		   	PlayerTextDrawHide(playerid, HudAufa[playerid][45]);
   			PlayerTextDrawHide(playerid, HudAufa[playerid][46]);
        for(new i = 0; i < 6; i++)
		{
	    	PlayerTextDrawHide(playerid, SPEDOAUFA[playerid][i]);
		}
         //Show
        if(pData[playerid][pHBEMode] == 1)
	    {
	    	for(new i = 0; i < 6; i++)
		{
		    PlayerTextDrawShow(playerid, SPEDOAUFA[playerid][i]);
		}
	    }
        //function
        if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
            if(pData[playerid][pHBEMode] == 1)
			{
				new Float:fDamage, Float:fFuel, color1, color2, fuelstr[50], veh[50];
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 8000.0) fDamage = 8000.0;

				fFuel = GetVehicleFuel(vehicleid);

				// if(fFuel < 0.0) fFuel = 0.0;
				// else if(fFuel > 300.0) fFuel = 300.0;

				if(fFuel <= 100.0) veh = "~g~";
				else if(fFuel <= 70.0) veh = "~y~";
				else if(fFuel <= 45.0) veh = "~r~";

				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, SPEDOAUFA[playerid][0], "STATUS : MATI");
				}
				else
				{
					PlayerTextDrawSetString(playerid, SPEDOAUFA[playerid][0], "STATUS : HIDUP");
				}

				format(fuelstr, sizeof(fuelstr), "%s%.0f", veh, fFuel);
				PlayerTextDrawSetString(playerid, SPEDOAUFA[playerid][5], fuelstr);

				format(tstr, sizeof(tstr), "%.0f", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, SPEDOAUFA[playerid][2], tstr);
			
        } 
    }
    return 1;
    }
}
