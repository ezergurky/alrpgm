function nambang1(playerid)
{
	new dapetbatu = RandomEx(1,4);
    pData[playerid][pBatu] += dapetbatu;
    new str[500];
	format(str, sizeof(str), "Received_%dx", dapetbatu);
	ShowItemBox(playerid, "Batu", str, 905, 4);
	return 1;
}
CMD:nambang1(playerid, params[])
{
	if(pData[playerid][pJob] != 6) return 1;
	if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress");
	if(pData[playerid][pBatu] > 30) return ErrorMsg(playerid, "Anda Tidak Bisa Membawa Lebih Dari 30 Batu");
	ShowProgressbar(playerid, "Menambang..", 5);
	ApplyAnimation(playerid,"GRENADE","WEAPON_throw",4.0, 1, 0, 0, 0, 0, 1);
	SetPlayerAttachedObject(playerid, 3, 18635, 6, 0.000000, -0.025000, 0.066000, 0.000000, 0.000000, 0.000000, 1.000000, 1.000000, 1.000000);
	SetTimerEx("nambang1", 5000, false, "d", playerid);
	return 1;
}
enum E_PENAMBANG
{
    STREAMER_TAG_MAP_ICON:LockerMap,
    STREAMER_TAG_MAP_ICON:NambangMap,
    STREAMER_TAG_MAP_ICON:CuciMap,
    STREAMER_TAG_MAP_ICON:PeleburanMap,
    STREAMER_TAG_MAP_ICON:PenjualanMap,
	STREAMER_TAG_CP:LockerTambang,
	STREAMER_TAG_CP:TakeCarTambang,
	STREAMER_TAG_CP:Nambang,
	STREAMER_TAG_CP:Nambang2,
	STREAMER_TAG_CP:Nambang3,
	STREAMER_TAG_CP:Nambang4,
	STREAMER_TAG_CP:Nambang5,
	STREAMER_TAG_CP:Nambang6,
	STREAMER_TAG_CP:Nambang7,
	STREAMER_TAG_CP:Nambang8,
	STREAMER_TAG_CP:Nambang9,
	STREAMER_TAG_CP:Nambang10,
	STREAMER_TAG_CP:CuciBatu,
	STREAMER_TAG_CP:CuciBatu1,
	STREAMER_TAG_CP:CuciBatu2,
	STREAMER_TAG_CP:Peleburan,
	STREAMER_TAG_CP:Peleburan1,
	STREAMER_TAG_CP:Penjualan,
}
new PenambangArea[MAX_PLAYERS][E_PENAMBANG];

DeletePenambangCP(playerid)
{
	if(IsValidDynamicCP(PenambangArea[playerid][LockerTambang]))
	{
		DestroyDynamicCP(PenambangArea[playerid][LockerTambang]);
		PenambangArea[playerid][LockerTambang] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang]);
		PenambangArea[playerid][Nambang] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang2]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang2]);
		PenambangArea[playerid][Nambang2] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang3]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang3]);
		PenambangArea[playerid][Nambang3] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang4]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang4]);
		PenambangArea[playerid][Nambang4] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang5]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang5]);
		PenambangArea[playerid][Nambang5] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang6]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang6]);
		PenambangArea[playerid][Nambang6] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang7]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang7]);
		PenambangArea[playerid][Nambang7] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang8]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang8]);
		PenambangArea[playerid][Nambang8] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang9]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang9]);
		PenambangArea[playerid][Nambang9] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Nambang10]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Nambang10]);
		PenambangArea[playerid][Nambang10] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][CuciBatu]))
	{
		DestroyDynamicCP(PenambangArea[playerid][CuciBatu]);
		PenambangArea[playerid][CuciBatu] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicCP(PenambangArea[playerid][Peleburan]))
	{
		DestroyDynamicCP(PenambangArea[playerid][Peleburan]);
		PenambangArea[playerid][Peleburan] = STREAMER_TAG_CP: -1;
	}
	if(IsValidDynamicMapIcon(PenambangArea[playerid][LockerMap]))
	{
		DestroyDynamicMapIcon(PenambangArea[playerid][LockerMap]);
		PenambangArea[playerid][LockerMap] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PenambangArea[playerid][NambangMap]))
	{
		DestroyDynamicMapIcon(PenambangArea[playerid][NambangMap]);
		PenambangArea[playerid][NambangMap] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PenambangArea[playerid][CuciMap]))
	{
		DestroyDynamicMapIcon(PenambangArea[playerid][CuciMap]);
		PenambangArea[playerid][CuciMap] = STREAMER_TAG_MAP_ICON: -1;
	}
	if(IsValidDynamicMapIcon(PenambangArea[playerid][PeleburanMap]))
	{
		DestroyDynamicMapIcon(PenambangArea[playerid][PeleburanMap]);
		PenambangArea[playerid][PeleburanMap] = STREAMER_TAG_MAP_ICON: -1;
	}
}

