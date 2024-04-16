
forward DCC_DM(str[]);
public DCC_DM(str[])
{
    new DCC_Channel:PM;
    PM = DCC_GetCreatedPrivateChannel();
    DCC_SendChannelMessage(PM, str);
    return 1;
}

//ngecek player yang online di dalam kota
DCMD:online(user, channel, params[])
{
    new DCC_Embed:msgEmbed, msgField[64];
    format(msgField, sizeof(msgField), " Player Online Di Kota Asia Lane: %d", Iter_Count(Player));
    msgEmbed = DCC_CreateEmbed("", msgField, "", "", 0xffa500, "Asia Lane Roleplay | New 2024", "", "", "");
    DCC_SendChannelEmbedMessage(channel, msgEmbed);
    return 1;
}

DCMD:ann(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1202386936401100871"))
        return 1;

    if(isnull(params)) return DCC_SendChannelMessage(channel, "```!ann [text]```");

    new str[512];
    format(str, sizeof(str), "~w~%s", params);
    GameTextForAll(str, 7000, 3);

    new msgAnn[256];
    format(msgAnn, sizeof(msgAnn), "`[ASIA LANE BOT]: '%s' Berhasil ditampilkan`", params);
    DCC_SendChannelMessage(channel, msgAnn);
    return 1;
}



//cek admin on di kota
DCMD:admins(user, channel, params[])
{
    new count = 0, line3[1200];
    foreach(new i:Player)
    {
        if(pData[i][pAdmin] > 0 || pData[i][pHelper] > 0)
        {
            format(line3, sizeof(line3), "%s\n%s(%s)\n", line3, pData[i][pName], pData[i][pAdminname], GetStaffRank(i));
            count++;
        }
    }
    if(count > 0)
    {
        new DCC_Embed:msgEmbed, msgField[256];
        format(msgField, sizeof(msgField), "```%s```", line3);
        msgEmbed = DCC_CreateEmbed("", "", "", "", 0xffa500, "Admin online list", "", "", "");
        DCC_AddEmbedField(msgEmbed, "Admin Online di Kota Asia Lane", msgField);
        DCC_SendChannelEmbedMessage(channel, msgEmbed);
    }
    else return DCC_SendChannelMessage(channel, "Tidak ada admin di Kota Asia Lane ");
    return 1;
}

forward DCC_DM_EMBED(str[], pin, id[]);
public DCC_DM_EMBED(str[], pin, id[])
{
    new DCC_Channel:PM, query[200];
    PM = DCC_GetCreatedPrivateChannel();

    new DCC_Embed:embed = DCC_CreateEmbed(.title="Asia Lane Roleplay", .image_url="https://cdn.discordapp.com/attachments/1203274981803425813/1204967227363696680/happy_roleplay.png?ex=65d6a82e&is=65c4332e&hm=cbbbfca47ebdbb1b77c3e98494a4820b0e5f5245eec4a69d84e6be65827642df&");
    new str1[100], str2[100];

    format(str1, sizeof str1, "```\nHalo!\nUCP kamu berhasil terverifikasi,\nGunakan PIN dibawah ini untuk login ke Game```");
    DCC_SetEmbedDescription(embed, str1);
    format(str1, sizeof str1, "UCP");
    format(str2, sizeof str2, "\n```%s```", str);
    DCC_AddEmbedField(embed, str1, str2, bool:1);
    format(str1, sizeof str1, "PIN");
    format(str2, sizeof str2, "\n```%d```", pin);
    DCC_AddEmbedField(embed, str1, str2, bool:1);

    DCC_SendChannelEmbedMessage(PM, embed);

    mysql_format(g_SQL, query, sizeof query, "INSERT INTO `playerucp` (`ucp`, `verifycode`, `DiscordID`) VALUES ('%e', '%d', '%e')", str, pin, id);
    mysql_tquery(g_SQL, query);
    return 1;
}

