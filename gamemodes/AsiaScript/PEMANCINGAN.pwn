#include <a_samp>
#include <strlib>

CMD:beliumpan(playerid, params[])
{
    if (pData[playerid][pUmpanaufa] > 30) return Error(playerid, "Anda tidak bisa membawa lebih dari 50 umpan");

    new total; 
    new str[128];
    new pay;
    GivePlayerMoneyEx(playerid, 300);
    pData[playerid][pUmpanaufa] += 30;
    format(str, sizeof(str), "ADD_%dx", pay);
    ShowItemBox(playerid, "Umpan", str, 1485, total);
    Inventory_Update(playerid);
    InfoMsg(playerid, "Anda berhasil membeli 50 umpan");
    return true;
}

CMD:belipancingan(playerid, params[])
{
    if (pData[playerid][pPancinganaufa] > 1) return Error(playerid, "Anda sudah memiliki pancingan");

    new total; 
    new str[128];
    new pay;
    GivePlayerMoney(playerid, 200);
    pData[playerid][pPancinganaufa] += 1;
    format(str, sizeof(str), "ADD_%dx", pay);
    ShowItemBox(playerid, "Pancingan", str, 18632, total);
    Inventory_Update(playerid);
    InfoMsg(playerid, "Anda berhasil membeli pancingan seharga $200");
    return true;
}
