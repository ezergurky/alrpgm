#include <strlib.inc>

CMD:givesim(playerid, params[])
{
    if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu bukan anggota kepolisian.");

    new otherid;

    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/givesim [playerid/PartOfName]");

    pData[otherid][pDriveLic] = 1;
    pData[otherid][pDriveLicTime] = gettime() + (24 * 3600 * 30);

    Info(playerid, "Anda telah berhasil memberikan sim kepada %s", ReturnName(otherid));
    Info(otherid, "%s telah berhasil memberikan sim kepada anda", ReturnName(playerid));

    ApplyAnimation(playerid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0);
    ApplyAnimation(otherid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0);    
    return 1;
}