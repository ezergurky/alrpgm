CMD:pmdc(playerid, params[])
{
	if(pData[playerid][pFaction] != 1)
		return SyntaxMsg(playerid, "Kamu bukan anggota SAPD!", 10000);

	new vehid = GetPlayerVehicleID(playerid), str[254];
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 234.44, 111.30, 1003.22))
	{
		format(str, sizeof(str), "Vehicle Info\nBisnis Info\nHouse Info\nPhone Track\nRequest Backup\n911 Calls");
		ShowPlayerDialog(playerid, PMDC_MENU, DIALOG_STYLE_LIST, "MDC Menu", str, "Select", "Cancel");
		return 1;
	}
	else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(IsSAPDCar(vehid))
		{
			format(str, sizeof(str), "Vehicle Info\nBisnis Info\nHouse Info\nPhone Track\nRequest Backup\n 911 Calls");
			ShowPlayerDialog(playerid, PMDC_MENU, DIALOG_STYLE_LIST, "MDC Menu", str, "Select", "Cancel");
			return 1;
		}
	}
	else return SyntaxMsg(playerid, "Kamu tidak berada di point mdc/didalam kendaraan sapd", 10000);
	return 1;
}
CMD:emdc(playerid, params[])
{
	if(pData[playerid][pFaction] != 3)
		return SyntaxMsg(playerid, "Kamu bukan anggota SAMD!", 10000);

	new vehid = GetPlayerVehicleID(playerid), str[254];
	if(IsPlayerInRangeOfPoint(playerid, 3.5, 1161.97, -1325.55, -35.40))
	{
		format(str, sizeof(str), "911 Calls");
		ShowPlayerDialog(playerid, EMDC_MENU, DIALOG_STYLE_LIST, "MDC Menu", str, "Select", "Cancel");
		return 1;
	}
	else if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	{
		if(IsSAMDCar(vehid))
		{
			format(str, sizeof(str), "911 Calls");
			ShowPlayerDialog(playerid, EMDC_MENU, DIALOG_STYLE_LIST, "MDC Menu", str, "Select", "Cancel");
			return 1;
		}
	}
	else return SyntaxMsg(playerid, "Kamu tidak berada di point mdc/didalam kendaraan samd", 10000);
	return 1;
}

// ReturnMdcVehicleID(playerid, hslot)
// {
// 	if(hslot < 1 && hslot > LIMIT_PER_PLAYER) return -1;

// 	new tmpcount;
// 	foreach(new i : PVehicles)
// 	{
// 		if(IsValidVehicle(pvData[i][cVeh]))
// 		{
// 			if(!strcmp(pvData[i][cPlate], pData[playerid][pTargetMDC]))
// 			{
// 				tmpcount++;
// 	       		if(tmpcount == hslot)
// 	       		{
// 	        		return i;
// 	  			}
// 	  		}
// 		}
// 	}
// 	return -1;
// }

// ReturnMdcBisnisID(playerid, hslot)
// {
// 	if(hslot < 1 && hslot > LIMIT_PER_PLAYER) return -1;

// 	new tmpcount;
// 	for(new i = 0; i < MAX_BISNIS; i++)
// 	{
// 		if(Iter_Contains(Bisnis, i))
// 		{
// 			if(!strcmp(bData[i][bOwner], pData[playerid][pTargetMDC]))
// 			{
// 	     		tmpcount++;
// 	       		if(tmpcount == hslot)
// 	       		{
// 	        		return i;
// 	  			}
// 	  		}
// 		}
// 	}
// 	return -1;
// }

// ReturnMdcHouseID(playerid, hslot)
// {
// 	if(hslot < 1 && hslot > LIMIT_PER_PLAYER) return -1;

// 	new tmpcount;
// 	for(new i = 0; i < MAX_HOUSES; i++)
// 	{
// 		if(Iter_Contains(Houses, i))
// 		{
// 			if(!strcmp(hData[i][hOwner], pData[playerid][pTargetMDC]))
// 			{
// 	     		tmpcount++;
// 	       		if(tmpcount == hslot)
// 	       		{
// 	        		return i;
// 	  			}
// 	  		}
// 		}
// 	}
// 	return -1;
// }


forward trackph(playerid, to_player);
public trackph(playerid, to_player)
{
	{
	   	if(pData[playerid][pActivityTime] >= 100)
	   	{
	    	InfoTD_MSG(playerid, 8000, "Searching done!");
			KillTimer(pData[playerid][pActivityTime]);
			pData[playerid][pLoading] = false;
			pData[playerid][pActivityTime] = 0;
			ShowPhone(playerid);
		}
 		else if(pData[playerid][pActivityTime] < 100)
		{
  			pData[playerid][pActivityTime] += 5;
 			PlayerPlaySound(playerid, 1053, 0.0, 0.0, 0.0);
	   	}
	}
	return 1;
}


