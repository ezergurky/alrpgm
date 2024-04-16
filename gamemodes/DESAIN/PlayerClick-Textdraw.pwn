stock HideRadial(playerid)
{
	for(new i; i < 44; i++)
    {
        PlayerTextDrawHide(playerid, BODYRADIAL[playerid][i]);
    }
	PlayerTextDrawHide(playerid, closerm[playerid]);
    PlayerTextDrawHide(playerid, hprm[playerid]);
	PlayerTextDrawHide(playerid, invenrm[playerid]);
	PlayerTextDrawHide(playerid, dokumenrm[playerid]);
	PlayerTextDrawHide(playerid, vehiclerm[playerid]);
	PlayerTextDrawHide(playerid, toysrm[playerid]);
	PlayerTextDrawHide(playerid, tagihanrm[playerid]);
	PlayerTextDrawHide(playerid, voicerm[playerid]);
	CancelSelectTextDraw(playerid);
}
stock ShowRadial(playerid)
{
	PlayerTextDrawShow(playerid, closerm[playerid]);
    PlayerTextDrawShow(playerid, hprm[playerid]);
	PlayerTextDrawShow(playerid, invenrm[playerid]);
	PlayerTextDrawShow(playerid, dokumenrm[playerid]);
	PlayerTextDrawShow(playerid, vehiclerm[playerid]);
	PlayerTextDrawShow(playerid, toysrm[playerid]);
	PlayerTextDrawShow(playerid, tagihanrm[playerid]);
	PlayerTextDrawShow(playerid, voicerm[playerid]);
	for(new i; i < 44; i++)
    {
        PlayerTextDrawShow(playerid, BODYRADIAL[playerid][i]);
    }
	SelectTextDraw(playerid, COLOR_WHITE);
}