forward CheckDiscordUCP(DiscordID[], Nama_UCP[]);
public CheckDiscordUCP(DiscordID[], Nama_UCP[])
{
    new rows = cache_num_rows();
    new DCC_Role: WARGA, DCC_Guild: guild, DCC_User: user, dc[100];
    new verifycode = RandomEx(1111, 9999);
    if(rows > 0)
    {
        return SendDiscordMessage(7, "```\n[INFO]: Nama UCP account tersebut sudah terdaftar```");
    }
    else 
    {
        new ns[32];
        guild = DCC_FindGuildById("1202223013924184135");
        WARGA = DCC_FindRoleById("1202223013941235802");
        user = DCC_FindUserById(DiscordID);
        format(ns, sizeof(ns), "Warga | %s ", Nama_UCP);
        DCC_SetGuildMemberNickname(guild, user, ns);
        DCC_AddGuildMemberRole(guild, user, WARGA);

        format(dc, sizeof(dc),  "```\n[UCP]: %s Telah Terverifikasi.```", Nama_UCP);
        SendDiscordMessage(7, dc);
        DCC_CreatePrivateChannel(user, "DCC_DM_EMBED", "sds", Nama_UCP, verifycode, DiscordID);
    }
    return 1;
}

forward CheckDiscordID(DiscordID[], Nama_UCP[]);
public CheckDiscordID(DiscordID[], Nama_UCP[])
{
    new rows = cache_num_rows(), ucp[20], dc[100];
    if(rows > 0)
    {
        cache_get_value_name(0, "ucp", ucp);

        format(dc, sizeof(dc),  "```\n[WARNING]: Kamu sudah mendaftar UCP sebelumnya dengan nama %s```", ucp);
        return SendDiscordMessage(7, dc);
    }
    else 
    {
        new characterQuery[178];
        mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `ucp` = '%s'", Nama_UCP);
        mysql_tquery(g_SQL, characterQuery, "CheckDiscordUCP", "ss", DiscordID, Nama_UCP);
    }
    return 1;
}

DCMD:ucp(user, channel, params[])
{
    new id[21];
    if(channel != DCC_FindChannelById("1211364409675485274"))
        return 1;
    if(isnull(params)) 
        return DCC_SendChannelMessage(channel, "```\n[USAGE]: !ucp Nama Ucp```");
    if(!IsValidNameUCP(params))
        return DCC_SendChannelMessage(channel, "```\nGunakan nama UCP bukan nama IC!```");    
    DCC_GetUserId(user, id, sizeof id);
    new uname[33];
    DCC_GetUserName(user, uname);

    new zQuery[256];
    mysql_format(g_SQL, zQuery, sizeof(zQuery), "SELECT * FROM `playerucp` WHERE `discordID` = '%e' LIMIT 1", id);
    new Cache:ex = mysql_query(g_SQL, zQuery, true);
    new count = cache_num_rows();
    if(count > 0)
    {
        new str[256];
        format(str, sizeof(str), "%s, Anda sudah pernah mendaftar dan tidak bisa lagi melakukan registrasi UCP", uname);
        DCC_SendChannelMessage(channel, str);
    }
    else
    {
        new characterQuery[178];
        mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `DiscordID` = '%s'", id);
        mysql_tquery(g_SQL, characterQuery, "CheckDiscordID", "ss", id, params);
        DCC_SendChannelMessage(channel, "```Ucp anda berhasil diverifikasi, silahkan cek message dari Asia Lane Bot```");
    }
    cache_delete(ex);
    return 1;
}



IsValidNameUCP(const name[])
{
    new len = strlen(name);

    for(new ch = 0; ch != len; ch++)
    {
        switch(name[ch])
        {
            case 'A' .. 'Z', 'a' .. 'z', '0' .. '9': continue;
            default: return false;
        }
    }
    return true;
}



// DCMD:ip(user, channel, params[])
// {
//     new DCC_Embed:msgEmbed, msgField[256];
//     format(msgField, sizeof(msgField), "ALAMAT IP ```43.228.213.116:7777```");
//     msgEmbed = DCC_CreateEmbed("", msgField, "", "", 0xffa500, "Asia Lane Roleplay", "", "", "");
//     DCC_SendChannelEmbedMessage(channel, msgEmbed);
//     return 1;
// }




DCMD:id(use, channel, params[])
{
    new otherid;
    new str[356];
    if(sscanf(params, "u", otherid))
    {
        DCC_SendChannelMessage(channel, "USAGE: !id [ID/Name]");
        return 1;
    }
    format(str, sizeof(str), "%sName: %s(ID: %d) | UCP Name: %s | Level: %d\n", str, pData[otherid][pName], otherid, pData[otherid][pUCP], pData[otherid][pLevel]);
    DCC_SendChannelMessage(channel, str);
    return 1;
}

