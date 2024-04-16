CMD:p(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
		return Error(playerid, "Anda sudah sedang menelpon seseorang!");
		
	if(pData[playerid][pInjured] != 0)
		return Error(playerid, "You cant do that in this time.");
		
	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[ii][pPhoneCredit]--;
			
			pData[playerid][pCall] = ii;
			//SendClientMessageEx(ii, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
   			for(new i = 0; i < 17; i++)
			{
				TextDrawHideForPlayer(ii, TeleponhpTD[i]);
			}
			TextDrawHideForPlayer(ii, CLOSE5);
			PlayerTextDrawHide(ii, NamatelHP[ii]);
			PlayerTextDrawHide(ii, WaktutelHP[ii]);
			PlayerTextDrawHide(ii, BataltelHP[ii]);
			PlayerTextDrawHide(ii, Batal2telHP[ii]);
			PlayerTextDrawHide(ii, MemanggiltelHP[ii]);
			PlayerTextDrawHide(ii, BerderingtelHP[ii]);
			PlayerTextDrawHide(ii, SibuktelHP[ii]);
			PlayerTextDrawHide(ii, PanggiltelHP[ii]);
			PlayerTextDrawHide(ii, RijekHP[ii]);
			PlayerTextDrawHide(ii, AngkatHP[ii]);
			
			for(new i = 0; i < 17; i++)
			{
				TextDrawShowForPlayer(ii, TeleponhpTD[i]);
			}
			TextDrawShowForPlayer(ii, CLOSE5);
			PlayerTextDrawShow(ii, NamatelHP[ii]);
			PlayerTextDrawShow(ii, WaktutelHP[ii]);
			PlayerTextDrawShow(ii, BataltelHP[ii]);
			CancelSelectTextDraw(ii);
			//SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			for(new i = 0; i < 17; i++)
			{
				TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
			}
			TextDrawHideForPlayer(playerid, CLOSE5);
			PlayerTextDrawHide(playerid, NamatelHP[playerid]);
			PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
			PlayerTextDrawHide(playerid, BataltelHP[playerid]);
			PlayerTextDrawHide(playerid, Batal2telHP[playerid]);
			PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
			PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
			PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, RijekHP[playerid]);
			PlayerTextDrawHide(playerid, AngkatHP[playerid]);
			
			for(new i = 0; i < 17; i++)
			{
				TextDrawShowForPlayer(playerid, TeleponhpTD[i]);
			}
			TextDrawShowForPlayer(playerid, CLOSE5);
			PlayerTextDrawShow(playerid, NamatelHP[playerid]);
			PlayerTextDrawShow(playerid, WaktutelHP[playerid]);
			PlayerTextDrawShow(playerid, BataltelHP[playerid]);
			CancelSelectTextDraw(playerid);
			ToggleCall[playerid] = 1;
			ToggleCall[ii] = 1;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_USECELLPHONE);
			SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s answers their cellphone.", ReturnName(playerid));
			
			DetikCall[playerid] = 0;
			MenitCall[playerid] = 0;
			JamCall[playerid] = 0;
			
			DetikCall[ii] = 0;
			MenitCall[ii] = 0;
			JamCall[ii] = 0;
			
			KillTimer(CallTimer[playerid]);
			KillTimer(CallTimer[ii]);
			
			CallTimer[playerid] = SetTimerEx("TambahDetikCall", 1000, true, "i", playerid);
			CallTimer[ii] = SetTimerEx("TambahDetikCall", 1000, true, "i", ii);
			
   			new targetid = pData[playerid][pCall];

			OnPhone[targetid] = SvCreateGStream(0xFFA200FF, "InPhone");

		    if (OnPhone[targetid])
			{
		        SvAttachListenerToStream(OnPhone[targetid], targetid);
		        SvAttachListenerToStream(OnPhone[targetid], playerid);
		    }
		    if (OnPhone[targetid] && pData[playerid][pCall] != INVALID_PLAYER_ID)
			{
		        SvAttachSpeakerToStream(OnPhone[targetid], playerid);
		    }

		    if(OnPhone[targetid] && pData[targetid][pCall] != INVALID_PLAYER_ID)
			{
		        SvAttachSpeakerToStream(OnPhone[targetid], targetid);
		    }
		}
	}
	return 1;
}

