#include <YSI\y_hooks>

#define MAX_ANSWER_DMV	5

// ======================================== [Array list] =================================================
stock const g_arrDMVQuestions[][] = {
    "Kamu melewati lampu lalu lintas yang berubah dari warna merah ke kuning, apa yang harus di lakukan?",
    "Ketika kamu ingin berpindah jalan, apa yang harus di lakukan?.",
    "Pengemudi harus memberi isyarat dengan petunjuk arah yang berkedip pada saat?",
    "Apa kegunaan helm yang sebenarnya?",
    "Dilarang melewati kendaraan lain walaupun tidak ada rambu-rambu yang melarangnya pada?",
    "Pengendara motor di anggap sah apabila?",
    "Jika mendengar sirine kendaraan ambulan, polisi dan kendaraan kovoi, apa yang harus di lakukan?",
    "Bila hendak membonceng seseorang, motor harus di lengkapi dengan?",
    "Barang bawaan yang boleh di bawa di kendaraan, kecuali?",
    "Kendaraan yang harus di iringi polisi saat berada di jalan raya?"
};


enum DMVAnswer {
    QID,
    Answer[128],
    True
};

stock const g_arrDMVAnswer[][DMVAnswer] = {
    {0, "A, Berhenti", false},
    {0, "B, Jalan terus", false},
    {0, "C, Bersiap-siap berhenti sebelum melewati garis berhenti.", true},

    {1, "A, Berhenti di tengah jalan.", false},
    {1, "B, Memberikan istarat dengan menggunakan petunjuk arah (lampu sein).", true},
    {1, "C, Kedua jawaban benar.", false},

    {2, "A, Akan berjalan atau mengubah arah ke kanan saja.", false},
    {2, "B, Pada saat akan berhenti sesuka kita lah pokoknya suka suka.", false},
    {2, "C, Akan merubah arah ke kiri atau kanan.", true},

    {3, "A, Untuk menghidari penangkapan oknum polisi yang korup.", false},
    {3, "B, Melindungi kepala dari benturan dan gesekan yang mengakibatkan luka di kepala.", true},
    {3, "C, Melindungi pandangan pengendara, air hujan dan panas serta debu yang menyebabkan jerawat.", false},

    {4, "A, Jalan menurun.", false},
    {4, "B, Jalan berlubang.", false},
    {4, "C, Jalan tikungan.", true},

    {5, "A, Diperoleh STNK dari polisi lalu lintas dan plat nomor kendaraan.", true},
    {5, "B, Mengurus STNK dari calo yang ada di pemerintahan Summers.", false},
    {5, "C, Semua jawaban benar.", false},

    {6, "A, Menepi dan berhenti sampai konvoi lewat dan jalan aman.", true},
    {6, "B, Tetap mengemudikan kendaraan seperti biasa.", false},
    {6, "C, Acuh dengan keadaan tersebut.", false},

    {7, "A, Tempat duduk yang berisi barang bawaan.", false},
    {7, "B, Injakan kaki dan pegangan untuk yang di bonceng.", false},
    {7, "C, Tempat duduk, injakan kaki dan pegangan untuk yang di bonceng.", true},

    {8, "A, Tas ransel, sayuran dan kelengkapan kotak P3K.", false},
    {8, "B, Narkoba dan bahan peledak.", true},
    {8, "C, Laptop, rokok dan bantal.", false},

    {9, "A, Mobil yang laki banget.", false},
    {9, "B, Bus.", false},
    {9, "C, Truck/Trailer dengan muatan maksimal, yang membahayakan penumpang lain.", true}
};

// ===================================== [Static variable list] =============================================

static 
	question_true[MAX_PLAYERS] = {0, ...},
	question_id[MAX_PLAYERS] = {-1, ...},
	question_alist[MAX_PLAYERS][3] = {0, ...},
	question_answered[MAX_PLAYERS] = {0, ...},
	question_list[MAX_PLAYERS][sizeof(g_arrDMVQuestions)] = {-1, ...};


// ========================================== [Function list] ================================================

ShowDMVQuestions(playerid)
{
    new 
    	question_index,
    	count = -1,
        question_text[400];

    question_index = random(sizeof(g_arrDMVQuestions));

    if(IsQuestionInListed(playerid, question_index)) 
    	return ShowDMVQuestions(playerid);

    question_id[playerid] = question_index;
    InsertQuestionList(playerid, question_index);

    strcat(question_text, sprintf("%s\n", g_arrDMVQuestions[question_index]));
    for(new answer = 0; answer != sizeof(g_arrDMVAnswer); answer++) if(g_arrDMVAnswer[answer][QID] == question_index)
    {
    	count++;

        question_alist[playerid][count] = g_arrDMVAnswer[answer][True];
        strcat(question_text, sprintf("%s\n", g_arrDMVAnswer[answer][Answer]));
    }
    Dialog_Show(playerid, DMVQuestions, DIALOG_STYLE_TABLIST_HEADERS, "DMV Questions", question_text, "Select", "Close");
    return 1;
}

