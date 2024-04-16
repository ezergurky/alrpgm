#include <strlib.inc>

CMD:giveweaponlic(playerid, params[])
{
    if(pData[playerid][pFaction] != 1)
        return Error(playerid, "Kamu bukan anggota kepolisian.");

    new otherid;

    if(sscanf(params, "u", otherid))
        return SyntaxMsg(playerid, "/giveweaponlic [playerid/PartOfName]");

    pData[otherid][pWeaponLic] = 1;
    pData[otherid][pWeaponLicTime] = gettime() + (24 * 3600 * 30);

    Info(playerid, "Anda telah berhasil memberikan weaponlic kepada %s", ReturnName(otherid));
    Info(otherid, "%s telah berhasil memberikan weaponlic kepada anda", ReturnName(playerid));

    ApplyAnimation(playerid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0);
    ApplyAnimation(otherid, "DEALER", "shop_pay", 4.1, 0, 0, 0, 0, 0);    
    return 1;
}