public OnPlayerClickDynamicTextdraw(playerid, PlayerText:playertextid)
{
	//radial menu
	// if(playertextid == vehiclerm[playerid]) //veh panel
	// {
	// 	callcmd::vpanel(playerid);
	// 	{
	// 	for(new i; i < 39; i++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][i]);
    //         // CancelSelectTextDraw(playerid);
    //     }
	// 	PlayerTextDrawHide(playerid, closerm[playerid]);
    //     PlayerTextDrawHide(playerid, hprm[playerid]);
	// 	PlayerTextDrawHide(playerid, invenrm[playerid]);
	// 	PlayerTextDrawHide(playerid, dokumenrm[playerid]);
	// 	PlayerTextDrawHide(playerid, vehiclerm[playerid]);
	// 	PlayerTextDrawHide(playerid, toysrm[playerid]);
	// 	PlayerTextDrawHide(playerid, tagihanrm[playerid]);
	// 	PlayerTextDrawHide(playerid, voicerm[playerid]);
	// 	// CancelSelectTextDraw(playerid);
	// 	}
	// }
	if(playertextid == vehiclerm[playerid]) //
	{
    	HideRadial(playerid);
		callcmd::vrm(playerid, "");	
	} 

	if(playertextid == closerm[playerid]) //keluar
	{
		HideRadial(playerid);
	}
	if(playertextid == hprm[playerid]) //keluar
	{
		HideRadial(playerid);
		callcmd::h(playerid, "");
	}
    if(playertextid == invenrm[playerid]) //inventory
    {
		HideRadial(playerid);
		callcmd::i(playerid, "");
	}
    
    if(playertextid == dokumenrm[playerid]) //dokumen
    {
		HideRadial(playerid);
		DisplayDokumen(playerid);
    }
    if(playertextid == voicerm[playerid]) //voice
    {
		HideRadial(playerid);
		ShowPlayerDialog(playerid, DIALOG_VOICE, DIALOG_STYLE_LIST, "Radial Menu | {7fffd4}Kota Asia Lane", "Berbisik\nNormal\nTeriak", "Pilih", "Kembali");
    }
    if(playertextid == toysrm[playerid]) //toys
    {
		HideRadial(playerid);
		callcmd::toys(playerid);
    }
	if(playertextid == tagihanrm[playerid]) // invoice
	{
		HideRadial(playerid);
		callcmd::mybill(playerid);
	}


	if(playertextid == AngkatHP[playerid])
	{
        callcmd::p(playerid, "");
        TogglePhone[playerid] = 0;
	}
	if(playertextid == RijekHP[playerid])
	{
        callcmd::ofhu(playerid, "");
        TogglePhone[playerid] = 0;
	}
	if(playertextid == BataltelHP[playerid])
	{
        callcmd::hu(playerid, "");
        TogglePhone[playerid] = 0;
	}
	if(playertextid == Batal2telHP[playerid])
	{
        callcmd::offhu(playerid, "");
        TogglePhone[playerid] = 0;
	}
	
	//KONTAK DI HP
	if(playertextid == DAFTARKONTAK[playerid])
	{
	    ShowContacts(playerid);
	}
	if(playertextid == TWEET[playerid])
	{
		new string[555];
		format(string, sizeof(string), "Post Twitter\nUbah Twitter({0099ff}%s{ffffff})", pData[playerid][pTwittername]);
		ShowPlayerDialog(playerid, DIALOG_TWITTER, DIALOG_STYLE_LIST, "Asia Lane - Twitter", string, "Pilih", "Tutup");
		SimpanHp(playerid);
	}
    //FUEL SYSTEM Aufa
    if(playertextid == PomTD[playerid][7])
    {
       	for(new i = 0; i < 26; i++)
		{
			PlayerTextDrawHide(playerid, PomTD[playerid][i]);
		}
		CancelSelectTextDraw(playerid);
		InfoMsg(playerid, "Terima kasih telah mengisi bahan bakar disini ><");
		KillTimer(pData[playerid][pFillTime]);
		pData[playerid][pInputFuel] = 0;
		pData[playerid][pFillStatus] = 0;
		pData[playerid][pFillPrice] = 0;
		pData[playerid][pFill] = -1;
	}
	if(playertextid == PomTD[playerid][6])
   	{
   	    if(pData[playerid][pInputFuel] == 0) return ErrorMsg(playerid, "Anda belum menginput jumlah yang akan ditarik");
   	    new gsid = pData[playerid][pFill];
   	    new vehicleid = GetPlayerVehicleID(playerid);
    	if(pData[playerid][pInputFuel] > GetVehicleFuel(vehicleid))
		return ErrorMsg(playerid, "Bahan bakar kendaraan tidak bisa lebih dari 100 liter.");
  		pData[playerid][pFillPrice] += pData[playerid][pInputFuel];
    	GStation_Refresh(gsid);
     	GivePlayerMoneyEx(playerid, -pData[playerid][pInputFuel]);
      	new fuels = GetVehicleFuel(vehicleid);
		SetVehicleFuel(vehicleid, fuels+pData[playerid][pInputFuel]);
  		gsData[pData[playerid][pFill]][gsStock] -= pData[playerid][pInputFuel];
	}
	if(playertextid == PomTD[playerid][18])
   	{
   	    ShowPlayerDialog(playerid, DIALOG_INPUTFUEL, DIALOG_STYLE_INPUT, "Asialane - Gas Station", "Mohon masukan jumlah bensin yang ingin di isi:", "Input", "Batal");
	}
	//ATM SYSTEM
	if(playertextid == AtmTD[playerid][7])
	{
	    for(new i = 0; i < 76; i++)
		{
			PlayerTextDrawHide(playerid, AtmTD[playerid][i]);
		}
		CancelSelectTextDraw(playerid);
		pData[playerid][pInputMoney] = 0;
	}
	if(playertextid == AtmTD[playerid][43])//input tf
	{
	    ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Asialane - Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Input", "Batal");
	}
	if(playertextid == AtmTD[playerid][53])//tombol input withdepo
	{
	    ShowPlayerDialog(playerid, DIALOG_WITHDEPO, DIALOG_STYLE_INPUT, "Asialane - FLEECA", "Mohon masukan jumlah uang yang ingin di input:", "Input", "Batal");
	}
	if(playertextid == AtmTD[playerid][58])//withdraw
	{
	    if(pData[playerid][pInputMoney] == 0) return ErrorMsg(playerid, "Anda belum menginput jumlah yang akan ditarik");
	    if(pData[playerid][pInputMoney] > pData[playerid][pBankMoney]) return ErrorMsg(playerid, "Anda tidak memiliki uang sebanyak itu di bank.");
		if(pData[playerid][pInputMoney] < 1) return ErrorMsg(playerid, "Angka yang anda masukan tidak valid!");
	    new query[128], lstr[512];
		pData[playerid][pBankMoney] = (pData[playerid][pBankMoney] - pData[playerid][pInputMoney]);
		GivePlayerMoneyEx(playerid, pData[playerid][pInputMoney]);
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET bmoney=%d,money=%d WHERE reg_id=%d", pData[playerid][pBankMoney], pData[playerid][pMoney], pData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		format(lstr, sizeof(lstr), "Anda berhasil menarik uang sejumlah %s dari rekening anda.", FormatMoney(pData[playerid][pInputMoney]));
		SuccesMsg(playerid, lstr);
		new AtmInfo[500];
		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 	PlayerTextDrawSetString(playerid, AtmTD[playerid][32], AtmInfo);
   		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
   		PlayerTextDrawSetString(playerid, AtmTD[playerid][31], AtmInfo);
	}
	if(playertextid == AtmTD[playerid][62])//deposit
	{
	    if(pData[playerid][pInputMoney] == 0) return ErrorMsg(playerid, "Anda belum menginput jumlah yang akan disimpan");
	    if(pData[playerid][pInputMoney] > pData[playerid][pMoney]) return ErrorMsg(playerid, "Anda tidak memiliki uang sebanyak itu di dompet.");
		if(pData[playerid][pInputMoney] < 1) return ErrorMsg(playerid, "Angka yang anda masukan tidak valid!");
	    new query[128], lstr[512];
		pData[playerid][pBankMoney] = (pData[playerid][pBankMoney] + pData[playerid][pInputMoney]);
		GivePlayerMoneyEx(playerid, -pData[playerid][pInputMoney]);
		mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET bmoney=%d,money=%d WHERE reg_id=%d", pData[playerid][pBankMoney], pData[playerid][pMoney], pData[playerid][pID]);
		mysql_tquery(g_SQL, query);
		format(lstr, sizeof(lstr), "Anda berhasil menyimpan uang sejumlah %s kedalam rekening anda.", FormatMoney(pData[playerid][pInputMoney]));
		SuccesMsg(playerid, lstr);
		new AtmInfo[500];
		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	 	PlayerTextDrawSetString(playerid, AtmTD[playerid][32], AtmInfo);
   		format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pMoney]));
   		PlayerTextDrawSetString(playerid, AtmTD[playerid][31], AtmInfo);
	}
	//PHONE SYSTEM
	if(playertextid == TRANSFER[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Asialane - Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Transfer", "Batal");
	}
	if(playertextid == GPAY[playerid])
	{
		ShowPlayerDialog(playerid, DIALOG_GOPAY, DIALOG_STYLE_INPUT, "GoJek App - GoPay", "Masukan jumlah uang yang ingin anda bayar", "Input", "Kembali");
	}
	if(playertextid == GTOPUP[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOTOPUP, DIALOG_STYLE_INPUT, "GoJek App - TopUp", "Masukan jumlah gopay yang ingin anda topup", "Input", "Kembali");
	}
	if(playertextid == GRIDE[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOJEK, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoJek", "Hai, kamu akan memesan GoJek. Mau kemana hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == GCAR[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOCAR, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoCar", "Hai, kamu akan memesan GoCar. Mau kemana hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == GFOOD[playerid])
	{
	    ShowPlayerDialog(playerid, DIALOG_GOFOOD, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoFood", "Hai, kamu akan memesan GoFood. Mau makan apa hari ini?", "Pesan", "Kembali");
	}
	if(playertextid == PLAYSTOREAPP[playerid][15])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	    if(PlayerInfo[playerid][pInstallMap] == 1) return ErrorMsg(playerid,"Lu udah punya google map blok!");
		ShowProgressbar(playerid, "Menginstall Spotify..", 10);
		SetTimerEx("DownloadSpotify", 10000, false, "d", playerid);
	}
	if(playertextid == PLAYSTOREAPP[playerid][16])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	    if(PlayerInfo[playerid][pInstallTweet] == 1) return ErrorMsg(playerid,"Lu udah punya twitter blok!");
		ShowProgressbar(playerid, "Menginstall Twitter..", 10);
		SetTimerEx("DownloadTweet", 10000, false, "d", playerid);
	}
	if(playertextid == PLAYSTOREAPP[playerid][17])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	    if(PlayerInfo[playerid][pInstallBank] == 1) return ErrorMsg(playerid,"Lu udah punya mbanking blok!");
		ShowProgressbar(playerid, "Menginstall Mbanking..", 10);
		SetTimerEx("DownloadBank", 10000, false, "d", playerid);
	}
	if(playertextid == PLAYSTOREAPP[playerid][18])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	    if(PlayerInfo[playerid][pInstallDweb] == 1) return ErrorMsg(playerid,"Lu udah punya darkweb blok!");
		ShowProgressbar(playerid, "Menginstall DarkWeb..", 10);
		SetTimerEx("DownloadDarkWeb", 10000, false, "d", playerid);
	}
	if(playertextid == PLAYSTOREAPP[playerid][19])
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda masih ada progress");
	    if(PlayerInfo[playerid][pInstallGojek] == 1) return ErrorMsg(playerid,"Lu udah punya Gojek blok!");
		ShowProgressbar(playerid, "Menginstall Gojek..", 10);
		SetTimerEx("DownloadGojek", 10000, false, "d", playerid);
	}
	//REGISTER
    if(playertextid == RegisterErn[playerid][31])
	{
	    if(pData[playerid][pMasukinNama] == 0) return ErrorMsg(playerid, "Anda belum memasukkan nama karakter");
	    if(pData[playerid][pAge] == 0) return ErrorMsg(playerid, "Anda belum memasukkan tanggal lahir");
	    if(pData[playerid][pTinggi] == 0) return ErrorMsg(playerid, "Anda belum memasukkan tinggi badan");
	    if(pData[playerid][pBerat] == 0) return ErrorMsg(playerid, "Anda belum memasukkan berat badan");
	    if(pData[playerid][pGender] < 1) return ErrorMsg(playerid, "Anda belum memilih jenis kelamin");
	    if(pData[playerid][pAge] == 0) return ErrorMsg(playerid, "Anda belum memasukkan tanggal lahir");
	    {
		    SuccesMsg(playerid,"Registrasi Berhasil! Terima kasih telah bergabung dengan Asialane ><!");
		    for(new i = 0; i < 34; i++)
			{
				PlayerTextDrawHide(playerid, RegisterErn[playerid][i]);
			}
			PlayerTextDrawHide(playerid, KLIKMALE[playerid]);
			PlayerTextDrawHide(playerid, KLIKFEMALE[playerid]);
			for(new idx; idx < 10; idx++) 
			{
				PlayerTextDrawHide(playerid, LoginErn[playerid][idx]);
			}
			CancelSelectTextDraw(playerid);
		    if(pData[playerid][pGender] == 1)
		    {
		        pData[playerid][pSkin] = 17;
				SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1750.5931, -2515.8118, 13.5969, 0.0, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
			}
			else
			{
			    pData[playerid][pSkin] = 93;
				SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 1750.5931, -2515.8118, 13.5969, 0.0, 0, 0, 0, 0, 0, 0);
				SpawnPlayer(playerid);
			}
		}
	}
	if(playertextid == KLIKMALE[playerid])
	{
	    PlayerTextDrawHide(playerid, KLIKMALE[playerid]);
	    PlayerTextDrawColor(playerid, KLIKMALE[playerid], COLOR_BLUE);
	    PlayerTextDrawShow(playerid, KLIKMALE[playerid]);
	    PlayerTextDrawHide(playerid, KLIKFEMALE[playerid]);
	    PlayerTextDrawColor(playerid, KLIKFEMALE[playerid], -1);
	    PlayerTextDrawShow(playerid, KLIKFEMALE[playerid]);
	    pData[playerid][pGender] = 1;
	}
	if(playertextid == KLIKFEMALE[playerid])
	{
	    PlayerTextDrawHide(playerid, KLIKMALE[playerid]);
	    PlayerTextDrawColor(playerid, KLIKMALE[playerid], -1);
	    PlayerTextDrawShow(playerid, KLIKMALE[playerid]);
	    PlayerTextDrawHide(playerid, KLIKFEMALE[playerid]);
	    PlayerTextDrawColor(playerid, KLIKFEMALE[playerid], COLOR_BLUE);
	    PlayerTextDrawShow(playerid, KLIKFEMALE[playerid]);
	    pData[playerid][pGender] = 2;
	}
	if(playertextid == RegisterErn[playerid][17])
	{
	    ShowPlayerDialog(playerid, DIALOG_MAKE_CHAR, DIALOG_STYLE_INPUT, "Asialane - {ffffff}Pembuatan Karakter", "Masukan nama baru untuk karakter anda\n\nContoh: Faruq_Jumantara.", "Oke", "Keluar");
	}
	if(playertextid == RegisterErn[playerid][20])
	{
	    ShowPlayerDialog(playerid, DIALOG_AGE, DIALOG_STYLE_INPUT, "Asialane - {ffffff}Tanggal Lahir", "Masukan tanggal lahir (Tgl/Bulan/Tahun): 15/04/1998", "Oke", "Batal");
	}
	if(playertextid == RegisterErn[playerid][23])
	{
	    ShowPlayerDialog(playerid, DIALOG_TINGGI, DIALOG_STYLE_INPUT, "Asialane - {ffffff}Tinggi Badan", "Masukan tinggi badan minimal 110 cm dan maksimal 200 cm", "Oke", "Batal");
	}
	if(playertextid == RegisterErn[playerid][26])
	{
        ShowPlayerDialog(playerid, DIALOG_BERAT, DIALOG_STYLE_INPUT, "Asialane - {ffffff}Berat Badan", "Masukan berat badan minimal 40 kg dan maksimal 150 kg", "Oke", "Batal");
	}

	if(playertextid == LoginErn[playerid][7])
	{
	    if(pData[playerid][pilihkarakter] == 0) return ErrorMsg(playerid, "Anda belum memilih karakter yang akan dimainkan");
		new cQuery[256];
		mysql_format(g_SQL, cQuery, sizeof(cQuery), "SELECT * FROM `players` WHERE `username` = '%s' LIMIT 1;", PlayerChar[playerid][pData[playerid][pChar]]);
		mysql_tquery(g_SQL, cQuery, "AssignPlayerData", "d", playerid);
   	 	for(new idx; idx < 10; idx++) PlayerTextDrawHide(playerid, LoginErn[playerid][idx]);
   	 	CancelSelectTextDraw(playerid);
   	 	pData[playerid][pilihkarakter] = 0;
	}
	if(playertextid == LoginErn[playerid][6])
	{
        CheckPlayerChar(playerid);
	}
	//Taruh di OnPlayerClickTextDraw
	for(new i = 0; i < MAX_INVENTORY; i++)
	{
		if(playertextid == MODELTD[playerid][i])
		{
			if(InventoryData[playerid][i][invExists])
			{
			    MenuStore_UnselectRow(playerid);
				MenuStore_SelectRow(playerid, i);
			    new name[48];
            	strunpack(name, InventoryData[playerid][pData[playerid][pSelectItem]][invItem]);
			}
		}
	}
	if(playertextid == INVINFO[playerid][2])
	{
		new id = pData[playerid][pSelectItem];

		if(id == -1)
		{
		    ErrorMsg(playerid,"[Inventory] Tidak Ada Barang Di Slot Tersebut");
		}
		else
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
			new string[64];
		    strunpack(string, InventoryData[playerid][id][invItem]);

		    if(!PlayerHasItem(playerid, string))
		    {
		   		ErrorMsg(playerid,"[Inventory] Kamu Tidak Memiliki Barang Tersebut");
                Inventory_Show(playerid);
			}
			else
			{
				CallLocalFunction("OnPlayerUseItem", "dds", playerid, id, string);
			}
		}
	}
	else if(playertextid == INVINFO[playerid][5])
	{
		Inventory_Close(playerid);
	}
	else if(playertextid == INVINFO[playerid][4])
	{
		InfoMsg(playerid, "Fitur ini sedang dalam pengembangan");
	}
	else if(playertextid == INVINFO[playerid][3])
	{
		new id = pData[playerid][pSelectItem], str[500], count = 0;
		if(id == -1)
		{
			ErrorMsg(playerid,"[Inventory] Pilih Barang Terlebih Dahulu");
		}
		else
		{
		    if (pData[playerid][pGiveAmount] < 1)
				return ErrorMsg(playerid,"[Inventory] Masukan Jumlah Terlebih Dahulu");

            foreach(new i : Player) if(IsPlayerConnected(i) && NearPlayer(playerid, i, 5) && i != playerid)
			{
				format(str, sizeof(str), "Kantong - %s (%d)\n", pData[i][pName], i);
				SetPlayerListitemValue(playerid, count++, i);
			}
			if(!count) ErrorMsg(playerid, "Tidak ada player lain didekat mu!");
			else ShowPlayerDialog(playerid, DIALOG_GIVE, DIALOG_STYLE_LIST, "Asialane - Inventory", str, "Pilih", "Tutup");
		}
	}
	else if(playertextid == INVINFO[playerid][1])
	{
		ShowPlayerDialog(playerid, DIALOG_AMOUNT, DIALOG_STYLE_INPUT, "Inventory - Jumlah", "Masukan Jumlah:", "Berikan", "Batal");
	}
    if(playertextid == ktpaufa[playerid][3])
    {
        for(new txd; txd < 28; txd++)
        {
            PlayerTextDrawHide(playerid, ktpaufa[playerid][txd]);
            CancelSelectTextDraw(playerid);
        }           
    }
    if(playertextid == LICCard[playerid][11])
    {
        for(new txd; txd < 26; txd++)
        {
            PlayerTextDrawHide(playerid, LICCard[playerid][txd]);
            CancelSelectTextDraw(playerid);
        }           
    }

	//veh panel aufa
	// if(playertextid == CLOSERUQVEH[playerid]) // close panel
	// {
    // 	for(new txd; txd < 31; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, KendaraanTD[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	PlayerTextDrawHide(playerid, keluar[playerid]);
	// 	PlayerTextDrawHide(playerid, kunci[playerid]);
	// 	PlayerTextDrawHide(playerid, jendela[playerid]);
	// 	PlayerTextDrawHide(playerid, mesin[playerid]);
	// 	PlayerTextDrawHide(playerid, listkendaraan[playerid]);
	// 	PlayerTextDrawHide(playerid, kap[playerid]);
	// 	PlayerTextDrawHide(playerid, bagasi[playerid]);
	// 	SelectTextDraw(playerid, COLOR_WHITE);
	// 	CancelSelectTextDraw(playerid);
	// }
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
		new
			vehicleid = GetPlayerVehicleID(playerid);

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
    //===============================================================//
    return 1;
}