CMD:ofhu(playerid, params[])
{
 	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

    foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			pData[playerid][pCall] = ii;
			for(new i = 0; i < 17; i++)
			{
				TextDrawHideForPlayer(ii, TeleponhpTD[i]);
			}
			TextDrawHideForPlayer(ii, CLOSE5);
			PlayerTextDrawHide(ii, NamatelHP[ii]);
			PlayerTextDrawHide(ii, WaktutelHP[ii]);
			PlayerTextDrawHide(ii, BataltelHP[ii]);
			PlayerTextDrawHide(ii, Batal2telHP[ii]);
			PlayerTextDrawHide(ii, MemanggiltelHP[ii]);
			PlayerTextDrawHide(ii, BerderingtelHP[ii]);
			PlayerTextDrawHide(ii, SibuktelHP[ii]);
			PlayerTextDrawHide(ii, PanggiltelHP[ii]);
			PlayerTextDrawHide(ii, RijekHP[ii]);
			PlayerTextDrawHide(ii, AngkatHP[ii]);
			pData[ii][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(ii, SPECIAL_ACTION_STOPUSECELLPHONE);
			//SendClientMessageEx(playerid, COLOR_YELLOW, "[CELLPHONE] "WHITE_E"phone is connected, type '/hu' to stop!");
			for(new i = 0; i < 17; i++)
			{
				TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
			}
			TextDrawHideForPlayer(playerid, CLOSE5);
			PlayerTextDrawHide(playerid, NamatelHP[playerid]);
			PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
			PlayerTextDrawHide(playerid, BataltelHP[playerid]);
			PlayerTextDrawHide(playerid, Batal2telHP[playerid]);
			PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
			PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
			PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
			PlayerTextDrawHide(playerid, RijekHP[playerid]);
			PlayerTextDrawHide(playerid, AngkatHP[playerid]);
			CancelSelectTextDraw(playerid);
			CancelSelectTextDraw(ii);
			ToggleCall[ii] = 0;
			ToggleCall[playerid] = 0;
			TogglePhone[ii] = 0;
			TogglePhone[playerid] = 0;
			DetikCall[playerid] = 0;
			MenitCall[playerid] = 0;
			JamCall[playerid] = 0;
			DetikCall[ii] = 0;
			MenitCall[ii] = 0;
			JamCall[ii] = 0;
			pData[playerid][pCall] = INVALID_PLAYER_ID;
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
		}
	}
	return 1;
}

CMD:offhu(playerid, params[])
{
 	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	for(new i = 0; i < 17; i++)
	{
		TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
	}
	TextDrawHideForPlayer(playerid, CLOSE5);
	PlayerTextDrawHide(playerid, NamatelHP[playerid]);
	PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
	PlayerTextDrawHide(playerid, BataltelHP[playerid]);
	PlayerTextDrawHide(playerid, Batal2telHP[playerid]);
	PlayerTextDrawHide(playerid, Batal2telHP[playerid]);
	PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
	PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
	PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
	PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
	PlayerTextDrawHide(playerid, RijekHP[playerid]);
	PlayerTextDrawHide(playerid, AngkatHP[playerid]);
	CancelSelectTextDraw(playerid);
	ToggleCall[playerid] = 0;
	TogglePhone[playerid] = 0;
	DetikCall[playerid] = 0;
	MenitCall[playerid] = 0;
	JamCall[playerid] = 0;
	pData[playerid][pCall] = INVALID_PLAYER_ID;
	SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);
	return 1;
}