DCMD:reffucp(user, channel, params[])
{
    new id[21];
    if(channel != DCC_FindChannelById("1211364409675485274"))
        return 1;
    if(isnull(params))
        return DCC_SendChannelMessage(channel, "```\n[USAGE]: !reffucp ucp name```");
    if(!IsValidNameUCP(params))
        return DCC_SendChannelMessage(channel, "```\nGunakan nama UCP bukan nama IC!```");
//  DCC_SendChannelMessage(channel, "**Accept Silahkan Cek PM Bot Discord HamZyy!**);

    DCC_GetUserId(user, id, sizeof id);
    new uname[33];
    DCC_GetUserName(user, uname);

    DCC_SendChannelMessage(channel, "Perintah berhasil disubmit, mohon tunggu hasil pemeriksaan dari kami!");
    new zQuery[256];
    mysql_format(g_SQL, zQuery, sizeof(zQuery), "SELECT * FROM `playerucp` WHERE `discordID` = '%e' LIMIT 1", id);
    new Cache:ex = mysql_query(g_SQL, zQuery, true);
    new count = cache_num_rows();
    if(count > 0)
    {
        new str[256];
        format(str, sizeof(str), "```:x: Hai %s, anda sudah pernah mendaftar dan tidak bisa lagi mengambil Karcis.Silahkan ke channel <#1095732559897444394> untuk refund role dan di cek oleh staff!```", uname);
        DCC_SendChannelMessage(channel, str);
    }
    else
    {
        new characterQuery[178];
        mysql_format(g_SQL, characterQuery, sizeof(characterQuery), "SELECT * FROM `playerucp` WHERE `DiscordID` = '%s'", id);
        mysql_tquery(g_SQL, characterQuery, "CheckDiscordID", "ss", id, params);
        DCC_SendChannelMessage(channel, "```Ucp anda berhasil diverifikasi,silahkan cek pm dari Asia Lane Bot```");
    }
    cache_delete(ex);
    return 1;
}

DCMD:ojail(user, channel, params[])
{
    if(channel != DCC_FindChannelById("1202386936401100871"))
        return 1;
    new player[24], datez, tmp[50], PlayerName[MAX_PLAYER_NAME];
    if(sscanf(params, "s[24]ds[50]", player, datez, tmp))
        return DCC_SendChannelMessage(channel, "`USAGE: !ojail <name> <time in minutes)> <reason>`");

    if(strlen(tmp) > 50) return DCC_SendChannelMessage(channel, "`[Asia Lane BOT]: Reason must be shorter than 50 characters.`");
    if(datez < 1 || datez > 60) return DCC_SendChannelMessage(channel, "`[Asia Lane BOT]: Jail time must remain between 1 and 60 minutes`");

    foreach(new ii : Player)
    {
        GetPlayerName(ii, PlayerName, MAX_PLAYER_NAME);

        if(strfind(PlayerName, player, true) != -1)
        {
            DCC_SendChannelMessage(channel, "`[Asia Lane BOT]: Player tersebut online, lu gabisa gunain ini goblok.`");
            return 1;
        }
    }
    new query[512];
    mysql_format(g_SQL, query, sizeof(query), "SELECT reg_id FROM players WHERE username='%e'", player);
    mysql_tquery(g_SQL, query, "OJailPlayerDiscord", "ssi", player, tmp, datez);
    return 1;
}

function OJailPlayerDiscord(adminid, NameToJail[], jailReason[], jailTime, channel)
{
    if(cache_num_rows() < 1)
    {
        return Error(adminid, "Account {ffff00}'%s' "WHITE_E"does not exist.", NameToJail);
    }
    else
    {
        new RegID, JailMinutes = jailTime * 60;
        cache_get_value_index_int(0, 0, RegID);
        SendClientMessageToAllEx(COLOR_RED, "Server: {ffff00}Admin %s telah menjail(offline) player %s selama %d menit. [Reason: %s]", pData[adminid][pAdminname], NameToJail, jailTime, jailReason);
        new str[150];
        format(str,sizeof(str),"Admin: %s memberi %s jail(offline) selama %d menit. Alasan: %s!", GetRPName(adminid), NameToJail, jailTime, jailReason);
        LogServer("Admin", str);
        new query[512];
        mysql_format(g_SQL, query, sizeof(query), "UPDATE players SET jail=%d WHERE reg_id=%d", JailMinutes, RegID);
        mysql_tquery(g_SQL, query);
    }
    return 1;
}