InsertQuestionList(playerid, qid)
{
	for(new id = 0; id != sizeof(g_arrDMVQuestions); id++) if(question_list[playerid][id] == -1)
	{
		question_list[playerid][id] = qid;
		return 1;
	}
	return 0;
}

IsQuestionInListed(playerid, qid)
{
	for(new id = 0; id != sizeof(g_arrDMVQuestions); id++) if(question_list[playerid][id] == qid) {
		return 1;
	}
	return 0;
}

ResetDMVVariable(playerid)
{
	question_id[playerid] = -1;
	question_answered[playerid] = 0;
	question_true[playerid] = 0;

	for(new i = 0; i < sizeof(g_arrDMVQuestions); i++) 
	{
		if(i < 3) question_alist[playerid][i] = 0;
		question_list[playerid][i] = -1;
	}
	return 1;
}

// ========================================== [Dialog responds list] =============================================

Dialog:DMVQuestions(playerid, response, listitem, inputtext[])
{
    if(response)
    {
		if(question_alist[playerid][listitem]) question_true[playerid]++;

    	if(++question_answered[playerid] >= MAX_ANSWER_DMV)
    	{
    		if(question_true[playerid] >= MAX_ANSWER_DMV) CallLocalFunction("OnDMVPassedTest", "dd", playerid, 1);
    		else CallLocalFunction("OnDMVPassedTest", "dd", playerid, 0);

    		ResetDMVVariable(playerid);
    		return 1;
    	}
    	ShowDMVQuestions(playerid);
    }
    else ResetDMVVariable(playerid), CallLocalFunction("OnDMVPassedTest", "dd", playerid, 0);
    return 1;
}

CMD:drivingtest(playerid, params[])
{
    if (IsPlayerConnected(playerid))
        return ErrorMsg(playerid, "Fitur ini sedang dalam perbaikan, tunggu informasi update berikutnya.");

    if(pData[playerid][pDrivingTest])
        return ErrorMsg(playerid, "Anda sedang melakukan test sekarang!");

    if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1584.3651,-1619.7992,13.3828))
        return ErrorMsg(playerid, "Kamu tidak berada di tempat pengujian sim.");

    if(pData[playerid][pDMVTime])
        return ErrorMsg(playerid, "kamu harus menunggu beberapa saat untuk melakukan pengujian sim kembali.");

    if(pData[playerid][pDrivingLicense])
        return ErrorMsg(playerid, "Kamu sudah memiliki sim!");
    
    if(GetPlayerMoney(playerid) < 75)
        return ErrorMsg(playerid, "Kamu harus memiliki 75$ untuk memulai pengujian SIM.");

    //if(pData[playerid][DMVAnswer] < 6)
    //    return ErrorMsg(playerid, "Kamu Gagal dalam menjawab soal, mohon mencoba lagi");

    //if(pData[playerid][DMVAnswer] > 6)
    //    SuccesMsg(playerid, "Kamu berhasil menjawab soal dengan baik, silahkan melanjutkan ke tahap tes mengemudi");

    // static
    //     sitid;

    // sitid = random(sizeof(g_arrSitSpawns));

    // SetPlayerPos(playerid, g_arrSitSpawns[sitid][0], g_arrSitSpawns[sitid][1], g_arrSitSpawns[sitid][2]);
    // SetPlayerFacingAngle(playerid, 234.7443);
    // ApplyAnimation(playerid, "ped", "SEAT_down", 4.1, 0, 0, 0, 1, 0);

    // SetCameraBehindPlayer(playerid);
    ClearChat(playerid);

    // InterpolateCameraPos(playerid, 1596.4635,-1606.5007,13.4241, 1584.4012,-1616.9139,13.3828, 10000);
    // InterpolateCameraLookAt(playerid, 1596.4635,-1606.5007,13.4241, 1584.4012,-1616.9139,13.3828, 10000);

    Dialog_Show(playerid, DrivingTest, DIALOG_STYLE_MSGBOX, "Ujian Materi - DMV", "Selamat datang, beberapa aturan yang harus di lakukan:\n\nI. Sebelum melanjutkan ke step selanjutnya, akan di adakan test teori sebelumnya.\nII. Tersedia 10 soal berbeda dan anda harus menjawab semuanya dengan benar.\nIII. Di harapkan berhati-hati untuk menjawabnya.\nIV. Jika sengaja keluar pada saat test, maka akan otomatis gagal dalam test.\nV. Saat gagal test anda harus menunggu 1 jam untuk melakukan test kembali.\n\nIkuti aturan di atas agar sukses dalam menjawab soal yang di berikan.", "Lanjut", "Menyerah");
    return 1;
}
hook OnPlayerDisconnectEx(playerid)
{
    ResetDMVVariable(playerid);
    return 1;
}