CMD:hu(playerid, params[])
{
	if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		return Error(playerid, "Anda tidak dapat melakukan ini jika sedang berada di OOC Zone");

	new caller = pData[playerid][pCall];
	if(IsPlayerConnected(caller) && caller != INVALID_PLAYER_ID)
	{
		pData[caller][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(caller, SPECIAL_ACTION_STOPUSECELLPHONE);
		//SendNearbyMessage(caller, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(caller));
		for(new i = 0; i < 17; i++)
		{
			TextDrawHideForPlayer(caller, TeleponhpTD[i]);
		}
		TextDrawHideForPlayer(caller, CLOSE5);
		PlayerTextDrawHide(caller, NamatelHP[caller]);
		PlayerTextDrawHide(caller, WaktutelHP[caller]);
		PlayerTextDrawHide(caller, BataltelHP[caller]);
		PlayerTextDrawHide(caller, Batal2telHP[caller]);
		PlayerTextDrawHide(caller, MemanggiltelHP[caller]);
		PlayerTextDrawHide(caller, BerderingtelHP[caller]);
		PlayerTextDrawHide(caller, SibuktelHP[caller]);
		PlayerTextDrawHide(caller, PanggiltelHP[caller]);
		PlayerTextDrawHide(caller, RijekHP[caller]);
		PlayerTextDrawHide(caller, AngkatHP[caller]);
		CancelSelectTextDraw(caller);
		ToggleCall[caller] = 0;
		TogglePhone[caller] = 0;
		DetikCall[caller] = 0;
		MenitCall[caller] = 0;
		JamCall[caller] = 0;
		
		//SendNearbyMessage(playerid, 20.0, COLOR_PURPLE, "* %s puts away their cellphone.", ReturnName(playerid));
  		for(new i = 0; i < 17; i++)
		{
			TextDrawHideForPlayer(playerid, TeleponhpTD[i]);
		}
		TextDrawHideForPlayer(playerid, CLOSE5);
		PlayerTextDrawHide(playerid, NamatelHP[playerid]);
		PlayerTextDrawHide(playerid, WaktutelHP[playerid]);
		PlayerTextDrawHide(playerid, BataltelHP[playerid]);
		PlayerTextDrawHide(playerid, Batal2telHP[playerid]);
		PlayerTextDrawHide(playerid, MemanggiltelHP[playerid]);
		PlayerTextDrawHide(playerid, BerderingtelHP[playerid]);
		PlayerTextDrawHide(playerid, SibuktelHP[playerid]);
		PlayerTextDrawHide(playerid, PanggiltelHP[playerid]);
		PlayerTextDrawHide(playerid, RijekHP[playerid]);
		PlayerTextDrawHide(playerid, AngkatHP[playerid]);
		CancelSelectTextDraw(playerid);
		ToggleCall[playerid] = 0;
		TogglePhone[playerid] = 0;
		DetikCall[playerid] = 0;
		MenitCall[playerid] = 0;
		JamCall[playerid] = 0;
		pData[playerid][pCall] = INVALID_PLAYER_ID;
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_STOPUSECELLPHONE);

  		if (OnPhone[caller] && pData[caller][pCall] != INVALID_PLAYER_ID)
	 	{
            SvDetachSpeakerFromStream(OnPhone[caller], caller);
        }

        if(OnPhone[caller] && pData[playerid][pCall] != INVALID_PLAYER_ID)
		{
            SvDetachSpeakerFromStream(OnPhone[caller], playerid);
        }

        if(OnPhone[caller])
		{
            SvDetachListenerFromStream(OnPhone[caller], caller);
            SvDetachListenerFromStream(OnPhone[caller], playerid);
            SvDeleteStream(OnPhone[caller]);
            OnPhone[caller] = SV_NULL;
        }

		if (OnPhone[playerid] && pData[caller][pCall] != INVALID_PLAYER_ID)
		{
            SvDetachSpeakerFromStream(OnPhone[playerid], caller);
        }

        if(OnPhone[playerid] && pData[playerid][pCall] != INVALID_PLAYER_ID)
		{
            SvDetachSpeakerFromStream(OnPhone[playerid], playerid);
        }

        if(OnPhone[playerid])
		{
            SvDetachListenerFromStream(OnPhone[playerid], caller);
            SvDetachListenerFromStream(OnPhone[playerid], playerid);
            SvDeleteStream(OnPhone[playerid]);
            OnPhone[playerid] = SV_NULL;
        }
	}
	return 1;
}