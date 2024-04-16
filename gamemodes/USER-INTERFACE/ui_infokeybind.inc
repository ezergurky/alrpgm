//aufa scrip
#include "YSI-Coding\y_hooks"
new Text: Infokeyaufa[25];

CreateTDInfoKeyAufa(playerid)
{
    Infokeyaufa[0] = TextDrawCreate(10.000, 257.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[0], 22.000, 22.000);
    TextDrawAlignment(Infokeyaufa[0], 1);
    TextDrawColor(Infokeyaufa[0], -1953790977);
    TextDrawSetShadow(Infokeyaufa[0], 0);
    TextDrawSetOutline(Infokeyaufa[0], 0);
    TextDrawBackgroundColor(Infokeyaufa[0], 255);
    TextDrawFont(Infokeyaufa[0], 4);
    TextDrawSetProportional(Infokeyaufa[0], 1);

    Infokeyaufa[1] = TextDrawCreate(11.000, 240.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[1], 22.000, 22.000);
    TextDrawAlignment(Infokeyaufa[1], 1);
    TextDrawColor(Infokeyaufa[1], -1953790977);
    TextDrawSetShadow(Infokeyaufa[1], 0);
    TextDrawSetOutline(Infokeyaufa[1], 0);
    TextDrawBackgroundColor(Infokeyaufa[1], 255);
    TextDrawFont(Infokeyaufa[1], 4);
    TextDrawSetProportional(Infokeyaufa[1], 1);

    Infokeyaufa[2] = TextDrawCreate(16.000, 263.000, "ALT");
    TextDrawLetterSize(Infokeyaufa[2], 0.158, 0.999);
    TextDrawAlignment(Infokeyaufa[2], 1);
    TextDrawColor(Infokeyaufa[2], -1);
    TextDrawSetShadow(Infokeyaufa[2], 1);
    TextDrawSetOutline(Infokeyaufa[2], 1);
    TextDrawBackgroundColor(Infokeyaufa[2], 150);
    TextDrawFont(Infokeyaufa[2], 1);
    TextDrawSetProportional(Infokeyaufa[2], 1);

    Infokeyaufa[3] = TextDrawCreate(12.000, 258.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[3], 18.000, 20.000);
    TextDrawAlignment(Infokeyaufa[3], 1);
    TextDrawColor(Infokeyaufa[3], -12254977);
    TextDrawSetShadow(Infokeyaufa[3], 0);
    TextDrawSetOutline(Infokeyaufa[3], 0);
    TextDrawBackgroundColor(Infokeyaufa[3], 255);
    TextDrawFont(Infokeyaufa[3], 4);
    TextDrawSetProportional(Infokeyaufa[3], 1);

    Infokeyaufa[4] = TextDrawCreate(11.000, 223.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[4], 22.000, 22.000);
    TextDrawAlignment(Infokeyaufa[4], 1);
    TextDrawColor(Infokeyaufa[4], -1953790977);
    TextDrawSetShadow(Infokeyaufa[4], 0);
    TextDrawSetOutline(Infokeyaufa[4], 0);
    TextDrawBackgroundColor(Infokeyaufa[4], 255);
    TextDrawFont(Infokeyaufa[4], 4);
    TextDrawSetProportional(Infokeyaufa[4], 1);

    Infokeyaufa[5] = TextDrawCreate(13.000, 224.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[5], 18.000, 20.000);
    TextDrawAlignment(Infokeyaufa[5], 1);
    TextDrawColor(Infokeyaufa[5], -12254977);
    TextDrawSetShadow(Infokeyaufa[5], 0);
    TextDrawSetOutline(Infokeyaufa[5], 0);
    TextDrawBackgroundColor(Infokeyaufa[5], 255);
    TextDrawFont(Infokeyaufa[5], 4);
    TextDrawSetProportional(Infokeyaufa[5], 1);

    Infokeyaufa[6] = TextDrawCreate(20.000, 229.000, "H");
    TextDrawLetterSize(Infokeyaufa[6], 0.159, 0.999);
    TextDrawAlignment(Infokeyaufa[6], 1);
    TextDrawColor(Infokeyaufa[6], -1);
    TextDrawSetShadow(Infokeyaufa[6], 1);
    TextDrawSetOutline(Infokeyaufa[6], 1);
    TextDrawBackgroundColor(Infokeyaufa[6], 150);
    TextDrawFont(Infokeyaufa[6], 1);
    TextDrawSetProportional(Infokeyaufa[6], 1);

    Infokeyaufa[7] = TextDrawCreate(31.000, 229.000, "- Radial Menu");
    TextDrawLetterSize(Infokeyaufa[7], 0.189, 0.898);
    TextDrawAlignment(Infokeyaufa[7], 1);
    TextDrawColor(Infokeyaufa[7], -1);
    TextDrawSetShadow(Infokeyaufa[7], 1);
    TextDrawSetOutline(Infokeyaufa[7], 1);
    TextDrawBackgroundColor(Infokeyaufa[7], 150);
    TextDrawFont(Infokeyaufa[7], 1);
    TextDrawSetProportional(Infokeyaufa[7], 1);

    Infokeyaufa[8] = TextDrawCreate(13.000, 241.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[8], 18.000, 20.000);
    TextDrawAlignment(Infokeyaufa[8], 1);
    TextDrawColor(Infokeyaufa[8], -12254977);
    TextDrawSetShadow(Infokeyaufa[8], 0);
    TextDrawSetOutline(Infokeyaufa[8], 0);
    TextDrawBackgroundColor(Infokeyaufa[8], 255);
    TextDrawFont(Infokeyaufa[8], 4);
    TextDrawSetProportional(Infokeyaufa[8], 1);

    Infokeyaufa[9] = TextDrawCreate(31.000, 264.000, "- Action");
    TextDrawLetterSize(Infokeyaufa[9], 0.188, 0.898);
    TextDrawAlignment(Infokeyaufa[9], 1);
    TextDrawColor(Infokeyaufa[9], -1);
    TextDrawSetShadow(Infokeyaufa[9], 1);
    TextDrawSetOutline(Infokeyaufa[9], 1);
    TextDrawBackgroundColor(Infokeyaufa[9], 150);
    TextDrawFont(Infokeyaufa[9], 1);
    TextDrawSetProportional(Infokeyaufa[9], 1);

    Infokeyaufa[10] = TextDrawCreate(20.000, 246.000, "Y");
    TextDrawLetterSize(Infokeyaufa[10], 0.159, 0.999);
    TextDrawAlignment(Infokeyaufa[10], 1);
    TextDrawColor(Infokeyaufa[10], -1);
    TextDrawSetShadow(Infokeyaufa[10], 1);
    TextDrawSetOutline(Infokeyaufa[10], 1);
    TextDrawBackgroundColor(Infokeyaufa[10], 150);
    TextDrawFont(Infokeyaufa[10], 1);
    TextDrawSetProportional(Infokeyaufa[10], 1);

    Infokeyaufa[11] = TextDrawCreate(31.000, 246.000, "- Panel Kendaraan");
    TextDrawLetterSize(Infokeyaufa[11], 0.189, 0.898);
    TextDrawAlignment(Infokeyaufa[11], 1);
    TextDrawColor(Infokeyaufa[11], -1);
    TextDrawSetShadow(Infokeyaufa[11], 1);
    TextDrawSetOutline(Infokeyaufa[11], 1);
    TextDrawBackgroundColor(Infokeyaufa[11], 150);
    TextDrawFont(Infokeyaufa[11], 1);
    TextDrawSetProportional(Infokeyaufa[11], 1);

    Infokeyaufa[12] = TextDrawCreate(10.000, 276.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[12], 22.000, 22.000);
    TextDrawAlignment(Infokeyaufa[12], 1);
    TextDrawColor(Infokeyaufa[12], -1953790977);
    TextDrawSetShadow(Infokeyaufa[12], 0);
    TextDrawSetOutline(Infokeyaufa[12], 0);
    TextDrawBackgroundColor(Infokeyaufa[12], 255);
    TextDrawFont(Infokeyaufa[12], 4);
    TextDrawSetProportional(Infokeyaufa[12], 1);

    Infokeyaufa[13] = TextDrawCreate(12.000, 277.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[13], 18.000, 20.000);
    TextDrawAlignment(Infokeyaufa[13], 1);
    TextDrawColor(Infokeyaufa[13], -12254977);
    TextDrawSetShadow(Infokeyaufa[13], 0);
    TextDrawSetOutline(Infokeyaufa[13], 0);
    TextDrawBackgroundColor(Infokeyaufa[13], 255);
    TextDrawFont(Infokeyaufa[13], 4);
    TextDrawSetProportional(Infokeyaufa[13], 1);

    Infokeyaufa[14] = TextDrawCreate(19.000, 282.000, "B");
    TextDrawLetterSize(Infokeyaufa[14], 0.159, 0.999);
    TextDrawAlignment(Infokeyaufa[14], 1);
    TextDrawColor(Infokeyaufa[14], -1);
    TextDrawSetShadow(Infokeyaufa[14], 1);
    TextDrawSetOutline(Infokeyaufa[14], 1);
    TextDrawBackgroundColor(Infokeyaufa[14], 150);
    TextDrawFont(Infokeyaufa[14], 1);
    TextDrawSetProportional(Infokeyaufa[14], 1);

    Infokeyaufa[15] = TextDrawCreate(31.000, 281.000, "- Untuk Nyalain Voice");
    TextDrawLetterSize(Infokeyaufa[15], 0.188, 0.898);
    TextDrawAlignment(Infokeyaufa[15], 1);
    TextDrawColor(Infokeyaufa[15], -1);
    TextDrawSetShadow(Infokeyaufa[15], 1);
    TextDrawSetOutline(Infokeyaufa[15], 1);
    TextDrawBackgroundColor(Infokeyaufa[15], 150);
    TextDrawFont(Infokeyaufa[15], 1);
    TextDrawSetProportional(Infokeyaufa[15], 1);

    Infokeyaufa[16] = TextDrawCreate(10.000, 293.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[16], 22.000, 22.000);
    TextDrawAlignment(Infokeyaufa[16], 1);
    TextDrawColor(Infokeyaufa[16], -1953790977);
    TextDrawSetShadow(Infokeyaufa[16], 0);
    TextDrawSetOutline(Infokeyaufa[16], 0);
    TextDrawBackgroundColor(Infokeyaufa[16], 255);
    TextDrawFont(Infokeyaufa[16], 4);
    TextDrawSetProportional(Infokeyaufa[16], 1);

    Infokeyaufa[17] = TextDrawCreate(12.000, 294.000, "LD_BEAT:chit");
    TextDrawTextSize(Infokeyaufa[17], 18.000, 20.000);
    TextDrawAlignment(Infokeyaufa[17], 1);
    TextDrawColor(Infokeyaufa[17], -12254977);
    TextDrawSetShadow(Infokeyaufa[17], 0);
    TextDrawSetOutline(Infokeyaufa[17], 0);
    TextDrawBackgroundColor(Infokeyaufa[17], 255);
    TextDrawFont(Infokeyaufa[17], 4);
    TextDrawSetProportional(Infokeyaufa[17], 1);

    Infokeyaufa[18] = TextDrawCreate(19.000, 299.000, "Y");
    TextDrawLetterSize(Infokeyaufa[18], 0.159, 0.999);
    TextDrawAlignment(Infokeyaufa[18], 1);
    TextDrawColor(Infokeyaufa[18], -1);
    TextDrawSetShadow(Infokeyaufa[18], 1);
    TextDrawSetOutline(Infokeyaufa[18], 1);
    TextDrawBackgroundColor(Infokeyaufa[18], 150);
    TextDrawFont(Infokeyaufa[18], 1);
    TextDrawSetProportional(Infokeyaufa[18], 1);

    Infokeyaufa[19] = TextDrawCreate(31.000, 300.000, "- Untuk mengakses panel kendaraan");
    TextDrawLetterSize(Infokeyaufa[19], 0.188, 0.898);
    TextDrawAlignment(Infokeyaufa[19], 1);
    TextDrawColor(Infokeyaufa[19], -1);
    TextDrawSetShadow(Infokeyaufa[19], 1);
    TextDrawSetOutline(Infokeyaufa[19], 1);
    TextDrawBackgroundColor(Infokeyaufa[19], 150);
    TextDrawFont(Infokeyaufa[19], 1);
    TextDrawSetProportional(Infokeyaufa[19], 1);

    Infokeyaufa[20] = TextDrawCreate(36.000, 211.000, "Info Keybind Asialane");
    TextDrawLetterSize(Infokeyaufa[20], 0.188, 0.898);
    TextDrawAlignment(Infokeyaufa[20], 1);
    TextDrawColor(Infokeyaufa[20], -1);
    TextDrawSetShadow(Infokeyaufa[20], 1);
    TextDrawSetOutline(Infokeyaufa[20], 1);
    TextDrawBackgroundColor(Infokeyaufa[20], 150);
    TextDrawFont(Infokeyaufa[20], 1);
    TextDrawSetProportional(Infokeyaufa[20], 1);

    Infokeyaufa[21] = TextDrawCreate(13.000, 205.000, "/");
    TextDrawLetterSize(Infokeyaufa[21], 0.300, 1.500);
    TextDrawAlignment(Infokeyaufa[21], 1);
    TextDrawColor(Infokeyaufa[21], -1);
    TextDrawSetShadow(Infokeyaufa[21], 1);
    TextDrawSetOutline(Infokeyaufa[21], 1);
    TextDrawBackgroundColor(Infokeyaufa[21], -1);
    TextDrawFont(Infokeyaufa[21], 1);
    TextDrawSetProportional(Infokeyaufa[21], 1);

    Infokeyaufa[22] = TextDrawCreate(17.000, 205.000, "/");
    TextDrawLetterSize(Infokeyaufa[22], 0.300, 1.500);
    TextDrawAlignment(Infokeyaufa[22], 1);
    TextDrawColor(Infokeyaufa[22], -12254977);
    TextDrawSetShadow(Infokeyaufa[22], 1);
    TextDrawSetOutline(Infokeyaufa[22], 1);
    TextDrawBackgroundColor(Infokeyaufa[22], -12254977);
    TextDrawFont(Infokeyaufa[22], 1);
    TextDrawSetProportional(Infokeyaufa[22], 1);

    Infokeyaufa[23] = TextDrawCreate(26.000, 205.000, "/");
    TextDrawLetterSize(Infokeyaufa[23], -0.339, 1.500);
    TextDrawAlignment(Infokeyaufa[23], 1);
    TextDrawColor(Infokeyaufa[23], -12254977);
    TextDrawSetShadow(Infokeyaufa[23], 1);
    TextDrawSetOutline(Infokeyaufa[23], 1);
    TextDrawBackgroundColor(Infokeyaufa[23], -12254977);
    TextDrawFont(Infokeyaufa[23], 1);
    TextDrawSetProportional(Infokeyaufa[23], 1);

    Infokeyaufa[24] = TextDrawCreate(25.000, 209.000, "-");
    TextDrawLetterSize(Infokeyaufa[24], -0.280, 1.500);
    TextDrawAlignment(Infokeyaufa[24], 1);
    TextDrawColor(Infokeyaufa[24], -12254977);
    TextDrawSetShadow(Infokeyaufa[24], 1);
    TextDrawSetOutline(Infokeyaufa[24], 1);
    TextDrawBackgroundColor(Infokeyaufa[24], -12254977);
    TextDrawFont(Infokeyaufa[24], 1);
    TextDrawSetProportional(Infokeyaufa[24], 1);
}

hook OnPlayerConnect(playerid)
{
    TextDrawShowForPlayer(playerid, Infokeyaufa[0]);
	TextDrawShowForPlayer(playerid, Infokeyaufa[1]);
	TextDrawShowForPlayer(playerid, Infokeyaufa[2]);
	TextDrawShowForPlayer(playerid, Infokeyaufa[3]);
	TextDrawShowForPlayer(playerid, Infokeyaufa[4]);
	TextDrawShowForPlayer(playerid, Infokeyaufa[5]);
	TextDrawShowForPlayer(playerid, Infokeyaufa[6]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[7]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[8]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[9]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[10]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[11]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[12]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[13]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[14]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[15]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[16]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[17]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[18]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[19]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[20]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[21]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[22]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[23]);
    TextDrawShowForPlayer(playerid, Infokeyaufa[24]);
}