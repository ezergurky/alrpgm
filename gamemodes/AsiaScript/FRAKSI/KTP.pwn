#include <strlib.inc>

CMD:givektp(playerid, params[])
{
    if(pData[playerid][pFaction] != 2)
        return Error(playerid, "Kamu bukan anggota pemerintah.");

    new otherid;

    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/givektp [playerid/PartOfName]");

    ShowPlayerDialog(otherid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "ID-Card", sprintf("{FFFFFF}Nama: %s\nNegara: San Andreas\nTgl Lahir: %s\nJenis Kelamin: %s\nBerlaku hingga 30 hari!", pData[otherid][pName], pData[otherid][pAge], (pData[otherid][pGender] == 1 ? "Laki-Laki" : "Perempuan")), "Tutup", "");

    pData[otherid][pIDCard] = 1;
    pData[otherid][pIDCardTime] = gettime() + (24 * 3600 * 30);

    Info(playerid, "Anda telah berhasil memberikan KTP kepada %s", ReturnName(otherid));
    Info(otherid, "%s telah berhasil memberikan KTP kepada anda", ReturnName(playerid));

    ApplyAnimation(playerid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0);
    ApplyAnimation(otherid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0);    
    return 1;
}