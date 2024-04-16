


// stock const Float:g_arrSitSpawns[][] = {462, 1584.5370,-1614.9401,12.9812};


// CMD:drivingtest(playerid, params[])
// {
//     if(pData[playerid][pDrivingTest])
//         return ErrorMsg(playerid, "Anda sedang melakukan test sekarang!");

//     if(!IsPlayerInRangeOfPoint(playerid, 3.0, 1584.3651,-1619.7992,13.3828))
//         return ErrorMsg(playerid, "Kamu tidak berada di tempat pengujian sim.");

//     if(pData[playerid][pDMVTime])
//         return ErrorMsg(playerid, "kamu harus menunggu beberapa saat untuk melakukan pengujian sim kembali.", (pData[playerid][pDMVTime]-gettime())/60);

//     if(pData[playerid][pDrivingLicense])
//         return ErrorMsg(playerid, "Kamu sudah memiliki sim!");
    
//     if(GetPlayerMoney(playerid) < 75)
//         return ErrorMsg(playerid, "Kamu harus memiliki 75$ untuk memulai pengujian SIM.");

//     if(pData[playerid][DMVAnswer] < 6)
//         return ErrorMsg(playerid, "Kamu Gagal dalam menjawab soal, mohon mencoba lagi");

//     if(pData[playerid][DMVanswer] > 6)
//         return infoMsg(playerid, "Kamu berhasil menjawab soal dengan baik, silahkan melanjutkan ke tahap tes mengemudi");

//     static
//         sitid;

//     sitid = random(sizeof(g_arrSitSpawns));

//     SetPlayerPos(playerid, g_arrSitSpawns[sitid][0], g_arrSitSpawns[sitid][1], g_arrSitSpawns[sitid][2]);
//     SetPlayerFacingAngle(playerid, 234.7443);
//     ApplyAnimation(playerid, "ped", "SEAT_down", 4.1, 0, 0, 0, 1, 0);

//     SetCameraBehindPlayer(playerid);
//     ClearChat(playerid, 20);

//     InterpolateCameraPos(playerid, 1596.4635,-1606.5007,13.4241, 1584.4012,-1616.9139,13.3828, 10000);
//     InterpolateCameraLookAt(playerid, 1596.4635,-1606.5007,13.4241, 1584.4012,-1616.9139,13.3828, 10000);

//     Dialog_Show(playerid, DrivingTest, DIALOG_STYLE_MSGBOX, "Ujian Materi - DMV", "Selamat datang, beberapa aturan yang harus di lakukan:\n\nI. Sebelum melanjutkan ke step selanjutnya, akan di adakan test teori sebelumnya.\nII. Tersedia 10 soal berbeda dan anda harus menjawab semuanya dengan benar.\nIII. Di harapkan berhati-hati untuk menjawabnya.\nIV. Jika sengaja keluar pada saat test, maka akan otomatis gagal dalam test.\nV. Saat gagal test anda harus menunggu 1 jam untuk melakukan test kembali.\n\nIkuti aturan di atas agar sukses dalam menjawab soal yang di berikan.", "Lanjut", "Menyerah");
//     return 1;
// }