RefreshJobTambang(playerid)
{
	DeletePenambangCP(playerid);

	if(pData[playerid][pJob] == 6)
	{
		PenambangArea[playerid][Nambang] = CreateDynamicCP(709.5767,913.5621,-95.2773, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang2] = CreateDynamicCP(709.8533,919.4036,-95.1732, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang3] = CreateDynamicCP(709.3992,928.4020,-95.1243, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang4] = CreateDynamicCP(709.9236,935.4225,-95.2557, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang5] = CreateDynamicCP(709.5246,943.4365,-94.7009, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang6] = CreateDynamicCP(709.4019,951.4313,-95.2810, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang7] = CreateDynamicCP(709.2734,957.3970,-95.2880, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang8] = CreateDynamicCP(709.2361,963.6351,-94.3459, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang9] = CreateDynamicCP(709.0634,969.4482,-94.1523, 1.0, -1, -1, playerid, 5.0);
		PenambangArea[playerid][Nambang10] = CreateDynamicCP(709.0248,974.7826,-94.1309, 1.0, -1, -1, playerid, 5.0);

		PenambangArea[playerid][CuciBatu] = CreateDynamicCP(-1373.5966,2110.0200,42.2000, 2.0, -1, -1, playerid, 30.0);
		PenambangArea[playerid][CuciBatu1] = CreateDynamicCP(-1377.4637,2112.6091,42.2000, 2.0, -1, -1, playerid, 30.0);
		PenambangArea[playerid][CuciBatu2] = CreateDynamicCP(-1381.2932,2115.5972,42.2000, 2.0, -1, -1, playerid, 30.0);

		PenambangArea[playerid][Peleburan] = CreateDynamicCP(-1300.6775,2705.0994,50.0625, 2.0, -1, -1, playerid, 30.0);
		PenambangArea[playerid][Peleburan1] = CreateDynamicCP(-1309.0109,2702.4890,50.0625, 2.0, -1, -1, playerid, 30.0);

		PenambangArea[playerid][NambangMap] = CreateDynamicMapIcon(682.5996,834.9089,-42.9609, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PenambangArea[playerid][CuciMap] = CreateDynamicMapIcon(-1373.5966,2110.0200,42.2000, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
		PenambangArea[playerid][PeleburanMap] = CreateDynamicMapIcon(-1300.6775,2705.0994,50.0625, 11, 0, -1, -1, playerid, 99999.0, MAPICON_GLOBAL);
	}
	return 1;
}

CMD:cucibatu(playerid, params[])
{
    if(pData[playerid][pJob] != 6) return 1;
    if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pBatu] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Batu");
	pData[playerid][pBatu] -= 1;
	pData[playerid][pBatuCucian] += 1;
	ShowItemBox(playerid, "Batu_Cucian", "Received_1x", 2936, 2);
	ShowItemBox(playerid, "Batu", "Removed_1x", 905, 2);
	ShowProgressbar(playerid, "Mencuci Batu..", 3);
    Inventory_Update(playerid);
    ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	return 1;
}

CMD:peleburanbatu(playerid, params[])
{
    if(pData[playerid][pJob] != 6) return 1;
    if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if(pData[playerid][pBatuCucian] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Batu Cucian");
 	SetTimerEx("leburkanbatuan", 4000, false, "d", playerid);
 	ShowProgressbar(playerid, "Meleburkan Batuan..", 4);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
    Inventory_Update(playerid);
	return 1;
}

function leburkanbatuan(playerid)
{
    if(IsPlayerConnected(playerid) && pData[playerid][pJob] == 6)
	{
		new rand = RandomEx(1,4);
	    if(rand == 1)
	    {
	        pData[playerid][pEmas] += 1;
		  	pData[playerid][pBatuCucian] -= 1;
			ShowItemBox(playerid, "Emas", "Received_1x", 19941, 2);
			ShowItemBox(playerid, "Batu_Cucian", "Removed_1x", 2936, 2);
			pData[playerid][pBladder] += 1;
			pData[playerid][pHunger] -= 1;
			pData[playerid][pEnergy] -= 1;
		}
		else if(rand == 2)
		{
		    pData[playerid][pBesi] += 1;
		  	pData[playerid][pBatuCucian] -= 1;
			ShowItemBox(playerid, "Besi", "Received_1x", 1510, 2);
			ShowItemBox(playerid, "Batu_Cucian", "Removed_1x", 2936, 2);
			pData[playerid][pBladder] += 1;
			pData[playerid][pHunger] -= 1;
			pData[playerid][pEnergy] -= 1;
		}
		else if(rand == 3)
		{
		    pData[playerid][pAluminium] += 1;
		  	pData[playerid][pBatuCucian] -= 1;
			ShowItemBox(playerid, "Aluminium", "Received_1x", 19809, 2);
			ShowItemBox(playerid, "Batu_Cucian", "Removed_1x", 2936, 2);
			pData[playerid][pBladder] += 1;
			pData[playerid][pHunger] -= 1;
			pData[playerid][pEnergy] -= 1;
		}
		else if(rand == 4)
		{
		    pData[playerid][pBesi] += 1;
		  	pData[playerid][pBatuCucian] -= 1;
			ShowItemBox(playerid, "Besi", "Received_1x", 1510, 2);
			ShowItemBox(playerid, "Batu_Cucian", "Removed_1x", 2936, 2);
			pData[playerid][pBladder] += 1;
			pData[playerid][pHunger] -= 1;
			pData[playerid][pEnergy] -= 1;
		}
	}
	return 1;
}

CMD:jualemas(playerid, params[])
{
    new total = pData[playerid][pEmas];
    if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if( pData[playerid][pEmas] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Emas");
    ShowProgressbar(playerid, "Menjual Emas..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pEmas] * 16;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pEmas] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Emas", str, 19941, 4);
    Inventory_Update(playerid);
	return 1;
}

CMD:jualtembaga(playerid, params[])
{
    new total = pData[playerid][pAluminium];
    if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if( pData[playerid][pAluminium] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Tembaga");
    ShowProgressbar(playerid, "Menjual Tembaga..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pAluminium] * 16;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pAluminium] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Aluminium", str, 19809, 4);
    Inventory_Update(playerid);
	return 1;
}
CMD:jualbesi(playerid, params[])
{
    new total = pData[playerid][pBesi];
    if( pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
    if( pData[playerid][pBesi] < 1) return ErrorMsg(playerid, "Anda Tidak Memiliki Besi");
    ShowProgressbar(playerid, "Menjual Besi..", 10);
	ApplyAnimation(playerid,"INT_HOUSE","wash_up",4.0, 1, 0, 0, 0, 0,1);
	new pay = pData[playerid][pBesi] * 10;
	GivePlayerMoneyEx(playerid, pay);
	pData[playerid][pBesi] -= total;
	new str[500];
	format(str, sizeof(str), "Received_%dx", pay);
	ShowItemBox(playerid, "Uang", str, 1212, 4);
	format(str, sizeof(str), "Removed_%dx", total);
	ShowItemBox(playerid, "Besi", str, 1510, 4);
    Inventory_Update(playerid);
	return 1;
}

function TungguNambang1(playerid)
{
	pData[playerid][pTimeTambang1] = 0;
	return 1;
}
function TungguNambang2(playerid)
{
	pData[playerid][pTimeTambang2] = 0;
	return 1;
}
function TungguNambang3(playerid)
{
	pData[playerid][pTimeTambang3] = 0;
	return 1;
}
function TungguNambang4(playerid)
{
	pData[playerid][pTimeTambang4] = 0;
	return 1;
}
function TungguNambang5(playerid)
{
	pData[playerid][pTimeTambang5] = 0;
	return 1;
}
function TungguNambang6(playerid)
{
	pData[playerid][pTimeTambang6] = 0;
	return 1;
}
function TungguNambang7(playerid)
{
	pData[playerid][pTimeTambang6] = 0;
	return 1;
}
function TungguNambang8(playerid)
{
	pData[playerid][pTimeTambang6] = 0;
	return 1;
}


