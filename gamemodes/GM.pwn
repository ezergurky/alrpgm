/*
	Copyright � 2024 ASIA LANE Gamemode RP v0.0.1.

			     * ASIA LANE ROLEPLAY SAMP *
			  BASED OF GAMEMODE: INDOLAND V 8.8


	[=================== CREDITS ===================]
	[ + Gyu (Owner & Support Developer)             ]
	[ + Aperta Semb (Developer)                     ]
	[===============================================]

		� GAMEMODE v0.0.1. �


*Changelogs Mode v0.0.1.
=============================
+ -
*/


#include <a_samp>
#include <compat>
#include <strlib>
#undef MAX_PLAYERS
#define MAX_PLAYERS 500
#include <crashdetect>
#include <gvar>
#include <a_mysql>
#include <a_actor>
#include <a_zones>
#include <progress2>
#include <Pawn.CMD>
#include <mSelection.inc>
#include <FiTimestamp>
#define ENABLE_3D_TRYG_YSI_SUPPORT
#include <3DTryg>
#include <streamer>
#include <EVF2>
#include <YSI\y_timers>
#include <YSI\y_ini>
#include <sscanf2>
#include <yom_buttons>
#include <geoiplite>
#include <garageblock>
#include <tp>
#include <compat>
#define DCMD_PREFIX '!'
#include <discord-connector>
#include <discord-cmd>
#include <fixobject>
#include <timerfix.inc>
#include <PreviewModelDialog>
#include <cprogress>

#define MAX_AUCTIONS    10
//-----[ Modular ]-----
#include "CORE\Connect-Database.pwn"

#include "DATA\VPARA.pwn"
//voice system
new TogglePhone[MAX_PLAYERS];
new ToggleSid[MAX_PLAYERS];
new ToggleCall[MAX_PLAYERS];
//BAJU SYSTEM
new delaykargo;
new bool:delaydealer;
new cskin[MAX_PLAYERS];
new rusa;
//id atas pala
new Text3D:playerID[MAX_PLAYERS];

//spedo bulet
new use_speedo[MAX_PLAYERS];

new speedo_timer;
new Text:speedoball;
new PlayerText:speedo[MAX_PLAYERS] = { PlayerText:0xFFFF,... };

static const PedMan[] =
{
    1, 2, 3, 4, 5, 6, 7, 8, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 32, 33,
	34, 35, 36, 37, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 57, 58, 59, 60, 61, 62, 66, 68, 72, 73,
	78, 79, 80, 81, 82, 83, 84, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109,
	110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 132, 133,
	134, 135, 136, 137, 142, 143, 144, 146, 153, 154, 156, 158, 159, 160, 161, 162, 167, 168, 170,
	171, 173, 174, 175, 176, 177, 179, 180, 181, 182, 183, 184, 185, 186, 188, 189, 190, 200, 202, 203,
	204, 206, 208, 209, 210, 212, 213, 217, 220, 221, 222, 223, 228, 229, 230, 234, 235, 236, 239, 240, 241,
	242, 247, 248, 249, 250, 253, 254, 255, 258, 259, 260, 261, 262, 268, 272, 273, 289, 290, 291, 292, 293,
	294, 296, 297, 299
};
static const Kendaraan[] =
{
	481, 509, 510, 462, 586, 581, 461, 521, 463, 468, 400, 412, 419, 426, 436, 466, 467, 474, 475, 480, 603, 421,
	602, 492, 545, 489, 405, 445, 579, 507, 483, 534, 535, 536, 558, 560, 565, 567, 575, 576
};
static const PedMale[] =
{
    9, 10, 11, 12, 13, 31, 38, 39, 40, 41, 53, 54, 55, 56, 63, 64, 65, 69, 75, 76, 77, 85, 88, 89, 90, 91, 92,
	93, 129, 130, 131, 138, 140, 141, 145, 148, 150, 151, 152, 157, 169, 178, 190, 191, 192, 193, 194, 195, 196,
	197, 198, 199, 201, 205, 207, 211, 214, 215, 216, 219, 224, 225, 226, 231, 232, 233, 237, 238, 243, 244, 245,
	246, 251, 256, 257, 263, 298
};
//=================================================
new bool:explosive[MAX_PLAYERS char] = {false,...};
//new Text:speedo_dot[21];
//new Text:speedo_number[12];
new PakaiSenjata[MAX_PLAYERS];
#include <sampvoice>
#define MAX_RADIOS 999
// voice
new SV_LSTREAM:lstream[MAX_PLAYERS] = { SV_NULL, ... };
new SV_GSTREAM:gstream = SV_NULL;
//new SV_GSTREAM:StreamTelpon[MAX_PLAYERS] = { SV_NULL, ... };
//new SV_GSTREAM:StreamFreq[MAX_RADIOS] = SV_NULL;
//new IDStream[MAX_PLAYERS];
//=========[ JAM FIVEM ]==========
new JamFivEm;
new DetikFivEm;
new JamCall[MAX_PLAYERS];
new DetikCall[MAX_PLAYERS];
new MenitCall[MAX_PLAYERS];

new rentalbike;
new rentalterminal;
new asuransi;
new sellpv;
new garasisamd;
new garasisags;
new garasigojek;
new kanabis1;
new kanabis2;
new kanabis3;
//new kanabis4;
//new kanabis5;
//new kanabis6;
//new kanabis7;
new rentalpelabuhan;
new rentalkapal;
new kendaraansapd;
new kendaraanudarasapd;
new garasipedagang;
new garasisanews;
//new gudangkota;
new menumasak;
new menuminum;
new menupedagang;
new sppelabuhan;
//penjahit 
new lockerpenjahit;
new ambilwoolaufa;
new jualbajuaufa;
//buat kain
new buatkainaufa0;
new buatkainaufa1;
new buatkainaufa2;
new buatkainaufa3;
new buatkainaufa4;
new buatkainaufa5;
new buatkainaufa6;
new buatkainaufa7;
//buat baju
new buatbaju1;
new buatbaju2;
new buatbaju3;
new buatbaju4;
new buatbaju5;
new buatbaju6;
new buatbaju7;
new buatbaju8;
new buatbaju9;
new buatbaju10;
new buatbaju11;
new buatbaju12;
new buatbaju13;
new buatbaju14;
new buatbaju15;
new buatbaju16;
new buatbaju17;
new buatbaju18;
new buatbaju19;
new buatbaju20;
new buatbaju21;
new buatbaju22;
new buatbaju23;
new buatbaju24;

//aufa rob
new createlockpick;
new robbank;
//=======[ ATM FIVEM]=======
new atm1;
// new atm2;
// new atm3;
// new atm4;
new atm5;
new atm6;
new atm7;
//========[ MANCING CP ]========
new mancing1;
new mancing2;
new mancing3;
new mancing4;
new mancing5;
new mancing6;
new mancing7;
new mancing8;
new mancing9;
new mancing10;
new mancing11;
new mancing12;
new mancing13;
new mancing14;
new mancing15;
new mancing16;
new mancing17;
new mancing18;
new mancing19;
new mancing20;
new mancing21;
new mancing22;
new mancing23;
new mancing24;

//mancingaufa
new umpanaufa;
new pancingaufa;
//======[ JOB BY Aufa ]========
new Sopirbus;
new tukangayam;
new petani;
new tukangtebang;
new penambangminyak;
new penjahit;
new pemerah;
new penambang;
new Recycler;
//=======[ JOB PEMERAH Aufa ]=========
new PemerahCP;
new Trucker;
new Disnaker;
new Healing;
//jualbotol
new JualIkan;
new JualNambang;
new JualPetani;
new JualKayu;
//pernikahan
new pernikahan;
//creategun
new Creategunn;
//================================
new
    JOB[MAX_PLAYERS], inJOB[MAX_PLAYERS], Car_Job[MAX_PLAYERS], timer_Car[MAX_PLAYERS], stresstimer[MAX_PLAYERS], KeluarKerja[MAX_PLAYERS],
    Seconds_timer[MAX_PLAYERS], Hunter_Deer[MAX_PLAYERS], Meeters_BTWDeer[MAX_PLAYERS], TimerKeluar[MAX_PLAYERS],
    Meeters[MAX_PLAYERS], Deer[MAX_PLAYERS], Deep_Deer[MAX_PLAYERS], Meeter_Kill[MAX_PLAYERS],
    Shoot_Deer[MAX_PLAYERS];

//han
// new STATUS_BOT2;

static warnings[MAX_PLAYERS char] = {0,...};
new Text3D:TagKeluar[MAX_PLAYERS];
//new DCC_Channel:g_Discord_CHENH4X;

new SV_GSTREAM:OnPhone[MAX_PLAYERS];


//-----[ Quiz ]-----
new quiz,
	answers[256],
	answermade,
	qprs;

//-----[ Twitter ]-----
new tweet[60];

//-----[ New HamZyy ]----
//rob
//new DCC_Channel:chLogsRobbank;
//New GMX
new CurGMX;
//Enum GMX
forward DoGMX();
//


//-----[ Rob ]-----
new RobMember = 0;

//speedo
new Float:VEHICLE_TOP_SPEEDS[] =
{
	157.0, 147.0, 186.0, 110.0, 133.0, 164.0, 110.0, 148.0, 100.0, 158.0, 129.0, 221.0, 168.0, 110.0, 105.0, 192.0, 154.0, 270.0, 115.0, 149.0,
	145.0, 154.0, 140.0, 99.0,  135.0, 270.0, 173.0, 165.0, 157.0, 201.0, 190.0, 130.0, 94.0,  110.0, 167.0, 0.0,   149.0, 158.0, 142.0, 168.0,
	136.0, 145.0, 139.0, 126.0, 110.0, 164.0, 270.0, 270.0, 111.0, 0.0,   0.0,   193.0, 270.0, 60.0,  135.0, 157.0, 106.0, 95.0,  157.0, 136.0,
	270.0, 160.0, 111.0, 142.0, 145.0, 145.0, 147.0, 140.0, 144.0, 270.0, 157.0, 110.0, 190.0, 190.0, 149.0, 173.0, 270.0, 186.0, 117.0, 140.0,
	184.0, 73.0,  156.0, 122.0, 190.0, 99.0,  64.0,  270.0, 270.0, 139.0, 157.0, 149.0, 140.0, 270.0, 214.0, 176.0, 162.0, 270.0, 108.0, 123.0,
	140.0, 145.0, 216.0, 216.0, 173.0, 140.0, 179.0, 166.0, 108.0, 79.0,  101.0, 270.0,	270.0, 270.0, 120.0, 142.0, 157.0, 157.0, 164.0, 270.0,
	270.0, 160.0, 176.0, 151.0, 130.0, 160.0, 158.0, 149.0, 176.0, 149.0, 60.0,  70.0,  110.0, 167.0, 168.0, 158.0, 173.0, 0.0,   0.0,   270.0,
	149.0, 203.0, 164.0, 151.0, 150.0, 147.0, 149.0, 142.0, 270.0, 153.0, 145.0, 157.0, 121.0, 270.0, 144.0, 158.0, 113.0, 113.0, 156.0, 178.0,
	169.0, 154.0, 178.0, 270.0, 145.0, 165.0, 160.0, 173.0, 146.0, 0.0,   0.0,   93.0,  60.0,  110.0, 60.0,  158.0, 158.0, 270.0, 130.0, 158.0,
	153.0, 151.0, 136.0, 85.0,  0.0,   153.0, 142.0, 165.0, 108.0, 162.0, 0.0,   0.0,   270.0, 270.0, 130.0, 190.0, 175.0, 175.0, 175.0, 158.0,
	151.0, 110.0, 169.0, 171.0, 148.0, 152.0, 0.0,   0.0,   0.0,   108.0, 0.0,   0.0
};

//-----[ Event ]-----
new EventCreated = 0, 
	EventStarted = 0, 
	EventPrize = 500;
new Float: RedX, 
	Float: RedY, 
	Float: RedZ, 
	EventInt, 
	EventWorld;
new Float: BlueX, 
	Float: BlueY, 
	Float: BlueZ;
new EventHP = 100,
	EventArmour = 0,
	EventLocked = 0;
new EventWeapon1, 
	EventWeapon2, 
	EventWeapon3, 
	EventWeapon4, 
	EventWeapon5;
new BlueTeam = 0, 
	RedTeam = 0;
new MaxRedTeam = 5, 
	MaxBlueTeam = 5;
new IsAtEvent[MAX_PLAYERS];


new AntiBHOP[MAX_PLAYERS];

//voice call
new CallTimer[MAX_PLAYERS];

new InRob[MAX_PLAYERS];
//-----[ Discord Connector ]-----
new pemainic;
//new upt = 0;
new emsdikota;
new polisidikota;
new bengkeldikota;
new gojekdikota;
new reporterdikota;
new pedagangdikota;

//new upt = 0;

//-----[ Selfie System ]-----
new takingselfie[MAX_PLAYERS];
new Float:Degree[MAX_PLAYERS];
const Float: Radius = 1.4; //do not edit this
const Float: Speed  = 1.25; //do not edit this
const Float: Height = 1.0; // do not edit this
new Float:lX[MAX_PLAYERS];
new Float:lY[MAX_PLAYERS];
new Float:lZ[MAX_PLAYERS];
//=========[ TIMER ]============//
new olahh[MAX_PLAYERS];
new ayamjob[MAX_PLAYERS];
//=========[ DISCORD ]============//
// new DCC_Channel:g_Discord_Serverstatus;
new DCC_Channel:g_Discord_Serverstatus, DCC_Embed:logsstatus;

enum
{
	//new job aufa
	DIALOG_MULAIBOX,
	DIALOG_GPS_REYCYCLER,
	//
	
	//sks
	DIALOG_SKS,
	//robbank
	DIALOG_ROBBANKRUQ,
	//aufa
	DIALOG_PHONE_ADDCONTACT,
	DIALOG_PHONE_CONTACT,
	DIALOG_PHONE_NEWCONTACT,
	DIALOG_PHONE_INFOCONTACT,
	DIALOG_PHONE_SENDSMS,
	DIALOG_PHONE_TEXTSMS,
	DIALOG_PHONE_DIALUMBER,
	DIALOG_TOGGLEPHONE,        
	DIALOG_GOJEK,
	DIALOG_GOCAR,
	DIALOG_GOFOOD,
	DIALOG_BABI,
	//--[ STORAGE VEHICLE ]---
	DIALOG_VSTORAGE,
	DIALOG_VSDEPOSIT,
	DIALOG_VSTAKE,
	DIALOG_VSOPTIONS,
	DIALOG_VSTDURGS,
	DIALOG_VSTSEEDS,
	DIALOG_VSTFOODS,
	DIALOG_VSTITEMS,
	DIALOG_BAGASI,
	//workshop
	GPS_DIALOG_ATM,
	GPS_NEAREST_WORKSHOP,
	WORKSHOP_SERVICE,
	//--[ ROAD BLOCK ]--
	DIALOG_BARRICADE,
	//aufa pajak
	DIALOG_PAYTAX,
	DIALOG_PAYTAX_BISNIS,
	DIALOG_PAYTAX_HOUSE,
	DIALOG_PAYTAX_DEALER,
	//JOBBALKOTi
	DIALOG_GPS_PETANI,
	DIALOG_DISNAKER,
	DIALOG_GARASIPD,
	DIALOG_GUDANGBARU,
	DIALOG_GARASIMD,
	DIALOG_GARASIPEDAGANG,
	DIALOG_GARASIGOJEK,
	DIALOG_GARASISAGS,
	DIALOG_GARASIPDUDARA,
	DIALOG_GARASISANEWS,
	DIALOG_INPUTFUEL,
	DIALOG_WITHDEPO,
	DIALOG_KARGO,
	DIALOG_LOCKERAYAM,
	DIALOG_WALLPAPER,
	DIALOG_NANAMBIBIT,
	DIALOG_ASURANSI,
	DIALOG_BELIBIBIT,
	DIALOG_PROSESTANI,
	DIALOG_ONDUTY,
	DIALOG_LOCKERPEMERAH,
	DIALOG_DOKUMEN,
	DIALOG_LOCKERPENJAHIT,
	DIALOG_LOCKERTUKANGKAYU,
	DIALOG_GOPAY,
	DIALOG_VOICE,
	DIALOG_LOCKERMINYAK,
	DIALOG_GOTOPUP,
	DIALOG_GPS_BUS,
	DIALOG_GPSPENJAHIT,
	DIALOG_VRM,
	DIALOG_LOCKERPENAMBANG,
	DIALOG_TINGGI,
	DIALOG_BERAT,
	DIALOG_AYAMFILL,
	DIALOG_REPORTS,
	//dialog radial menu dewata
	DIALOG_RADIAL,
	DIALOG_WT,
	DIALOG_HOLIMARKET,

	DIALOG_JUALIKAN,
	DIALOG_TAMBANG,
	DIALOG_JUALPETANI,
	DIALOG_JUALKAYU,
	DIALOG_JUALBOTOL,

	DIALOG_RADIO,
	DIALOG_GPSSPAREPART,
	DIALOG_LOCKERGOJEK,
	//modshop
	DIALOG_GIVE,
	DIALOG_AMOUNT,
	DIALOG_MODSHOP,
	DIALOG_MAKE_CHAR,
	DIALOG_CHARLIST,
	DIALOG_VERIFYCODE,
	DIALOG_UNUSED,
    DIALOG_LOGIN,
    DIALOG_REGISTER,
    DIALOG_AGE,
	DIALOG_GENDER,
	DIALOG_EMAIL,
	DIALOG_PASSWORD,
	DIALOG_STATS,
	DIALOG_SETTINGS,
	DIALOG_HBEMODE,
	DIALOG_CHANGEAGE,
	DIALOG_GOLDSHOP,
	// MODSHOP
	DIALOG_MODMENU,
	DIALOG_MODTOY,
	DIALOG_MODTBUY,
	DIALOG_MODTEDIT,
	DIALOG_MODTPOSX,
	DIALOG_MODTPOSY,
	DIALOG_MODTPOSZ,
	DIALOG_MODTPOSRX,
	DIALOG_MODTPOSRY,
	DIALOG_MODTPOSRZ,
	DIALOG_MODTSELECTPOS,
	DIALOG_MODTSETVALUE,
	DIALOG_MODTSETCOLOUR,
	DIALOG_MODTSETPOS,
	DIALOG_MODTACCEPT,
	DIALOG_GOLDNAME,
	DIALOG_SELL_BISNISS,
	DIALOG_SELL_BISNIS,
	DIALOG_MY_BISNIS,
	DIALOG_MENU,
	DIALOG_MENUMASAK,
	DIALOG_LOCKERPEDAGANG,
	DIALOG_LOCKFAMS,
	DIALOG_GPS_KARGO,
	DIALOG_GPS_TUKANGKAYU,
	DIALOG_MENUMINUM,
	DIALOG_GUDANGPEDAGANG,
	DIALOG_SIMPAN,
	DIALOG_SIMPANUANG,
	DIALOG_TAKEMONEY,
	DIALOG_TAKE,
	DIALOG_WEAPONPEDAGANG,
	DIALOG_MMENU,
	BISNIS_MENU,
	BISNIS_INFO,
	BISNIS_NAME,
	BISNIS_VAULT,
	BISNIS_WITHDRAW,
	BISNIS_DEPOSIT,
	BISNIS_BUYPROD,
	BISNIS_EDITPROD,
	BISNIS_PRICESET,
	DIALOG_SELL_HOUSES,
	DIALOG_SELL_HOUSE,
	DIALOG_MY_HOUSES,
	DIALOG_MY_SG,
	DIALOG_SG_MENU,
	DIALOG_SETNAME,
	DIALOG_MAT,
	DIALOG_COM,
	DIALOG_UANG,
	DIALOG_COM2,
	DIALOG_MAT2,
	DIALOG_AMBILUANG,
	DIALOG_DEPOUANG,
	HOUSE_INFO,
	HOUSE_STORAGE,
	HOUSE_WEAPONS,
	HOUSE_MONEY,
	HOUSE_REALMONEY,
	HOUSE_WITHDRAW_REALMONEY,
	HOUSE_DEPOSIT_REALMONEY,
	HOUSE_REDMONEY,
	HOUSE_WITHDRAW_REDMONEY,
	HOUSE_DEPOSIT_REDMONEY,
	HOUSE_FOODDRINK,
	HOUSE_FOOD,
	HOUSE_FOOD_DEPOSIT,
	HOUSE_FOOD_WITHDRAW,
	HOUSE_DRINK,
	HOUSE_DRINK_DEPOSIT,
	HOUSE_DRINK_WITHDRAW,
	HOUSE_DRUGS,
	HOUSE_MEDICINE,
	HOUSE_MEDICINE_DEPOSIT,
	HOUSE_MEDICINE_WITHDRAW,
	HOUSE_MEDKIT,
	HOUSE_MEDKIT_DEPOSIT,
	HOUSE_MEDKIT_WITHDRAW,
	HOUSE_BANDAGE,
	HOUSE_BANDAGE_DEPOSIT,
	HOUSE_BANDAGE_WITHDRAW,
	HOUSE_OTHER,
	HOUSE_SEED,
	HOUSE_SEED_DEPOSIT,
	HOUSE_SEED_WITHDRAW,
	HOUSE_MATERIAL,
	HOUSE_MATERIAL_DEPOSIT,
	HOUSE_MATERIAL_WITHDRAW,
	HOUSE_COMPONENT,
	HOUSE_COMPONENT_DEPOSIT,
	HOUSE_COMPONENT_WITHDRAW,
	HOUSE_MARIJUANA,
	HOUSE_MARIJUANA_DEPOSIT,
	HOUSE_MARIJUANA_WITHDRAW,
	DIALOG_TRACK,
	DIALOG_TRACK_PH,
	DIALOG_INFO_BIS,
	DIALOG_INFO_HOUSE,
	DIALOG_FINDVEH,
	DIALOG_TRACKVEH,
	DIALOG_TRACKVEH2,
	DIALOG_TRACKPARKEDVEH,
	DIALOG_GOTOVEH,
	DIALOG_GETVEH,
	DIALOG_DELETEVEH,
	DIALOG_BUYPV,
	DIALOG_BUYVIPPV,
	DIALOG_BUYPLATE,
	DIALOG_LOCKVEH,
	DIALOG_BUYPVCP,
	DIALOG_BUYPVCP_BIKES,
	DIALOG_BUYPVCP_CARS,
	DIALOG_BUYPVCP_UCARS,
	DIALOG_BUYPVCP_JOBCARS,
	DIALOG_BUYPVCP_VIPCARS,
	DIALOG_BUYPVCP_CONFIRM,
	DIALOG_BUYPVCP_VIPCONFIRM,
	DIALOG_RENT_JOBCARS,
	DIALOG_RENT_JOBCARSCONFIRM,
	DIALOG_SKINFAM,
	DIALOG_RENT_BOAT,
	DIALOG_RENT_BOATCONFIRM,
	DIALOG_RENT_BIKE,
	DIALOG_RENT_BIKECONFIRM,
	DIALOG_GARKOT,
	DIALOG_GUDANG,
	DIALOG_MY_VEHICLE,
	DIALOG_TOY,
	DIALOG_TOYEDIT,
	DIALOG_TOYEDIT_ANDROID,
	DIALOG_TOYPOSISI,
	DIALOG_TOYPOSISIBUY,
	DIALOG_TOYBUY,
	DIALOG_TOYVIP,
	DIALOG_TOYPOSX,
	DIALOG_TOYPOSY,
	DIALOG_TOYPOSZ,
	DIALOG_TOYPOSRX,
	DIALOG_TOYPOSRY,
	DIALOG_TOYPOSRZ,
	DIALOG_TOYPOSSX,
	DIALOG_TOYPOSSY,
	DIALOG_TOYPOSSZ,
	//ingame map
	DIALOG_MTEDIT,
	DIALOG_EDIT,
	DIALOG_X,
	DIALOG_Y,
	DIALOG_Z,
	DIALOG_RX,
	DIALOG_RY,
	DIALOG_RZ,
	DIALOG_MTC,
	DIALOG_COORD,
	DIALOG_MTX,
	DIALOG_MTY,
	DIALOG_MTZ,
	DIALOG_MTRX,
	DIALOG_MTRY,
	DIALOG_MTRZ,
	DIALOG_HELP,
	DIALOG_GPS,
	DIALOG_JOB,
	DIALOG_GPS_MINYAK,
	DIALOG_GPS_PEMERASSUSU,
	DIALOG_GPS_PENAMBANG,
	DIALOG_GPS_JOB,
	DIALOG_GPS_PUBLIC,
	DIALOG_GPS_PROPERTIES,
	DIALOG_GPS_GENERAL,
	DIALOG_GPS_MISSION,
	DIALOG_GPS_AYAM,
	DIALOG_TRACKBUSINESS,
	DIALOG_ELECTRONIC_TRACK,
	DIALOG_PAYBILL,
	DIALOG_PAY,
	DIALOG_EDITBONE,
	FAMILY_SAFE,
	FAMILY_STORAGE,
	FAMILY_WEAPONS,
	FAMILY_MARIJUANA,
	FAMILY_WITHDRAWMARIJUANA,
	FAMILY_DEPOSITMARIJUANA,
	FAMILY_COMPONENT,
	FAMILY_WITHDRAWCOMPONENT,
	FAMILY_DEPOSITCOMPONENT,
	FAMILY_MATERIAL,
	FAMILY_WITHDRAWMATERIAL,
	FAMILY_DEPOSITMATERIAL,
	FAMILY_MONEY,
	FAMILY_WITHDRAWMONEY,
	FAMILY_DEPOSITMONEY,
	FAMILY_INFO,
	DIALOG_SERVERMONEY,
	DIALOG_SERVERMONEY_STORAGE,
	DIALOG_SERVERMONEY_WITHDRAW,
	DIALOG_SERVERMONEY_DEPOSIT,
	DIALOG_SERVERMONEY_REASON,
	DIALOG_LOCKERSAPD,
	DIALOG_WEAPONSAPD,
	DIALOG_LOCKERSAGS,
	DIALOG_WEAPONSAGS,
	DIALOG_LOCKERSAMD,
	DIALOG_WEAPONSAMD,
	DIALOG_DRUGSSAMD,
	DIALOG_LOCKERSANEW,
	DIALOG_WEAPONSANEW,
	DIALOG_LOCKERVIP,
	DIALOG_SERVICE,
	DIALOG_SERVICE_COLOR,
	DIALOG_SERVICE_COLOR2,
	DIALOG_SERVICE_PAINTJOB,
	DIALOG_SERVICE_WHEELS,
	DIALOG_SERVICE_SPOILER,
	DIALOG_SERVICE_HOODS,
	DIALOG_SERVICE_VENTS,
	DIALOG_SERVICE_LIGHTS,
	DIALOG_SERVICE_EXHAUSTS,
	DIALOG_SERVICE_FRONT_BUMPERS,
	DIALOG_SERVICE_REAR_BUMPERS,
	DIALOG_SERVICE_ROOFS,
	DIALOG_SERVICE_SIDE_SKIRTS,
	DIALOG_SERVICE_BULLBARS,
	DIALOG_SERVICE_NEON,
	DIALOG_MENU_TRUCKER,
	DIALOG_SHIPMENTS,
	DIALOG_SHIPMENTS_VENDING,
	DIALOG_HAULING,
	DIALOG_RESTOCK,
	DIALOG_RESTOCK_VENDING,
	DIALOG_ARMS_GUN,
	DIALOG_PLANT,
	DIALOG_EDIT_PRICE,
	DIALOG_EDIT_PRICE1,
	DIALOG_EDIT_PRICE2,
	DIALOG_EDIT_PRICE3,
	DIALOG_EDIT_PRICE4,
	DIALOG_OFFER,
	DIALOG_MATERIAL,
	DIALOG_COMPONENT,
	DIALOG_DRUGS,
	DIALOG_FOOD,
	DIALOG_FOOD_BUY,
	DIALOG_SEED_BUY,
	DIALOG_PRODUCT,
	DIALOG_GASOIL,
	DIALOG_APOTEK,
	DIALOG_ATM,
	DIALOG_TRACKATM,
	DIALOG_ATMDEPOSIT,
	DIALOG_ATMWITHDRAW,
	DIALOG_BSHOP,
	DIALOG_BANK,
	DIALOG_BANKDEPOSIT,
	DIALOG_BANKWITHDRAW,
	DIALOG_BANKREKENING,
	DIALOG_BANKTRANSFER,
	DIALOG_BANKCONFIRM,
	DIALOG_BANKSUKSES,
	DIALOG_PHONE,
	DIALOG_TWITTER,
	DIALOG_TWITTERPOST,
	DIALOG_TWITTERNAME,
	DIALOG_IBANK,
	DIALOG_AYAM,
	DIALOG_ASKS,
	DIALOG_SALARY,
	DIALOG_PAYCHECK,
	DIALOG_BUS,
	DIALOG_RUTE_BUS,
	DIALOG_HEALTH,
	DIALOG_OBAT,
	DIALOG_ISIKUOTA,
	DIALOG_DOWNLOAD,
	DIALOG_KUOTA,
	DIALOG_STUCK,
	DIALOG_TDM,
	DIALOG_PICKUPVEH,
	DIALOG_TRACKPARK,
	DIALOG_MY_WS,
	DIALOG_TRACKWS,
	WS_MENU,
	WS_SETNAME,
	WS_SETOWNER,
	WS_SETEMPLOYE,
	WS_SETEMPLOYEE,
	WS_SETOWNERCONFIRM,
	WS_SETMEMBER,
	WS_SETMEMBERE,
	WS_MONEY,
	WS_WITHDRAWMONEY,
	WS_DEPOSITMONEY,
	WS_COMPONENT,
	WS_COMPONENT2,
	WS_MATERIAL,
	WS_MATERIAL2,
	DIALOG_ACTORANIM,
	DIALOG_MY_VENDING,
	DIALOG_VENDING_INFO,
	DIALOG_VENDING_BUYPROD,
	DIALOG_VENDING_MANAGE,
	DIALOG_VENDING_NAME,
	DIALOG_VENDING_VAULT,
	DIALOG_VENDING_WITHDRAW,
	DIALOG_VENDING_DEPOSIT,
	DIALOG_VENDING_EDITPROD,
	DIALOG_VENDING_PRICESET,
	DIALOG_VENDING_RESTOCK,
	DIALOG_SPAWN_1,
	DIALOG_MYVEH,
	DIALOG_MYVEH_INFO,
	DIALOG_FAMILY_INTERIOR,
	DIALOG_SPAREPART,
	DIALOG_BUYPARTS,
	DIALOG_BUYPARTS_DONE,
	VEHICLE_STORAGE,
	VEHICLE_WEAPON,
	VEHICLE_MONEY,
	VEHICLE_REALMONEY,
	VEHICLE_REALMONEY_WITHDRAW,
	VEHICLE_REALMONEY_DEPOSIT,
	VEHICLE_REDMONEY,
	VEHICLE_REDMONEY_WITHDRAW,
	VEHICLE_REDMONEY_DEPOSIT,
	VEHICLE_DRUGS,
	VEHICLE_MEDICINE,
	VEHICLE_MEDICINE_WITHDRAW,
	VEHICLE_MEDICINE_DEPOSIT,
	VEHICLE_MEDKIT,
	VEHICLE_MEDKIT_WITHDRAW,
	VEHICLE_MEDKIT_DEPOSIT,
	VEHICLE_BANDAGE,
	VEHICLE_BANDAGE_WITHDRAW,
	VEHICLE_BANDAGE_DEPOSIT,
	VEHICLE_OTHER,
	VEHICLE_SEED,
	VEHICLE_SEED_WITHDRAW,
	VEHICLE_SEED_DEPOSIT,
	VEHICLE_MATERIAL,
	VEHICLE_MATERIAL_WITHDRAW,
	VEHICLE_MATERIAL_DEPOSIT,
	VEHICLE_COMPONENT,
	VEHICLE_COMPONENT_WITHDRAW,
	VEHICLE_COMPONENT_DEPOSIT,
	VEHICLE_MARIJUANA,
	VEHICLE_MARIJUANA_WITHDRAW,
	VEHICLE_MARIJUANA_DEPOSIT,
	DIALOG_NONRPNAME,
	//CONTAINER
	DIALOG_CONTAINER,
	//bb
	DIALOG_BOOMBOX,
	DIALOG_BOOMBOX1,
	//dealership
	DIALOG_FIND_DEALER,
	DIALOG_BUYDEALERCARS_CONFIRM_M,
	DIALOG_BUYJOBCARSVEHICLE,
	DIALOG_ACLAIM,
	DIALOG_BUYDEALERCARS_CONFIRM,
	DIALOG_BUYTRUCKVEHICLE,
	DIALOG_BUYMOTORCYCLEVEHICLE,
	DIALOG_BUYUCARSVEHICLE,
	DIALOG_BUYCARSVEHICLE,
	DIALOG_DEALER_MANAGE,
	DIALOG_DEALER_VAULT,
	DIALOG_DEALER_WITHDRAW,
	DIALOG_PRISONMENU,
	DIALOG_DEALER_DEPOSIT,
	DIALOG_DEALER_NAME,
	DIALOG_DEALER_RESTOCK,
	DIALOG_TAKEFOOD,
	DIALOG_TDC,
	DIALOG_TDC_PLACE,
	//PEDAGANG
	PEDAGANG_MENU,
	PDG_AYAMFILLET,
	PDG_BERAS,
	PDG_SAMBAL,
	PDG_TEPUNG,
	PDG_GULA,
	PDG_BIJIKOPI,
	PDG_SARITEH,
	PDG_SARIJERUK,
	PDG_MINERAL,
	//lanjutan
	PDG_AYAMFILLET1,
	PDG_BERAS1,
	PDG_SAMBAL1,
	PDG_TEPUNG1,
	PDG_GULA1,
	PDG_BIJIKOPI1,
	PDG_SARITEH1,
	PDG_SARIJERUK1,
	PDG_MINERAL1,


	// PDG_KENTANG,
	// PDG_MINERAL,
	// PDG_SNACK,
	// PDG_CHICKEN,
	// PDG_COCACOLA,
	// PDG_JERUK,
	// PDG_BURGER,
	// PDG_PIZZA,
	// PDG_AYAM_FILET,
	//
	// PDG_KENTANG1,
	// PDG_MINERAL1,
	// PDG_SNACK1,
	// PDG_CHICKEN1,
	// PDG_COCACOLA1,
	// PDG_JERUK1,
	// PDG_BURGER1,
	// PDG_PIZZA1,
	// PDG_AYAM_FILET1,
	//---[ DIALOG OWN FARM ]---
	FARM_STORAGE,
	FARM_INFO,
	FARM_POTATO,
	FARM_WHEAT,
	FARM_ORANGE,
	FARM_MONEY,
	FARM_DEPOSITPOTATO,
	FARM_WITHDRAWPOTATO,
	FARM_DEPOSITWHEAT,
	FARM_WITHDRAWWHEAT,
	FARM_DEPOSITORANGE,
	FARM_WITHDRAWORANGE,
	FARM_DEPOSITMONEY,
	FARM_WITHDRAWMONEY,
	PMDC_MENU,
	EMDC_MENU,
	MDC_VEHICLE,
	MDC_BISNIS,
	MDC_HOUSE,
	MDC_PHONE,
	MDC_VEHICLE_MENU,
	MDC_BISNIS_MENU,
	MDC_HOUSE_MENU,
	MDC_VEHICLE_TRACK,
	MDC_BISNIS_TRACK,
	MDC_HOUSE_TRACK,

	//dialog aufa
	DIALOG_MDC_911,
	DIALOG_MDC_911_MENU,
	DIALOG_MDC_911_LIST,
	DIALOG_MDC_911_DETAILS,
	DIALOG_MDC_RETURN,
	DIALOG_CALL_911,
}

//-----[ Download System ]-----
new download[MAX_PLAYERS];

enum    _:E_EDITING_TYPE {
    NOTHING = 0,
    ROADBLOCK
}


//area index aufa
enum
{
    INVALID_AREA_INDEX = 0,
    BARRICADE_AREA_INDEX,
    FIRE_AREA_INDEX
};


//-----[ Count System ]-----
new Count = -1;
new countTimer;
new showCD[MAX_PLAYERS];

//-----[ Rob System ]-----
new robmoney;

//-----[ Server Uptime ]-----
new up_days,
	up_hours,
	up_minutes,
	up_seconds,
	WorldTime = 10,
	WorldWeather = 24;

//idskin
new SpawnMale = mS_INVALID_LISTID,
	SpawnFemale = mS_INVALID_LISTID,
	MaleSkins = mS_INVALID_LISTID,
	FemaleSkins = mS_INVALID_LISTID,
	VIPMaleSkins = mS_INVALID_LISTID,
	VIPFemaleSkins = mS_INVALID_LISTID,
	SAPDMale = mS_INVALID_LISTID,
	SAPDFemale = mS_INVALID_LISTID,
	SAPDWar = mS_INVALID_LISTID,
	SAGSMale = mS_INVALID_LISTID,
	SAGSFemale = mS_INVALID_LISTID,
	SAMDMale = mS_INVALID_LISTID,
	SAMDFemale = mS_INVALID_LISTID,
	SANEWMale = mS_INVALID_LISTID,
	SANEWFemale = mS_INVALID_LISTID,
	toyslist = mS_INVALID_LISTID,
	viptoyslist = mS_INVALID_LISTID,
	vtoylist = mS_INVALID_LISTID,
	PDGSkinMale = mS_INVALID_LISTID,
	PDGSkinFemale = mS_INVALID_LISTID,
	TransFender = mS_INVALID_LISTID,
	Waa = mS_INVALID_LISTID,
	LoCo = mS_INVALID_LISTID;

new afk_check[MAX_PLAYERS];
new afk_tick[MAX_PLAYERS];
new afk_time[MAX_PLAYERS];
#define VEHICLE_RESPAWN 7200

new SAPDVehicles[75],
	SAGSVehicles[30],
	SAMDVehicles[30],
	SANAVehicles[30];

IsSAPDCar(carid)
{
	for(new v = 0; v < sizeof(SAPDVehicles); v++)
	{
	    if(carid == SAPDVehicles[v]) return 1;
	}
	return 0;
}

IsGovCar(carid)
{
	for(new v = 0; v < sizeof(SAGSVehicles); v++)
	{
	    if(carid == SAGSVehicles[v]) return 1;
	}
	return 0;
}

IsSAMDCar(carid)
{
	for(new v = 0; v < sizeof(SAMDVehicles); v++)
	{
	    if(carid == SAMDVehicles[v]) return 1;
	}
	return 0;
}

IsSANACar(carid)
{
	for(new v = 0; v < sizeof(SANAVehicles); v++)
	{
	    if(carid == SANAVehicles[v]) return 1;
	}
	return 0;
}

new Kompensasi;
new showroom;
new spterminal;
new DutyTimer;
new MalingKendaraan;

new mulaikerja;
new ambilbox;
new ambilbox1;
new ambilbox2;
new jualdaurulang;
new nyortir;
new daurulang;

//-----[ MySQL Connect ]-----	
new MySQL: g_SQL;
new TogOOC = 1;
new bool:DialogHauling[7];
new bool:DialogSaya[MAX_PLAYERS][7];
#define MAX_ANIM_DATA 100
#define MAX_ANIM_STRING 512
#define function%0(%1)  	forward %0(%1); public %0(%1)
enum E_ANIM_DATA
{
	data_string[MAX_ANIM_STRING],
	data_frame,
	data_chars,
	data_color[4],
	data_color_1[15],
	data_color_2[15]
}
new AnimData[MAX_ANIM_DATA][E_ANIM_DATA];

static stock FindFreeAnimDataID()
{
	for (new i = 0; i < MAX_ANIM_DATA; i++) {
		if (strlen(AnimData[i][data_string]) <= 0) {
			return i;
		}
	}
	return -1;
}


stock CreateTextdrawAnimation(playerid, PlayerText:textdraw, frame, color[], string[])
{
	new id = FindFreeAnimDataID();
	if (id == -1) return 1;

	for (new i = 0; i < strlen(string); i++) {
		if (string[i] == ' ') {
			string[i] = '_';
		}
	}

	AnimData[id][data_chars] = 0;
	AnimData[id][data_frame] = frame;
	format (AnimData[id][data_string], MAX_ANIM_STRING, "%s", string);
	format (AnimData[id][data_color], 4, "%s", color);
	format (AnimData[id][data_color_1], 15, "%s~h~~h~~h~", color);
	format (AnimData[id][data_color_2], 15, "%s~h~~h~", color);
	PlayerTextDrawSetString(playerid, textdraw, "");

	SetTimerEx("UpdateTextdrawAnimation", frame, false, "iii", playerid, _:textdraw, id);
	return 1;
}

function UpdateTextdrawAnimation(playerid, PlayerText:textdraw, id)
{
	new tmp[MAX_ANIM_STRING];
	new len = strlen(AnimData[id][data_string]);
	new idx = AnimData[id][data_chars]++;

	if (AnimData[id][data_string][idx] == '~') {
		AnimData[id][data_chars] += 3;
		idx += 3;
	}

	strmid(tmp, AnimData[id][data_string], 0, idx);

	if (idx < len) {
		if (idx > 2 && (tmp[idx - 2] != '~' && tmp[idx - 1] != '~' && tmp[idx] != '~') ) {
			strins(tmp, AnimData[id][data_color_2], idx - 2);
			strins(tmp, AnimData[id][data_color_1], idx + strlen(AnimData[id][data_color_2]) - 1);
		}

		SetTimerEx("UpdateTextdrawAnimation", AnimData[id][data_frame], false, "iii", playerid, _:textdraw, id);
	} else {
		format (AnimData[id][data_string], MAX_ANIM_STRING, "");
		CallRemoteFunction("OnTextdrawAnimationFinish", "ii", playerid, _:textdraw);
	}

	strins(tmp, AnimData[id][data_color], 0);
	PlayerTextDrawSetString(playerid, textdraw, tmp);
	return 1;
}

//-----[ Player Data ]-----	
enum E_PLAYERS
{
	pID,
	pUCP[22],
	pExtraChar,
	pChar,
	pName[MAX_PLAYER_NAME],
	pAdminname[MAX_PLAYER_NAME],
	bool:pAhide,
	pIP[16],
	pTrackDealer,
	pVerifyCode,
	pPassword[65],
	pSalt[17],
	pEmail[40],
	pBotol,
	pAdmin,
	pHelper,
	pClikmap,
	pLevel,
	pLevelUp,
	pVip,
	pVipTime,
	pGold,
	pSteak,
	pRegDate[50],
	pLastLogin[50],
	//bandana
	pBandana,
	pBlind,
	//UangGudang,
	pMoney,
	pRedMoney,
	Text3D:pMaskLabel,
	pBankMoney,
	pInputMoney,
	pInputFuel,
	pToggleBank,
	pBankRek,
	pPhone,
	pPhoneCredit,
	pContact,
	pPhoneBook,
	pSMS,
	pCall,
	pCallTime,
	pWT,
	pHours,
	pMinutes,
	pSeconds,
	pPaycheck,
	pSkin,
	pFacSkin,
	pJobSkin,
	pGender,
	pDelaypernikahan,
	pAge[50],
	pDutyJob,
	pGetPARKID,
	pInDoor,
	pInHouse,
	pInBiz,
	pInVending,
	pInFamily,
	Float: pPosX,
	Float: pPosY,
	Float: pPosZ,
	Float: pPosA,
	Float:pPos[4],
	pInt,
	pWorld,
	Float:pHealth,
    Float:pArmour,
    pVest,
	pHunger,
	pEnergy,
	pBladder,
	pBladderTime,
	pKencing,
	pKencingTime,
	pHungerTime,
	pEnergyTime,
	pSick,
	pSickTime,
	pHospital,
	Text3D:pBensinLabel,
	pHospitalTime,
	pInjured,
	Text3D: pInjuredLabel,
	pOnDuty,
	pOnDutyTime,
	pFaction,
	pFactionRank,
	pObatStress,
	pPerban,
	pFactionLead,
	pTazer,
	pBroadcast,
	pNewsGuest,
	pFamily,
	pFamilyRank,
	pJail,
	pJailTime,
	pArrest,
	pArrestTime,
	pWarn,
	pJob,
	pJob2,
	pJobTime,
	pExitJob,
	pMedicine,
	pMedkit,
	pMask,
	pHelmet,
	pCig,
	pMineral,
	pPizza,
	pBurger,
	pChiken,
	//hasil menu makan pedagang
	pNasikucing,
	pAyamgeprek,
	pKueaufa,
	//hasil menu minum pedagang
	pBenihkopi,
	pBenihteh,
	pBenihjeruk,

	pOlahkopi,
	pOlahteh,
	pOlahjeruk,

	pBijikopi,
	pSariteh,
	pSarijeruk,
	pCola,
	//hasil menu minum pedagang
	pKopiruq,
	pEsteh,
	pEsjeruk,

	//aufa
	pWorkshop,
	//makanan di market
	pSnack,
	pKebab,
	pCappucino,
	pRoti,
	pWallpaper,
	pStarling,
	pSprunk,
	pMilxMax,
	//-----------------
	pGas,
	pBandage,
	pGopay,
	pGPS,
	pGpsActive,
	pMaterial,
	pComponent,
	pFood,
	pSeed,
	//MANCING
	pPenyu,
	pMakarel,
	pNemo,
 	pBlueFish,
	pPancinganaufa,
	pUmpanaufa,
	//drive lic aufa
	pDrivingTest,
	pDMVTime,
	pDrivingLicense,
	//PETANI
	pPadi,
	pCabai,
	pJagung,
	pTebu,
	pPadiOlahan,
	pCabaiOlahan,
	pJagungOlahan,
	pTebuOlahan,
	pBeras,
	pSambal,
	pGula,
	pTepung,
	//
	pPotato,
	pWheat,
	pOrange,
	pPrice1,
	pPrice2,
	pPrice3,
	Text3D:AdminTag,
	pPrice4,
	pMarijuana,
	pKanabis,
	pPlant,
	pPlantTime,
	pInSt,
	pFishTool,
	pInstallDweb,
	pMenuTypeStorage,
	pIns,
	pWorm,
	pFish,
	//alt td ruq
	altruq,
	altruqq,
	//bus
	pInFish,
	pIDCard,
	pIDCardTime,
	pDriveLic,
	pDriveLicTime,
	pDriveLicApp,
	pBoatLic,
	pBoatLicTime,
	pWeaponLic,
	pWeaponLicTime,
	pBizLic,
	pBizLicTime,
	pBpjs,
	pBpjsTime,
	pFlyLic,
	pFlyLicTime,
	pGuns[13],
    pAmmo[13],
	pWeapon,
	//Not Save
	Cache:Cache_ID,
	bool: IsLoggedIn,
	LoginAttempts,
	LoginTimer,
	pSpawned,
	pSpawnList,
	pAdminDuty,
	pFreezeTimer,
	pFreeze,
	pMaskID,
	pMaskOn,
	pSPY,
	pTogPM,
	pTogName,
	pTogLog,
	pTogAds,
	pTogWT,
	pBuluAyam,
	Text3D:pAdoTag,
	Text3D:pBTag,
	bool:pBActive,
	bool:pAdoActive,
	pFlare,
	bool:pFlareActive,
	sampahsaya,
	//=======[ PEMERAS SUSU ]======
	pSusu,
	bool:pJobmilkduty,
	pMilkJob,
	bool:pLoading,
	pSusuOlahan,
	//========[ Duty Job ]========
	bool:DutyPenambang,
	bool:DutyMinyak,
	bool:DutyPemotong,
	bool:DutyPenebang,
	//=============================
	pPeluru[2],
	pDe,
	pKatana,
	pMolotov,
	p9mm,
	pSg,
	pSpas,
	pMp5,
	pM4,
	pClip,
	//================
	pTrackCar,
	pBuyPvModel,
	pTrackHouse,
	pTrackBisnis,
	pTrackVending,
	pFacInvite,
	pFacOffer,
	pFamInvite,
	pFamOffer,
	pFindEms,
	pCuffed,
	toySelected,
	bool:PurchasedToy,
	pEditingItem,
	pProductModify,
	pEditingVendingItem,
	pVendingProductModify,
	pCurrSeconds,
	pCurrMinutes,
	pCurrHours,
	pSpec,
	playerSpectated,
	pFriskOffer,
	pDragged,
	pDraggedBy,
	pDragTimer,
	pHBEMode,
	pHelmetOn,
	pReportTime,
	pAskTime,
	//Player Progress Bar
	PlayerBar:spfuelbar,
	PlayerBar:spdamagebar,
	PlayerBar:sphungrybar,
	PlayerBar:spenergybar,
	PlayerBar:activitybar,
	pPart,
	pPartStatus,
	pProducting,
	pProductingStatus,
	pPemotong,
	pPemotongStatus,
	pCooking,
	pCookingStatus,
	pArmsDealer,
	pArmsDealerStatus,
	// Roleplay Booster
 	pBooster,
 	pBoostTime,
	pMechanic,
	pMechanicStatus,
	pActivity,
	pActivityStatus,
	pActivityTime,
	pCs,
	//Penambang
	pTimeTambang1,
	pTimeTambang2,
	pTimeTambang3,
	pTimeTambang4,
	pTimeTambang5,
	pTimeTambang6,
	//Jobs
	pLagiDealer,
	pKendaraanDealer,
	pSideJob,
	pSideJobTime,
	pBustime,
	pBusRute,
	pBusTime,
	bool:pBuswaiting,
	bool:TempatHealing,
	pSparepartTime,
	pGetJob,
	pGetJob2,
	pMechDuty,
	pAmbilCar,
	pKendaraanKerja,
	pMechVeh,
	pKendaraanFraksi,
	pMechColor1,
	pMechColor2,
	EditingTrash,
	EditingGarkot,
	//ATM
	EditingATMID,
	//lumber job
	pKamera,
	EditingTreeID,
	CuttingTreeID,
	bool:CarryingLumber,
	//Storage
	ST_MENU,
	ST_MONEY,
	ST_WITHDRAWMONEY,
	ST_DEPOSITMONEY,
	ST_COMPONENT,
	ST_COMPONENT2,
	ST_MATERIAL,
	ST_MATERIAL2,
	//Container
	pSedangContainer,
	//ROB
	pLockPick,
	BankDelay,
	pRobStatus,
	RobbankTime,
	RobatmTime,
	RobbizTime,
	//Vending
	EditingVending,
	//production
	CarryProduct,
	//part job
	CarryPart,
	//trucker
	pMission,
	pHauling,
	pVendingRestock,
	bool: CarryingBox,
	//kejar
	pCheckpointTarget,
	//Farmer
	pHarvest,
	pHarvestID,
	pOffer,
	//Bank
	pTransfer,
	pTransferRek,
	pTransferName[128],
	//Gas Station
	pFill,
	pFillStatus,
	pFillTime,
	pFillPrice,
	//boombox
	pBoombox,
	//Gate
	gEditID,
	gEdit,
	// WBR
	pHead,
 	pPerut,
 	pLHand,
 	pRHand,
 	pLFoot,
 	pRFoot,
 	// Inspect Offer
 	pInsOffer,
 	// Obat System
 	pObat,
 	// Suspect
 	pSuspectTimer,
 	pSuspect,
 	// Phone On Off
 	pPhoneStatus,
 	// Kurir
 	pKurirEnd,
 	// Shareloc Offer
 	pLocOffer,
 	// Register tinggi dan berat badan
 	pTinggi[50],
 	pBerat[50],
 	//download app handphone
 	pInstallTweet,
 	pInstallGojek,
 	pInstallMap,
 	pInstallBank,
 	// Twitter
 	pTwitter,
	pTwitterStatus, 
	pTwittername[MAX_PLAYER_NAME],
	pTwitterPostCooldown,
	pTwitterNameCooldown,
 	pRegTwitter,
 	// Kuota
 	pKuota,
 	// DUTY SYSTEM
 	pDutyHour,
 	//pemotong ayam
	timerambilayamhidup,
    timerpotongayam,
    timerpackagingayam,
    timerjualayam,
    AmbilAyam,
    DutyAmbilAyam,
    AyamHidup,
	AyamPotong,
	AyamFillet,
	sedangambilayam,
    sedangpotongayam,
    sedangfilletayam,
    sedangjualayam,
 	// CHECKPOINT
 	pCP,
 	// ROBBERY
 	pRobTime,
 	pRobOffer,
 	pRobLeader,
 	pRobMember,
 	pMemberRob,
 	pKargo,
	pTrailer,
	// Smuggler
	bool:pTakePacket,
	pTrackPacket,
	// Garkot
	pPark,
	pLoc,
	//robbank
	pPanelHacking,
	pBomb,
	// WS
	pMenuType,
	pInWs,
	pTransferWS,
	//PENJAHIT
	pKain,
	pWool,
	pPakaian,
	//tukang kayu
	pKayu,
	pPapan,
	//sks
	pSks,
	//job recyler 
	pDutyBox,
	pDapatBox,
	pBox,
	pKaret,
	//Anticheat
	pACWarns,
	pACTime,
	pRadioVoice,
	pTombolVoice,
	pTombolVoiceRadio,
	pTombolVoiceAdmin,
	pCallStage,
	pCallLine,
	pCalling,
	pJetpack,
	pArmorTime,
	pLastUpdate,
	//Checkpoint
	pCheckPoint,
	pBus,
	//SpeedCam
	pSpeedTime,
	//Starterpack
	pStarterpack,
	// pKompensasi,
	pKompensasi2,
	pKompensasi1,
	//inventkry
	PilihSpawn,
	pProgress,
	Float:pWeight,
	pilihbensin,
	WaktuWarung,
	pMasukinNama,
	pilihkarakter,
	pSelectItem,
	pTarget,
	pGiveAmount,
	//Anim
	pLoopAnim,
	//Rob Car
	pLastChop,
	pLastChopTime,
	pIsStealing,
	//Sparepart
	pSparepart,
	//
	pUangKorup,
	//Senter
	pFlashlight,
	pUsedFlashlight,
	//Moderator
	pServerModerator,
	pEventModerator,
	pFactionModerator,
	pFamilyModerator,
	//
	pPaintball,
	pPaintball2,
	//
	pDelayIklan,
	pTukar,
	//PENAMBANG
	pBatu,
	pBatuCucian,
	pBorax,
	pKecubung,
	pPaketborax,
	pPaketkecubung,
	pTujuan[100],
	pOngkos[50],
	pEmas,
	pBesi,
	pAluminium,
	//PENAMBANGMINYAK
	pMinyak,
	pEssence,
	//Pedagang
	pdgMenuType,
	pInPdg,
	//-----[ FARM PRIVATE]
	pFarm,
	pFarmRank,
	pFarmInvite,
	pFarmOffer,
	//GPS TAG HAN
	pWaypoint,
	pLocation[32],
	Float:pWaypointPos[3],
	PlayerText:pTextdraws[83],
	//SEATBLET
	pSeatbelt,
	// Vehicle Toys
	EditStatus,
	VehicleID,
	pInDealer,
	//barikade polisi aufa
	pEditingMode,
	pEditRoadblock
};
new pData[MAX_PLAYERS][E_PLAYERS];
new g_MysqlRaceCheck[MAX_PLAYERS];
#define PlayerData pData
#define PlayerInfo PlayerData

//-----[ Smuggler ]-----	

new Text3D:packetLabel,
	packetObj,
	Float:paX, 
	Float:paY, 
	Float:paZ;

//-----[ Lumber Object Vehicle ]-----	
#define MAX_BOX 50
#define BOX_LIFETIME 100
#define BOX_LIMIT 5

enum    E_BOX
{
	boxDroppedBy[MAX_PLAYER_NAME],
	boxSeconds,
	boxObjID,
	boxTimer,
	boxType,
	Text3D: boxLabel
}
new BoxData[MAX_BOX][E_BOX],
	Iterator:Boxs<MAX_BOX>;

new
	BoxStorage[MAX_VEHICLES][BOX_LIMIT];

//-----[ Trucker ]-----	
new VehProduct[MAX_VEHICLES];
new VehGasOil[MAX_VEHICLES];
new VehParts[MAX_VEHICLES];


//-----[ Type Checkpoint ]-----	
enum
{
	CHECKPOINT_NONE = 0,
	CHECKPOINT_DRIVELIC,
	CHECKPOINT_MISC,
	CHECKPOINT_BUS
}

//-----[ Storage Limit ]-----	
enum
{
	LIMIT_SNACK,
	LIMIT_SPRUNK,
	LIMIT_MEDICINE,
	LIMIT_MEDKIT,
 	LIMIT_BANDAGE,
 	LIMIT_SEED,
	LIMIT_MATERIAL,
	LIMIT_COMPONENT,
	LIMIT_MARIJUANA
};

//-----[ eSelection Define ]-----	
#define 	SPAWN_SKIN_MALE 		1
#define 	SPAWN_SKIN_FEMALE 		2
#define 	SHOP_SKIN_MALE 			3
#define 	SHOP_SKIN_FEMALE 		4
#define 	VIP_SKIN_MALE 			5
#define 	VIP_SKIN_FEMALE 		6
#define 	SAPD_SKIN_MALE 			7
#define 	SAPD_SKIN_FEMALE 		8
#define 	SAPD_SKIN_WAR 			9
#define 	SAGS_SKIN_MALE 			10
#define 	SAGS_SKIN_FEMALE 		11
#define 	SAMD_SKIN_MALE 			12
#define 	SAMD_SKIN_FEMALE 		13
#define 	SANA_SKIN_MALE 			14
#define 	SANA_SKIN_FEMALE 		15
#define 	TOYS_MODEL 				16
#define 	VIPTOYS_MODEL 			17
#define 	PDG_SKIN_MALE 			18
#define 	PDG_SKIN_FEMALE 		19
#define 	vtoyslist 		20




//-----[ Modular ]-----	
main() 
{
	SetTimer("onlineTimer", 1000, true);
	SetTimer("TDUpdates", 8000, true);
}
new bool:Warung;
new bool:Nikahan;
#include <textdraw-streamer>
//========= DATA =====================
#include "DATA\COLOR.pwn"
#include "NOTIFIKASISYSTEM\INFONOTIF.pwn"
#include "NOTIFIKASISYSTEM\SHOWITEMBOX.pwn"
#include "DATA\ASIAINV.pwn"
#include "DATA\UCP.pwn"
#include "DESAIN\Desain-Textdraw.pwn"
#include "DATA\ANIMS.pwn"
#include "DATA\RENTAL.pwn"
#include "FAMILY-ASIA LANE-SYSTEM\kanabis-aufa.pwn"
#include "DATA\PRIVATE_VEHICLE.pwn"
#include "DYNAMIC\HOUSE.pwn"
#include "DYNAMIC\BISNIS.pwn"
#include "DYNAMIC\GARKOT.pwn"
#include "DYNAMIC\DOOR.pwn"
#include "DYNAMIC\GAS_STATION.pwn"
#include "DYNAMIC\LOCKER.pwn"
#include "DYNAMIC\DEALERSHIP.pwn"
#include "DYNAMIC\GATE.pwn"
#include "DYNAMIC\WORKSHOP.pwn"
#include "DYNAMIC\SPEEDCAM.pwn"
#include "DYNAMIC\ACTOR.pwn"
#include "DYNAMIC\TRASH.pwn"
#include "DYNAMIC\ROBWARUNG.pwn"
#include "DATA\VSTORAGE.pwn"
#include "DATA\REPORT.pwn"
#include "DATA\ASK.pwn"
#include "DATA\WEAPON_ATTH.pwn"
#include "DATA\TOYS.pwn"
#include "DATA\HELMET.pwn"
#include "DATA\BILLS.pwn"
#include "Core-Mysql\Server-Dynamic.pwn"
#include "FAMILY-ASIA LANE-SYSTEM\Fam-ASIA LANE-system.pwn"
#include "DATA\AUCTION.pwn"
#include "Core-Mysql\query-sql.pwn"
#include "DATA\VOUCHER.pwn"
#include "DATA\SALARY.pwn"
#include "DATA\ATM.pwn"
#include "FAMILY-ASIA LANE-SYSTEM\BlackMarket-ASIA LANE.pwn"
#include "DATA\INGAMEMAP.pwn"
#include "DATA\ROB.pwn"
#include "DATA\ROBBANK.pwn"
#include "DATA\MDC.pwn"
#include "DESAIN\PlayerClick-Textdraw.pwn"
#include "FAMILY-ASIA LANE-SYSTEM\ladang-pribadi-fam.pwn"
#include "DATA\ROBBERY.pwn"
#include "DATA\DMV.pwn"
#include "DATA\ANTICHEAT.pwn"
#include "DATA\VENDING.pwn"
#include "DATA\CONTACT.pwn"
#include "DATA\TOLL.pwn"
#include "DATA\MOD.pwn"
#include "FAMILY-ASIA LANE-SYSTEM\ladang-kecubung.pwn"
#include "DATA\SIREN.pwn"
#include "DATA\STORAGE.pwn"
#include "DATA\GUDANG_PEDAGANG.pwn"
#include "DATA\MODIF.pwn"
//======[ PEKERJAAN KOTA ASIA LANE ]==========
#include "List-Pekerjaan-ASIA LANE\TUKANGAYAM.pwn"
#include "List-Pekerjaan-ASIA LANE\PENAMBANGMINYAK.pwn"
#include "List-Pekerjaan-ASIA LANE\KARGO.pwn"
#include "List-Pekerjaan-ASIA LANE\PENAMBANG.pwn"
#include "List-Pekerjaan-ASIA LANE\PEMERAHSUSU.pwn"
#include "List-Pekerjaan-ASIA LANE\SMUGGLER.pwn"
#include "List-Pekerjaan-ASIA LANE\TRUCKER.pwn"
#include "List-Pekerjaan-ASIA LANE\MANCING.pwn"
#include "List-Pekerjaan-ASIA LANE\PENJAHIT.pwn"
#include "List-Pekerjaan-ASIA LANE\BUS.pwn"
#include "List-Pekerjaan-ASIA LANE\PETANI.pwn"
#include "List-Pekerjaan-ASIA LANE\PEMBURU.pwn"
#include "List-Pekerjaan-ASIA LANE\TUKANGKAYU.pwn"
#include "List-Pekerjaan-ASIA LANE\RECYCLER.pwn"
// MODSHOP
#include "DATA\VTOYS.pwn"
#include "DATA\MODSHOP.pwn"
#include "MODSHOP\ANAXY.pwn"
#include "CMD\FACTION.pwn"
#include "CMD\PLAYER.pwn"
#include "CMD\ADMIN.pwn"
#include "DATA\SAPD_TASER.pwn"
#include "DATA\SAPD_SPIKE.pwn"
#include "DATA\DIALOG.pwn"
//mapping
#include "LoadMap\LoadMap.pwn"
#include "RemoveLoadMap\RemoveMap.pwn"
#include "CMD\ALIAS\ALIAS_PRIVATE_VEHICLE.pwn"
#include "CMD\ALIAS\ALIAS_PLAYER.pwn"
#include "CMD\ALIAS\ALIAS_BISNIS.pwn"
#include "CMD\ALIAS\ALIAS_ADMIN.pwn"
#include "CMD\ALIAS\ALIAS_HOUSE.pwn"
#include "DATA\EVENT.pwn"
#include "Core-Mysql\FungsiSystem.pwn"
#include "DATA\TASK.pwn"
#include "AsiaScript\SAPD_BARRICADE.pwn"
#include "AsiaScript\FIRE_SYSTEM.pwn"
#include "AsiaScript\911CALL.pwn"
#include "AsiaScript\DISCORD.pwn"
#include "AsiaScript\DAMAGE_LOG.pwn"
#include "AsiaScript\PEMANCINGAN.pwn"
#include "AsiaScript\AUFADMV"
#include "AsiaScript\FRAKSI\KTP.pwn"
#include "AsiaScript\FRAKSI\WEAPONLIC.pwn"
#include "AsiaScript\FRAKSI\SIM.pwn"
#include "USER-INTERFACE\ui_progressbaraufa"
#include "USER-INTERFACE\ui_notif-aufa2"


native SendClientCheck(playerid, type, arg, offset, size);

// -----[ Discord Status ]-----
forward BotStatus();
new Float:upt;

public BotStatus()
{
    static h = 0, m = 0, secs = 0;
    new statuz[256];
    h = floatround(upt / 3600);
    m = floatround((upt / 60) - (h * 60));
    secs = floatround(upt - ((h * 3600) + (m * 60)));
    upt++;
    format(statuz, sizeof(statuz), "%d/%d %02dj %02dm %02ds Uptime | Asia Lane", pemainic, GetMaxPlayers(), h, m, secs);
    DCC_SetBotActivity(statuz);
}


forward speedoupdate();

public speedoupdate()
{
	new string[4], veh, Float:speed, Float:x, Float:y, Float:z, model;
	for (new playerid = GetPlayerPoolSize(); playerid > -1; playerid--)
	{
		if (!use_speedo[playerid] || GetPlayerState(playerid) != 2) continue;
		veh = GetPlayerVehicleID(playerid);
		model = GetVehicleModel(veh);
		GetVehicleVelocity(veh, x, y, z);
		speed = floatmul(floatsqroot(floatadd(floatmul(x, x), floatmul(y, y))), 180.0);
		format(string, 4, "%.0f", speed);
		PlayerTextDrawSetString(playerid, speedo[playerid], string);
		if(model >= 400)
		{
			ShowPlayerCircleProgress(playerid, floatround(speed / VEHICLE_TOP_SPEEDS[model - 400] * 100.0), 596.500244, 374.259460, 0xFF8000FF);
		}
		//ShowPlayerCircleProgress(playerid, floatround(speed / VEHICLE_TOP_SPEEDS[model - 400] * 100.0), 596.500244, 374.259460, 0xFF8000FF);
	}
	return 1;
}

CMD:sm(playerid, params[])
{
    new begal[200], craft[200], robberybiz[200], war[200];
    if(FactionMember_GetCount(1, true) > 2 && FactionMember_GetCount(3, true) > 1)
    {
        begal = "{00FF00}Tidak Mendung";
    }
    else
    {
        begal = "{FF0000}Mendung";
    }
    if(FactionMember_GetCount(1, true) > 1 && FactionMember_GetCount(3, true) > 0)
    {
        craft = "{00FF00}Tidak Mendung";
    }
    else
    {
        craft = "{FF0000}Mendung";
    }
    if(FactionMember_GetCount(1, true) > 2 && FactionMember_GetCount(3, true) > 1)
    {
        robberybiz = "{00FF00}Tidak Mendung";
    }
    else
    {
        robberybiz = "{FF0000}Mendung";
    }
    if(FactionMember_GetCount(1, true) > 4 && FactionMember_GetCount(3, true) > 2)
    {
        war = "{00FF00}Tidak Mendung";
    }
    else
    {
        war = "{FF0000}Mendung";
    }

    new ZENN[10000], String[10000];
    strcat(ZENN, "Roleplay\tInstansi\tStatus\n");
    format(String, sizeof(String), "Begal/Scam\t3 KPD & 2 KMD\t%s\n", begal);// 596
    strcat(ZENN, String);
    format(String, sizeof(String), "Crafting/Ladang Illegal\t2 KPD & 1 KMD\t%s\n", craft);// 596
    strcat(ZENN, String);
    format(String, sizeof(String), "Rampok Warung/ATM/Car Stealing\t3 KPD & 2 KMD\t%s\n", robberybiz);// 596
    strcat(ZENN, String);
    format(String, sizeof(String), "Peperangan\t5 KPD & 3 KMD\t%s\n", war); // 599
    strcat(ZENN, String);

    ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_TABLIST_HEADERS,"{00FFA2}Kuyland Roleplay{FFFFFF} - {FFFFFF}Status Mendungung", ZENN, "Tutup","");
    return 1;
}



forward splits(const strsrc[], strdest[][], delimiter);
public splits(const strsrc[], strdest[][], delimiter)
{
	new i, li;
	new aNum;
	new len;
	while(i <= strlen(strsrc)){
		if(strsrc[i]==delimiter || i==strlen(strsrc)){
			len = strmid(strdest[aNum], strsrc, li, i, 128);
			strdest[aNum][len] = 0;
			li = i+1;
			aNum++;
		}
		i++;
	}
	return 1;
}

//drive lic aufa


stock FIXES_valstr(dest[], value, bool:pack = false)
{
    // format can't handle cellmin properly
    static const cellmin_value[] = !"-2147483648";

    if (value == cellmin)
        pack && strpack(dest, cellmin_value, 12) || strunpack(dest, cellmin_value, 12);
    else
        format(dest, 12, "%d", value) && pack && strpack(dest, dest, 12);
}

stock number_format(number)
{
	new i, string[15];
	FIXES_valstr(string, number);
	if(strfind(string, "-") != -1) i = strlen(string) - 4;
	else i = strlen(string) - 3;
	while (i >= 1)
 	{
		if(strfind(string, "-") != -1) strins(string, ",", i + 1);
		else strins(string, ",", i);
		i -= 3;
	}
	return string;
}

public DCC_OnMessageCreate(DCC_Message:message)
{
	new realMsg[100];
    DCC_GetMessageContent(message, realMsg, 100);
    new bool:IsBot;
    new DCC_Channel:g_Discord_Chat;
    g_Discord_Chat = DCC_FindChannelById("1202316095273304094");
    new DCC_Channel:channel;
 	DCC_GetMessageChannel(message, channel);
    new DCC_User:author;
	DCC_GetMessageAuthor(message, author);
    DCC_IsUserBot(author, IsBot);
    if(channel == g_Discord_Chat && !IsBot) //!IsBot will block BOT's message in game
    {
        new user_name[32 + 1], str[152];
       	DCC_GetUserName(author, user_name, 32);
        format(str,sizeof(str), "{8a6cd1}[DISCORD] {aa1bb5}%s: {ffffff}%s", user_name, realMsg);
        SendClientMessageToAll(-1, str);
    }

    return 1;
}

stock GetCS(playerid)
{
 	new astring[48];
 	if(pData[playerid][pCs] == 0)format(astring, sizeof(astring), ""RED_E"None");
	else if(pData[playerid][pCs] == 1)format(astring, sizeof(astring), ""LG_E"Approved");
	return astring;
}

function WaktuKeluar(playerid)
{
 	if(IsValidDynamic3DTextLabel(TagKeluar[playerid]))
  		DestroyDynamic3DTextLabel(TagKeluar[playerid]);
}

function RobWarung(playerid)
{
	new value = 500 + random(500), str[500];
	for(new i = 0; i < MAX_ROBBERY; i++)
	{
  		if(IsPlayerInRangeOfPoint(playerid, 2.3, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]))
		{
			GivePlayerMoneyEx(playerid, value);
			format(str,sizeof(str),"Anda mendapatkan uang ~g~%s", FormatMoney(value));
			SuccesMsg(playerid, str);
			new duet[500];
			format(duet, sizeof(duet), "Received_%sx", FormatMoney(value));
			ShowItemBox(playerid, "Uang", duet, 1212, 2);
		 	ApplyActorAnimation(RobberyData[i][robberyID], "ped", "cower",4.0,0,0,0,1,0);
		 	DeletePVar(playerid, "RobArea");
		 	PlayerPlaySound(playerid, 3401, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]);
		 	if(IsValidDynamic3DTextLabel(RobberyData[i][robberyText]))
		  	DestroyDynamic3DTextLabel(RobberyData[i][robberyText]);
		}
	}
}
function SambutanHilang(playerid)
{
	PlayerTextDrawHide(playerid, SambutanTD[playerid][0]);
	PlayerTextDrawHide(playerid, SambutanTD[playerid][1]);
}
function SambutanMuncul(playerid)
{
    PlayerTextDrawShow(playerid, SambutanTD[playerid][0]);
    new AtmInfo[560];
   	format(AtmInfo,1000,"%s", GetName(playerid));
	PlayerTextDrawSetString(playerid, SambutanTD[playerid][1], AtmInfo);
    PlayerTextDrawShow(playerid, SambutanTD[playerid][1]);
}
function SimpanHp(playerid)
{
    	for(new i = 0; i < 21; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneTD[i]);
		}
		for(new i = 0; i < 13; i++)
		{
			TextDrawHideForPlayer(playerid, APKNAME[i]);
		}
		for(new u = 0; u < 13; u++)
	    {
			PlayerTextDrawHide(playerid, APKLOGO[playerid][u]);
     	}
        TextDrawHideForPlayer(playerid, GPS);
	    TextDrawHideForPlayer(playerid, KONTAK);
		TextDrawHideForPlayer(playerid, AIRDROP);
		TextDrawHideForPlayer(playerid, GOJEK);
		TextDrawHideForPlayer(playerid, MBANKING);
		TextDrawHideForPlayer(playerid, TWITTER);
		TextDrawHideForPlayer(playerid, DARKWEB);
		TextDrawHideForPlayer(playerid, PLAYSTORE);
		TextDrawHideForPlayer(playerid, WHATSAPP);
		TextDrawHideForPlayer(playerid, CALL);
		TextDrawHideForPlayer(playerid, MUSIC);
		TextDrawHideForPlayer(playerid, SETTINGS);
		TextDrawHideForPlayer(playerid, KAMERA);
		TextDrawHideForPlayer(playerid, TUTUPHP);
		TextDrawHideForPlayer(playerid, TANGGAL);
		TextDrawHideForPlayer(playerid, FINGERPRINT);
		TextDrawHideForPlayer(playerid, JAMTD);
		for(new u = 0; u < 3; u++)
        {
			PlayerTextDrawHide(playerid, KONTAKAPP[playerid][u]);
	    }
	    for(new i = 0; i < 21; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneTD[i]);
		}
	    PlayerTextDrawHide(playerid, KONTAKBARU[playerid]);
	    PlayerTextDrawHide(playerid, DAFTARKONTAK[playerid]);
	    for(new u = 0; u < 11; u++)
        {
			PlayerTextDrawHide(playerid, MBANKINGAPP[playerid][u]);
	    }
		PlayerTextDrawHide(playerid, TRANSFER[playerid]);
		PlayerTextDrawHide(playerid, NoRekening[playerid]);
		PlayerTextDrawHide(playerid, BNama[playerid]);
		PlayerTextDrawHide(playerid, BSaldo[playerid]);
		for(new u = 0; u < 12; u++)
        {
			PlayerTextDrawHide(playerid, MUSICAPP[playerid][u]);
	    }
		PlayerTextDrawHide(playerid, EARPHONE[playerid]);
		PlayerTextDrawHide(playerid, BOOMBOX[playerid]);
		for(new u = 0; u < 17; u++)
        {
			PlayerTextDrawHide(playerid, GOJEKAPP[playerid][u]);
	    }
		PlayerTextDrawHide(playerid, GPAY[playerid]);
		PlayerTextDrawHide(playerid, GSALDO[playerid]);
		PlayerTextDrawHide(playerid, GTOPUP[playerid]);
		PlayerTextDrawHide(playerid, GRIDE[playerid]);
		PlayerTextDrawHide(playerid, GSEND[playerid]);
		PlayerTextDrawHide(playerid, GCAR[playerid]);
		PlayerTextDrawHide(playerid, GFOOD[playerid]);
		for(new u = 0; u < 31; u++)
        {
			PlayerTextDrawHide(playerid, PLAYSTOREAPP[playerid][u]);
	    }
		PlayerTextDrawHide(playerid, TWELCOME[playerid]);
		PlayerTextDrawHide(playerid, TLOGIN[playerid]);
		PlayerTextDrawHide(playerid, TLOGOUT[playerid]);
		PlayerTextDrawHide(playerid, TWEET[playerid]);
		PlayerTextDrawHide(playerid, TDAFTAR[playerid]);
		for(new u = 0; u < 4; u++)
        {
			PlayerTextDrawHide(playerid, TWEETAPP[playerid][u]);
	    }
		CancelSelectTextDraw(playerid);
}
public OnGameModeInit()
{


	//  // Panggil fungsi BotStatus() pada saat inisialisasi game mode
    // BotStatus();
    
    // // Atau panggil fungsi BotStatus() secara teratur menggunakan timer
    // SetTimer("BotStatus", 60000, true); // Panggil BotStatus() setiap 60 detik (misalnya)


	speedoball = TextDrawCreate(572.000244, 358.259460, "LD_POOL:ball");
	TextDrawTextSize(speedoball, 48.000000, 54.000000);
	TextDrawAlignment(speedoball, 1);
	TextDrawColor(speedoball, 255);
	TextDrawSetShadow(speedoball, 0);
	TextDrawBackgroundColor(speedoball, 255);
	TextDrawFont(speedoball, 4);
	TextDrawSetProportional(speedoball, 0);
	speedo_timer = SetTimer("speedoupdate", 250, 1);
	for (new playerid = GetPlayerPoolSize(); playerid > -1; playerid--)
	{
		if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) continue;
		speedo[playerid] = CreatePlayerTextDraw(playerid, 596.133483, 379.266845, "0");
		PlayerTextDrawLetterSize(playerid, speedo[playerid], 0.319333, 1.147851);
		PlayerTextDrawAlignment(playerid, speedo[playerid], 2);
		PlayerTextDrawColor(playerid, speedo[playerid], -1);
		PlayerTextDrawSetShadow(playerid, speedo[playerid], 0);
		PlayerTextDrawBackgroundColor(playerid, speedo[playerid], 255);
		PlayerTextDrawFont(playerid, speedo[playerid], 1);
		PlayerTextDrawSetProportional(playerid, speedo[playerid], 1);
	}

	//spedo bulet
	// speedoball = TextDrawCreate(572.000244, 358.259460, "LD_POOL:ball");
	// TextDrawTextSize(speedoball, 48.000000, 54.000000);
	// TextDrawAlignment(speedoball, 1);
	// TextDrawColor(speedoball, 255);
	// TextDrawSetShadow(speedoball, 0);
	// TextDrawBackgroundColor(speedoball, 255);
	// TextDrawFont(speedoball, 4);
	// TextDrawSetProportional(speedoball, 0);

	// speedo_timer = SetTimer("speedoupdate", 250, 1);
	// for (new playerid = GetPlayerPoolSize(); playerid > -1; playerid--)
	// {
	// 	if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) continue;
	// 	speedo[playerid] = CreatePlayerTextDraw(playerid, 596.133483, 379.266845, "0");
	// 	PlayerTextDrawLetterSize(playerid, speedo[playerid], 0.319333, 1.147851);
	// 	PlayerTextDrawAlignment(playerid, speedo[playerid], 2);
	// 	PlayerTextDrawColor(playerid, speedo[playerid], -1);
	// 	PlayerTextDrawSetShadow(playerid, speedo[playerid], 0);
	// 	PlayerTextDrawBackgroundColor(playerid, speedo[playerid], 255);
	// 	PlayerTextDrawFont(playerid, speedo[playerid], 1);
	// 	PlayerTextDrawSetProportional(playerid, speedo[playerid], 1);
	// }
	// AddCharModel(17, 20001, "bmybu.dff", "bmybu.txd");
	JamFivEm = 7;

	SetTimer("TambahDetikFivEM", 4000, true);
	CreateTextDraw();
	
    gstream = SvCreateGStream(0xC2A2DAFF, "DEWA");

	if (gstream == SV_NULL)
		return 1;

	for(new i = 0; i < MAX_PLAYERS; i++)
	{
	    warnings{i} = 0;
	}
	//SetTimer("YANGTIM", 10000, true);
	////////////////////////////////
	//mysql_log(ALL);
	//SetTimer("BackupDB", 60000, true);
	new MySQLOpt: option_id = mysql_init_options();

    DCC_FindChannelById("1202316095273304094"); //
    g_Discord_Serverstatus = DCC_FindChannelById("1202316095273304094");

    //g_Discord_CHENH4X = DCC_FindChannelById("992113672942002187");
    
	mysql_set_option(option_id, AUTO_RECONNECT, true);

	g_SQL = mysql_connect(MYSQL_HOST, MYSQL_USER, MYSQL_PASSWORD, MYSQL_DATABASE, option_id);
	if (g_SQL == MYSQL_INVALID_HANDLE || mysql_errno(g_SQL) != 0)
	{
		print("MySQL connection failed. Server is shutting down.");
		SendRconCommand("exit");
		return 1;
	}
	print("MySQL connection is successful.");

	mysql_tquery(g_SQL, "SELECT * FROM `server`", "LoadServer");
	mysql_tquery(g_SQL, "SELECT * FROM `doors`", "LoadDoors");
	mysql_tquery(g_SQL, "SELECT * FROM `familys`", "LoadFamilys");
	mysql_tquery(g_SQL, "SELECT * FROM `houses`", "LoadHouses");
	mysql_tquery(g_SQL, "SELECT * FROM `bisnis`", "LoadBisnis");
	mysql_tquery(g_SQL, "SELECT * FROM `lockers`", "LoadLockers");
	mysql_tquery(g_SQL, "SELECT * FROM `gstations`", "LoadGStations");
	mysql_tquery(g_SQL, "SELECT * FROM `atms`", "LoadATM");
	mysql_tquery(g_SQL, "SELECT * FROM `gates`", "LoadGates");
	mysql_tquery(g_SQL, "SELECT * FROM `vouchers`", "LoadVouchers");
	//mysql_tquery(g_SQL, "SELECT * FROM `trees`", "LoadTrees");
	//mysql_tquery(g_SQL, "SELECT * FROM `ores`", "LoadOres");
	mysql_tquery(g_SQL, "SELECT * FROM `object`", "Object_Load", "");
    mysql_tquery(g_SQL, "SELECT * FROM `matext`", "Matext_Load", "");
	//mysql_tquery(g_SQL, "SELECT * FROM `plants`", "LoadPlants");
	mysql_tquery(g_SQL, "SELECT * FROM `workshop`", "LoadWorkshop");
	mysql_tquery(g_SQL, "SELECT * FROM `dealership`", "LoadDealership");
	mysql_tquery(g_SQL, "SELECT * FROM `parks`", "LoadGarkot");
	mysql_tquery(g_SQL, "SELECT * FROM `trash`", "LoadTrash");
	mysql_tquery(g_SQL, "SELECT * FROM `speedcameras`", "LoadSpeedCam");
	mysql_tquery(g_SQL, "SELECT * FROM `actor`", "LoadActor");
	mysql_tquery(g_SQL, "SELECT * FROM `vending`", "LoadVending");
	mysql_tquery(g_SQL, "SELECT * FROM `pedagang`", "LoadPedagang");
	mysql_tquery(g_SQL, "SELECT * FROM `farm`", "LoadFarm");
	mysql_tquery(g_SQL, "SELECT * FROM `robbery`", "Loadrobbery");

	ShowNameTags(0);
	//EnableTirePopping(0);
	CreateServerPoint();
	CreateArmsPoint();
	LoadTazerSAPD();
	CreateJoinSmugglerPoint();	
	new garasi;
	garasi = CreateDynamicObject(1316, 1574.9863,-1645.4646,13.5753 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);

	garasi = CreateDynamicObject(1316, 1574.4860,-1640.9458,28.4021 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);

	garasi = CreateDynamicObject(1316, -6.9099,-1724.0741,5.0848 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);

	garasi = CreateDynamicObject(1316, 1375.9167,-1767.8365,13.5781 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);

	garasi = CreateDynamicObject(1316, 1094.4025,1311.0411,10.8203 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);

	garasi = CreateDynamicObject(1316, 645.4379,-1347.6639,13.5469 -0.5, 0.0, 0.0, 0.0, 0, 0, -1, 50.00, 50.00);
	SetDynamicObjectMaterial(garasi, 0, 18646, "matcolours", "white", 0xFFCCCC00);


	
	//CreateDynamicPickup(19134, 23, 1164.004394,-1201.940551,19.837736, -1, -1, -1, 50);
	//CreateDynamic3DTextLabel("| Gudang Kota |\n| Gunakan "LG_E"ALT {FFFFFF}Untuk Akses Gudang |", COLOR_WHITE, 1164.004394,-1201.940551,19.837736, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

   	rusa = CreateObject(19315, -1911.798583,-2382.167480,30.197269,   0.00000, 0.00000, 0.00000);
	    	
	CreateCarStealingPoint();
	AufaMapping();
	
	for (new i; i < sizeof(ColorList); i++) {
    format(color_string, sizeof(color_string), "%s{%06x}%03d %s", color_string, ColorList[i] >>> 8, i, ((i+1) % 16 == 0) ? ("\n") : (""));
    }

    for (new i; i < sizeof(FontNames); i++) {
        format(object_font, sizeof(object_font), "%s%s\n", object_font, FontNames[i]);
    }
	
	SpawnMale = LoadModelSelectionMenu("spawnmale.txt");
	SpawnFemale = LoadModelSelectionMenu("spawnfemale.txt");
	MaleSkins = LoadModelSelectionMenu("maleskin.txt");
	FemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	VIPMaleSkins = LoadModelSelectionMenu("maleskin.txt");
	VIPFemaleSkins = LoadModelSelectionMenu("femaleskin.txt");
	SAPDMale = LoadModelSelectionMenu("sapdmale.txt");
	SAPDFemale = LoadModelSelectionMenu("sapdfemale.txt");
	SAPDWar = LoadModelSelectionMenu("sapdwar.txt");
	SAGSMale = LoadModelSelectionMenu("sagsmale.txt");
	SAGSFemale = LoadModelSelectionMenu("sagsfemale.txt");
	SAMDMale = LoadModelSelectionMenu("samdmale.txt");
	SAMDFemale = LoadModelSelectionMenu("samdfemale.txt");
	SANEWMale = LoadModelSelectionMenu("sanewmale.txt");
	SANEWFemale = LoadModelSelectionMenu("sanewfemale.txt");
	toyslist = LoadModelSelectionMenu("toys.txt");
	viptoyslist = LoadModelSelectionMenu("viptoys.txt");
	vtoylist = LoadModelSelectionMenu("vtoylist.txt");
	PDGSkinMale = LoadModelSelectionMenu("pmale.txt");
	PDGSkinFemale = LoadModelSelectionMenu("pfemale.txt");
	TransFender = LoadModelSelectionMenu("transfender.txt");
	Waa = LoadModelSelectionMenu("waa.txt");
	LoCo = LoadModelSelectionMenu("loco.txt");
	
	ResetCarStealing();
	LoadModsPoint();
	
	//ShowRoomCP = CreateDynamicSphere(1864.952880,878.926574,10.930519, 1.0, 0, 0);
	Healing = CreateDynamicSphere(115.4265,-1860.6697,-0.5300, 30.0, 0, 0);
	JualIkan = CreateDynamicSphere(2798.4680,-1578.8145,10.9858, 2.0, 0, 0);
	JualNambang = CreateDynamicSphere(2798.1953,-1571.1901,11.0391, 2.0, 0, 0);
	JualPetani = CreateDynamicSphere(2799.2314,-1556.5638,11.0114, 2.0, 0, 0);
	JualKayu = CreateDynamicSphere(2799.0505,-1544.9191,11.0521, 2.0, 0, 0);

	new gm[32];
	format(gm, sizeof(gm), "%s", TEXT_GAMEMODE);
	SetGameModeText(gm);
	format(gm, sizeof(gm), "weburl %s", TEXT_WEBURL);
	SendRconCommand(gm);
	format(gm, sizeof(gm), "language %s", TEXT_LANGUAGE);
	SendRconCommand(gm);
	//SendRconCommand("hostname Xero Gaming Roleplay");
	SendRconCommand("mapname ASIA LANE");
	ManualVehicleEngineAndLights();
	EnableStuntBonusForAll(0);
	AllowInteriorWeapons(1);
	DisableInteriorEnterExits();
	LimitPlayerMarkerRadius(1.0);
	SetNameTagDrawDistance(1.0);
	//DisableNameTagLOS();
	ShowPlayerMarkers(PLAYER_MARKERS_MODE_OFF);
	SetWorldTime(WorldTime);
	SetWeather(WorldWeather);
	BlockGarages(.text="NO ENTER");
	//Audio_SetPack("default_pack");	
	CreateDynamicObject(800, 1754.928588,-187.140090,80.490097, 0.000000, 0.000000, 133.731521, -1, -1, -1, 300.00, 300.00);//Kanabis
	CreateDynamicObject(800, 1754.928588,-187.140090,80.490097, 0.000000, 0.000000, 137.313674, -1, -1, -1, 300.00, 300.00);//Kanabis
	CreateDynamicMapIcon(2817.4790,-1577.3334,10.9289, 52, 0, -1, -1, -1, 700.0, -1);//ASIA LANE market
	CreateDynamicMapIcon(1090.4324,1327.5913,10.9787, 10, 0, -1, -1, -1, 700.0, -1);//pedagang
	CreateDynamicMapIcon(1535.3628,-1675.6324,13.3828, 30, 0, -1, -1, -1, 700.0, -1);//polisi
	//------[ PENJAHIT ]-----------
	new str[150];
    // CreateDynamicPickup(1275, 23, 1302.190673,-1876.173828,13.763982, -1, -1, -1, 50);
    // format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membuat Pakaian");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 2313.817382,-2075.185546,17.644004, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    // format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Menjual Pakaian");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, -618.1193,-524.9147,25.6234, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	// format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Mengambil Wool");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 1925.521972,170.046707,37.281250, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	// format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Akses Locker");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 2318.562744,-2070.840576,17.644752, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	// format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membuat Kain");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 2319.573730,-2080.727783,17.692657, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
    // format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membuat Kain");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 2321.482421,-2082.888671,17.652400, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	// format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membuat Kain");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 2317.667236,-2082.262939,17.694538, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	// format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membuat Kain");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 2319.653320,-2084.508544,17.652679, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

    format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Membuat new rek");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 935.6656,-1670.8666,14.0791, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Mengakses bank");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 942.2501,-1667.1718,14.0791, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	//ayam
	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk Onduty Pekerja Ayam");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1377.1400,735.8207,10.8203, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk ambil ayam");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1387.7285,736.9077,10.8203, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk potong ayam");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1393.8392,758.2020,10.9203, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	format(str, sizeof(str), "Tekan "LG_E"ALT {ffffff}Untuk proses paket ayam");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1386.5592,767.5418,10.9203, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	//izin tok dalang
	format(str, sizeof(str), "Pak dalang : Ada apa wahai anak muda?");
	CreateDynamic3DTextLabel(str, COLOR_WHITE, 1298.77,354.929, 19.5617, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);


	//weapon license sapd
	// format(str, sizeof(str), "Gunakan "LG_E"/newweaponlic {ffffff}Untuk Membeli license senjata");
	// CreateDynamic3DTextLabel(str, COLOR_WHITE, 1382.1221,1531.8909,1510.9011, 2.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	//-----[ Toll System ]-----	
	for(new i;i < sizeof(BarrierInfo);i ++)
	{
		new
		Float:X = BarrierInfo[i][brPos_X],
		Float:Y = BarrierInfo[i][brPos_Y];

		ShiftCords(0, X, Y, BarrierInfo[i][brPos_A]+90.0, 3.5);
		CreateDynamicObject(966,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z],0.00000000,0.00000000,BarrierInfo[i][brPos_A]);
		if(!BarrierInfo[i][brOpen])
		{
			gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,90.00000000,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
			MoveObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.75,BARRIER_SPEED,0.0,90.0,BarrierInfo[i][brPos_A]+180);
		}
		else gBarrier[i] = CreateDynamicObject(968,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.8,0.00000000,20.00000000,BarrierInfo[i][brPos_A]+180);
	}

	// 	if(IsPlayerInRangeOfPoint(playerid, 1.5, -607.68,-488.65,25.62))
	// 	if(IsPlayerInRangeOfPoint(playerid, 1.5, 1871.1113,-2423.3376,22.3647))
	// 	if(IsPlayerInRangeOfPoint(playerid, 1.5, 2752.34,2404.45,29.19))
	new strings[500];
	CreateDynamicPickup(1239, 23, 918.1131,-1463.2157,2754.3389, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Kantor Pemerintah]\n{FFFFFF}/buatktp - untuk membuat ktp anda\n{FFFFFF}/sellhouse - untuk menjual rumah anda\n/sellbusiness - untuk menjual bisnis anda");
	CreateDynamic3DTextLabel(strings, COLOR_YELLOW, 918.1131,-1463.2157,2754.3389, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); //

	CreateDynamicPickup(1239, 23, 801.12, -613.77, 16.33, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Sparepart]\n{FFFFFF}/sellpart\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 801.12, -613.77, 16.33, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance
	
	CreateDynamicPickup(1239, 23, 1294.1837, -1267.9083, 20.6199, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Sparepart Shop]\n{FFFFFF}/buysparepart\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1294.1837, -1267.9083, 20.6199, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance

	CreateDynamicPickup(1239, 23, 1160.23, -1299.97, 13.61, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BPJS]\n{FFFFFF}/newbpjs\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1160.23, -1299.97, 13.61, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Veh insurance
	
	CreateDynamicPickup(1239, 23, -607.68, -488.65, 25.62, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Claim Starterpack]\n{FFFFFF}Otot ALT Untuk Claim Starterpack\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, -607.68, -488.65, 25.62, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // POINT CLAIM SP

	CreateDynamicPickup(1239, 23, 2794.25, -2449.40, 13.69, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Claim Starterpack]\n{FFFFFF}Otot ALT Untuk Claim Starterpack\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 2794.25, -2449.40, 13.69, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // POINT CLAIM SP

	CreateDynamicPickup(1239, 23, 1871.1113, -2423.3376, 22.3647, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Claim Starterpack]\n{FFFFFF}Otot ALT Untuk Claim Starterpack\n");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1871.1113, -2423.3376, 22.3647, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // POINT CLAIM SP

	CreateDynamicPickup(1241, 23, 1171.42,-1299.85,13.63, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Rumah Sakit ASIA LANE]\n{BABABA}Tekan "LG_E" ALT {BABABA}untuk membeli perban");
	CreateDynamic3DTextLabel(strings, COLOR_PINK2, 1171.42,-1299.85,13.63, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	CreateDynamicPickup(1241, 23, 919.69,-1463.53,2754.33, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Rumah Sakit ASIA LANE]\n{BABABA}Tekan "LG_E" ALT {BABABA} Untuk Mengambil JOB");
	CreateDynamic3DTextLabel(strings, COLOR_PINK2, 919.69,-1463.53,2754.33, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);

	CreateDynamicPickup(1239, 23, 1171.60,-1298.29,13.63, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Rumah Sakit ASIA LANE]\n{BABABA}Tekan "LG_E" ALT {BABABA}untuk membeli obat stress");
	CreateDynamic3DTextLabel(strings, COLOR_PINK2, 1171.60,-1298.29,13.63, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1);
	
	CreateDynamicPickup(1239, 23, 1571.9326,-1691.6022,16.2153, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Kepolisian ASIA LANE]\n{BABABA}/buyplate - membuat plate kendaraan\n/payticket untuk membayar biaya pelangaran \n/newdrivelic beli lisensi kendaraan");
	CreateDynamic3DTextLabel(strings, COLOR_ARWIN, 1571.9326,-1691.6022,16.2153, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Plate Kota LS
	
	CreateDynamicPickup(1239, 23, 85.0160, 1070.5106, -48.9141, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Ticket]\n{FFFFFF}/payticket - untuk membayar denda");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 85.0160, 1070.5106, -48.9141, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Ticket Kota Dilimore

	CreateDynamicPickup(1239, 23, 1351.8241,1570.7533,1467.6976, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Arrest Point]\n{FFFFFF}/arrest - untuk mengirimkan pelaku ke penjara");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1351.8241,1570.7533,1467.6976, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest

	CreateDynamicPickup(1239, 23, 1364.0143,1577.2247,1468.7877, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[release Area]\n{FFFFFF}/release - Untuk mengeluarkan pelaku dari penjara");
	CreateDynamic3DTextLabel(strings, COLOR_BLUE, 1364.0143,1577.2247,1468.7877, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // arrest
	
	CreateDynamicPickup(1239, 23, 1177.2365,-1309.1824,13.8858, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[Hospital]\n{FFFFFF}/dropinjured");
	CreateDynamic3DTextLabel(strings, COLOR_PINK, 1177.2365,-1309.1824,13.8858, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // hospital
	
	CreateDynamicPickup(1239, 23, 1672.12, -1347.85, 18.21, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[BANK]\n{FFFFFF}/bank - access rekening\n/newrek - new rekening");
	CreateDynamic3DTextLabel(strings, COLOR_LBLUE, 1672.12, -1347.85, 18.21, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // bank
	
	CreateDynamicPickup(1239, 23, 2060.9265,1338.6526,1003.5000, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[IKLAN]\n{FFFFFF}/iklan - Untuk meluncurkan iklan");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 2060.9265,1338.6526,1003.5000, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // iklan

	CreateDynamicPickup(1241, 23, 1341.95, 1575.97, 3010.90, -1, -1, -1, 50);
	format(strings, sizeof(strings), "[MYRICOUS PRODUCTION]\n{FFFFFF}/mix");
	CreateDynamic3DTextLabel(strings, COLOR_ORANGE2, 1341.95, 1575.97, 3010.90, 5.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // racik obat


	
	//-----[ Dynamic Checkpoint ]-----	
	//ShowRoomCP = CreateDynamicCP(1864.9528,878.9265,10.9305, 1.0, -1, -1, -1, 5.0);
	Disnaker = CreateDynamicCP(919.4431,-1463.2151,2754.3389, 1.0, -1, -1, -1, 20.0);
	Kompensasi = CreateDynamicCP(1871.1113,-2423.3376,22.3647, 1.0, -1, -1, -1, 20.0);
	showroom = CreateDynamicCP(1864.952880,878.926574,10.930519, 1.0, -1, -1, -1, 20.0);
	spterminal = CreateDynamicCP(-607.7561,-488.6573,25.6234, 1.0, -1, -1, -1, 20.0);
	Creategunn = CreateDynamicCP(2605.5583,2808.3623,10.8203, 1.0, -1, -1, -1, 20.0);

	//job new
	mulaikerja = CreateDynamicCP(-920.0016,-468.0568,826.8417, 1.0, -1, -1, -1, 20.0);
	ambilbox = CreateDynamicCP(-887.2399,-479.9101,826.8417, 1.0, -1, -1, -1, 20.0);
	ambilbox1 = CreateDynamicCP(-893.2037,-490.6880,826.8417, 1.0, -1, -1, -1, 20.0);
	ambilbox2 = CreateDynamicCP(-898.6295,-500.8337,826.8417, 1.0, -1, -1, -1, 20.0);
	jualdaurulang = CreateDynamicCP(303.7292,-239.4889,1.5781, 1.0, -1, -1, -1, 20.0);

	//pernikahan
	pernikahan = CreateDynamicCP(830.3033,-2066.9246,13.2240, 1.0, -1, -1, -1, 20.0);
	//--------[ ATM CP ]--------------
	atm1 = CreateDynamicCP(1920.387207,-1786.922729,13.546875, 1.0, -1, -1, -1, 5.0);
	atm5 = CreateDynamicCP(1374.6693,-1887.5564,13.5901, 1.0, -1, -1, -1, 5.0);
	atm6 = CreateDynamicCP(1275.9919,-1558.3986,13.5869, 1.0, -1, -1, -1, 5.0);
	atm7 = CreateDynamicCP(1977.7656,-2058.9355,13.5938, 1.0, -1, -1, -1, 5.0);
	asuransi = CreateDynamicCP(1530.5714,-2163.6646,13.6593, 1.0, -1, -1, -1, 5.0);//aufa
	sellpv = CreateDynamicCP(1530.5714,-2159.6865,13.6593, 1.0, -1, -1, -1, 5.0);//aufa
	rentalbike = CreateDynamicCP(1687.043090,-2265.090087,13.481613, 1.0, -1, -1, -1, 5.0);
	rentalkapal = CreateDynamicCP(133.0584,-1832.2073,4.4060, 1.0, -1, -1, -1, 5.0);
	rentalterminal = CreateDynamicCP(-613.6473,-488.6987,25.6234, 1.0, -1, -1, -1, 5.0);
	menumasak = CreateDynamicCP(1090.9022,1318.3073,10.9625, 1.0, -1, -1, -1, 5.0);
	menuminum = CreateDynamicCP(1087.5863,1318.2523,10.9623, 1.0, -1, -1, -1, 5.0);
	menupedagang = CreateDynamicCP(1090.4324,1327.5913,10.9787, 1.0, -1, -1, -1, 5.0);
	rentalpelabuhan = CreateDynamicCP(2766.651367,-2395.744384,13.632812, 1.0, -1, -1, -1, 5.0);
	sppelabuhan = CreateDynamicCP(2754.4788,-2404.3132,29.1975, 1.0, -1, -1, -1, 5.0);
	createlockpick = CreateDynamicCP(1298.77,354.929, 19.5617, 1.0, -1, -1, -1, 5.0);//aufa
	robbank = CreateDynamicCP(945.0869,-1673.9796,14.0791, 1.0, -1, -1, -1, 5.0);//aufa


	//penjahit system aufa 
	lockerpenjahit = CreateDynamicCP(723.4478,-1431.2233,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	ambilwoolaufa = CreateDynamicCP(723.4581,-1435.9750,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	jualbajuaufa = CreateDynamicCP(-620.8550,-524.7370,25.6234, 1.0, -1, -1, -1, 5.0);//aufa

	//buat kain aufa
	buatkainaufa0 = CreateDynamicCP(714.7750,-1421.1039,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa1 = CreateDynamicCP(714.8711,-1424.9688,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa2 = CreateDynamicCP(720.1006,-1424.9679,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa3 = CreateDynamicCP(719.6128,-1421.1041,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa4 = CreateDynamicCP(724.8679,-1421.1099,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa5 = CreateDynamicCP(730.0422,-1421.1041,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa6 = CreateDynamicCP(729.7242,-1424.9524,13.7357, 1.0, -1, -1, -1, 5.0);//aufa
	buatkainaufa7 = CreateDynamicCP(724.8238,-1424.9642,13.7357, 1.0, -1, -1, -1, 5.0);//aufa

	//buat baju aufa
	buatbaju1 = CreateDynamicCP(755.5255,-1417.9779,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju2 = CreateDynamicCP(757.6044,-1417.9346,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju3 = CreateDynamicCP(759.3753,-1417.9081,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju4 = CreateDynamicCP(765.9367,-1417.9703,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju5 = CreateDynamicCP(767.8130,-1417.9327,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju6 = CreateDynamicCP(769.4692,-1417.9061,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju7 = CreateDynamicCP(769.3947,-1421.0533,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju8 = CreateDynamicCP(767.9344,-1421.0813,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju9 = CreateDynamicCP(765.8922,-1421.1176,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju10 = CreateDynamicCP(759.3902,-1421.0529,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju11 = CreateDynamicCP(757.6138,-1421.0841,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju12 = CreateDynamicCP(755.7879,-1421.1200,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju13 = CreateDynamicCP(755.7969,-1434.4711,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju14 = CreateDynamicCP(757.4611,-1434.4398,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju15 = CreateDynamicCP(759.3204,-1434.4069,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju16 = CreateDynamicCP(765.7222,-1434.4736,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju17 = CreateDynamicCP(767.9090,-1434.4369,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju18 = CreateDynamicCP(769.6451,-1434.4025,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju19 = CreateDynamicCP(769.4451,-1437.5538,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju20 = CreateDynamicCP(767.3452,-1437.5817,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju21 = CreateDynamicCP(765.8853,-1437.6173,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju22 = CreateDynamicCP(759.2594,-1437.5554,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju23 = CreateDynamicCP(757.6447,-1437.5839,13.7357, 1.0, -1, -1, -1, 5.0);
	buatbaju24 = CreateDynamicCP(755.7207,-1437.6217,13.7357, 1.0, -1, -1, -1, 5.0);


	//kendaraan fraksi dan gudang
	kendaraansapd = CreateDynamicCP(1574.9863,-1645.4646,13.5753, 2.0, -1, -1, -1, 5.0);
	kendaraanudarasapd = CreateDynamicCP(1578.4910,-1679.2308,27.6454, 2.0, -1, -1, -1, 5.0);
	garasisags = CreateDynamicCP(-6.9099,-1724.0741,5.0848, 2.0, -1, -1, -1, 5.0);
	garasisamd = CreateDynamicCP(1176.9761,-1339.7943,13.9531, 2.0, -1, -1, -1, 5.0);
	garasigojek = CreateDynamicCP(1375.9167,-1767.8365,13.5781, 2.0, -1, -1, -1, 5.0);
	garasipedagang = CreateDynamicCP(1094.4025,1311.0411,10.8203, 2.0, -1, -1, -1, 5.0);
	garasisanews  = CreateDynamicCP(645.4379,-1347.6639,13.5469, 2.0, -1, -1, -1, 5.0);


	kanabis1 = CreateDynamicCP(874.795104,-13.976298,63.195312, 2.0, -1, -1, -1, 5.0);
	kanabis2 = CreateDynamicCP(1775.1582,-167.0989,77.5520, 2.0, -1, -1, -1, 5.0);
	kanabis3 = CreateDynamicCP(1770.9899,-166.8354,78.0667, 2.0, -1, -1, -1, 5.0);

	//MANCINGCP
	mancing1 = CreateDynamicCP(123.1883,-1857.2671,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing2 = CreateDynamicCP(129.5409,-1856.9869,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing3 = CreateDynamicCP(135.7410,-1857.1583,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing4 = CreateDynamicCP(135.7410,-1857.1583,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing5 = CreateDynamicCP(141.4648,-1866.2422,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing6 = CreateDynamicCP(135.7371,-1866.1814,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing7 = CreateDynamicCP(129.4386,-1865.8507,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing8 = CreateDynamicCP(123.4697,-1865.7893,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing9 = CreateDynamicCP(141.5936,-1874.8224,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing10 = CreateDynamicCP(135.7600,-1874.6079,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing11 = CreateDynamicCP(129.6355,-1875.3541,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing12 = CreateDynamicCP(123.4099,-1875.1106,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing13 = CreateDynamicCP(112.1592,-1827.7762,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing14 = CreateDynamicCP(106.4675,-1827.3353,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing15 = CreateDynamicCP(100.2417,-1827.8079,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing16 = CreateDynamicCP(94.1920,-1827.3158,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing17 = CreateDynamicCP(112.1956,-1838.1487,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing18 = CreateDynamicCP(106.4298,-1838.1510,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing19 = CreateDynamicCP(100.1669,-1837.8054,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing20 = CreateDynamicCP(94.1904,-1838.1725,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing21 = CreateDynamicCP(112.4105,-1847.7648,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing22 = CreateDynamicCP(106.5567,-1847.8490,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing23 = CreateDynamicCP(100.1109,-1847.3472,1.3613, 1.0, -1, -1, -1, 5.0);
	mancing24 = CreateDynamicCP(93.9313,-1847.4720,1.3613, 1.0, -1, -1, -1, 5.0);

	umpanaufa = CreateDynamicCP(144.3634,-1829.7277,4.4060, 1.0, -1, -1, -1, 5.0);
	pancingaufa = CreateDynamicCP(144.3639,-1826.1487,4.4060, 1.0, -1, -1, -1, 5.0);

	new DCC_Channel:hidupp, DCC_Embed:logss;
	new yy, m, d, timestamp[200];
	getdate(yy, m , d);
	hidupp = DCC_FindChannelById("1202316095273304094");

	format(timestamp, sizeof(timestamp), "%02i%02i%02i", yy, m, d);
	logss = DCC_CreateEmbed("ASIA LANE ROLEPLAY ");
	DCC_SetEmbedTitle(logss, "ASIA LANE ROLEPLAY ");
	DCC_SetEmbedTimestamp(logss, timestamp);
	DCC_SetEmbedColor(logss, 0xffa500);
	DCC_SetEmbedUrl(logss, "https://asialaneroleplayofficial.web.app");
	DCC_SetEmbedThumbnail(logss, "https://asialaneroleplayofficial.web.app");
	DCC_SetEmbedFooter(logss, "ASIA LANE ROLEPLAY ", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "> Server Asia Lane Telah Online Silahkan memasuki kota dan bersenang-senang Happy Roleplay\n> Server update <#1202223015178555420>\n\n> IP server <#1202223015497039895> \nDihimbau semua warga untuk membaca:\n <#1202223014943399984>\n\n> Jika Menemukan suatu Keganjalan atau BUG Silahkan Report <#1202223017204129847>\n> Mengalami kesulitan? <#1206166423559217172>\n> Menemukan Cheater? <#1202223017204129848>");
	DCC_AddEmbedField(logss, "Server Asia Lane Telah Online", stroi, true);
	DCC_SendChannelEmbedMessage(hidupp, logss);

	printf("[Objects]: %d Loaded.", CountDynamicObjects());
	

	return 1;
}
public OnGameModeExit()
{
	//spedo bulet
	TextDrawDestroy(speedoball);
	KillTimer(speedo_timer);
	for (new playerid = GetPlayerPoolSize(); playerid > -1; playerid--)
	{
		if (!IsPlayerConnected(playerid) || IsPlayerNPC(playerid)) continue;
		PlayerTextDrawDestroy(playerid, spedobodyruq[playerid][0]);
	}
   	print("-------------- [ Auto Gmx ] --------------");
	new count = 0, user = 0;
	foreach(new gsid : GStation)
	{
		if(Iter_Contains(GStation, gsid))
		{
			count++;
			GStation_Save(gsid);
		}
	}
	printf("[Gas Station]: %d Saved.", count);
	
	for (new i = 0, j = GetPlayerPoolSize(); i <= j; i++) 
	{
		if (IsPlayerConnected(i))
		{
			OnPlayerDisconnect(i, 1);
		}
	}
	printf("[Database] User Saved: %d", user);
	print("-------------- [ Auto Gmx ] --------------");
	SendClientMessageToAll(COLOR_RED, "[!]"YELLOW_E" Maaf server dalam pemeliharaan/Restart.{00FFFF} ~ASIA LANE BOTS");

	UnloadTazerSAPD();
	DestroyDynaimcRobBank();
	//Audio_DestroyTCPServer();
	mysql_close(g_SQL);
	
	new DCC_Channel:hidupp, DCC_Embed:logss;
	new yy, m, d, timestamp[200];

	getdate(yy, m , d);
	hidupp = DCC_FindChannelById("1202316095273304094");

	format(timestamp, sizeof(timestamp), "%02i%02i%02i", yy, m, d);
	logss = DCC_CreateEmbed("ASIA LANE ROLEPLAY");
	DCC_SetEmbedTitle(logss, "ASIA LANE ROLEPLAY");
	DCC_SetEmbedTimestamp(logss, timestamp);
	DCC_SetEmbedColor(logss, 0xffa500);
	DCC_SetEmbedUrl(logss, "https://asialaneroleplayofficial.web.app");
	DCC_SetEmbedThumbnail(logss, "https://asialaneroleplayofficial.web.app");
	DCC_SetEmbedFooter(logss, "ASIA LANE ROLEPLAY", "");
	new stroi[5000];
	format(stroi, sizeof(stroi), "> Server ASIA LANE Sedang Dalam Perbaikan.");
	DCC_AddEmbedField(logss, "Server ASIA LANE sedang Dalam Perbaikan, Diharapkan Seluruh Player Keluar Dari Game Untuk Menghindari Masalah Yang Tidak Diinginkan", stroi, true);
	DCC_SendChannelEmbedMessage(hidupp, logss);

	return 1;
}

stock RefreshDGHbec(playerid)
{
	PlayerTextDrawSetPreviewModel(playerid, DGHBEC[playerid], GetVehicleModel(GetPlayerVehicleID(playerid)));
	PlayerTextDrawShow(playerid, DGHBEC[playerid]);
    return 1;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
    if(vehicleid == Car_Job[playerid])
	{
        KillTimer(timer_Car[playerid]);
        Seconds_timer[playerid] = 0;
    }
    if(vehicleid == pData[playerid][pKendaraanKerja])
	{
        KillTimer(KeluarKerja[playerid]);
        TimerKeluar[playerid] = 0;
    }
	if(!ispassenger)
	{
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    new Float:slx, Float:sly, Float:slz;
				GetPlayerPos(playerid, slx, sly, slz);
				SetPlayerPos(playerid, slx, sly, slz);
			    Error(playerid, "Anda bukan SANEWS!");
			}
		}
	}
	return 1;
}

stock SGetName(playerid)
{
    new name[ 64 ];
    GetPlayerName(playerid, name, sizeof( name ));
    return name;
}

public OnPlayerText(playerid, text[])
{
	if(isnull(text)) return 0;
	new str[150];
	format(str,sizeof(str),"[CHAT] %s: %s", GetRPName(playerid), text);
	LogServer("Chat", str);
	printf(str);

	if(pData[playerid][pSpawned] == 0 && pData[playerid][IsLoggedIn] == false)
	{
	    Error(playerid, "You must be spawned or logged in to use chat.");
	    return 0;
	}
	//-----[ Auto RP ]-----	
	if(!strcmp(text, "rpgun", true) || !strcmp(text, "gunrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s lepaskan senjatanya dari sabuk dan siap untuk menembak kapan saja.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcrash", true) || !strcmp(text, "crashrp", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s kaget setelah kecelakaan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfish", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memancing dengan kedua tangannya.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfall", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s jatuh dan merasakan sakit.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpmad", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa kesal dan ingin mengeluarkan amarah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprob", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menggeledah sesuatu dan siap untuk merampok.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcj", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mencuri kendaraan seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpwar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berperang dengan sesorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdie", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s pingsan dan tidak sadarkan diri.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfixmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memperbaiki mesin kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcheckmeka", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memeriksa kondisi kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfight", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s ribut dan memukul seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpcry", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang bersedih dan menangis.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rprun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s berlari dan kabur.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpfear", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa ketakutan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdropgun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meletakkan senjata kebawah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rptakegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s mengamnbil senjata.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpgivegun", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memberikan kendaraan kepada seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpshy", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s merasa malu.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnusuk", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s menusuk dan membunuh seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpharvest", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memanen tanaman.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockhouse", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci rumah.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rplockcar", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s sedang mengunci kendaraan.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpnodong", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memulai menodong seseorang.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpeat", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s makan makanan yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(!strcmp(text, "rpdrink", true))
	{
		SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s meminum minuman yang ia beli.", ReturnName(playerid));
		return 0;
	}
	if(text[0] == '@')
	{
		if(pData[playerid][pSMS] != 0)
		{
			if(pData[playerid][pPhoneCredit] < 1)
			{
				Error(playerid, "Anda tidak memiliki Credit!");
				return 0;
			}
			if(pData[playerid][pInjured] != 0)
			{
				Error(playerid, "Tidak dapat melakukan saat ini.");
				return 0;
			}
			new tmp[512];
			foreach(new ii : Player)
			{
				if(text[1] == ' ')
				{
			 		format(tmp, sizeof(tmp), "%s", text[2]);
				}
				else
				{
				    format(tmp, sizeof(tmp), "%s", text[1]);
				}
				if(pData[ii][pPhone] == pData[playerid][pSMS])
				{
					if(ii == INVALID_PLAYER_ID || !IsPlayerConnected(ii))
					{
						Error(playerid, "Nomor ini tidak aktif!");
						return 0;
					}
					SendClientMessageEx(playerid, COLOR_YELLOW, "[SMS to %d]"WHITE_E" %s", pData[playerid][pSMS], tmp);
					SendClientMessageEx(ii, COLOR_YELLOW, "[SMS from %d]"WHITE_E" %s", pData[playerid][pPhone], tmp);
					PlayerPlaySound(ii, 6003, 0,0,0);
					pData[ii][pSMS] = pData[playerid][pPhone];
					
					pData[playerid][pPhoneCredit] -= 1;
					return 0;
				}
			}
		}
	}
	if(pData[playerid][pCall] != INVALID_PLAYER_ID)
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		format(lstr, sizeof(lstr), "[CellPhone] %s says: %s", ReturnName(playerid), text);
		ProxDetector(10, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
		SetPlayerChatBubble(playerid, text, COLOR_WHITE, 10.0, 3000);
		SendClientMessageEx(pData[playerid][pCall], COLOR_YELLOW, "[CELLPHONE] "WHITE_E"%s.", text);
		return 0;
	}
	else
	{
		// Anti-Caps
		if(GetPVarType(playerid, "Caps"))
			UpperToLower(text);
		new lstr[1024];
		if(!IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		{
			if(pData[playerid][pAdminDuty] == 1)
			{
				if(strlen(text) > 64)
				{
					SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %.64s ..", ReturnName(playerid), text);
					SendNearbyMessage(playerid, 20.0, COLOR_WHITE, ".. %s ))", text[64]);
					return 0;
				}
				else
				{
					SendNearbyMessage(playerid, 20.0, COLOR_RED, "%s:"WHITE_E" (( %s ))", ReturnName(playerid), text);
					return 0;
				}
			}
			new dc[128];
			format(dc, sizeof(dc),  "```\n[CHAT] %s: %s```", ReturnName(playerid), text);
			SendDiscordMessage(2, dc);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 50, 2184.32, -1023.32, 1018.68))
		{
			if(pData[playerid][pAdmin] < 1)
			{
				format(lstr, sizeof(lstr), "[OOC ZONE] %s: (( %s ))", ReturnName(playerid), text);
				ProxDetector(40, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			}
			else if(pData[playerid][pAdmin] > 1 || pData[playerid][pHelper] > 1)
			{
				format(lstr, sizeof(lstr), "[OOC ZONE] %s: %s", pData[playerid][pAdminname], text);
				ProxDetector(40, playerid, lstr, 0xE6E6E6E6, 0xC8C8C8C8, 0xAAAAAAAA, 0x8C8C8C8C, 0x6E6E6E6E);
			}
		}
		return 0;
	}
}

public OnPlayerCommandPerformed(playerid, cmd[], params[], result, flags)
{
    new str[1500];
    if (result == -1)
    {
	    format(str,sizeof(str),"Perintah ~y~/%s ~w~Tidak Ditemukan Gunakan ~y~/help", cmd);
		ErrorMsg(playerid, str);
        return 0;
    }
	
	format(str,sizeof(str),"[CMD] %s: [%s] [%s]", GetRPName(playerid), cmd, params);
	LogServer("Command", str);
	printf(str);
	new dc[128];
	format(dc, sizeof(dc),  "```\n[CMD] %s: [%s] [%s]```", GetRPName(playerid), cmd);
	SendDiscordMessage(1, dc);
    return 1;
}

public OnPlayerCommandReceived(playerid, cmd[], params[], flags)
{
	return 1;
}

stock ShowTdDeath(playerid)
{
	PlayerTextDrawShow(playerid, Text_Player[playerid][0]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][1]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][2]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][3]);
	PlayerTextDrawShow(playerid, Text_Player[playerid][4]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][5]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][6]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][7]);
    PlayerTextDrawShow(playerid, Text_Player[playerid][8]);
    return 1;
}
stock HideTdDeath(playerid)
{
	PlayerTextDrawHide(playerid, Text_Player[playerid][0]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][1]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][2]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][3]);
	PlayerTextDrawHide(playerid, Text_Player[playerid][4]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][5]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][6]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][7]);
    PlayerTextDrawHide(playerid, Text_Player[playerid][8]);
    return 1;
}

public OnPlayerConnect(playerid)
{	
	/*new str[1000];
    format(str, sizeof(str), "%s[%d]", GetName(playerid), playerid);
    playerID[playerid] = Create3DTextLabel(str, 0xDB881AFF, 0, 0, 0, 10, 0);
    Attach3DTextLabelToPlayer(playerID[playerid], playerid, 0.0, 0.0, 0.1);*/

	new nametag[500];
	format(nametag, sizeof(nametag), "{BABABA}[%i] {BABABA}%s\n{FFFFFF}%s", playerid, pData[playerid][pUCP]);
	playerID[playerid] = CreateDynamic3DTextLabel(nametag, 0xFFFFFFFF, 0.0, 0.0, 0.1, NT_DISTANCE, .attachedplayer = playerid, .testlos = 1);

	pData[playerid][pTogName] = 1;
	
	//logo aufa
	TextDrawShowForPlayer(playerid, NAMESERVERBARU[0]);
	TextDrawShowForPlayer(playerid, NAMESERVERBARU[1]);
	TextDrawShowForPlayer(playerid, NAMESERVERBARU[2]);
	TextDrawShowForPlayer(playerid, NAMESERVERBARU[3]);
	TextDrawShowForPlayer(playerid, NAMESERVERBARU[4]);
	TextDrawShowForPlayer(playerid, NAMESERVERBARU[5]);

   	if(IsValidDynamic3DTextLabel(pData[playerid][AdminTag]))
       DestroyDynamic3DTextLabel(pData[playerid][AdminTag]);
              
    if(IsValidDynamic3DTextLabel(TagKeluar[playerid]))
  		DestroyDynamic3DTextLabel(TagKeluar[playerid]);
  		
    PakaiSenjata[playerid] = 0;
    CreateProgress(playerid);
    CreatePlayerInv(playerid);
	// CreateNotifyruq(playerid);
    PlayerInfo[playerid][pSelectItem] = 0;
    for (new i = 0; i != MAX_INVENTORY; i ++)
	{
	    InventoryData[playerid][i][invExists] = false;
	    InventoryData[playerid][i][invModel] = 0;
	}
	Player_EditVehicleObject[playerid] = -1;
    Player_EditVehicleObjectSlot[playerid] = -1;
    Player_EditingObject[playerid] = 0;

    JOB[playerid] = 0;
    inJOB[playerid] = 0;
	warnings{playerid} = 0;
	SendClientCheck(playerid, 0x48, 0, 0, 2);
	new PlayerIP[16], country[MAX_COUNTRY_LENGTH], city[MAX_CITY_LENGTH];
	g_MysqlRaceCheck[playerid]++;
	pemainic++;
	AntiBHOP[playerid] = 0;
	IsAtEvent[playerid] = 0;
	takingselfie[playerid] = 0;
	pData[playerid][pDriveLicApp] = 0;
	//AntiCheat
	pData[playerid][pJetpack] = 0;
	pData[playerid][pLastUpdate] = 0;
	pData[playerid][pArmorTime] = 0;
	pData[playerid][pACTime] = 0;
	pData[playerid][pToggleBank] = 0;
	//Anim
	pData[playerid][pLoopAnim] = 0;
	//Rob
	pData[playerid][pLastChop] = 0;
	//seatblet
	PlayerInfo[playerid][pSeatbelt] = 0;
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pActivityTime] = 0;
	//

	ClearAnimations(playerid);

	ResetVariables(playerid);
	RemoveMappingAufa(playerid);
	CreatePlayerTextDraws(playerid);
	//OnPlayerFinishedDownloading(playerid);
	// SpeedoUpdate(playerid);



	GetPlayerName(playerid, pData[playerid][pUCP], MAX_PLAYER_NAME);
	GetPlayerIp(playerid, PlayerIP, sizeof(PlayerIP));
	pData[playerid][pIP] = PlayerIP;
	pData[playerid][pID] = playerid;
    InterpolateCameraPos(playerid, 356.1173,-2017.6241,59.5162, 199.0929,-1919.1708,39.9441, 3000);
	InterpolateCameraLookAt(playerid, 356.1173,-2017.6241,59.5162, 199.0929,-1919.1708,39.9441, 3000);

	GetPlayerCountry(playerid, country, MAX_COUNTRY_LENGTH);
	GetPlayerCity(playerid, city, MAX_CITY_LENGTH);
	
	SetTimerEx("SafeLogin", 1000, 0, "i", playerid);
	//Prose Load Data
	new query[103];
	mysql_format(g_SQL, query, sizeof query, "SELECT * FROM `playerucp` WHERE `ucp` = '%e' LIMIT 1", pData[playerid][pUCP]);
	mysql_pquery(g_SQL, query, "OnPlayerDataLoaded", "dd", playerid, g_MysqlRaceCheck[playerid]);
	SetPlayerColor(playerid, COLOR_WHITE);

	pData[playerid][activitybar] = CreatePlayerProgressBar(playerid, 273.500000, 157.333541, 88.000000, 8.000000, 5930683, 100, 0);
	

	//HBE textdraw Simple
	pData[playerid][pInjuredLabel] = CreateDynamic3DTextLabel("", COLOR_ORANGE, 0.0, 0.0, -0.3, 10, .attachedplayer = playerid, .testlos = 1);

    if(pData[playerid][pHead] < 0) return pData[playerid][pHead] = 20;

    if(pData[playerid][pPerut] < 0) return pData[playerid][pPerut] = 20;

    if(pData[playerid][pRFoot] < 0) return pData[playerid][pRFoot] = 20;

    if(pData[playerid][pLFoot] < 0) return pData[playerid][pLFoot] = 20;

    if(pData[playerid][pLHand] < 0) return pData[playerid][pLHand] = 20;
   
    if(pData[playerid][pRHand] < 0) return pData[playerid][pRHand] = 20;
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	//spedo bulet
	PlayerTextDrawDestroy(playerid, spedobodyruq[playerid][0]);
	spedobodyruq[playerid][0] = PlayerText:0xFFFF;
	//id atas pala
	Delete3DTextLabel(playerID[playerid]);
    DelHunter(playerid);
	if (lstream[playerid])
    {
        SvDeleteStream(lstream[playerid]);
        lstream[playerid] = SV_NULL;
    }
    if(pData[playerid][pJob] == 1)
	{
	    DeleteBusCP(playerid);
	    Sopirbus--;
	}
	else if(pData[playerid][pJob] == 2)
	{
    	tukangayam--;
    	DeletePemotongCP(playerid);
	}
	else if(pData[playerid][pJob] == 3)
	{
    	tukangtebang--;
		DeletePenebangCP(playerid);
	}
	else if(pData[playerid][pJob] == 4)
	{
	    DeleteMinyakCP(playerid);
    	penambangminyak--;
	}
	else if(pData[playerid][pJob] == 5)
	{
	    DeleteJobPemerahMap(playerid);
    	pemerah--;
	}
	else if(pData[playerid][pJob] == 6)
	{
    	penambang--;
    	DeletePenambangCP(playerid);
	}
	else if(pData[playerid][pJob] == 7)
	{
	    DeletePetaniCP(playerid);
    	petani--;
	}
	else if(pData[playerid][pJob] == 8)
	{
    	Trucker--;
    	DeleteKargoCP(playerid);
	}
	else if(pData[playerid][pJob] == 10)
	{
    	penjahit--;
	}

	explosive{playerid} = false;
	//////////
	warnings{playerid} = 0;

	pemainic--;

	SetPlayerName(playerid, pData[playerid][pUCP]);
	//Pengganti IsValidTimer
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pActivityTime] = 0;
	

	DestroyDynamic3DTextLabel(pData[playerid][pInjuredLabel]);

	pData[playerid][pDriveLicApp] = 0;
	pData[playerid][pSpawnList] = 0;
	takingselfie[playerid] = 0;

	TogglePhone[playerid] = 0;
	ToggleSid[playerid] = 0;
	ToggleCall[playerid] = 0;
	DetikCall[playerid] = 0;
	MenitCall[playerid] = 0;
	JamCall[playerid] = 0;
	//KillTimer(Unload_Timer[playerid]);
	
	if(IsPlayerInAnyVehicle(playerid))
	{
        RemovePlayerFromVehicle(playerid);
    }
	if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   		DestroyVehicle(pData[playerid][pKendaraanFraksi]);
   	
    if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
   		DestroyVehicle(pData[playerid][pKendaraanKerja]);
   		
    if(IsValidVehicle(pData[playerid][pTrailer]))
   		DestroyVehicle(pData[playerid][pTrailer]);

	g_MysqlRaceCheck[playerid]++;

	if(pData[playerid][pFaction] == 3)
	{
		emsdikota--;
	}
	if(pData[playerid][pFaction] == 1)
	{
		polisidikota--;
	}
	if(pData[playerid][pFaction] == 7)
	{
		bengkeldikota--;
	}
	if(pData[playerid][pFaction] == 6)
	{
		gojekdikota--;
	}
	if(pData[playerid][pFaction] == 5)
	{
		pedagangdikota--;
	}
	if(pData[playerid][pFaction] == 4)
	{
		reporterdikota--;
	}
	if(pData[playerid][pLagiDealer] == 1)	
	{
		delaydealer = false;
	}
	
	if(pData[playerid][IsLoggedIn] == true)
	{

		UpdatePlayerData(playerid);
		RemovePlayerVehicle(playerid);
		Report_Clear(playerid);
		Ask_Clear(playerid);

		KillTazerTimer(playerid);
		if(IsValidVehicle(pData[playerid][pTrailer]))
			DestroyVehicle(pData[playerid][pTrailer]);

		pData[playerid][pTrailer] = INVALID_VEHICLE_ID;
		if(IsAtEvent[playerid] == 1)
		{
			if(GetPlayerTeam(playerid) == 1)
			{
				if(EventStarted == 1)
				{
					RedTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 2)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 1)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							RedTeam = 0;
						}
					}
				}
			}
			if(GetPlayerTeam(playerid) == 2)
			{
				if(EventStarted == 1)
				{
					BlueTeam -= 1;
					foreach(new ii : Player)
					{
						if(GetPlayerTeam(ii) == 1)
						{
							GivePlayerMoneyEx(ii, EventPrize);
							Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
						else if(GetPlayerTeam(ii) == 2)
						{
							Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
							SetPlayerPos(ii, pData[ii][pPosX], pData[ii][pPosY], pData[ii][pPosZ]);
							pData[playerid][pHospital] = 0;
							ClearAnimations(ii);
							BlueTeam = 0;
						}
					}
				}
			}
			SetPlayerTeam(playerid, 0);
			IsAtEvent[playerid] = 0;
			pData[playerid][pInjured] = 0;
			pData[playerid][pSpawned] = 1;
			UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
	    }
		if(pData[playerid][pRobLeader] == 1)
		{
			foreach(new ii : Player) 
			{
				if(pData[ii][pMemberRob] > 1)
				{
					Servers(ii, "* Pemimpin Perampokan anda telah keluar! [ MISI GAGAL ]");
					pData[ii][pMemberRob] = 0;
					RobMember = 0;
					pData[ii][pRobLeader] = 0;
					ServerMoney += robmoney;
				}
			}
		}
		if(pData[playerid][pMemberRob] == 1)
		{
			pData[playerid][pMemberRob] = 0;
			foreach(new ii : Player) 
			{
				if(pData[ii][pRobLeader] > 1)
				{
					Servers(ii, "* Member berkurang 1");
					pData[ii][pMemberRob] -= 1;
					RobMember -= 1;
				}
			}
		}
	}
	
	if(IsValidDynamic3DTextLabel(pData[playerid][pAdoTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pAdoTag]);

    if(IsValidDynamic3DTextLabel(pData[playerid][pBTag]))
            DestroyDynamic3DTextLabel(pData[playerid][pBTag]);
			
	if(IsValidDynamicObject(pData[playerid][pFlare]))
            DestroyDynamicObject(pData[playerid][pFlare]);
    

    pData[playerid][pAdoActive] = false;
	

	if (pData[playerid][LoginTimer])
	{
		KillTimer(pData[playerid][LoginTimer]);
		pData[playerid][LoginTimer] = 0;
	}

	pData[playerid][IsLoggedIn] = false;
	
	new Float:x, Float:y, Float:z, strings[500];
	GetPlayerPos(playerid, x, y, z);

	new reasontext[526];
	switch(reason)
	{
	    case 0: reasontext = "Timeout/ Crash";
	    case 1: reasontext = "Quit";
	    case 2: reasontext = "Kicked/ Banned";
	}
	format(strings, sizeof(strings), "[%s | %s (%d) Telah Keluar Dari Kota\nAlasan: [%s]", pData[playerid][pName], pData[playerid][pUCP], playerid, reasontext);
	TagKeluar[playerid] = CreateDynamic3DTextLabel(strings, 0xC6E2FFFF, x, y, z, 15.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1); // Text Jika Player Disconnect
 	SetTimerEx("WaktuKeluar", 10000, false, "d", playerid);
	new dc[100];
	format(dc, sizeof(dc),  "```\nNama: %s Telah keluar dari kota ASIA LANE\nUcp: %s\nReason: %s.```", pData[playerid][pName], pData[playerid][pUCP], reasontext);
	SendDiscordMessage(0, dc);
	return 1;
}

function Register(playerid)
{
    for(new i = 0; i < 34; i++)
	{ 
		PlayerTextDrawShow(playerid, RegisterErn[playerid][i]);
	}
	PlayerTextDrawShow(playerid, KLIKMALE[playerid]);
	PlayerTextDrawShow(playerid, KLIKFEMALE[playerid]);
	for(new idx; idx < 10; idx++) PlayerTextDrawHide(playerid, LoginErn[playerid][idx]);
	SelectTextDraw(playerid, COLOR_BLUE);
	return 1;
}
function pilihanspawn(playerid)
{
    for(new i = 0; i < 14; i++)
	{
		TextDrawShowForPlayer(playerid, SpawnErn[i]);
	}
	//TextDrawHideForPlayer(playerid, Spawnaufa[12]);
	SelectTextDraw(playerid, COLOR_BLUE);
	return 1;
}
public OnPlayerSpawn(playerid)
{
	StopAudioStreamForPlayer(playerid);
	SetPlayerInterior(playerid, pData[playerid][pInt]);
	SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
	SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
	SetCameraBehindPlayer(playerid);
	TogglePlayerControllable(playerid, 0);
	SetPlayerSpawn(playerid);
	LoadAnims(playerid);
	ClearChat(playerid);
 	
	vpara[playerid]=0;
	
	SetPlayerSkillLevel(playerid, WEAPON_COLT45, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SILENCED, 1);
	SetPlayerSkillLevel(playerid, WEAPON_DEAGLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGUN, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SAWEDOFF, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SHOTGSPA, 1);
	SetPlayerSkillLevel(playerid, WEAPON_UZI, 1);
	SetPlayerSkillLevel(playerid, WEAPON_MP5, 1);
	SetPlayerSkillLevel(playerid, WEAPON_AK47, 1);
	SetPlayerSkillLevel(playerid, WEAPON_M4, 1);
	SetPlayerSkillLevel(playerid, WEAPON_TEC9, 1);
	SetPlayerSkillLevel(playerid, WEAPON_RIFLE, 1);
	SetPlayerSkillLevel(playerid, WEAPON_SNIPER, 1);
 	new dc[100];
	format(dc, sizeof(dc),  "```\nNama: %s Telah memasuki kota ASIA LANE\nUcp: %s\nNegara: Indonesian.```", pData[playerid][pName], pData[playerid][pUCP]);
	SendDiscordMessage(0, dc);
	return 1;
}

SetPlayerSpawn(playerid)
{
	if(IsPlayerConnected(playerid))
	{
	    if(pData[playerid][pGender] == 0)
		{
			TogglePlayerControllable(playerid,0);
			SetPlayerHealth(playerid, 100.0);
			SetPlayerArmour(playerid, 0.0);
			SetPlayerPos(playerid, 2823.21,-2440.34,12.08);
			SetPlayerCameraPos(playerid,1058.544433, -1086.021362, 41);
			SetPlayerCameraLookAt(playerid,1055.534057, -1082.029296, 39.802570);
			SetPlayerVirtualWorld(playerid, 0);
		}
		else
		{
			SetPlayerColor(playerid, COLOR_WHITE);
			CheckPlayerSpawn3Titik(playerid);
			if(pData[playerid][pHBEMode] == 1) //simple
			{
				for(new i = 0; i < 9; i++)
				{
					PlayerTextDrawShow(playerid, HbeBaru[playerid][i]);
				}
				for(new idx; idx < 9; idx++) TextDrawShowForPlayer(playerid, HUDAUFA[idx]);
				PlayerTextDrawShow(playerid, LAPARBAR[playerid]);
				PlayerTextDrawShow(playerid, HAUSBAR[playerid]);
				PlayerTextDrawShow(playerid, STRESBAR[playerid]);
			}

			// if(pData[playerid][pHBEMode] == 1)
			// {
			// 	for(new i = 0; i < 9; i++)
			// 	{
			// 		PlayerTextDrawShow(playerid, HbeBaru[playerid][i]);
			// 	}
			// 	for(new idx; idx < 9;  idx++) TextdrawShowForplayer(playerid, VOICERUQQ[playerid][idx]);
			// 	PlayerTextDrawShow(playerid, VOICERUQQ[playerid]);
			// }


			CheckPlayerSpawn3Titik(playerid);
			SetPlayerSkin(playerid, pData[playerid][pSkin]);
			if(pData[playerid][pOnDuty] >= 1)
			{
				SetPlayerSkin(playerid, pData[playerid][pFacSkin]);
				SetFactionColor(playerid);
			}
			if(pData[playerid][pAdminDuty] > 0)
			{
				SetPlayerColor(playerid, COLOR_RED);
			}
			SetTimerEx("SpawnTimer", 6000, false, "i", playerid);
		}
	}
}

function SpawnTimer(playerid)
{
	ResetPlayerMoney(playerid);
	GivePlayerMoney(playerid, pData[playerid][pMoney]);
	SetPlayerScore(playerid, pData[playerid][pLevel]);
	SetPlayerHealth(playerid, pData[playerid][pHealth]);
	SetPlayerArmour(playerid, pData[playerid][pArmour]);
	pData[playerid][pSpawned] = 1;
	TogglePlayerControllable(playerid, 1);
	SetCameraBehindPlayer(playerid);
	AttachPlayerToys(playerid);
	SetWeapons(playerid);
	if(pData[playerid][pJail] > 0)
	{
		JailPlayer(playerid); 
	}
	if(pData[playerid][pArrestTime] > 0)
	{
		SetPlayerArrest(playerid, pData[playerid][pArrest]);
	}
	//anti fakespawn aufa
	// if(GetPlayerScore(playerid) < 1)
	// {
	// 	KickEx(playerid);//jika player menggunakan fakespawn biasanya ia bakal kedetet score nya adalah 0 atau null, maka jika si player score/levelnya 0 maka akan ke kick otomatis oleh system
	// 	return 1;
	// }
	// //variable untuk get skin player
	// new skinid;
	// if(pData[playerid][skinid] = 0)
	// {
	// 	KickEx(playerid);//jika player menggunakan skin cj maka akan ke kick otomatis oleh system
	// 	return 1;
	// }
	return 1;
}
public OnPlayerRequestClass(playerid, classid)
{
    InterpolateCameraPos(playerid, 356.1173,-2017.6241,59.5162, 199.0929,-1919.1708,39.9441, 3000);
	InterpolateCameraLookAt(playerid, 356.1173,-2017.6241,59.5162, 199.0929,-1919.1708,39.9441, 3000);
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	KickEx(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
	if(killerid != INVALID_PLAYER_ID)
	{
		new reasontext[526];
		switch(reason)
		{
	        case 0: reasontext = "Fist";
	        case 1: reasontext = "Brass Knuckles";
	        case 2: reasontext = "Golf Club";
	        case 3: reasontext = "Nite Stick";
	        case 4: reasontext = "Knife";
	        case 5: reasontext = "Basebal Bat";
	        case 6: reasontext = "Shovel";
	        case 7: reasontext = "Pool Cue";
	        case 8: reasontext = "Katana";
	        case 9: reasontext = "Chain Shaw";
	        case 14: reasontext = "Cane";
	        case 18: reasontext = "Molotov";
	        case 22..24: reasontext = "Pistol";
	        case 25..27: reasontext = "Shotgan";
	        case 28..34: reasontext = "Laras long";
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
		new h, m, s;
		new day, month, year;
	    gettime(h, m, s);
	    getdate(year,month,day);

        new dc[128];
        format(dc, sizeof dc, "```%02d.%02d.%d - %02d:%02d:%02d```\n```\n%s [ID: %d] killed %s [ID: %d] (%s)\n```",day, month, year, h, m, s, pData[killerid][pName], killerid, pData[playerid][pName], playerid, reasontext);
        SendDiscordMessage(9, dc);
	}
    else
	{
		new reasontext[526];
		switch(reason)
		{
	        case 0: reasontext = "Fist";
	        case 1: reasontext = "Brass Knuckles";
	        case 2: reasontext = "Golf Club";
	        case 3: reasontext = "Nite Stick";
	        case 4: reasontext = "Knife";
	        case 5: reasontext = "Basebal Bat";
	        case 6: reasontext = "Shovel";
	        case 7: reasontext = "Pool Cue";
	        case 8: reasontext = "Katana";
	        case 9: reasontext = "Chain Shaw";
	        case 14: reasontext = "Cane";
	        case 18: reasontext = "Molotov";
	        case 22..24: reasontext = "Pistol";
	        case 25..27: reasontext = "Shotgan";
	        case 28..34: reasontext = "Laras long";
		    case 49: reasontext = "Rammed by Car";
		    case 50: reasontext = "Helicopter blades";
		    case 51: reasontext = "Explosion";
		    case 53: reasontext = "Drowned";
		    case 54: reasontext = "Splat";
		    case 255: reasontext = "Suicide";
		}
	    new h, m, s;
	    new day, month, year;
	    gettime(h, m, s);
	    getdate(year,month,day);
	    new name[MAX_PLAYER_NAME + 1];
	    GetPlayerName(playerid, name, sizeof name);

	    new dc[128];
	    format(dc, sizeof dc, "```%02d.%02d.%d - %02d:%02d:%02d```\n```\n%s [ID: %d] death(%s)\n```",day, month, year, h, m, s, name, playerid, reasontext);
	    SendDiscordMessage(9, dc);
	}

	DeletePVar(playerid, "UsingSprunk");
	SetPVarInt(playerid, "GiveUptime", -1);
	pData[playerid][pSpawned] = 0;

	pData[playerid][CarryProduct] = 0;
	pData[playerid][CarryPart] = 0;
	pData[playerid][pProductingStatus] = 0;
	pData[playerid][pPemotongStatus] = 0;
	pData[playerid][pPartStatus] = 0;
	pData[playerid][pCookingStatus] = 0;
	pData[playerid][pMechanicStatus] = 0;
	pData[playerid][pActivityStatus] = 0;
	pData[playerid][pArmsDealerStatus] = 0;
	pData[playerid][pFillStatus] = 0;
	
	KillTimer(pData[playerid][pActivity]);
	KillTimer(pData[playerid][pMechanic]);
	KillTimer(pData[playerid][pProducting]);
	KillTimer(pData[playerid][pCooking]);
	KillTimer(pData[playerid][pPemotong]);
	KillTimer(pData[playerid][pCheckpointTarget]);
	KillTimer(pData[playerid][pPart]);
	HidePlayerProgressBar(playerid, pData[playerid][activitybar]);
	PlayerTextDrawHide(playerid, ActiveTD[playerid]);
	pData[playerid][pMechVeh] = INVALID_VEHICLE_ID;
	pData[playerid][pActivityTime] = 0;
	
	pData[playerid][pMechDuty] = 0;
	pData[playerid][pMission] = -1;
	
	pData[playerid][pSideJob] = 0;
	DisablePlayerCheckpoint(playerid);
	DisablePlayerRaceCheckpoint(playerid);
	SetPlayerColor(playerid, COLOR_WHITE);
	RemovePlayerAttachedObject(playerid, 9);
	GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
	UpdatePlayerData(playerid);
    if(IsAtEvent[playerid] == 1)
    {
    	SetPlayerPos(playerid, 1474.65, -1736.36, 13.38);
    	SetPlayerVirtualWorld(playerid, 0);
    	SetPlayerInterior(playerid, 0);
    	ClearAnimations(playerid);
    	ResetPlayerWeaponsEx(playerid);
       	SetPlayerColor(playerid, COLOR_WHITE);
    	if(GetPlayerTeam(playerid) == 1)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		RedTeam -= 1;
    	}
    	else if(GetPlayerTeam(playerid) == 2)
    	{
    		Servers(playerid, "Anda sudah terkalahkan");
    		BlueTeam -= 1;
    	}
    	if(BlueTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 1)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 2)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    		}
    	}
    	if(RedTeam == 0)
    	{
    		foreach(new ii : Player)
    		{
    			if(GetPlayerTeam(ii) == 2)
    			{
    				GivePlayerMoneyEx(ii, EventPrize);
    				Servers(ii, "Selamat, Tim Anda berhasil memenangkan Event dan Mendapatkan Hadiah $%d per orang", EventPrize);
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				BlueTeam = 0;
    			}
    			else if(GetPlayerTeam(ii) == 1)
    			{
    				Servers(ii, "Maaf, Tim anda sudah terkalahkan, Harap Coba Lagi lain waktu");
    				pData[playerid][pHospital] = 0;
    				ClearAnimations(ii);
    				RedTeam = 0;
    			}
    		}
    	}
    	SetPlayerTeam(playerid, 0);
    	IsAtEvent[playerid] = 0;
    	pData[playerid][pInjured] = 0;
    	pData[playerid][pSpawned] = 1;
		UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
    }
    if(IsAtEvent[playerid] == 0)
    {
    	new asakit = RandomEx(0, 5);
    	new bsakit = RandomEx(0, 9);
    	new csakit = RandomEx(0, 7);
    	new dsakit = RandomEx(0, 6);
    	pData[playerid][pLFoot] -= dsakit;
    	pData[playerid][pLHand] -= bsakit;
    	pData[playerid][pRFoot] -= csakit;
    	pData[playerid][pRHand] -= dsakit;
    	pData[playerid][pHead] -= asakit;
    }
	return 1;
}

public OnPlayerEditAttachedObject(playerid, response, index, modelid, boneid, Float:fOffsetX, Float:fOffsetY, Float:fOffsetZ, Float:fRotX, Float:fRotY, Float:fRotZ,Float:fScaleX, Float:fScaleY, Float:fScaleZ)
{
	new weaponid = EditingWeapon[playerid];
    if(weaponid)
    {
        if(response == 1)
        {
            new enum_index = weaponid - 22, weaponname[18], string[340];
 
            GetWeaponName(weaponid, weaponname, sizeof(weaponname));
           
            WeaponSettings[playerid][enum_index][Position][0] = fOffsetX;
            WeaponSettings[playerid][enum_index][Position][1] = fOffsetY;
            WeaponSettings[playerid][enum_index][Position][2] = fOffsetZ;
            WeaponSettings[playerid][enum_index][Position][3] = fRotX;
            WeaponSettings[playerid][enum_index][Position][4] = fRotY;
            WeaponSettings[playerid][enum_index][Position][5] = fRotZ;
 
            RemovePlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid));
            SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
 
            Servers(playerid, "You have successfully adjusted the position of your %s.", weaponname);
           
            mysql_format(g_SQL, string, sizeof(string), "INSERT INTO weaponsettings (Owner, WeaponID, PosX, PosY, PosZ, RotX, RotY, RotZ) VALUES ('%d', %d, %.3f, %.3f, %.3f, %.3f, %.3f, %.3f) ON DUPLICATE KEY UPDATE PosX = VALUES(PosX), PosY = VALUES(PosY), PosZ = VALUES(PosZ), RotX = VALUES(RotX), RotY = VALUES(RotY), RotZ = VALUES(RotZ)", pData[playerid][pID], weaponid, fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ);
            mysql_tquery(g_SQL, string);
        }
		else if(response == 0)
		{
			new enum_index = weaponid - 22;
			SetPlayerAttachedObject(playerid, GetWeaponObjectSlot(weaponid), GetWeaponModel(weaponid), WeaponSettings[playerid][enum_index][Bone], fOffsetX, fOffsetY, fOffsetZ, fRotX, fRotY, fRotZ, 1.0, 1.0, 1.0);
		}
        EditingWeapon[playerid] = 0;
		return 1;
    }
	else
	{
		if(response == 1)
		{
			InfoTD_MSG(playerid, 4000, "~g~~h~Toy Position Updated~y~!");

			pToys[playerid][index][toy_x] = fOffsetX;
			pToys[playerid][index][toy_y] = fOffsetY;
			pToys[playerid][index][toy_z] = fOffsetZ;
			pToys[playerid][index][toy_rx] = fRotX;
			pToys[playerid][index][toy_ry] = fRotY;
			pToys[playerid][index][toy_rz] = fRotZ;
			pToys[playerid][index][toy_sx] = fScaleX;
			pToys[playerid][index][toy_sy] = fScaleY;
			pToys[playerid][index][toy_sz] = fScaleZ;
			
			MySQL_SavePlayerToys(playerid);
		}
		else if(response == 0)
		{
			InfoTD_MSG(playerid, 4000, "~r~~h~Selection Cancelled~y~!");

			SetPlayerAttachedObject(playerid,
				index,
				modelid,
				boneid,
				pToys[playerid][index][toy_x],
				pToys[playerid][index][toy_y],
				pToys[playerid][index][toy_z],
				pToys[playerid][index][toy_rx],
				pToys[playerid][index][toy_ry],
				pToys[playerid][index][toy_rz],
				pToys[playerid][index][toy_sx],
				pToys[playerid][index][toy_sy],
				pToys[playerid][index][toy_sz]);
		}
		SetPVarInt(playerid, "UpdatedToy", 1);
		TogglePlayerControllable(playerid, true);
	}
	return 1;
}

public OnPlayerEditDynamicObject(playerid, STREAMER_TAG_OBJECT: objectid, response, Float:x, Float:y, Float:z, Float:rx, Float:ry, Float:rz)
{
	if(Player_EditingObject[playerid])
	{
		if (response == EDIT_RESPONSE_FINAL)
		{
			new
                vehicleid = Player_EditVehicleObject[playerid],
                vehid = GetPlayerVehicleID(playerid),
                slot = Player_EditVehicleObjectSlot[playerid],
                Float:vx,
                Float:vy,
                Float:vz,
                Float:va,
                Float:real_x,
                Float:real_y,
                Float:real_z,
                Float:real_a
            ;

            GetVehiclePos(vehid, vx, vy, vz);
            GetVehicleZAngle(vehid, va); // Coba lagi

            real_x = x - vx;
            real_y = y - vy;
            real_z = z - vz;
            real_a = rz - va;

            new Float:v_size[3];
            GetVehicleModelInfo(pvData[vehicleid][cModel], VEHICLE_MODEL_INFO_SIZE, v_size[0], v_size[1], v_size[2]);
            if(	(real_x >= v_size[0] || -v_size[0] >= real_x) ||
                (real_y >= v_size[1] || -v_size[1] >= real_y) ||
                (real_z >= v_size[2] || -v_size[2] >= real_z))
            {
                SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"Posisi object terlal jauh dari body kendaraan.");
                ResetEditing(playerid);
                return 1;
            }

            VehicleObjects[vehicleid][slot][vehObjectPosX] = real_x;
            VehicleObjects[vehicleid][slot][vehObjectPosY] = real_y;
            VehicleObjects[vehicleid][slot][vehObjectPosZ] = real_z;
            VehicleObjects[vehicleid][slot][vehObjectPosRX] = rx;
            VehicleObjects[vehicleid][slot][vehObjectPosRY] = ry;
            VehicleObjects[vehicleid][slot][vehObjectPosRZ] = real_a;
		
			Streamer_UpdateEx(playerid, VehicleObjects[vehicleid][slot][vehObjectPosX], VehicleObjects[vehicleid][slot][vehObjectPosY], VehicleObjects[vehicleid][slot][vehObjectPosZ]);
			if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_BODY)
			{
				SetDynamicObjectMaterial(VehicleObjects[vehicleid][slot][vehObject], 0, VehicleObjects[vehicleid][slot][vehObjectModel], "none", "none", RGBAToARGB(ColorList[VehicleObjects[vehicleid][slot][vehObjectColor]]));
			}
			else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_TEXT)
			{
				SetDynamicObjectMaterialText(VehicleObjects[vehicleid][slot][vehObject], 0, VehicleObjects[vehicleid][slot][vehObjectText], 130, VehicleObjects[vehicleid][slot][vehObjectFont], VehicleObjects[vehicleid][slot][vehObjectFontSize], 1, RGBAToARGB(ColorList[VehicleObjects[vehicleid][slot][vehObjectFontColor]]), 0, OBJECT_MATERIAL_TEXT_ALIGN_CENTER);
			}
			AttachDynamicObjectToVehicle(VehicleObjects[vehicleid][slot][vehObject], pvData[vehicleid][cVeh], real_x, real_y, real_z, rx, ry, real_a);
        	Vehicle_ObjectUpdate(vehicleid, slot);
            Vehicle_ObjectSave(vehicleid, slot);
			
            if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_BODY)
            {
                Dialog_Show(playerid, VACCSE, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nChange Color\nRemove Modification\nSave", "Pilih", "Kembali");
            }
            else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_TEXT)
            {
                Dialog_Show(playerid, VACCSE1, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nText Name\nText Size\nText Font\nText Color\nRemove Modification\nSave", "Pilih", "Kembali");
            }
            else if(VehicleObjects[vehicleid][slot][vehObjectType] == OBJECT_TYPE_LIGHT)
            {
                Dialog_Show(playerid, VACCSE2, DIALOG_STYLE_LIST, "Edit Component", "Position\nPosition (Manual)\nRemove Modification\nSave", "Pilih", "Kembali");
            }
			return 1;
		}

		if(response == EDIT_RESPONSE_CANCEL)
		{
			ResetEditing(playerid);
			return 1;
		}
	}
    if (response == EDIT_RESPONSE_FINAL)
	{
		if (EditingObject[playerid] != -1 && ObjectData[EditingObject[playerid]][objExists])
	    {
			ObjectData[EditingObject[playerid]][objPos][0] = x;
			ObjectData[EditingObject[playerid]][objPos][1] = y;
			ObjectData[EditingObject[playerid]][objPos][2] = z;
			ObjectData[EditingObject[playerid]][objPos][3] = rx;
			ObjectData[EditingObject[playerid]][objPos][4] = ry;
			ObjectData[EditingObject[playerid]][objPos][5] = rz;

			Object_Refresh(EditingObject[playerid]);
			Object_Save(EditingObject[playerid]);

			SendClientMessageEx(playerid, COLOR_WHITE, "OBJECT: {FFFFFF}You've edited the position of Object ID: %d.", EditingObject[playerid]);
	    }
		else if (EditingMatext[playerid] != -1 && MatextData[EditingMatext[playerid]][mtExists])
	    {
			MatextData[EditingMatext[playerid]][mtPos][0] = x;
			MatextData[EditingMatext[playerid]][mtPos][1] = y;
			MatextData[EditingMatext[playerid]][mtPos][2] = z;
			MatextData[EditingMatext[playerid]][mtPos][3] = rx;
			MatextData[EditingMatext[playerid]][mtPos][4] = ry;
			MatextData[EditingMatext[playerid]][mtPos][5] = rz;

			Matext_Refresh(EditingMatext[playerid]);
			Matext_Save(EditingMatext[playerid]);

			SendClientMessageEx(playerid, COLOR_WHITE, "MATEXT: {FFFFFF}You've edited the position of Material Text ID: %d.", EditingMatext[playerid]);
	    }

	    
	}
	if(pData[playerid][EditingATMID] != -1 && Iter_Contains(ATMS, pData[playerid][EditingATMID]))
	{
		if(response == EDIT_RESPONSE_FINAL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        AtmData[etid][atmX] = x;
	        AtmData[etid][atmY] = y;
	        AtmData[etid][atmZ] = z;
	        AtmData[etid][atmRX] = rx;
	        AtmData[etid][atmRY] = ry;
	        AtmData[etid][atmRZ] = rz;

	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);

			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_X, AtmData[etid][atmX]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Y, AtmData[etid][atmY]);
			Streamer_SetFloatData(STREAMER_TYPE_3D_TEXT_LABEL, AtmData[etid][atmLabel], E_STREAMER_Z, AtmData[etid][atmZ] + 0.3);

		    Atm_Save(etid);
	        pData[playerid][EditingATMID] = -1;
	    }

	    if(response == EDIT_RESPONSE_CANCEL)
	    {
	        new etid = pData[playerid][EditingATMID];
	        SetDynamicObjectPos(objectid, AtmData[etid][atmX], AtmData[etid][atmY], AtmData[etid][atmZ]);
	        SetDynamicObjectRot(objectid, AtmData[etid][atmRX], AtmData[etid][atmRY], AtmData[etid][atmRZ]);
	        pData[playerid][EditingATMID] = -1;
	    }
	}
	if(pData[playerid][gEditID] != -1 && Iter_Contains(Gates, pData[playerid][gEditID]))
	{
		new id = pData[playerid][gEditID];
		if(response == EDIT_RESPONSE_UPDATE)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
		}
		else if(response == EDIT_RESPONSE_CANCEL)
		{
			SetDynamicObjectPos(objectid, gPosX[playerid], gPosY[playerid], gPosZ[playerid]);
			SetDynamicObjectRot(objectid, gRotX[playerid], gRotY[playerid], gRotZ[playerid]);
			gPosX[playerid] = 0; gPosY[playerid] = 0; gPosZ[playerid] = 0;
			gRotX[playerid] = 0; gRotY[playerid] = 0; gRotZ[playerid] = 0;
			Servers(playerid, " You have canceled editing gate ID %d.", id);
			Gate_Save(id);
		}
		else if(response == EDIT_RESPONSE_FINAL)
		{
			SetDynamicObjectPos(objectid, x, y, z);
			SetDynamicObjectRot(objectid, rx, ry, rz);
			if(pData[playerid][gEdit] == 1)
			{
				gData[id][gCX] = x;
				gData[id][gCY] = y;
				gData[id][gCZ] = z;
				gData[id][gCRX] = rx;
				gData[id][gCRY] = ry;
				gData[id][gCRZ] = rz;
				if(IsValidDynamic3DTextLabel(gData[id][gText])) DestroyDynamic3DTextLabel(gData[id][gText]);
				new str[64];
				format(str, sizeof(str), "Gate ID: %d", id);
				gData[id][gText] = CreateDynamic3DTextLabel(str, COLOR_WHITE, gData[id][gCX], gData[id][gCY], gData[id][gCZ], 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 0, -1, -1, -1, 10.0);
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's closing position.", id);
				gData[id][gStatus] = 0;
				Gate_Save(id);
			}
			else if(pData[playerid][gEdit] == 2)
			{
				gData[id][gOX] = x;
				gData[id][gOY] = y;
				gData[id][gOZ] = z;
				gData[id][gORX] = rx;
				gData[id][gORY] = ry;
				gData[id][gORZ] = rz;
				
				pData[playerid][gEditID] = -1;
				pData[playerid][gEdit] = 0;
				Servers(playerid, " You have finished editing gate ID %d's opening position.", id);

				gData[id][gStatus] = 1;
				Gate_Save(id);
			}
		}
	}
	return 1;
}

public DoGMX()
{
	SendRconCommand("gmx");
	return 1;
}
function StressBerkurang(playerid)
{
	pData[playerid][pBladder] --;
}

public OnPlayerLeaveDynamicArea(playerid, areaid)
{
	if(areaid == Healing)
	{
	    InfoMsg(playerid, "Anda telah meninggalkan tempat healing");
	    pData[playerid][TempatHealing] = false;
	    KillTimer(stresstimer[playerid]);
	}
}

forward OnPlayerEnterDynamicArea(playerid, areaid);
public OnPlayerEnterDynamicArea(playerid, areaid)
{
	if(areaid == Healing)
	{
	    InfoMsg(playerid, "Anda memasukin tempat healing");
        pData[playerid][TempatHealing] = true;
	}
	if(areaid == JualIkan)
	{
	    Altruqtd(playerid, "Untuk menjual ikan", 5);
	}
	if(areaid == JualNambang)
	{
	    Altruqtd(playerid, "Untuk menjual hasil nambang", 5);
	}
	if(areaid == JualPetani)
	{
	    Altruqtd(playerid, "Untuk menjual hasil tani/ternak", 5);
	}
	if(areaid == JualKayu)
	{
	    Altruqtd(playerid, "Untuk menjual hasil nebang kayu", 5);
	}
	
}

public OnPlayerLeaveDynamicCP(playerid, checkpointid)
{
	if(checkpointid == rentalbike)
	{
	    HideAltruq(playerid);
	}
	if(checkpointid == rentalterminal)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == rentalkapal)
	{
		HideAltruq(playerid);
	}
	// if(checkpointid == atm3)
	// {
	// 	HideAltruq(playerid);
	// }
	if(checkpointid == Disnaker)
	{
        HideAltruq(playerid);
	}
	if(checkpointid == Creategunn)
	{
        HideAltruq(playerid);
	}
	if(checkpointid == pernikahan)
	{
        HideAltruq(playerid);
	}
	if(checkpointid == Kompensasi)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == showroom)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == spterminal)
	{
		HideAltruq(playerid);
	}	
	if(checkpointid == jualdaurulang)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == mulaikerja)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == ambilbox)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == ambilbox1)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == ambilbox2)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == nyortir)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == daurulang)
	{
		HideAltruq(playerid);
	}

	if(checkpointid == BusArea[playerid][BusCp])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == BusArea[playerid][BusCpBaru])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][LockerPemotong])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][AmbilAyam])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam2])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam3])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][PackingAyam2])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PemotongArea[playerid][PackingAyam])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PenambangArea[playerid][LockerTambang])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PenambangArea[playerid][Nambang])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PenambangArea[playerid][CuciBatu])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PenambangArea[playerid][Peleburan])
	{
        HideAltruq(playerid);
	}
	if(checkpointid == PenebangArea[playerid][LockerNebang])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PenebangArea[playerid][Nebang])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == PenebangArea[playerid][ProsesKayu])
	{
		HideAltruq(playerid);
	}
	if(checkpointid == MinyakArea[playerid][OlahMinyak])
	{
	    HideAltruq(playerid);
	}
	if(checkpointid == MinyakArea[playerid][LockerTambang])
	{
	    HideAltruq(playerid);
	}
	if(checkpointid == PemerahCP)
	{
		HideAltruq(playerid);
	}
	if(checkpointid == MinyakArea[playerid][Nambangg])
	{
	    HideAltruq(playerid);
	}
	if(checkpointid == MinyakArea[playerid][Nambang])
	{
	    HideAltruq(playerid);
	}
}

public OnPlayerEnterDynamicCP(playerid, checkpointid)
{
    if(checkpointid == KargoArea[playerid][Kargo])
	{
		Altruqtd(playerid, "Mulai Tugas Kargo", 5);
	}
	// if(checkpointid == atm2)
	// {
	// 	Altruqtd(playerid, "Menggunakan Atm", 5);
	// }
	/*if(checkpointid == gudangkota)
	{
		Altruqtd(playerid, "Mengakses Gudang Kota", 5);
	}*/
	//kanabis
	if(checkpointid == kanabis1)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	if(checkpointid == kanabis2)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	if(checkpointid == kanabis3)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	if(checkpointid == kanabis1)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	if(checkpointid == kanabis1)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	if(checkpointid == kanabis1)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	if(checkpointid == kanabis1)
	{
		Altruqtd(playerid, "Untuk Mengambil kanabis", 5);
	}
	//garasi pemerintah
	if(checkpointid == garasisags)
	{
		Altruqtd(playerid, "Mengakses Garasi Pemerintah", 5);
	}
	if(checkpointid == garasigojek)
	{
		Altruqtd(playerid, "Mengakses Garasi Gojek", 5);
	}
	if(checkpointid == kendaraansapd)
	{
		Altruqtd(playerid, "Mengakses Garasi Kepolisian", 5);
	}
	if(checkpointid == garasipedagang)
	{
		Altruqtd(playerid, "Mengakses Garasi pedagang", 5);
	}
	if(checkpointid == garasisanews)
	{
		Altruqtd(playerid, "Mengakses Garasi sanews", 5);
	}
	if(checkpointid == kendaraanudarasapd)
	{
		Altruqtd(playerid, "Mengakses Garasi udara Kepolisian", 5);
	}
	if(checkpointid == garasisamd)
	{
		Altruqtd(playerid, "Mengakses Garasi Tenaga Medis", 5);
	}
	if(checkpointid == rentalbike)
	{
		Altruqtd(playerid, "Merental sepeda", 5);
	}
	//aufa five em
	if(checkpointid == createlockpick)
	{
		Altruqtd(playerid, "Ambil kunci dari pak dalang", 5);
	}
	if(checkpointid == robbank)
	{
		Altruqtd(playerid, "untuk melakukan robbank", 5);
	}
	if(checkpointid == rentalterminal)
	{
		Altruqtd(playerid, "Merental sepeda", 5);
	}
	if(checkpointid == rentalkapal)
	{
		Altruqtd(playerid, "Merental kapal", 5);
	}
	if(checkpointid == menumasak)
	{
		Altruqtd(playerid, "Melihat Menu Masakan", 5);
	}
	if(checkpointid == menuminum)
	{
		Altruqtd(playerid, "Mengambil minuman", 5);
	}
	if(checkpointid == menupedagang)
	{
		Altruqtd(playerid, "Melihat menu pedagang", 5);
	}
	if(checkpointid == rentalpelabuhan)
	{
		Altruqtd(playerid, "Merental sepeda", 5);
	}
	if(checkpointid == mancing1)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing2)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing3)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing4)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing5)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing6)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing7)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing8)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing9)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing10)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing11)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing12)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing13)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing14)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing15)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing16)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing17)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing18)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing19)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing20)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing21)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing22)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing23)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	if(checkpointid == mancing24)
	{
		Altruqtd(playerid, "Untuk Memancing Ikan", 5);
	}
	//mancing aufa
	if(checkpointid == umpanaufa)
	{
		Altruqtd(playerid, "Untuk Membeli umpan", 5);
	}
	if(checkpointid == pancingaufa)
	{
		Altruqtd(playerid, "Untuk Membeli pancingan", 5);
	}
	if(checkpointid == sppelabuhan)
	{
		Altruqtd(playerid, "Untuk mengambil starterpack", 5);
	}
	//penjahit aufa
	if(checkpointid == lockerpenjahit)
	{
		Altruqtd(playerid, "Untuk on duty penjahit", 5);
	}
	if(checkpointid == ambilwoolaufa)
	{
		Altruqtd(playerid, "Untuk ambil wool", 5);
	}
	if(checkpointid == jualbajuaufa)
	{
		Altruqtd(playerid, "Untuk menjual baju", 5);
	}
	//buat kain
	if(checkpointid == buatkainaufa0)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa1)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa2)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa3)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa4)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa5)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa6)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	if(checkpointid == buatkainaufa7)
	{
		Altruqtd(playerid, "Untuk membuat kain", 5);
	}
	//buat baju aufa
	if(checkpointid == buatbaju1)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju2)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju3)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju4)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju5)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju6)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju7)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju8)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju9)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju10)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju11)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju12)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju13)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju14)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju15)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju16)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju17)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju18)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju19)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju20)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju21)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju22)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju23)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == buatbaju24)
	{
		Altruqtd(playerid, "Untuk membuat baju", 5);
	}
	if(checkpointid == atm1)
	{
		Altruqtd(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm5)
	{
		Altruqtd(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm7)
	{
		Altruqtd(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == atm6)
	{
		Altruqtd(playerid, "Menggunakan Atm", 5);
	}
	if(checkpointid == asuransi)
	{
		Altruqtd(playerid, "Mengakses Asuransi", 5);
	}
	if(checkpointid == sellpv)
	{
		Altruqtd(playerid, "untuk menjual kendaraan", 5);
	}
	if(checkpointid == Disnaker)
	{
		Altruqtd(playerid, "Untuk Ambil Job", 5);
	}
	if(checkpointid == pernikahan)
	{
		Altruqtd(playerid, "Untuk mengambil makanan", 5);
	}
	if(checkpointid == Creategunn)
	{
		Altruqtd(playerid, "Untuk membuat Gun", 5);
	}
	if(checkpointid == Kompensasi)
	{
		Altruqtd(playerid, "Untuk Mengambil Starterpack", 5);
	}
	if(checkpointid == showroom)
	{
		Altruqtd(playerid, "Untuk Membeli kendaraan", 5);
	}
	if(checkpointid == spterminal)
	{
		Altruqtd(playerid, "Untuk Mengambil Starterpack", 5);
	}
	//job new aufa
	if(checkpointid == mulaikerja)
	{
		Altruqtd(playerid, "Untuk Memulai kerja recycler", 5);
	}
	if(checkpointid == ambilbox)
	{
		Altruqtd(playerid, "Untuk Mengambil box", 5);
	}
	if(checkpointid == ambilbox1)
	{
		Altruqtd(playerid, "Untuk Mengambil box", 5);
	}
	if(checkpointid == ambilbox2)
	{
		Altruqtd(playerid, "Untuk Mengambil box", 5);
	}
	if(checkpointid == nyortir)
	{
		Altruqtd(playerid, "Untuk Menyortir box", 5);
	}
	if(checkpointid == daurulang)
	{
		Altruqtd(playerid, "Untuk Mendaur ulang", 5);
	}
	if(checkpointid == jualdaurulang)
	{
		Altruqtd(playerid, "Untuk menjual hasil daur ulang", 5);
	}
	// if(checkpointid == ShowRoomCP)
	// {
	// 	ShowPlayerDialog(playerid, DIALOG_BUYPVCP, DIALOG_STYLE_LIST, "ASIA LANE - Showroom", "Sepeda Motor\nMobil\nMobil Sport", "Pilih", "Batal");
	// }
	if(checkpointid == BusArea[playerid][BusCp])
	{
		Altruqtd(playerid, "Untuk memulai pekerjaan bus", 5);
	}
	if(checkpointid == BusArea[playerid][BusCpBaru])
	{
		Altruqtd(playerid, "Untuk memulai pekerjaan bus", 5);
	}
	if(checkpointid == PemotongArea[playerid][AmbilAyam])
	{
		Altruqtd(playerid, "Untuk Memulai Mengambil Ayam", 5);
	}
	if(checkpointid == PetaniArea[playerid][LockerTani])
	{
		Altruqtd(playerid, "Untuk Membeli Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][PembuatanJadiApa])
	{
		Altruqtd(playerid, "Untuk Memproses Bahan Tani", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamTani])
	{
		Altruqtd(playerid, "Untuk Menanam Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamLagi])
	{
		Altruqtd(playerid, "Untuk Menanam Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamJuga])
	{
		Altruqtd(playerid, "Untuk Menanam Bibit", 5);
	}
	if(checkpointid == PetaniArea[playerid][NanamAja])
	{
		Altruqtd(playerid, "Untuk Menanam Bibit", 5);
	}
	if(checkpointid == PemotongArea[playerid][AmbilAyamHidup])
	{
		Altruqtd(playerid, "Untuk Mengambil Ayam", 5);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam])
	{
		Altruqtd(playerid, "Untuk Memotong Ayam", 5);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam2])
	{
		Altruqtd(playerid, "Untuk Memotong Ayam", 5);
	}
	if(checkpointid == PemotongArea[playerid][PotongAyam3])
	{
		Altruqtd(playerid, "Untuk Memotong Ayam", 5);
	}
	if(checkpointid == PemotongArea[playerid][PackingAyam2])
	{
		Altruqtd(playerid, "Untuk Packing Ayam", 5);
	}
	if(checkpointid == PemotongArea[playerid][PackingAyam])
	{
		Altruqtd(playerid, "Untuk Packing Ayam", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang])
	{
		Altruqtd(playerid, "Untuk Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang2])
	{
		Altruqtd(playerid, "Untuk Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang3])
	{
		Altruqtd(playerid, "Untuk Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang4])
	{
		Altruqtd(playerid, "Untuk Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang5])
	{
		Altruqtd(playerid, "Untuk Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][Nambang6])
	{
		Altruqtd(playerid, "Untuk Memulai Menambang", 5);
	}
	if(checkpointid == PenambangArea[playerid][CuciBatu])
	{
		Altruqtd(playerid, "Untuk Mencuci Batu", 5);
	}
	if(checkpointid == PenambangArea[playerid][Peleburan])
	{
		Altruqtd(playerid, "Untuk Meleburkan Batu", 5);
	}
	if(checkpointid == PenebangArea[playerid][Nebang])
	{
		Altruqtd(playerid, "Untuk Menggergaji Pohon", 5);
	}
	if(checkpointid == PenebangArea[playerid][Nebang1])
	{
		Altruqtd(playerid, "Untuk Menggergaji Pohon", 5);
	}
	if(checkpointid == PenebangArea[playerid][Nebang2])
	{
		Altruqtd(playerid, "Untuk Menggergaji Pohon", 5);
	}
	if(checkpointid == PenebangArea[playerid][Nebang3])
	{
		Altruqtd(playerid, "Untuk Menggergaji Pohon", 5);
	}
	if(checkpointid == PenebangArea[playerid][Nebang4])
	{
		Altruqtd(playerid, "Untuk Menggergaji Pohon", 5);
	}
	if(checkpointid == PenebangArea[playerid][ProsesKayu])
	{
		Altruqtd(playerid, "Untuk Memproses Pohon", 5);
	}
	if(checkpointid == PenebangArea[playerid][ProsesKayu1])
	{
		Altruqtd(playerid, "Untuk Memproses Pohon", 5);
	}
	if(checkpointid == MinyakArea[playerid][OlahMinyak])
	{
	    Altruqtd(playerid, "Untuk Olah Minyak", 5);
	}
	if(checkpointid == PemerahCP)
	{
		Altruqtd(playerid, "Untuk Akses ~p~Locker", 5);
	}
	if(checkpointid == MinyakArea[playerid][Nambangg])
	{
	    Altruqtd(playerid, "Untuk Ambil Minyak", 5);
	}
	if(checkpointid == MinyakArea[playerid][Nambang])
	{
	    Altruqtd(playerid, "Untuk Ambil Minyak", 5);
	}
	return 1;
}
public OnPlayerLeaveCheckpoint(playerid)
{
    new vehicleid = GetPlayerVehicleID(playerid);
	if(pData[playerid][pBus] && GetVehicleModel(vehicleid) == 431)
	{
		pData[playerid][pBuswaiting] = false;
		HideAltruq(playerid);
	}
	return 1;
}
public OnPlayerEnterRaceCheckpoint(playerid)
{
	switch(pData[playerid][pCheckPoint])
	{
		case CHECKPOINT_BUS:
		{
			if(pData[playerid][pJob] == 1)
			{
				new vehicleid = GetPlayerVehicleID(playerid);
				if(GetVehicleModel(vehicleid) == 431)
				{
					if(pData[playerid][pBus] == 1)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 2;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint2, buspoint2, 5.0);
					}
					else if(pData[playerid][pBus] == 2)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 3;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint3, buspoint3, 5.0);
					}
					else if(pData[playerid][pBus] == 3)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 4;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint4, buspoint4, 5.0);
					}
					else if(pData[playerid][pBus] == 4)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 5;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint5, buspoint5, 5.0);
					}
					else if(pData[playerid][pBus] == 5)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 6;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint6, buspoint6, 5.0);
					}
					else if(pData[playerid][pBus] == 6)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 7;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint7, buspoint7, 5.0);
					}
					else if(pData[playerid][pBus] == 7)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 8;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint8, buspoint8, 5.0);
					}
					else if(pData[playerid][pBus] == 8)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 9;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint9, buspoint9, 5.0);
					}
					else if(pData[playerid][pBus] == 9)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 10;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint10, buspoint10, 5.0);
					}
					else if(pData[playerid][pBus] == 10)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 11;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint11, buspoint11, 5.0);
					}
					else if(pData[playerid][pBus] == 11)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 12;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint12, buspoint12, 5.0);
					}
					else if(pData[playerid][pBus] == 12)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 13;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint13, buspoint13, 5.0);
					}
					else if(pData[playerid][pBus] == 13)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 14;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint14, buspoint14, 5.0);
					}
					else if(pData[playerid][pBus] == 14)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 15;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint15, buspoint15, 5.0);
					}
					else if(pData[playerid][pBus] == 15)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1965.075073,-1779.868530,13.479113);
					}
					else if(pData[playerid][pBus] == 16)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 17;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint17, buspoint17, 5.0);
					}
					else if(pData[playerid][pBus] == 17)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 18;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint18, buspoint18, 5.0);
					}
					else if(pData[playerid][pBus] == 18)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 19;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint19, buspoint19, 5.0);
					}
					else if(pData[playerid][pBus] == 19)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 20;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint20, buspoint20, 5.0);
					}
					else if(pData[playerid][pBus] == 20)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 21;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint21, buspoint21, 5.0);
					}
					else if(pData[playerid][pBus] == 21)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 22;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint22, buspoint22, 5.0);
					}
					else if(pData[playerid][pBus] == 22)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 23;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint23, buspoint23, 5.0);
					}
					else if(pData[playerid][pBus] == 23)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 24;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint24, buspoint24, 5.0);
					}
					else if(pData[playerid][pBus] == 24)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 25;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint25, buspoint25, 5.0);
					}
					else if(pData[playerid][pBus] == 25)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 26;
						SetPlayerRaceCheckpoint(playerid, 2, buspoint26, buspoint26, 5.0);
					}
					else if(pData[playerid][pBus] == 26)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 2763.975097,-2479.834228,13.575368);
					}
					else if(pData[playerid][pBus] == 27)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 28;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint28, buspoint28, 5.0);
					}
					else if(pData[playerid][pBus] == 28)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 29;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint29, buspoint29, 5.0);
					}
					else if(pData[playerid][pBus] == 29)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 30;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint30, buspoint30, 5.0);
					}
					else if(pData[playerid][pBus] == 30)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 31;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint31, buspoint31, 5.0);
					}
					else if(pData[playerid][pBus] == 31)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 32;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint32, buspoint32, 5.0);
					}
					else if(pData[playerid][pBus] == 32)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 33;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint33, buspoint33, 5.0);
					}
					else if(pData[playerid][pBus] == 33)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 34;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint34, buspoint34, 5.0);
					}
					else if(pData[playerid][pBus] == 34)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 35;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint35, buspoint35, 5.0);
					}
					else if(pData[playerid][pBus] == 35)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 36;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint36, buspoint36, 5.0);
					}
					else if(pData[playerid][pBus] == 36)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 37;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint37, buspoint37, 5.0);
					}
					else if(pData[playerid][pBus] == 37)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 38;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint38, buspoint38, 5.0);
					}
					else if(pData[playerid][pBus] == 38)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 39;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint39, buspoint39, 5.0);
					}
					else if(pData[playerid][pBus] == 39)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 40;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint40, buspoint40, 5.0);
					}
					else if(pData[playerid][pBus] == 40)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 41;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint41, buspoint41, 5.0);
					}
					else if(pData[playerid][pBus] == 41)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 42;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint42, buspoint42, 5.0);
					}
					else if(pData[playerid][pBus] == 42)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 43;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint43, buspoint43, 5.0);
					}
					else if(pData[playerid][pBus] == 43)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 44;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint44, buspoint44, 5.0);
					}
					else if(pData[playerid][pBus] == 44)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 45;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint45, buspoint45, 5.0);
					}
					else if(pData[playerid][pBus] == 45)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 46;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint46, buspoint46, 5.0);
					}
					else if(pData[playerid][pBus] == 46)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 47;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint47, buspoint47, 5.0);
					}
					else if(pData[playerid][pBus] == 47)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 48;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint48, buspoint48, 5.0);
					}
					else if(pData[playerid][pBus] == 48)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 49;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint49, buspoint49, 5.0);
					}
					else if(pData[playerid][pBus] == 49)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 50;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint50, buspoint50, 5.0);
					}
					else if(pData[playerid][pBus] == 50)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 51;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint51, buspoint51, 5.0);
					}
					else if(pData[playerid][pBus] == 51)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 52;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint52, buspoint52, 5.0);
					}
					else if(pData[playerid][pBus] == 52)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 53;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint53, buspoint53, 5.0);
					}
					else if(pData[playerid][pBus] == 53)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 54;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint54, buspoint54, 5.0);
					}
					else if(pData[playerid][pBus] == 54)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 55;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint55, buspoint55, 5.0);
					}
					else if(pData[playerid][pBus] == 55)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 56;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint56, buspoint56, 5.0);
					}
					else if(pData[playerid][pBus] == 56)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 57;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint57, buspoint57, 5.0);
					}
					else if(pData[playerid][pBus] == 57)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 58;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint58, buspoint58, 5.0);
					}
					else if(pData[playerid][pBus] == 58)
					{
						pData[playerid][pBuswaiting] = true;
						pData[playerid][pBustime] = 10;
						PlayerPlaySound(playerid, 43000, 1235.685913,-1855.510986,13.481544);
					}
					else if(pData[playerid][pBus] == 59)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 60;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint60, buspoint60, 5.0);
					}
					else if(pData[playerid][pBus] == 60)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 61;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint61, buspoint61, 5.0);
					}
					else if(pData[playerid][pBus] == 61)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 62;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint62, buspoint62, 5.0);
					}
					else if(pData[playerid][pBus] == 62)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 63;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint63, buspoint63, 5.0);
					}
					else if(pData[playerid][pBus] == 63)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 64;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint64, buspoint64, 5.0);
					}
					else if(pData[playerid][pBus] == 64)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 65;
						SetPlayerRaceCheckpoint(playerid, 1, buspoint65, buspoint65, 5.0);
					}
					else if(pData[playerid][pBus] == 65)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
					    GivePlayerMoneyEx(playerid, 800);
					    ShowItemBox(playerid, "Uang", "Received_$800", 1212, 4);
						RemovePlayerFromVehicle(playerid);
						if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
   						DestroyVehicle(pData[playerid][pKendaraanKerja]);
					}
					//bus rute baru
					else if(pData[playerid][pBus] == 66)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 67;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus2, cpbus2, 5.0);
					}
					else if(pData[playerid][pBus] == 67)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 68;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus3, cpbus3, 5.0);
					}
					else if(pData[playerid][pBus] == 68)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 70;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus4, cpbus4, 5.0);
					}
					else if(pData[playerid][pBus] == 69)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 70;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus5, cpbus5, 5.0);
					}
					else if(pData[playerid][pBus] == 70)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 71;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus6, cpbus6, 5.0);
					}
					else if(pData[playerid][pBus] == 71)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 72;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus7, cpbus7, 5.0);
					}
					else if(pData[playerid][pBus] == 72)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 73;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus8, cpbus8, 5.0);
					}
					else if(pData[playerid][pBus] == 73)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 74;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus9, cpbus9, 5.0);
					}
					else if(pData[playerid][pBus] == 74)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 75;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus10, cpbus10, 5.0);
					}
					else if(pData[playerid][pBus] == 75)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 76;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus11, cpbus11, 5.0);
					}
					else if(pData[playerid][pBus] == 76)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 77;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus12, cpbus12, 5.0);
					}
					else if(pData[playerid][pBus] == 77)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 78;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus13, cpbus13, 5.0);
					}
					else if(pData[playerid][pBus] == 78)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 79;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus14, cpbus14, 5.0);
					}
					else if(pData[playerid][pBus] == 79)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 80;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus15, cpbus15, 5.0);
					}
					else if(pData[playerid][pBus] == 80)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 81;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus16, cpbus16, 5.0);
					}
					else if(pData[playerid][pBus] == 81)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 82;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus17, cpbus17, 5.0);
					}
					else if(pData[playerid][pBus] == 82)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 83;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus18, cpbus18, 5.0);
					}
					else if(pData[playerid][pBus] == 83)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 84;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus19, cpbus19, 5.0);
					}
					else if(pData[playerid][pBus] == 84)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 85;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus20, cpbus20, 5.0);
					}
					else if(pData[playerid][pBus] == 85)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 86;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus21, cpbus21, 5.0);
					}
					else if(pData[playerid][pBus] == 86)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 87;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus22, cpbus22, 5.0);
					}
					else if(pData[playerid][pBus] == 87)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 88;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus23, cpbus23, 5.0);
					}
					else if(pData[playerid][pBus] == 88)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 89;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus24, cpbus24, 5.0);
					}
					else if(pData[playerid][pBus] == 89)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 90;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus25, cpbus25, 5.0);
					}
					else if(pData[playerid][pBus] == 90)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 91;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus26, cpbus26, 5.0);
					}
					else if(pData[playerid][pBus] == 91)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 92;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus27, cpbus27, 5.0);
					}
					else if(pData[playerid][pBus] == 92)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 93;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus28, cpbus28, 5.0);
					}
					else if(pData[playerid][pBus] == 93)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 94;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus29, cpbus29, 5.0);
					}
					else if(pData[playerid][pBus] == 94)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 95;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus30, cpbus30, 5.0);
					}
					else if(pData[playerid][pBus] == 95)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 96;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus31, cpbus31, 5.0);
					}
					else if(pData[playerid][pBus] == 96)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 97;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus32, cpbus32, 5.0);
					}
					else if(pData[playerid][pBus] == 97)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 98;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus33, cpbus33, 5.0);
					}
					else if(pData[playerid][pBus] == 98)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 99;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus34, cpbus34, 5.0);
					}
					else if(pData[playerid][pBus] == 99)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 100;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus35, cpbus35, 5.0);
					}
					else if(pData[playerid][pBus] == 100)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 101;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus36, cpbus36, 5.0);
					}
					else if(pData[playerid][pBus] == 101)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 102;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus37, cpbus37, 5.0);
					}
					else if(pData[playerid][pBus] == 102)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 103;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus38, cpbus38, 5.0);
					}
					else if(pData[playerid][pBus] == 103)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 104;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus39, cpbus39, 5.0);
					}
					else if(pData[playerid][pBus] == 104)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 105;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus40, cpbus40, 5.0);
					}
					else if(pData[playerid][pBus] == 105)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 106;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus41, cpbus41, 5.0);
					}
					else if(pData[playerid][pBus] == 106)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 107;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus42, cpbus42, 5.0);
					}
					else if(pData[playerid][pBus] == 107)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 108;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus43, cpbus43, 5.0);
					}
					else if(pData[playerid][pBus] == 108)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 109;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus44, cpbus44, 5.0);
					}
					else if(pData[playerid][pBus] == 109)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 110;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus45, cpbus45, 5.0);
					}
					else if(pData[playerid][pBus] == 110)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 111;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus46, cpbus46, 5.0);
					}
					else if(pData[playerid][pBus] == 111)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 112;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus47, cpbus47, 5.0);
					}
					else if(pData[playerid][pBus] == 112)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 113;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus48, cpbus48, 5.0);
					}
					else if(pData[playerid][pBus] == 113)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 114;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus49, cpbus49, 5.0);
					}
					else if(pData[playerid][pBus] == 114)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 115;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus50, cpbus50, 5.0);
					}
					else if(pData[playerid][pBus] == 115)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 116;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus51, cpbus51, 5.0);
					}
					else if(pData[playerid][pBus] == 116)
					{
						DisablePlayerRaceCheckpoint(playerid);
						pData[playerid][pBus] = 117;
						SetPlayerRaceCheckpoint(playerid, 2, cpbus52, cpbus52, 5.0);
					}
					else if(pData[playerid][pBus] == 117)
					{
						pData[playerid][pBus] = 0;
						pData[playerid][pSideJob] = 0;
						pData[playerid][pBusTime] = 0;
						pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
						DisablePlayerRaceCheckpoint(playerid);
						GivePlayerMoneyEx(playerid, 800);
					    ShowItemBox(playerid, "Uang", "Received_$800", 1212, 4);
						RemovePlayerFromVehicle(playerid);
						if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
   						DestroyVehicle(pData[playerid][pKendaraanKerja]);  //jika player disconnect maka kendaraan akan ilang
					}
				}
			}
		}
		case CHECKPOINT_MISC:
		{
			pData[playerid][pCheckPoint] = CHECKPOINT_NONE;
			DisablePlayerRaceCheckpoint(playerid);
		}
	}
	if(pData[playerid][pGpsActive] == 1)
	{
		pData[playerid][pGpsActive] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackCar] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan kendaraan anda!");
		pData[playerid][pTrackCar] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackHouse] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan rumah anda!");
		pData[playerid][pTrackHouse] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pTrackBisnis] == 1)
	{
		Info(playerid, "Anda telah berhasil menemukan bisnis!");
		pData[playerid][pTrackBisnis] = 0;
		DisablePlayerRaceCheckpoint(playerid);
	}
	if(pData[playerid][pMission] > -1)
	{
		DisablePlayerRaceCheckpoint(playerid);
		Info(playerid, "/buy , /gps(My Mission) , /storeproduct.");
	}
	if(pData[playerid][pJob] == 8)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 515)
		{
			if(IsPlayerInRangeOfPoint(playerid, 3.5, 290.330383,2542.228027,16.820337))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("MuatBarang", 20000, false, "d", playerid);
				DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, 2814.943847,964.729858,10.750000))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("MuatBarangRock", 20000, false, "d", playerid);
				DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, 1633.136718,971.050537,10.820312))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("MuatBarangLva", 20000, false, "d", playerid);
				DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, -1326.462036,2688.859619,50.062500))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("BahanBakar", 20000, false, "d", playerid);
                DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, 249.263397,1443.614746,10.585937))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("BahanBakarLv", 20000, false, "d", playerid);
                DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, -1676.272094,412.909149,7.179687))
			{
				ShowProgressbar(playerid, "Memuat Kargo..", 20);
				SetTimerEx("BahanBakarSf", 20000, false, "d", playerid);
                DisablePlayerRaceCheckpoint(playerid);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 3.5, -1040.951782,-656.037048,32.007812))
			{
			    if(pData[playerid][pKargo] == 1)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1150);
					ShowItemBox(playerid, "Uang", "Received_$1,150", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Puing Pesawat ~w~seharga ~p~$1,150.");
			    }
			    if(pData[playerid][pKargo] == 2)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1250);
					ShowItemBox(playerid, "Uang", "Received_$1,250", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Bahan Bakar ~w~seharga ~p~$1,250.");
			    }
			    if(pData[playerid][pKargo] == 3)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 1300);
					ShowItemBox(playerid, "Uang", "Received_$1,300", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Barang ~w~seharga ~p~$1,300.");
			    }
			    if(pData[playerid][pKargo] == 4)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 750);
					ShowItemBox(playerid, "Uang", "Received_$750", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Bahan Bakar ~w~seharga ~p~$750.");
			    }
			    if(pData[playerid][pKargo] == 5)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 850);
					ShowItemBox(playerid, "Uang", "Received_$850", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Barang ~w~seharga ~p~$850.");
			    }
			    if(pData[playerid][pKargo] == 6)
			    {
			        if(IsValidVehicle(pData[playerid][pKendaraanKerja]))
			   		DestroyVehicle(pData[playerid][pKendaraanKerja]);

				    if(IsValidVehicle(pData[playerid][pTrailer]))
				   		DestroyVehicle(pData[playerid][pTrailer]);
					GivePlayerMoneyEx(playerid, 550);
					ShowItemBox(playerid, "Uang", "Received_$550", 1212, 2);
					DisablePlayerRaceCheckpoint(playerid);
					SuccesMsg(playerid, "Anda berhasil ekspor ~y~Bahan Bakar ~w~seharga ~p~$550.");
			    }
			}
		}
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsTrailerAttachedToVehicle(GetPlayerVehicleID(playerid)))
		{
			DisablePlayerRaceCheckpoint(playerid);
			Info(playerid, "'/storegas' untuk menyetor GasOilnya!");
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 10.0, 335.66, 861.02, 21.01))
			{
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerCheckpoint(playerid, 336.70, 895.54, 20.40, 5.5);
				Info(playerid, "Silahkan ambil trailer dan menuju ke checkpoint untuk membeli GasOil!");
			}
			else
			{
				Error(playerid, "Anda tidak membawa Trailer Gasnya, Silahkan ambil kembali trailernnya!");
			}
		}
	}
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
    CPHunter(playerid);
	if (PlayerInfo[playerid][pWaypoint])
	{
		PlayerInfo[playerid][pWaypoint] = 0;

		DisablePlayerCheckpoint(playerid);
		PlayerTextDrawHide(playerid, PlayerInfo[playerid][pTextdraws][69]);
		SuccesMsg(playerid, "Anda telah sampai ditujuan :)");
	}
	if(pData[playerid][pHauling] > -1)
	{
		if(IsPlayerInRangeOfPoint(playerid, 5.5, 336.70, 895.54, 20.40))
		{
			DisablePlayerCheckpoint(playerid);
			Info(playerid, "/buy, /gps(My Hauling), /storegas.");
		}
	}
	if(pData[playerid][pFindEms] != INVALID_PLAYER_ID)
	{
		pData[playerid][pFindEms] = INVALID_PLAYER_ID;
		DisablePlayerCheckpoint(playerid);
	}
	if(pData[playerid][pSideJob] == 2)
	{
		new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 431)
		{
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint1))
			{
				SetPlayerCheckpoint(playerid, buspoint2, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint2))
			{
				SetPlayerCheckpoint(playerid, buspoint3, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint3))
			{
				SetPlayerCheckpoint(playerid, buspoint4, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint4))
			{
				SetPlayerCheckpoint(playerid, buspoint5, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint5))
			{
				SetPlayerCheckpoint(playerid, buspoint6, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint6))
			{
				SetPlayerCheckpoint(playerid, buspoint7, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint7))
			{
				SetPlayerCheckpoint(playerid, buspoint8, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint8))
			{
				SetPlayerCheckpoint(playerid, buspoint9, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint9))
			{
				SetPlayerCheckpoint(playerid, buspoint10, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint10))
			{
				SetPlayerCheckpoint(playerid, buspoint11, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint11))
			{
				SetPlayerCheckpoint(playerid, buspoint12, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint12))
			{
				SetPlayerCheckpoint(playerid, buspoint13, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint13))
			{
				SetPlayerCheckpoint(playerid, buspoint14, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint14))
			{
				SetPlayerCheckpoint(playerid, buspoint15, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint15))
			{
				SetPlayerCheckpoint(playerid, buspoint16, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint16))
			{
				SetPlayerCheckpoint(playerid, buspoint17, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint17))
			{
				SetPlayerCheckpoint(playerid, buspoint18, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint18))
			{
				SetPlayerCheckpoint(playerid, buspoint19, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint19))
			{
				SetPlayerCheckpoint(playerid, buspoint20, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint20))
			{
				SetPlayerCheckpoint(playerid, buspoint21, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint21))
			{
				SetPlayerCheckpoint(playerid, buspoint22, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint22))
			{
				SetPlayerCheckpoint(playerid, buspoint23, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint23))
			{
				SetPlayerCheckpoint(playerid, buspoint24, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint24))
			{
				SetPlayerCheckpoint(playerid, buspoint25, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint25))
			{
				SetPlayerCheckpoint(playerid, buspoint26, 7.0);
			}
			if (IsPlayerInRangeOfPoint(playerid, 7.0,buspoint26))
			{
				SetPlayerCheckpoint(playerid, buspoint27, 7.0);
			}
			if(IsPlayerInRangeOfPoint(playerid, 7.0,buspoint27))
			{
				pData[playerid][pSideJob] = 0;
				pData[playerid][pBusTime] = 280;
				DisablePlayerCheckpoint(playerid);
				AddPlayerSalary(playerid, "Sidejob(Bus)", 300);
				Info(playerid, "Sidejob(Bus) telah masuk ke pending salary anda!");
				RemovePlayerFromVehicle(playerid);
				SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
			}
		}
	}
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
    DEN_OnPlayerKeyStateChange(playerid, newkeys, oldkeys);
	if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && (newkeys & KEY_NO))
	{
		if(pData[playerid][CarryingBox])
		{
			Player_DropBox(playerid);
		}
	}
	if((newkeys & KEY_SECONDARY_ATTACK))
    {
		foreach(new did : Doors)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ]))
			{
				if(dData[did][dIntposX] == 0.0 && dData[did][dIntposY] == 0.0 && dData[did][dIntposZ] == 0.0)
					return ErrorMsg(playerid, "Interior entrance masih kosong, atau tidak memiliki interior.");

				if(dData[did][dLocked])
					return ErrorMsg(playerid, "This entrance is locked at the moment.");
					
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return ErrorMsg(playerid, "This door only for faction.");
				}
				if(dData[did][dFamily] > 0)
				{
					if(dData[did][dFamily] != pData[playerid][pFamily])
						return ErrorMsg(playerid, "This door only for family.");
				}
				
				if(dData[did][dVip] > pData[playerid][pVip])
					return ErrorMsg(playerid, "Your VIP level not enough to enter this door.");
				
				if(dData[did][dAdmin] > pData[playerid][pAdmin])
					return ErrorMsg(playerid, "Your admin level not enough to enter this door.");
					
				if(strlen(dData[did][dPass]))
				{
					new params[256];
					if(sscanf(params, "s[256]", params)) return SyntaxMsg(playerid, "/enter [password]");
					if(strcmp(params, dData[did][dPass])) return Error(playerid, "Invalid door password.");
					
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
					pData[playerid][pInDoor] = did;
					ShowProgressbar(playerid, "Loading Rendering..", 3);
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
				else
				{
					if(dData[did][dCustom])
					{
						SetPlayerPositionEx(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					else
					{
						SetPlayerPosition(playerid, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ], dData[did][dIntposA]);
					}
					if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
					pData[playerid][pInDoor] = did;
					ShowProgressbar(playerid, "Loading Rendering..", 3);
					SetPlayerInterior(playerid, dData[did][dIntint]);
					SetPlayerVirtualWorld(playerid, dData[did][dIntvw]);
					SetCameraBehindPlayer(playerid);
					SetPlayerWeather(playerid, 0);
				}
			}
			if(IsPlayerInRangeOfPoint(playerid, 2.8, dData[did][dIntposX], dData[did][dIntposY], dData[did][dIntposZ]))
			{
				if(dData[did][dFaction] > 0)
				{
					if(dData[did][dFaction] != pData[playerid][pFaction])
						return Error(playerid, "This door only for faction.");
				}
				
				if(dData[did][dCustom])
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				else
				{
					SetPlayerPositionEx(playerid, dData[did][dExtposX], dData[did][dExtposY], dData[did][dExtposZ], dData[did][dExtposA]);
				}
				pData[playerid][pInDoor] = -1;
				if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid, "Tunggu Sebentar");
				ShowProgressbar(playerid, "Loading Rendering..", 3);
				SetPlayerInterior(playerid, dData[did][dExtint]);
				SetPlayerVirtualWorld(playerid, dData[did][dExtvw]);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
		//Houses
		foreach(new hid : Houses)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, hData[hid][hExtposX], hData[hid][hExtposY], hData[hid][hExtposZ]))
			{
				if(hData[hid][hIntposX] == 0.0 && hData[hid][hIntposY] == 0.0 && hData[hid][hIntposZ] == 0.0)
					return Error(playerid, "Interior house masih kosong, atau tidak memiliki interior.");

				if(hData[hid][hLocked])
					return Error(playerid, "This house is locked!");
				
				pData[playerid][pInHouse] = hid;
				SetPlayerPositionEx(playerid, hData[hid][hIntposX], hData[hid][hIntposY], hData[hid][hIntposZ], hData[hid][hIntposA]);

				SetPlayerInterior(playerid, hData[hid][hInt]);
				SetPlayerVirtualWorld(playerid, hid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
        }
		new inhouseid = pData[playerid][pInHouse];
		if(pData[playerid][pInHouse] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, hData[inhouseid][hIntposX], hData[inhouseid][hIntposY], hData[inhouseid][hIntposZ]))
		{
			pData[playerid][pInHouse] = -1;
			SetPlayerPositionEx(playerid, hData[inhouseid][hExtposX], hData[inhouseid][hExtposY], hData[inhouseid][hExtposZ], hData[inhouseid][hExtposA]);
			
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetCameraBehindPlayer(playerid);
			SetPlayerWeather(playerid, WorldWeather);
		}
		//Family
		foreach(new fid : FAMILYS)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.8, fData[fid][fExtposX], fData[fid][fExtposY], fData[fid][fExtposZ]))
			{
				if(fData[fid][fIntposX] == 0.0 && fData[fid][fIntposY] == 0.0 && fData[fid][fIntposZ] == 0.0)
					return Error(playerid, "Interior masih kosong, atau tidak memiliki interior.");

				if(pData[playerid][pFaction] == 0)
					if(pData[playerid][pFamily] == -1)
						return Error(playerid, "You dont have registered for this door!");
					
				pData[playerid][pInFamily] = fid;	
				SetPlayerPositionEx(playerid, fData[fid][fIntposX], fData[fid][fIntposY], fData[fid][fIntposZ], fData[fid][fIntposA]);

				SetPlayerInterior(playerid, fData[fid][fInt]);
				SetPlayerVirtualWorld(playerid, fid);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, 0);
			}
			new difamily = pData[playerid][pInFamily];
			if(pData[playerid][pInFamily] != -1 && IsPlayerInRangeOfPoint(playerid, 2.8, fData[difamily][fIntposX], fData[difamily][fIntposY], fData[difamily][fIntposZ]))
			{
				pData[playerid][pInFamily] = -1;	
				SetPlayerPositionEx(playerid, fData[difamily][fExtposX], fData[difamily][fExtposY], fData[difamily][fExtposZ], fData[difamily][fExtposA]);

				SetPlayerInterior(playerid, 0);
				SetPlayerVirtualWorld(playerid, 0);
				SetCameraBehindPlayer(playerid);
				SetPlayerWeather(playerid, WorldWeather);
			}
        }
	}
	//SAPD Taser/Tazer
	if(newkeys & KEY_FIRE && TaserData[playerid][TaserEnabled] && GetPlayerWeapon(playerid) == 0 && !IsPlayerInAnyVehicle(playerid) && TaserData[playerid][TaserCharged])
	{
  		TaserData[playerid][TaserCharged] = false;

	    new Float: x, Float: y, Float: z, Float: health;
     	GetPlayerPos(playerid, x, y, z);
	    PlayerPlaySound(playerid, 6003, 0.0, 0.0, 0.0);
	    ApplyAnimation(playerid, "KNIFE", "KNIFE_3", 4.1, 0, 1, 1, 0, 0, 1);
		pData[playerid][pActivityTime] = 0;
	    TaserData[playerid][ChargeTimer] = SetTimerEx("ChargeUp", 1000, true, "i", playerid);
		PlayerTextDrawSetString(playerid, ActiveTD[playerid], "Recharge...");
		PlayerTextDrawShow(playerid, ActiveTD[playerid]);
		ShowPlayerProgressBar(playerid, pData[playerid][activitybar]);

	    for(new i, maxp = GetPlayerPoolSize(); i <= maxp; ++i)
		{
	        if(!IsPlayerConnected(i)) continue;
          	if(playerid == i) continue;
          	if(TaserData[i][TaserCountdown] != 0) continue;
          	if(IsPlayerInAnyVehicle(i)) continue;
			if(GetPlayerDistanceFromPoint(i, x, y, z) > 2.0) continue;
			ClearAnimations(i, 1);
			TogglePlayerControllable(i, false);
   			ApplyAnimation(i, "CRACK", "crckdeth2", 4.1, 0, 0, 0, 1, 0, 1);
			PlayerPlaySound(i, 6003, 0.0, 0.0, 0.0);

			GetPlayerHealth(i, health);
			TaserData[i][TaserCountdown] = TASER_BASETIME + floatround((100 - health) / 12);
   			Info(i, "Anda bisa memakai Taser setelah %d detik!", TaserData[i][TaserCountdown]);
			TaserData[i][GetupTimer] = SetTimerEx("TaserGetUp", 1000, true, "i", i);
			break;
	    }
	}
	if((newkeys & KEY_CTRL_BACK))
	{
	    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
	    ShowRadial(playerid);
		//ShowPlayerDialog(playerid, DIALOG_RADIAL, DIALOG_STYLE_TABLIST_HEADERS, "Radial Menu - {7fffd4}Kota ASIA LANE", "Kategori\tPenjelasan\n{BABABA}Dokumen Pribadi\t{BABABA}-> Untuk melihat dokumen pribadi\n{ffffff}Phone\t-> Untuk membuka smartphone\n{BABABA}Inventory\t{BABABA}-> Untuk membuka tas\n{ffffff}Voice Mode\t-> Untuk mengganti jarak suara\n{ffffff}Aksesoris\t{BABABA}-> Untuk mengatur aksesoris\n{ffffff}Invoice\t{BABABA}-> Untuk melihat tagihan anda\n{ffffff}Panel Kendaraan\t{BABABA}-> Untuk mengakses panel kendaraan anda", "Pilih", "Tutup");
	}
	if(newkeys & KEY_HANDBRAKE && GetPlayerWeapon(playerid) == 24 && GetNearbyRobbery(playerid) >= 0)
	{
	    for(new i = 0; i < MAX_ROBBERY; i++)
		{
		    if(IsPlayerInRangeOfPoint(playerid, 2.3, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]))
			{
				if(Warung == true) return 1;
				SetTimerEx("RobWarung", 10000, false, "d", playerid);
				ApplyActorAnimation(RobberyData[i][robberyID], "ROB_BANK","SHP_HandsUp_Scr",4.0,0,0,0,1,0);
				Warung = true;
				new label[100];
				format(label, sizeof label, "Penjaga : Jangan sakiti aku tuan, aku akan memberikanmu uangnya");
				new Float:x, Float:y, Float:z;
				GetPlayerPos(playerid, x, y, z);
				new lstr[1024];
				format(lstr, sizeof(lstr), "PERAMPOKAN : {ffffff}Telah terjadi perampokan di daerah %s", GetLocation(x, y, z));
				SendClientMessageToAll(COLOR_ORANGE2, lstr);
				RobberyData[i][robberyText] = CreateDynamic3DTextLabel(label, COLOR_WHITE, RobberyData[i][robberyX], RobberyData[i][robberyY], RobberyData[i][robberyZ]+1.3, 10.0, INVALID_PLAYER_ID, INVALID_VEHICLE_ID, 1, 0, 0, -1, 10.0);
			}
		}
	}
	if(newkeys & KEY_NO)
	{
		callcmd::death(playerid, "");
	}
	//-----[ Vehicle ]-----	
	// if((newkeys & KEY_NO ))
	// {
	// 	if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
	// 	{
	// 		return callcmd::engine(playerid, "");
	// 	}
	// }
	if(newkeys & KEY_WALK)
	{
	    foreach(new gsid : GStation)
		{
			if(IsPlayerInRangeOfPoint(playerid, 4.0, gsData[gsid][gsPosX], gsData[gsid][gsPosY], gsData[gsid][gsPosZ]))
			{
			    if(IsPlayerInAnyVehicle(playerid))
				return ErrorMsg(playerid, "Anda harus berada di luar kendaraan.");
				if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity");
	 	 		callcmd::belijerigen(playerid, "");
			}
	    }
	}
		//veh panel aufa
	if((newkeys & KEY_NO))
	{
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			return callcmd::vpanel(playerid, "");
		}
 	}
	//dealer
	if((newkeys & KEY_WALK ))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1864.952880,878.926574,10.930519))
		{
		    if(delaydealer == true) return ErrorMsg(playerid, "Harap antri!");
	        for(new i = 0; i < 14; i++)
			{
				TextDrawShowForPlayer(playerid, DealerTD[i]);
			}
			cskin[playerid]++;
			delaydealer = true;
			pData[playerid][pLagiDealer] = 1;
		    if(cskin[playerid] >= sizeof Kendaraan) cskin[playerid] = 0;
		    if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
	   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
	   		pData[playerid][pKendaraanDealer] = CreateVehicle(Kendaraan[cskin[playerid]], 1853.037475,869.174865,10.910516,359.373474,0,0,-1);
	   		PutPlayerInVehicle(playerid, pData[playerid][pKendaraanDealer], 0);
	   		new AtmInfo[560];
		   	format(AtmInfo,1000,"%s", FormatMoney(GetVehicleCost(Kendaraan[cskin[playerid]])));
			TextDrawSetString(DealerTD[6], AtmInfo);
		    TextDrawShowForPlayer(playerid, DealerTD[6]);
		    format(AtmInfo,1000,"%s", GetVehicleModelName(Kendaraan[cskin[playerid]]));
			TextDrawSetString(DealerTD[13], AtmInfo);
		    TextDrawShowForPlayer(playerid, DealerTD[13]);
		    SetPlayerCameraPos(playerid,1850.219970,875.313476,10.910516);
			SelectTextDraw(playerid, COLOR_BLUE);
	    }
	}
	if((newkeys & KEY_WALK ))
	{
		foreach(new lid : Lockers)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.5, lData[lid][lPosX], lData[lid][lPosY], lData[lid][lPosZ]))
			{
				if(pData[playerid][pVip] > 0 && lData[lid][lType] == 7)
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERVIP, DIALOG_STYLE_LIST, "ASIA LANE - VIP Locker", "Health\nWeapons\nClothing\nVip Toys", "Okay", "Batal");
				}
				else if(pData[playerid][pFaction] == 1 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAPD, DIALOG_STYLE_LIST, "ASIA LANE - Locker Kepolisian", "On Duty\nArmour\nSenjata\nBaju polisi\nBaju Tempur", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 2 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAGS, DIALOG_STYLE_LIST, "ASIA LANE - Locker Pemerintah", "Baju Kerja\nArmour\nSenjata", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 3 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSAMD, DIALOG_STYLE_LIST, "ASIA LANE - Locker Medis", "Baju Kerja\nObat", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 4 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERSANEW, DIALOG_STYLE_LIST, "ASIA LANE - Locker Pembawa Berita", "Baju Kerja", "Proceed", "Batal");
				}
				else if(pData[playerid][pFaction] == 5 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERPEDAGANG, DIALOG_STYLE_LIST, "ASIA LANE - Locker Pedagang", "Baju Kerja", "Pilih", "Batal");
				}
				else if(pData[playerid][pFaction] == 6 && pData[playerid][pFaction] == lData[lid][lType])
				{
					ShowPlayerDialog(playerid, DIALOG_LOCKERGOJEK, DIALOG_STYLE_LIST, "ASIA LANE - Locker Gojek", "Seragam Driver Gojek\nSeragam biasa", "Pilih", "Batal");
				}
				else if(pData[playerid][pFamily] > -1)
				{
					ShowPlayerDialog(playerid, DIALOG_SKINFAM, DIALOG_STYLE_LIST, "ASIA LANE - Family Lockers", "Baju Fam", "Pilih", "Batal");
				}
				else return ErrorMsg(playerid, "Anda tidak mengakses locker ini!");
			}
		}
	}
	if((newkeys & KEY_WALK ))
	{
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 1530.5714,-2163.6646,13.6593))
		{
			if(!GetOwnedVeh(playerid))
				return ErrorMsg(playerid, "Anda tidak memiliki kendaraan apapun.");

			new vid, str[300], count = GetOwnedVeh(playerid), status[24];
			format (str, sizeof(str), "VID\tModel [Database ID]\tPlate\tBiaya Asuransi");

			Loop(itt, (count + 1), 1)
			{
				vid = ReturnPlayerVehID(playerid, itt);
				if(pvData[vid][cPark] != -1)
				{
					status = ""LG_E"Garkot";
				}
				else if(pvData[vid][cClaim] != 0)
				{
					status = "Asuransi";
				}
				else if(pvData[vid][cStolen] != 0)
				{
					status = ""RED_E"Rusak";
				}
				else
				{
					status = "Spawned";
				}
				if(itt == count)
				{
					format(str, sizeof(str), "%s\n{ffffff}[%s]\t%s [%d]{ffffff}\t%s\t"LG_E"$500\n", str, status, GetVehicleModelName(pvData[vid][cModel]), pvData[vid][cID], pvData[vid][cPlate]);
				}
				else format(str, sizeof(str), "%s\n{ffffff}[%s]\t%s [%d]{ffffff}\t%s\t"LG_E"$500\n", str, status, GetVehicleModelName(pvData[vid][cModel]), pvData[vid][cID], pvData[vid][cPlate]);
			}
			ShowPlayerDialog(playerid, DIALOG_ASURANSI, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Ansuransi Kendaraan", str, "Pilih", "Batal");
		}
	}
	//sell pv
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 1530.5714,-2159.6865,13.6593))
        {
        	callcmd::sellpv(playerid, "");
        }
		if(IsPlayerInRangeOfPoint(playerid, 3, 1298.77,354.929, 19.5617))
        {
        	callcmd::izintokdalang(playerid, "");
        }
		if(IsPlayerInRangeOfPoint(playerid, 3, 945.0869,-1673.9796,14.0791))
        {
        	callcmd::robbank(playerid, "");
        }

	}
	if((newkeys & KEY_YES))
	{
	   	foreach(new gsid : GStation)
		{
			if(IsPlayerInRangeOfPoint(playerid, 4.0, gsData[gsid][gsPosX], gsData[gsid][gsPosY], gsData[gsid][gsPosZ]))
			{
				if(!IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
				return ErrorMsg(playerid, "Anda harus berada di dalam kendaraan.");

				new vehid = GetPlayerVehicleID(playerid);
				if(!IsEngineVehicle(vehid))
			            return ErrorMsg(playerid, "Anda tidak berada di kendaraan yang mempunyai bahan bakar.");

				if(GetEngineStatus(vehid))
								return ErrorMsg(playerid, "Mohon matikan mesin kendaraan terlebih dahulu");

				if(pData[playerid][pFill] != -1)
					return ErrorMsg(playerid, "Anda sedang mengisi bahan bakar, mohon ditunggu!");

				if(gsData[gsid][gsStock] < 1)
					return ErrorMsg(playerid, "Pom bensin tidak mempunyai stok!");

				pData[playerid][pFill] = gsid;
				pData[playerid][pFillStatus] = 1;
				for(new i = 0; i < 26; i++)
				{
					PlayerTextDrawShow(playerid, PomTD[playerid][i]);
				}
				SelectTextDraw(playerid, COLOR_BLUE);
			}
		}
	}
	//-----[ Bisnis ]-----
	if((newkeys & KEY_WALK))
	{
	    foreach(new bid : Bisnis)
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, bData[bid][bExtposX], bData[bid][bExtposY], bData[bid][bExtposZ]))
			{
				if(bData[bid][bLocked])
					return ErrorMsg(playerid, "Bisnis Ini Sedang Tutup!");

				pData[playerid][pInBiz] = bid;
				Bisnis_BuyMenu(playerid, pData[playerid][pInBiz]);
			}
		}
	}
	if((newkeys & KEY_NO ))
	{
		foreach(new id : Bisnis)
		{
		if(IsPlayerInRangeOfPoint(playerid, 2.5, bData[id][bExtposX], bData[id][bExtposY], bData[id][bExtposZ]))
		{
			if(bData[id][bPrice] > GetPlayerMoney(playerid)) return ErrorMsg(playerid, "Uang anda tidak cukup, anda tidak dapat membeli bisnis ini!.");
			if(strcmp(bData[id][bOwner], "-")) return ErrorMsg(playerid, "Someone already owns this bisnis.");
			if(pData[playerid][pVip] == 1)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 2) return ErrorMsg(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 2)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 3) return ErrorMsg(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else if(pData[playerid][pVip] == 3)
			{
			    #if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 4) return Error(playerid, "You can't buy any more bisnis.");
				#endif
			}
			else
			{
				#if LIMIT_PER_PLAYER > 0
				if(Player_BisnisCount(playerid) + 1 > 1) return ErrorMsg(playerid, "You can't buy any more bisnis.");
				#endif
			}
			GivePlayerMoneyEx(playerid, -bData[id][bPrice]);
			GetPlayerName(playerid, bData[id][bOwner], MAX_PLAYER_NAME);
			bData[id][bOwnerID] = pData[playerid][pID];
			bData[id][bVisit] = gettime();
			new str[522], query[500];
			format(str,sizeof(str),"[BIZ]: %s membeli bisnis id %d seharga %s!", GetRPName(playerid), id, FormatMoney(bData[id][bPrice]));
			SuccesMsg(playerid, str);
			LogServer("Property", str);
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET owner='%s', ownerid='%d', visit='%d' WHERE ID='%d'", bData[id][bOwner], bData[id][bOwnerID], bData[id][bVisit], id);
			mysql_tquery(g_SQL, query);
			Bisnis_Refresh(id);
			Bisnis_Save(id);
		}
	}
}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 233.6398,2949.6365,15.6187))
        {
        	callcmd::kerjaminyak1(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, 267.5909,2954.9868,15.5539))
        {
        	callcmd::kerjaminyak2(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, 247.8056,2975.0906,15.6139))
        {
        	callcmd::kerjaminyak3(playerid, "");
        }

        else if(IsPlayerInRangeOfPoint(playerid, 3, 221.6441,1422.7505,10.5859))
        {
        	callcmd::saringminyak(playerid, "");
        }
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, -887.2399,-479.9101,826.8417))
        {
        	callcmd::ambilbox(playerid, "");
        }
		else  if(IsPlayerInRangeOfPoint(playerid, 3, -893.2037,-490.6880,826.8417))
        {
        	callcmd::ambilbox(playerid, "");
        }
		else  if(IsPlayerInRangeOfPoint(playerid, 3, -898.6295,-500.8337,826.8417))
        {
        	callcmd::ambilbox(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -927.1517,-486.4165,826.8417))
        {
        	callcmd::penyortiran(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 3, -920.0016,-468.0568,826.8417))
        {
        	callcmd::mulaikerjabox1(playerid, "");
        }
		 else if(IsPlayerInRangeOfPoint(playerid, 3, 303.3027,-237.8519,1.5781))
        {
        	callcmd::Daurulang(playerid, "");
        }
		//  else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9240,1379.4988,9.1719))
        // {
        // 	callcmd::Daurulang(playerid, "");
        // }
		//  else if(IsPlayerInRangeOfPoint(playerid, 3, 34.9276,1351.1335,9.1719))
        // {
        // 	callcmd::Daurulang(playerid, "");
        // }
	}
	if(newkeys & KEY_WALK)
	{
		//1
		if(IsPlayerInRangeOfPoint(playerid, 1, 123.1883,-1857.2671,1.3613)) //1
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 123.1883,-1857.2671,1.3613)) //2
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 135.7410,-1857.1583,1.3613))//3
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 135.7410,-1857.1583,1.3613))//4
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 141.4648,-1866.2422,1.3613))//5
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 135.7371,-1866.1814,1.3613))//6
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 223.3978,-1946.2858,1.1914))//7
        {
        	callcmd::mancing(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 123.4697,-1865.7893,1.3613))//8
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 141.5936,-1874.8224,1.3613))//9
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 135.7600,-1874.6079,1.3613))//10
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 129.6355,-1875.3541,1.3613))//11
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 123.4099,-1875.1106,1.3613))//12
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 112.1592,-1827.7762,1.3613))//13
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 106.4675,-1827.3353,1.3613))//14
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 100.2417,-1827.8079,1.3613))//15
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 94.1920,-1827.3158,1.3613))//16
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 112.1956,-1838.1487,1.3613))//17
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 106.4298,-1838.1510,1.3613))//18
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 100.1669,-1837.8054,1.3613))//19
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 94.1904,-1838.1725,1.3613))//20
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 112.4105,-1847.7648,1.3613))//21
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 106.5567,-1847.8490,1.3613))//22
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 100.1109,-1847.3472,1.3613))//23
        {
        	callcmd::mancing(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 93.9313,-1847.4720,1.3613))//24
        {
        	callcmd::mancing(playerid, "");
        }
	}

	//beli umpan
	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1, 144.3634,-1829.7277,4.4060)) //1
        {
        	callcmd::beliumpan(playerid, "");
        }
	}


	// membuat ktp
	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 918.1131,-1463.2157,2754.3389)) //ktp
        {
        	callcmd::buatktp(playerid, "");
        }
	}

	//beli pancingan
	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1, 144.3639,-1826.1487,4.4060)) //1
        {
        	callcmd::belipancingan(playerid, "");
        }
	}
	//tukang kayu
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, -1992.7512,-2387.5115,30.6250))//tukang kayu
		{
		    if(pData[playerid][pJob] == 3)
			ShowPlayerDialog(playerid, DIALOG_LOCKERTUKANGKAYU, DIALOG_STYLE_LIST, "ASIA LANE - Locker Tukang Kayu", "Baju Kerja\nBaju Warga", "Pilih", "Batal");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2, -1997.1274,-2420.9097,30.6250))
        {
        	callcmd::potongkayu1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -2001.2432,-2416.8083,30.6250))
        {
        	callcmd::potongkayu2(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -2011.3643,-2404.0962,30.6250))
        {
        	callcmd::potongkayu3(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -2021.2697,-2402.0901,30.6250))
        {
        	callcmd::potongkayu4(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -2030.3298,-2391.3167,30.6250))
        {
        	callcmd::potongkayu5(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -1986.3417,-2425.8486,30.6250))
        {
        	callcmd::proseskayu1(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, -1986.3417,-2425.8486,30.6250))
        {
        	callcmd::proseskayu2(playerid, "");
        }
	}







	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, 723.4478,-1431.2233,13.7357))//penjahit
		{
		    if(pData[playerid][pJob] == 10)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPENJAHIT, DIALOG_STYLE_LIST, "ASIA LANE - Locker Penjahit", "Baju Kerja\nBaju Warga", "Pilih", "Batal");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 2,723.4581,-1435.9750,13.7357))
        {
        	callcmd::ambilwool(playerid, "");
        }
		//buat kain 1-8 cp
		else if(IsPlayerInRangeOfPoint(playerid, 2, 714.7750,-1421.1039,13.7357))//1
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 714.8711,-1424.9688,13.7357))//2
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 720.1006,-1424.9679,13.7357))//3
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 719.6128,-1421.1041,13.7357))//4
        {
        	callcmd::buatkain(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 724.8679,-1421.1099,13.7357))//5
        {
        	callcmd::buatkain(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 730.0422,-1421.1041,13.7357))//6
        {
        	callcmd::buatkain(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 729.7242,-1424.9524,13.7357))//7
        {
        	callcmd::buatkain(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 724.8238,-1424.9642,13.7357))//8
        {
        	callcmd::buatkain(playerid, "");
        }



		//buat baju cp 1-24 
		else if(IsPlayerInRangeOfPoint(playerid, 2, 755.5255,-1417.9779,13.7357))//1
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 757.6044,-1417.9346,13.7357))//2
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 759.3753,-1417.9081,13.7357))//3
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 765.9367,-1417.9703,13.7357))//4
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 767.8130,-1417.9327,13.7357))//5
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 769.4692,-1417.9061,13.7357))//6
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 769.3947,-1421.0533,13.7357))//7
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 767.9344,-1421.0813,13.7357))//8
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 765.8922,-1421.1176,13.7357))//9
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 759.3902,-1421.0529,13.7357))//10
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 757.6138,-1421.0841,13.7357))//11
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 755.7879,-1421.1200,13.7357))//12
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 755.7969,-1434.4711,13.7357))//13
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 757.4611,-1434.4398,13.7357))//14
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 759.3204,-1434.4069,13.7357))//15
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 765.7222,-1434.4736,13.7357))//16
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 767.9090,-1434.4369,13.7357))//17
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 769.6451,-1434.4025,13.7357))//18
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 769.4451,-1437.5538,13.7357))//19
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 767.3452,-1437.5817,13.7357))//20
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 765.8853,-1437.6173,13.7357))//21
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 759.2594,-1437.5554,13.7357))//22
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 757.6447,-1437.5839,13.7357))//23
        {
        	callcmd::buatbaju(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 755.7207,-1437.6217,13.7357))//24
        {
        	callcmd::buatbaju(playerid, "");
        }



		//jual pakaian
        else if(IsPlayerInRangeOfPoint(playerid, 2, -620.8550,-524.7370,25.6234))
		{
            callcmd::jualpakaian(playerid, "");
        }
		//nyasar
        else if(IsPlayerInRangeOfPoint(playerid, 2,935.6656,-1670.8666,14.0791))
		{
            callcmd::newrek(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2,942.2501,-1667.1718,14.0791))
		{
            callcmd::bank(playerid, "");
        }
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 1, 1690.892456,-2237.770751,13.539621))
		{
			callcmd::atm(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 1550.266601,-2176.392578,13.546875))
        {
			callcmd::atm(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1125.240966,-2033.215698,69.883659))
        {
			callcmd::atm(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1291.651489,-1874.457031,13.783984))
        {
			callcmd::atm(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 1920.387207,-1786.922729,13.546875))
        {
			callcmd::atm(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 1374.6693,-1887.5564,13.5901))
        {
			callcmd::atm(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 1275.9919,-1558.3986,13.5869))
        {
			callcmd::atm(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 1977.7656,-2058.9355,13.5938))
        {
			callcmd::atm(playerid, "");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(GetNearbyTrash(playerid) >= 0)
		{
		    for(new i = 0; i < MAX_Trash; i++)
			{
			    if(IsPlayerInRangeOfPoint(playerid, 2.3, TrashData[i][TrashX], TrashData[i][TrashY], TrashData[i][TrashZ]))
			{
				if(pData[playerid][sampahsaya] < 1) return ErrorMsg(playerid, "Anda tidak mempunyai sampah");
				new total = pData[playerid][sampahsaya];
				pData[playerid][sampahsaya] -= total;
				new str[500];
				format(str, sizeof(str), "Removed_%dx", total);
				ShowItemBox(playerid, "Sampah", str, 1265, total);
			    Inventory_Update(playerid);
			    TrashData[i][Sampah] += total;
				new query[128];
				mysql_format(g_SQL, query, sizeof(query), "UPDATE trash SET sampah='%d' WHERE ID='%d'", TrashData[i][Sampah], i);
				mysql_tquery(g_SQL, query);
				ShowProgressbar(playerid, "Membuang sampah..", 1);
				ApplyAnimation(playerid,"GRENADE","WEAPON_throwu",4.0, 1, 0, 0, 0, 0, 1);
				Trash_Save(i);
			}
		}
	}
}
	if((newkeys & KEY_WALK))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1687.043090,-2265.090087,13.481613))
		{
			new str[1024];
			format(str, sizeof(str), "Jenis Sepeda & Series\tHarga Rental\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff}Sepeda Gunung Aviator 2690 XT Steel\t"LG_E"$150\n> Pilih ini untuk mengembalikan kendaraan yang disewa dari negara");			
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Rental Sepeda", str, "Rent", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, 2766.651367,-2395.744384,13.632812))
        {
        	new str[1024];
			format(str, sizeof(str), "Jenis Sepeda & Series\tHarga Rental\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff}Sepeda Gunung Aviator 2690 XT Steel\t"LG_E"$150\n> Pilih ini untuk mengembalikan kendaraan yang disewa dari negara");
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Rental Sepeda", str, "Rent", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3, -613.6473,-488.6987,25.6234))
        {
        	new str[1024];
			format(str, sizeof(str), "Jenis Sepeda & Series\tHarga Rental\n"WHITE_E"TDR-3000\t"LG_E"$75\n{ffffff}Sepeda Gunung Aviator 2690 XT Steel\t"LG_E"$150\n> Pilih ini untuk mengembalikan kendaraan yang disewa dari negara");
			ShowPlayerDialog(playerid, DIALOG_RENT_BIKE, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Rental Sepeda", str, "Rent", "Close");
		}
	}
	if(newkeys & KEY_CROUCH)
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1303.972045,-1338.869506,13.722788))
		{
		    if(pData[playerid][pFaction] != 1)
        	return ErrorMsg(playerid, "Anda bukan seorang kepolisian!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 717.724060,-1418.360717,13.785820))
		{
		    if(pData[playerid][pFaction] != 3)
        	return ErrorMsg(playerid, "Anda bukan seorang tenaga medis!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1493.067138,-666.322204,94.769989))
		{
		    if(pData[playerid][pFaction] != 5)
        	return ErrorMsg(playerid, "Anda bukan seorang pedagang!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1239.4237,-2054.5679,59.9075))
		{
		    if(pData[playerid][pFaction] != 2)
        	return ErrorMsg(playerid, "Anda bukan anggota pemerintah!");
			if(IsValidVehicle(pData[playerid][pKendaraanFraksi]))
   			DestroyVehicle(pData[playerid][pKendaraanFraksi]);
		}
	}
	if((newkeys & KEY_WALK))
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3.0, 1574.9863,-1645.4646,13.5753))
		{
		    if(pData[playerid][pFaction] != 1)
        	return ErrorMsg(playerid, "Anda bukan seorang kepolisian!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nBullet\nSultan\nKendaraan Patroli\nSanchez\nMotor Patroli\nSwatt\nFBI Truck\nTruck Police");
			ShowPlayerDialog(playerid, DIALOG_GARASIPD, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Kepolisian", str, "Pilih", "Close");
		}
		//kendaraan udara polisi
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 1578.4910,-1679.2308,27.6454))
		{
		    if(pData[playerid][pFaction] != 1)
        	return ErrorMsg(playerid, "Anda bukan seorang kepolisian!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nHeliKopter");
			ShowPlayerDialog(playerid, DIALOG_GARASIPDUDARA, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Kepolisian udara", str, "Pilih", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1176.9761,-1339.7943,13.9531))
		{
		    if(pData[playerid][pFaction] != 3)
        	return ErrorMsg(playerid, "Anda bukan seorang tenaga medis!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nAmbulance\nSanchez");
			ShowPlayerDialog(playerid, DIALOG_GARASIMD, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Tenaga Medis", str, "Pilih", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1094.4025,1311.0411,10.8203))
		{
		    if(pData[playerid][pFaction] != 5)
        	return ErrorMsg(playerid, "Anda bukan seorang pedagang!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nMobil Pedagang");
			ShowPlayerDialog(playerid, DIALOG_GARASIPEDAGANG, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Pedagang", str, "Pilih", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, -6.9099,-1724.0741,5.0848))
		{
		    if(pData[playerid][pFaction] != 2)
        	return ErrorMsg(playerid, "Anda bukan anggota pemerintah!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nMobil Pemerintah\nSentinel\nFCR");
			ShowPlayerDialog(playerid, DIALOG_GARASISAGS, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Pemerintah", str, "Pilih", "Close");
		}
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 1375.9167,-1767.8365,13.5781))
		{
		    if(pData[playerid][pFaction] != 6)
        	return ErrorMsg(playerid, "Anda bukan anggota gojek!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nMotor Gojek\nMobil Gojek\nMotor makanan gojek");
			ShowPlayerDialog(playerid, DIALOG_GARASIGOJEK, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Gojek", str, "Pilih", "Close");
		}
		//garasi kendaraan sanews
		else if(IsPlayerInRangeOfPoint(playerid, 3.0, 645.4379,-1347.6639,13.5469))
		{
		    if(pData[playerid][pFaction] != 4)
        	return ErrorMsg(playerid, "Anda bukan anggota sanews!");
			new str[1024];
			format(str, sizeof(str), "Nama Kendaraan\nNews Van\nNews Heli");
			ShowPlayerDialog(playerid, DIALOG_GARASISANEWS, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Garasi Sanews", str, "Pilih", "Close");
		}
		/*else if(IsPlayerInRangeOfPoint(playerid, 3, 2766.651367,-2395.744384,13.632812))
        {
        	new str[1024];
			format(str, sizeof(str), "Ambil Barang\nSimpan Barang");
			ShowPlayerDialog(playerid, DIALOG_GUDANGBARU, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE - Gudang Kota", str, "Pilih", "Close");
		}*/
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 2, 874.795104,-13.976298,63.195312))//Olah kanabis
		{
  			callcmd::olahkanabis(playerid, "");
		}
	    else if(IsPlayerInRangeOfPoint(playerid, 2, 1775.1582,-167.0989,77.5520))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1770.9899,-166.8354,78.0667))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
       	else if(IsPlayerInRangeOfPoint(playerid, 2, 1767.3459,-170.8528,78.9311))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1769.2379,-174.3668,79.8527))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1765.0322,-175.5911,79.8391))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1755.6796,-180.9095,79.8963))//ambilkanabis
        {
        	callcmd::ambilkanabis(playerid, "");
        }
		//rental kapal aupa
		else if(IsPlayerInRangeOfPoint(playerid, 2, 133.0584,-1832.2073,4.4060))
        {
		new str[1024];
		format(str, sizeof(str), "Kendaraan\tHarga\n"WHITE_E"%s\t"LG_E"$100 / one days\n%s\t"LG_E"$200 / one days\n%s\t"LG_E"$300 / one days",
		GetVehicleModelName(473), 
		GetVehicleModelName(453),
		GetVehicleModelName(452));
		ShowPlayerDialog(playerid, DIALOG_RENT_BOAT, DIALOG_STYLE_TABLIST_HEADERS, "Rent Boat", str, "Rent", "Close");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3.0, 919.4431,-1463.2151,2754.3389))
		{
		    if(pData[playerid][pIDCard] == 0) return ErrorMsg(playerid, "Anda tidak memiliki ID Card!");
			PlayerPlaySound(playerid, 5202, 0,0,0);
			new string[1000];
		    format(string, sizeof(string), "Pekerjaan\t\tSedang Bekerja\n{ffffff}Supir Bus\t\t{FFFF00}%d Orang\n{BABABA}Tukang Ayam\t\t{FFFF00}%d Orang\n{ffffff}Penebang Kayu\t\t{FFFF00}%d Orang\n{BABABA}Petani\t\t{FFFF00}%d Orang\n{ffffff}Penambang Minyak\t\t{FFFF00}%d Orang\n{BABABA}Pemerah Susu\t\t{FFFF00}%d Orang\n{ffffff}Penambang\t\t{FFFF00}%d Orang\n{BABABA}Kargo\t\t{FFFF00}%d Orang\n{ffffff}Penjahit\t\t{FFFF00}%d Orang\n{ffffff}Recycler\t\t{FFFF00}%d Orang\n"RED_E"Keluar dari pekerjaan",
			Sopirbus,
			tukangayam,
			tukangtebang,
			petani,
			penambangminyak,
		 	pemerah,
		 	penambang,
		 	Trucker,
			penjahit,
			Recycler
		    );
	    	ShowPlayerDialog(playerid, DIALOG_DISNAKER, DIALOG_STYLE_TABLIST_HEADERS, "{7fffd4}Dinas Tenaga Kerja ASIA LANE", string, "Pilih", "Batal");
		}
	}
	//-----[ Toll System ]-----	
	if(newkeys & KEY_CROUCH)
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_SPECTATING)
		{
			new forcount = MuchNumber(sizeof(BarrierInfo));
			for(new i;i < forcount;i ++)
			{
				if(i < sizeof(BarrierInfo))
				{
					if(IsPlayerInRangeOfPoint(playerid,8,BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]))
					{
						if(BarrierInfo[i][brOrg] == TEAM_NONE)
						{
							if(!BarrierInfo[i][brOpen])
							{
								if(pData[playerid][pMoney] < 5)
								{
									ErrorMsg(playerid, "Uangmu tidak cukup untuk membayar toll");
								}
								else
								{
									MoveDynamicObject(gBarrier[i],BarrierInfo[i][brPos_X],BarrierInfo[i][brPos_Y],BarrierInfo[i][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[i][brPos_A]+180);
									SetTimerEx("BarrierClose",5000,0,"i",i);
									BarrierInfo[i][brOpen] = true;
									GivePlayerMoneyEx(playerid, -100);
									ShowItemBox(playerid, "Uang", "Removed_$100", 1212, 2);
									if(BarrierInfo[i][brForBarrierID] != -1)
									{
										new barrierid = BarrierInfo[i][brForBarrierID];
										MoveDynamicObject(gBarrier[barrierid],BarrierInfo[barrierid][brPos_X],BarrierInfo[barrierid][brPos_Y],BarrierInfo[barrierid][brPos_Z]+0.7,BARRIER_SPEED,0.0,0.0,BarrierInfo[barrierid][brPos_A]+180);
										BarrierInfo[barrierid][brOpen] = true;

									}
								}
							}
						}
						else Toll(playerid, "Anda tidak bisa membuka pintu Toll ini!");
						break;
					}
				}
			}
		}
		return true;		
	}
	if(GetPVarInt(playerid, "UsingSprunk"))
	{
		if(pData[playerid][pEnergy] >= 100 )
		{
  			Info(playerid, " Anda terlalu banyak minum.");
	   	}
	   	else
	   	{
		    pData[playerid][pEnergy] += 5;
		}
	}
	if(takingselfie[playerid] == 1)
	{
		if(PRESSED(KEY_ANALOG_RIGHT))
		{
			GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] += Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
		if(PRESSED(KEY_ANALOG_LEFT))
		{
		    GetPlayerPos(playerid,lX[playerid],lY[playerid],lZ[playerid]);
			static Float: n1X, Float: n1Y;
		    if(Degree[playerid] >= 360) Degree[playerid] = 0;
		    Degree[playerid] -= Speed;
		    n1X = lX[playerid] + Radius * floatcos(Degree[playerid], degrees);
		    n1Y = lY[playerid] + Radius * floatsin(Degree[playerid], degrees);
		    SetPlayerCameraPos(playerid, n1X, n1Y, lZ[playerid] + Height);
		    SetPlayerCameraLookAt(playerid, lX[playerid], lY[playerid], lZ[playerid]+1);
		    SetPlayerFacingAngle(playerid, Degree[playerid] - 90.0);
		}
	}

    if(PRESSED( KEY_WALK ) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
    {
    	foreach(new pid : Pedagang)
		{
    		if(IsPlayerInRangeOfPoint(playerid, 4.0, pdgDATA[pid][pdgPosX], pdgDATA[pid][pdgPosY], pdgDATA[pid][pdgPosZ]))
			{
				if(pData[playerid][pFaction] != 5)
    				return Error(playerid, "You must be part of a Pedagang faction.");
				ShowPedagangMenu(playerid, pid);
			}
		}
    }
   /* if(PRESSED( KEY_WALK ))
    {
    		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2506.981933,-2637.118896,13.646511))
			{
			    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
				PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[10000];
			    format(string, sizeof(string), "Barang\t\tHarga\nAyam Fillet\t\t"LG_E"$40/{ffffff}1 Paket\nSusu Olahan\t\t"LG_E"$30/{ffffff}1 Botol\nEssence\t\t"LG_E"$25/{ffffff}1 Kotak\nEmas\t\t"LG_E"$45/{ffffff}1 emas\nBeras\t\t"LG_E"$14/{ffffff}1 Paket\nSambal\t\t"LG_E"$8/{ffffff}1 Paket\nTepung\t\t"LG_E"$10/{ffffff}1 Paket\nGula\t\t"LG_E"$12/{ffffff}1 Paket\nPenyu\t\t"LG_E"$9/{ffffff}1 Penyu\nIkan Marakel\t\t"LG_E"$3/{ffffff}1 Ikan\nIkan Nemo\t\t"LG_E"$5/{ffffff}1 Ikan\nBlue Fish\t\t"LG_E"$6/{ffffff}1 Ikan\nBesi\t\t"LG_E"$16/{ffffff}1 Besi\nAluminium\t\t"LG_E"$22/{ffffff}1 Tembaga\nPapan\t\t"LG_E"$80/{ffffff}1 Papan");
		    	ShowPlayerDialog(playerid, DIALOG_HOLIMARKET, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE Market - Penjualan", string, "Jual", "Batal");
			}
    	}*/

	// SELL FISH AUFA
    if(PRESSED( KEY_WALK ))
    {
    		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2798.4680,-1578.8145,10.9858))
			{
			    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
				PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[10000];
			    format(string, sizeof(string), "Mancing Ikan\t\tHarga\nPenyu\t\t"LG_E"$9/{ffffff}1 Penyu\nIkan Marakel\t\t"LG_E"$3/{ffffff}1 Ikan\nIkan Nemo\t\t"LG_E"$5/{ffffff}1 Ikan\nBlue Fish\t\t"LG_E"$6/{ffffff}1 Ikan");
		    	ShowPlayerDialog(playerid, DIALOG_JUALIKAN, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE Market - Jual Ikan", string, "Jual", "Batal");
			}
    	}
	//sell hasil tambang & minyak Aufa
	if(PRESSED( KEY_WALK ))
    {
    		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2798.1953,-1571.1901,11.0391))
			{
			    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
				PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[10000];
			    format(string, sizeof(string), "nambang\t\tHarga\nEssence\t\t"LG_E"$15/{ffffff}1 Kotak\nEmas\t\t"LG_E"$16/{ffffff}1 emas\nBesi\t\t"LG_E"$10/{ffffff}1 Besi\nAluminium\t\t"LG_E"13/{ffffff}1 Aluminium");
		    	ShowPlayerDialog(playerid, DIALOG_TAMBANG, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE Market -Hasil Nambang", string, "Jual", "Batal");
			}
    	}
	//sell hasil petani & peternak ayam
	if(PRESSED( KEY_WALK ))
    {
    		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2799.2314,-1556.5638,11.0114))
			{
			    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
				PlayerPlaySound(playerid, 5202, 0,0,0);
				new string[10000];
			    format(string, sizeof(string), "Petani/Peternak\t\tHarga\nPacket Ayam\t\t"LG_E"$10/{ffffff}1 Paket\nSusu Olahan\t\t"LG_E"$20/{ffffff}1 botol\nBeras\t\t"LG_E"$14/{ffffff}1 Paket\nSambal\t\t"LG_E"$8/{ffffff}1 Paket\nTepung\t\t"LG_E"$10/{ffffff}1 Paket\nGula\t\t"LG_E"8$/{ffffff}1 Paket\nBiji Kopi\t\t"LG_E"15$/{ffffff}1 Pakett\nSari teh\t\t"LG_E"10$/{ffffff}1 Pakett\nSari Jeruk\t\t"LG_E"10$/{ffffff}1 Paket");
		    	ShowPlayerDialog(playerid, DIALOG_JUALPETANI, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE Market - Peternak & Petani", string, "Jual", "Batal");
			}
    	}

	//hasil tukang kayu
	if(PRESSED( KEY_WALK ))
    {
		if(IsPlayerInRangeOfPoint(playerid, 2.0, 2799.0505,-1544.9191,11.0521))
		{
			if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
			PlayerPlaySound(playerid, 5202, 0,0,0);
			new string[10000];
			format(string, sizeof(string), "Kayu\t\tHarga\nPapan\t\t"LG_E"$18/{ffffff}1 Papan");
			ShowPlayerDialog(playerid, DIALOG_JUALKAYU, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE Market - Tukang Kayu", string, "Jual", "Batal");
		}
	}
	if(PRESSED( KEY_WALK ))
    {
    	if(IsPlayerInRangeOfPoint(playerid, 2.0, 2803.5535,-1585.6144,10.9272))
		{
		    if(pData[playerid][pProgress] == 1) return ErrorMsg(playerid, "Anda masih memiliki activity progress!");
			PlayerPlaySound(playerid, 5202, 0,0,0);
			new string[10000];
		    format(string, sizeof(string), "Daur ulang\t\tHarga\nBotol\t\t"LG_E"$40/{ffffff}1 botol\nKaret\t\t"LG_E"$60/{ffffff}1 karet");
		   	ShowPlayerDialog(playerid, DIALOG_JUALBOTOL, DIALOG_STYLE_TABLIST_HEADERS, "ASIA LANE Market - Tukang Daur ulang", string, "Jual", "Batal");
		}
    }
   	if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 3, 1090.9022,1318.3073,10.9625))
        {
        	return callcmd::menumasak(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1090.4324,1327.5913,10.9787))
        {
        	return callcmd::menu(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1087.5863,1318.2523,10.9623))
        {
        	return callcmd::menuminum(playerid, "");
        }
	}
    if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 2, -999.998291,-683.041320,32.007812))
        {
        	return callcmd::kargo(playerid, "");
        }
		//ayamaufa
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1377.1400,735.8207,10.8203))
        {
            return callcmd::izinayam(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 2, 1387.7285,736.9077,10.8203))
        {
            return callcmd::ambilayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1393.8392,758.2020,10.9203))
        {
        	return callcmd::potongayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 1386.5592,767.5418,10.9203))
        {
        	return callcmd::packingayam(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, 2395.137695,-1495.538696,23.834865))
        {
        	return callcmd::jualayam(playerid, "");
        }


        else if(IsPlayerInRangeOfPoint(playerid, 5, 1458.828491,-674.108825,94.979980))
        {
        	return callcmd::menumasak(playerid, "");
        }
    }
    if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 2, ORusa1))
        {
        	return callcmd::ambilrusa(playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, ORusa2))
        {
        	return callcmd::ambilrusa(playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, ORusa2))
        {
        	return callcmd::ambilrusa(playerid);
        }
    }
    if(PRESSED(KEY_WALK) && GetPlayerState(playerid) == PLAYER_STATE_ONFOOT)
	{
        if(IsPlayerInRangeOfPoint(playerid, 2, -1060.852172,-1195.437011,129.664138))
        {
        	return callcmd::belibibit(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1141.685791,-1095.497192,129.218750))
        {
        	return callcmd::plant(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1129.279663,-1095.668579,129.218750))
        {
        	return callcmd::plant(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1125.371826,-1084.356811,129.218750))
        {
        	return callcmd::plant(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1138.143554,-1084.205688,129.218750))
        {
        	return callcmd::plant(playerid, "");
        }
        else if(IsPlayerInRangeOfPoint(playerid, 2, -1431.233398,-1460.474975,101.693000))
        {
        	return callcmd::proses(playerid, "");
        }
    }
    if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 1244.857910,-2020.113891,59.894012))
		{
            if(pData[playerid][pJob] != 1) return 1;
		    if(pData[playerid][pBusTime] > 0)
		    	return	ErrorMsg(playerid, "Anda harus menunggu.");
		    	
	    	pData[playerid][pKendaraanKerja] = CreateVehicle(431, 1244.857910,-2020.113891,59.894012,180.118698,0,0,120000,0);
			PutPlayerInVehicle(playerid, pData[playerid][pKendaraanKerja], 0);
	    	SetVehicleNumberPlate(pData[playerid][pKendaraanKerja], "JOB VEHICLE");
	    	new tmpobjid;
	    	tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "PELABUHAN - BANDARA", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.274, 0.464, -0.120, 0.000, 0.000, 89.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.330, -2.455, 0.490, 0.000, 0.000, 90.099);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.349, -4.018, 0.490, 0.000, 0.000, 90.999);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.411, -3.781, 0.550, 0.000, 0.000, 90.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "ASIA LANE Transit", 90, "Times New Roman", 45, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.427, -3.071, 0.480, 0.000, 0.000, 91.600);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.342, -2.997, 0.210, 0.000, 0.000, 91.299);
		    tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "PELABUHAN - BANDARA", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.322, 0.442, -0.090, 0.000, 0.000, -90.900);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.345, -1.662, 0.490, 0.000, 0.000, -90.000);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.342, -3.243, 0.490, 0.000, 0.000, -90.299);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.400, -4.109, 0.550, 0.000, 0.000, -91.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "ASIA LANE Transit", 90, "Times New Roman", 48, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.448, -2.595, 0.440, 0.000, 0.000, -84.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.397, -3.351, 0.150, 0.000, 0.000, -89.399);
			pData[playerid][pBusTime] = 360;
			pData[playerid][pBus] = 1;
			SetPlayerRaceCheckpoint(playerid, 2, buspoint1, buspoint1, 4.0);
			pData[playerid][pCheckPoint] = CHECKPOINT_BUS;
			InfoMsg(playerid, "Ikuti Checkpoint!");
			SwitchVehicleEngine(pData[playerid][pKendaraanKerja], true);
		}
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, -609.8121,-507.1617,25.7228))
		{
            if(pData[playerid][pJob] != 1) return 1;
		    if(pData[playerid][pBusTime] > 0)
		    	return	ErrorMsg(playerid, "Anda harus menunggu.");

	    	pData[playerid][pKendaraanKerja] = CreateVehicle(431, -609.8121,-507.1617,25.7228,272.3994,0,0,120000,0);
			PutPlayerInVehicle(playerid, pData[playerid][pKendaraanKerja], 0);
	    	SetVehicleNumberPlate(pData[playerid][pKendaraanKerja], "JOB VEHICLE");
	    	SwitchVehicleEngine(pData[playerid][pKendaraanKerja], true);
	    	pData[playerid][pBusRute] = 2;
	    	new tmpobjid;
	    	tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "Terminal Bus", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.274, 0.464, -0.120, 0.000, 0.000, 89.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.330, -2.455, 0.490, 0.000, 0.000, 90.099);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.349, -4.018, 0.490, 0.000, 0.000, 90.999);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.411, -3.781, 0.550, 0.000, 0.000, 90.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "ASIA LANE Transit", 90, "Times New Roman", 45, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.427, -3.071, 0.480, 0.000, 0.000, 91.600);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], 1.342, -2.997, 0.210, 0.000, 0.000, 91.299);
		    tmpobjid = CreateDynamicObject(7313,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10837, "airroadsigns_sfse", "ws_airbigsign1", 0);
		    SetDynamicObjectMaterial(tmpobjid, 1, 16646, "a51_alpha", "des_rails1", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "Terminal Bus", 80, "Arial", 30, 0, 0xFF555999, 0xFF000000, 1);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.322, 0.442, -0.090, 0.000, 0.000, -90.900);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.345, -1.662, 0.490, 0.000, 0.000, -90.000);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.342, -3.243, 0.490, 0.000, 0.000, -90.299);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "u", 90, "Webdings", 100, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.400, -4.109, 0.550, 0.000, 0.000, -91.899);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "ASIA LANE Transit", 90, "Times New Roman", 48, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.448, -2.595, 0.440, 0.000, 0.000, -84.799);
		    tmpobjid = CreateDynamicObject(2722,0.0,0.0,-1000.0,0.0,0.0,0.0,0,0,-1,300.0,300.0);
		    SetDynamicObjectMaterial(tmpobjid, 0, 10101, "2notherbuildsfe", "ferry_build14", 0);
		    SetDynamicObjectMaterialText(tmpobjid, 0, "BUS", 90, "Times New Roman", 65, 0, -16777216, 0, 0);
		    AttachDynamicObjectToVehicle(tmpobjid, pData[playerid][pKendaraanKerja], -1.397, -3.351, 0.150, 0.000, 0.000, -89.399);
			pData[playerid][pBusTime] = 360;
			pData[playerid][pBus] = 66;
			SetPlayerRaceCheckpoint(playerid, 2, cpbus1, cpbus1, 4.0);
			pData[playerid][pCheckPoint] = CHECKPOINT_BUS;
			InfoMsg(playerid, "Ikuti Checkpoint!");
		}
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 1171.60,-1298.29,13.63))
		{
            if(pData[playerid][pMoney] < 750)
				return ErrorMsg(playerid, "Anda tidak memiliki uang sebanyak $750!");

			pData[playerid][pObatStress] += 1;
			GivePlayerMoneyEx(playerid, -750);
			ShowItemBox(playerid, "Obat_Stress", "Received_1x", 1241, 4);
			ShowItemBox(playerid, "Uang", "Removed_$750", 1212, 4);
		}
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.0, 1171.42,-1299.85,13.63))
		{
            if(pData[playerid][pMoney] < 500)
				return ErrorMsg(playerid, "Anda tidak memiliki uang sebanyak $500!");

			pData[playerid][pPerban] += 1;
			GivePlayerMoneyEx(playerid, -500);
			ShowItemBox(playerid, "Perban", "Received_1x", 11736, 4);
			ShowItemBox(playerid, "Uang", "Removed_$500", 1212, 4);
		}
	}



	//bandara
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 1871.1113,-2423.3376,22.3647))
		{
            if(pData[playerid][pStarterpack] != 0)
				return ErrorMsg(playerid, "Kamu sudah mengambil Sebelumnya!");

			pData[playerid][pStarterpack] = 1;
			pData[playerid][pPhone] = 1;
			pData[playerid][pGPS] = 1;
			ShowItemBox(playerid, "Ponsel", "Received_1x", 18871, 4);
			pData[playerid][pSnack] += 10;
			pData[playerid][pSprunk] += 10;
			GivePlayerMoneyEx(playerid, 3000);
			SuccesMsg(playerid, "Anda Diberi Kompensasi 10 Snack, 10 Water Dan $3.000");
			ShowItemBox(playerid, "Snack", "Received_10x", 2821, 4);
			ShowItemBox(playerid, "Water", "Received_10x", 2958, 4);
			ShowItemBox(playerid, "Uang", "Received_$3.000", 1212, 4);
		}
	}

	//terminal
	
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.5, -607.68,-488.65,25.62))
		{
            if(pData[playerid][pStarterpack] != 0)
				return ErrorMsg(playerid, "Kamu sudah mengambil Sebelumnya!");

			pData[playerid][pStarterpack] = 1;
			pData[playerid][pPhone] = 1;
			pData[playerid][pGPS] = 1;
			ShowItemBox(playerid, "Ponsel", "Received_1x", 18871, 4);
			pData[playerid][pSnack] += 10;
			pData[playerid][pSprunk] += 10;
			GivePlayerMoneyEx(playerid, 3000);
			SuccesMsg(playerid, "Anda Diberi Kompensasi 10 Snack, 10 Water Dan $3.000");
			ShowItemBox(playerid, "Snack", "Received_10x", 2821, 4);
			ShowItemBox(playerid, "Water", "Received_10x", 2958, 4);
			ShowItemBox(playerid, "Uang", "Received_$3.000", 1212, 4);
		}
	}

	//pelabuhan
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 1.5, 2794.25, -2449.40, 13.69))
		{
            if(pData[playerid][pStarterpack] != 0)
				return ErrorMsg(playerid, "Kamu sudah mengambil Sebelumnya!");

			pData[playerid][pStarterpack] = 1;
			pData[playerid][pPhone] = 1;
			pData[playerid][pGPS] = 1;
			ShowItemBox(playerid, "Ponsel", "Received_1x", 18871, 4);
			pData[playerid][pSnack] += 10;
			pData[playerid][pSprunk] += 10;
			GivePlayerMoneyEx(playerid, 3000);
			SuccesMsg(playerid, "Anda Diberi Kompensasi 10 Snack, 10 Water Dan $3.000");
			ShowItemBox(playerid, "Snack", "Received_10x", 2821, 4);
			ShowItemBox(playerid, "Water", "Received_10x", 2958, 4);
			ShowItemBox(playerid, "Uang", "Received_$3.000", 1212, 4);
		}
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 2605.5583,2808.3623,10.8203))
		{
		   callcmd::creategun(playerid, "");
		}
	}
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, -1069.9493,-2322.5383,55.7935))
		{
		   callcmd::lockpick(playerid, "");
		}
	}
	
	if(newkeys & KEY_WALK)
	{
	    if(IsPlayerInRangeOfPoint(playerid, 3, 830.3033,-2066.9246,13.2240))
		{
		   callcmd::pernikahan(playerid, "");
		}
	}


	if(newkeys & KEY_WALK)
	{
		if(IsPlayerInRangeOfPoint(playerid, 1, 709.5767,913.5621,-95.2773))//1
        {
            if(pData[playerid][pTimeTambang1] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang1] = 1;
        	SetTimerEx("TungguNambang1", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 709.8533,919.4036,-95.1732))//2
        {
        	if(pData[playerid][pTimeTambang2] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang2] = 1;
        	SetTimerEx("TungguNambang2", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 709.3992,928.4020,-95.1243))//3
        {
        	if(pData[playerid][pTimeTambang3] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang3] = 1;
        	SetTimerEx("TungguNambang3", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 709.9236,935.4225,-95.2557))//4
        {
        	if(pData[playerid][pTimeTambang4] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang4] = 1;
        	SetTimerEx("TungguNambang4", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 709.5246,943.4365,-94.7009))//5
        {
        	if(pData[playerid][pTimeTambang5] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang5] = 1;
        	SetTimerEx("TungguNambang5", 50000, false, "d", playerid);
        }
        else if(IsPlayerInRangeOfPoint(playerid, 1, 709.4019,951.4313,-95.2810))//6
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang6", 50000, false, "d", playerid);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 709.2734,957.3970,-95.2880))//7
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang7", 50000, false, "d", playerid);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 709.2361,963.6351,-94.3459))//8
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang8", 50000, false, "d", playerid);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 709.0634,969.4482,-94.1523))//9
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang8", 50000, false, "d", playerid);
        }
		else if(IsPlayerInRangeOfPoint(playerid, 1, 709.0248,974.7826,-94.1309))//10
        {
        	if(pData[playerid][pTimeTambang6] > 0) return 1;
        	callcmd::nambang1(playerid, "");
        	pData[playerid][pTimeTambang6] = 1;
        	SetTimerEx("TungguNambang8", 50000, false, "d", playerid);
        }

        else if(IsPlayerInRangeOfPoint(playerid, 3, -1373.5966,2110.0200,42.2000))//7
        {
        	callcmd::cucibatu(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1377.4637,2112.6091,42.2000))//7
        {
        	callcmd::cucibatu(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3, -1381.2932,2115.5972,42.2000))//7
        {
        	callcmd::cucibatu(playerid, "");
        }

        else if(IsPlayerInRangeOfPoint(playerid, 3, -1300.6775,2705.0994,50.0625))//8
        {
        	callcmd::peleburanbatu(playerid, "");
        }
		else if(IsPlayerInRangeOfPoint(playerid, 3,-1309.0109,2702.4890,50.0625))//8
        {
        	callcmd::peleburanbatu(playerid, "");
        }
	}
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 300.121429,1141.311645,9.137485))
		{
		    if(pData[playerid][pJob] == 5)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPEMERAH, DIALOG_STYLE_LIST, "ASIA LANE {ffffff}- Locker Pemerah", "Baju Kerja\nBaju Warga", "Pilih", "Kembali");
		}
	}
	//penambang batu bara
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 110.3333,1105.5592,13.6094))
		{
		    if(pData[playerid][pJob] == 6)
			ShowPlayerDialog(playerid, DIALOG_LOCKERPENAMBANG, DIALOG_STYLE_LIST, "ASIA LANE {ffffff}- Locker Penambang batu", "Baju Kerja\nBaju Warga", "Pilih", "Kembali");
		}
	}

	//nambang minyak
	if((newkeys & KEY_WALK))
	{
		if(IsPlayerInRangeOfPoint(playerid, 3, 117.4530,1108.9342,13.6094))
		{
		    if(pData[playerid][pJob] == 4)
			ShowPlayerDialog(playerid, DIALOG_LOCKERMINYAK, DIALOG_STYLE_LIST, "ASIA LANE {ffffff}- Locker Penambang Minyak", "Baju Kerja\nBaju Warga", "Pilih", "Kembali");
		}
	}

	if(PRESSED( KEY_CTRL_BACK ))
	{
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1 || pData[playerid][pCuffed] == 1) return Error(playerid, "You can't do at this moment.");
		if(GetPlayerState(playerid) == PLAYER_STATE_ONFOOT && pData[playerid][pCuffed] == 0)
		{
			if(pData[playerid][pLoopAnim])
	    	{	
	        	pData[playerid][pLoopAnim] = 0;

				ClearAnimations(playerid);
				StopLoopingAnim(playerid);
				SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
				TogglePlayerControllable(playerid, 1);
		    	TextDrawHideForPlayer(playerid, AnimationTD);
			}
		}
    }
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	if(use_speedo[playerid])
	{
		if(newstate != 2 && oldstate == 2)
		{
	        TextDrawHideForPlayer(playerid, speedoball);
			PlayerTextDrawHide(playerid, spedobodyruq[playerid][0]);
			DestroyPlayerCircleProgress(playerid);
		}
		if(newstate == 2 && oldstate != 2)
		{
		    TextDrawShowForPlayer(playerid, speedoball);
			PlayerTextDrawShow(playerid, spedobodyruq[playerid][0]);
		}
	}

	if(newstate == PLAYER_STATE_WASTED && pData[playerid][pJail] < 1)
    {	
		if(pData[playerid][pInjured] == 0)
        {
            pData[playerid][pInjured] = 1;
            SetPlayerHealthEx(playerid, 99999);

            pData[playerid][pInt] = GetPlayerInterior(playerid);
            pData[playerid][pWorld] = GetPlayerVirtualWorld(playerid);

            GetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
            GetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
        }
        else
        {
            pData[playerid][pHospital] = 1;
        }
	}
	//Spec Player
	new vehicleid = GetPlayerVehicleID(playerid);
	if(newstate == PLAYER_STATE_ONFOOT)
	{
		if(pData[playerid][playerSpectated] != 0)
		{
			foreach(new ii : Player)
			{
				if(pData[ii][pSpec] == playerid)
				{
					PlayerSpectatePlayer(ii, playerid);
					Servers(ii, ,"%s(%i) is now on foot.", pData[playerid][pName], playerid);
				}
			}
		}
	}
	if(newstate == PLAYER_STATE_DRIVER || newstate == PLAYER_STATE_PASSENGER)
    {
		if(pData[playerid][pInjured] == 1)
        {
            //RemoveFromVehicle(playerid);
			RemovePlayerFromVehicle(playerid);
            SetPlayerHealthEx(playerid, 99999);
        }
		foreach (new ii : Player) if(pData[ii][pSpec] == playerid) 
		{
            PlayerSpectateVehicle(ii, GetPlayerVehicleID(playerid));
        }
	}
	if(oldstate == PLAYER_STATE_DRIVER)
    {
		//spedoo aufa
		for(new i = 0; i < 7; i++)
		{
			PlayerTextDrawHide(playerid, spedobodyruq[playerid][i]);
		}
		if(pData[playerid][pIsStealing] == 1)
		{
			pData[playerid][pIsStealing] = 0;
			pData[playerid][pLastChopTime] = 0;
			Info(playerid, "Anda gagal mencuri kendaraan ini, di karenakan Anda keluar kendaraan saat proses pencurian!");
			KillTimer(MalingKendaraan);

		}
		HidePlayerProgressBar(playerid, pData[playerid][spfuelbar]);
        HidePlayerProgressBar(playerid, pData[playerid][spdamagebar]);
	}
	else if(newstate == PLAYER_STATE_DRIVER)
    {
		foreach(new pv : PVehicles)
		{
			if(vehicleid == pvData[pv][cVeh])
			{
				if(IsABike(vehicleid) || GetVehicleModel(vehicleid) == 424)
				{
					if(pvData[pv][cLocked] == 1)
					{
						RemovePlayerFromVehicle(playerid);
						//new Float:slx, Float:sly, Float:slz;
						//GetPlayerPos(playerid, slx, sly, slz);
						//SetPlayerPos(playerid, slx, sly, slz);
						ShowInfo(playerid, "Kendaraan ini Dikunci", BOXCOLOR_RED);
						return 1;
					}
				}
			}
		}
		if(IsSAPDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 1)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SAPD!");
			}
		}
		if(IsGovCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 2)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SAGS!");
			}
		}
		if(IsSAMDCar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 3)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SAMD!");
			}
		}
		if(IsSANACar(vehicleid))
		{
		    if(pData[playerid][pFaction] != 4)
			{
			    RemovePlayerFromVehicle(playerid);
			    ErrorMsg(playerid, "Anda bukan SANEWS!");
			}
		}
		if(!IsEngineVehicle(vehicleid))
        {
            SwitchVehicleEngine(vehicleid, true);
        }
		if(IsEngineVehicle(vehicleid) && pData[playerid][pDriveLic] <= 0)
        {
            WarningMsg(playerid, "Anda tidak memiliki sim.");
        }
		if(pData[playerid][pHBEMode] == 1)
		{
			for(new i = 0; i < 7; i++)
			{
			    PlayerTextDrawShow(playerid, spedobodyruq[playerid][i]);
				
			}
		}
		
		else
		{
		
		}
		new Float:health;
        GetVehicleHealth(GetPlayerVehicleID(playerid), health);
        VehicleHealthSecurityData[GetPlayerVehicleID(playerid)] = health;
        VehicleHealthSecurity[GetPlayerVehicleID(playerid)] = true;
		
		if(pData[playerid][playerSpectated] != 0)
  		{
			foreach(new ii : Player)
			{
    			if(pData[ii][pSpec] == playerid)
			    {
        			PlayerSpectateVehicle(ii, vehicleid);
				    Servers(ii, "%s(%i) is now driving a %s(%d).", pData[playerid][pName], playerid, GetVehicleModelName(GetVehicleModel(vehicleid)), vehicleid);
				}
			}
		}
		SetPVarInt(playerid, "LastVehicleID", vehicleid);
	}
	return 1;
}

public OnPlayerWeaponShot(playerid, weaponid, hittype, hitid, Float:fX, Float:fY, Float:fZ)
{
    if(Deer[playerid] == 1) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2046.76978, -799.45319, 127.07957) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2046.7698, -799.4532, 126.7188, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing F. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 2) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2021.1818, -494.0207, 76.1904) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2021.18176, -494.02069, 76.19040, 3.5, -90.0000, 0.0000, 0.0000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}m. Du-te si jupoaiei pielea de pe ea apasat CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 3) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1632.5769, -599.7444, 62.0889) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1632.57690, -599.74438, 61.82332, 3.5, 90.00000, 0.00000, -54.66002);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }

                }
            }
        }
    }else if(Deer[playerid] == 4) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 1741.4386, -979.5817, 36.9209) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 1741.43860, -979.58173, 36.61147, 3.5, 90.00000, 0.00000, -7.38000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 5) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2553.6780, -963.4338, 82.0169) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2553.67798, -963.43378, 81.66848, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 6) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2637.4963, -380.2195, 58.2060) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid], 2637.49634, -380.21951, 57.92605, 3.5, 90.00000, 0.00000, -49.26000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }else if(Deer[playerid] == 7) {
        if(weaponid == 33) {
            if(hittype == BULLET_HIT_TYPE_OBJECT) {
                if(IsPlayerInRangeOfPoint(playerid, 100.0, 2406.9773, -403.4681, 72.4926) && Shoot_Deer[playerid] == 0) {
                    KillTimer(Meeters_BTWDeer[playerid]);
                    Meeter_Kill[playerid] = Meeters[playerid];
                    Meeters_BTWDeer[playerid] = SetTimerEx("Detect_M", 1000, true, "i", playerid);

                    if(Meeter_Kill[playerid] >= 5) {
                        Shoot_Deer[playerid] = 1;
                        new mesaj[256];
                        MoveObject(Hunter_Deer[playerid],  2406.97729, -403.46811, 72.17617, 3.5, 90.00000, 0.00000, 0.00000);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}You killed a deer from a distance {1e90ff}%d{FFFFFF}Go and peel the skin off it by pressing CTRL. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        Deep_Deer[playerid] = 1;
                    }else {
                        new mesaj[256];
                        DestroyObject(Hunter_Deer[playerid]);
                        format(mesaj, sizeof(mesaj), "{1e90ff}(JOB): {FFFFFF}Because you fired from a distance {1e90ff}%d{FFFFFF}the deer got scared and ran away. ", Meeter_Kill[playerid]);
                        SendClientMessage(playerid, -1, mesaj);
                        DisablePlayerCheckpoint(playerid);
                        SetTimerEx("Next_Deer", 1000, false, "i", playerid);
                    }
                }
            }
        }
    }
	if(explosive{playerid})
	{
	    CreateExplosion(fX, fY, fZ, 12, 5.0);
	}
	switch(weaponid){ case 0..18, 39..54: return 1;} //invalid weapons
	if(1 <= weaponid <= 46 && pData[playerid][pGuns][g_aWeaponSlots[weaponid]] == weaponid)
	{
		pData[playerid][pAmmo][g_aWeaponSlots[weaponid]]--;
		if(pData[playerid][pGuns][g_aWeaponSlots[weaponid]] != 0 && !pData[playerid][pAmmo][g_aWeaponSlots[weaponid]])
		{
			pData[playerid][pGuns][g_aWeaponSlots[weaponid]] = 0;
		}
	}
	return 1;
}

stock GivePlayerHealth(playerid,Float:Health)
{
	new Float:health; GetPlayerHealth(playerid,health);
	SetPlayerHealth(playerid,health+Health);
}

public OnVehicleDamageStatusUpdate(vehicleid, playerid)
{
   	new Float: p_HP;
    GetPlayerHealth(playerid, p_HP);
	if(!pData[playerid][pSeatbelt])
	{
		SetPlayerHealth(playerid, p_HP-3);
		PlayerPlaySoundEx(playerid, 1130);
		SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFF000066));
	}

	new
        Float: vehicleHealth,
        playerVehicleId = GetPlayerVehicleID(playerid);

    new Float: health;
	health = GetPlayerHealth(playerid, health);
    GetVehicleHealth(playerVehicleId, vehicleHealth);
    if(pData[playerid][pSeatbelt] == 0 || pData[playerid][pHelmetOn] == 0)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 2);
    		new bsakit = RandomEx(0, 2);
    		new csakit = RandomEx(0, 2);
    		new dsakit = RandomEx(0, 2);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -2);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 100)
    	{
    		new asakit = RandomEx(0, 3);
    		new bsakit = RandomEx(0, 3);
    		new csakit = RandomEx(0, 3);
    		new dsakit = RandomEx(0, 3);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -5);
    		return 1;
    	}
    	return 1;
    }
    if(pData[playerid][pSeatbelt] == 1 || pData[playerid][pHelmetOn] == 1)
    {
    	if(GetVehicleSpeed(vehicleid) <= 20)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 50)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= dsakit;
    		pData[playerid][pLHand] -= bsakit;
    		pData[playerid][pRFoot] -= csakit;
    		pData[playerid][pRHand] -= dsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -1);
    		return 1;
    	}
    	if(GetVehicleSpeed(vehicleid) <= 90)
    	{
    		new asakit = RandomEx(0, 1);
    		new bsakit = RandomEx(0, 1);
    		new csakit = RandomEx(0, 1);
    		new dsakit = RandomEx(0, 1);
    		pData[playerid][pLFoot] -= csakit;
    		pData[playerid][pLHand] -= csakit;
    		pData[playerid][pRFoot] -= dsakit;
    		pData[playerid][pRHand] -= bsakit;
    		pData[playerid][pHead] -= asakit;
    		GivePlayerHealth(playerid, -3);
    		return 1;
    	}
    }
    return 1;
}

public OnPlayerTakeDamage(playerid, issuerid, Float:amount, weaponid, bodypart)
{
	new str[60];
	new Float:hp;
	GetPlayerHealth(playerid, hp);
	if(IsPlayerNPC(issuerid) || !IsPlayerInAnyVehicle(issuerid)) return 0;
	if(weaponid > 21 && weaponid < 34 || weaponid == 38)
	{
	    SetPlayerHealth(playerid, hp);
		TogglePlayerControllable(issuerid, 0);
		warnings{issuerid} ++;
		if(warnings{issuerid} < MAX_WARININGS)
		{
		    format(str, sizeof(str), "{FFFFFF}Jangan lakukan drive-by {FF0000}%d{FFFFFF}/{FF0000}%d", warnings{issuerid}, MAX_WARININGS);
		    ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Drive-By", str, "Ok", "");
		    TogglePlayerControllable(issuerid, 1);
		}
		if(warnings{issuerid} >= MAX_WARININGS)
		{
		    ShowPlayerDialog(issuerid, 12221, DIALOG_STYLE_MSGBOX, "{FF0000}Drive-By", "{FF0000}Anda telah di tendang karna drive-by", "Ok", "");
		    KickEx(issuerid);
		}
	}
	if(IsAtEvent[playerid] == 0)
	{
		new sakit = RandomEx(1, 4);
		new asakit = RandomEx(1, 5);
		new bsakit = RandomEx(1, 7);
		new csakit = RandomEx(1, 4);
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			pData[playerid][pHead] -= 20;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 3)
		{
			pData[playerid][pPerut] -= sakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 6)
		{
			pData[playerid][pRHand] -= bsakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 5)
		{
			pData[playerid][pLHand] -= asakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 8)
		{
			pData[playerid][pRFoot] -= csakit;
		}
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 7)
		{
			pData[playerid][pLFoot] -= bsakit;
		}
	}
	else if(IsAtEvent[playerid] == 1)
	{
		if(issuerid != INVALID_PLAYER_ID && GetPlayerWeapon(issuerid) && bodypart == 9)
		{
			GivePlayerHealth(playerid, -90);
			SendClientMessage(issuerid, -1,"{7fffd4}[ TDM ]{ffffff} Headshot!");
		}
	}
    return 1;
}

stock SavePeluru(playerid)
{
    new queryBuffer[103];
	if(GetPlayerWeapon(playerid) == WEAPON_DEAGLE)
	{
		pData[playerid][pPeluru][0] = GetPlayerAmmo(playerid);
		mysql_format(g_SQL, queryBuffer, sizeof(queryBuffer), "UPDATE players SET peluru_0 = %i WHERE uid = %i", pData[playerid][pPeluru][0], pData[playerid][pID]);
		mysql_tquery(g_SQL, queryBuffer);
	}
	else if(GetPlayerWeapon(playerid) == WEAPON_SILENCED)
	{
		pData[playerid][pPeluru][1] = GetPlayerAmmo(playerid);
		mysql_format(g_SQL, queryBuffer, sizeof(queryBuffer), "UPDATE players SET peluru_1 = %i WHERE uid = %i", pData[playerid][pPeluru][1], pData[playerid][pID]);
		mysql_tquery(g_SQL, queryBuffer);
	}
}

public OnPlayerUpdate(playerid)
{

    afk_tick[playerid]++;
    new string[256];
	format(string, sizeof string, "%02d:%02d", JamFivEm, DetikFivEm);
   	PlayerTextDrawSetString(playerid, HudAufa[playerid][43], string);
   	TextDrawSetString(JAMLOCKSCREEN, string);
    SavePeluru(playerid);
	if(vpara[playerid] == 1) 
    { 
        if(IsPlayerInAnyVehicle(playerid)) 
        { 
            if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) 
            { 
                static vid, Float:x, Float:y, Float:z; 
               	vid = GetPlayerVehicleID(playerid); 
                GetVehicleVelocity(vid,x,y,z); 
                SetVehicleVelocity(vid,x,y,-0.2); 
            } 
        } 
    } 
	foreach(new ii : Player)
	{
		if(playerid == pData[ii][pCall])
		{
			format(string, sizeof(string), "%02d:%02d:%02d", JamCall[ii], MenitCall[ii], DetikCall[ii]);
			PlayerTextDrawSetString(ii, WaktutelHP[ii], string);

			format(string, sizeof(string), "%02d:%02d:%02d", JamCall[playerid], MenitCall[playerid], DetikCall[playerid]);
			PlayerTextDrawSetString(playerid, WaktutelHP[playerid], string);
		}
	}

	static str[500];
	if (PlayerInfo[playerid][pWaypoint])
	{
		format(str, sizeof(str), "~b~GPS:~w~ %s (%.2f meters)", PlayerInfo[playerid][pLocation], GetPlayerDistanceFromPoint(playerid, PlayerInfo[playerid][pWaypointPos][0], PlayerInfo[playerid][pWaypointPos][1], PlayerInfo[playerid][pWaypointPos][2]));
		PlayerTextDrawSetString(playerid, PlayerInfo[playerid][pTextdraws][69], str);
	}
	//SAPD Tazer/Taser
	UpdateTazer(playerid);
	
	//SAPD Road Spike
	CheckPlayerInSpike(playerid);

	//Report ask
	//GetPlayerName(playerid, g_player_name[playerid], MAX_PLAYER_NAME);

	//AntiCheat
	pData[playerid][pLastUpdate] = gettime();

	//SpeedCam
	static id;
	new vehicled = Vehicle_Nearest2(playerid), query[326];
	if ((id = SpeedCam_Nearest(playerid)) != -1 && GetPlayerSpeedCam(playerid) > CamData[id][CamLimit] && GetPlayerState(playerid) == PLAYER_STATE_DRIVER && pvData[vehicled][cOwner] == pData[playerid][pID] && GetEngineStatus(vehicled) && !pData[playerid][pSpeedTime])
	{
	    if (!IsACruiser(vehicled) && !IsABoat(vehicled) && !IsAPlane(vehicled) && !IsAHelicopter(vehicled))
	    {
	 		new price = 30 + floatround(GetPlayerSpeedCam(playerid) - CamData[id][CamLimit]);
	   		format(str, sizeof(str), "Kecepatan (%.0f/%.0f mph)", GetPlayerSpeedCam(playerid), CamData[id][CamLimit]);
	        SetTimerEx("HidePlayerBox", 500, false, "dd", playerid, _:ShowPlayerBox(playerid, 0xFFFFFF66));
    		format(str, sizeof(str), "Anda telah melebihi kecepatan dan mendapatkan denda sebesar ~y~%s", FormatMoney(price));
     		InfoMsg(playerid, str);
			pvData[vehicled][cTicket] += price;

			mysql_format(g_SQL, query, sizeof(query), "UPDATE vehicle SET ticket = '%d' WHERE id = '%d'", pvData[vehicled][cTicket], pvData[vehicled][cID]);
			mysql_tquery(g_SQL, query);
			pData[playerid][pSpeedTime] = 5;
		}
	}
	return 1;
}

task VehicleUpdate[40000]()
{
	for (new i = 1; i != MAX_VEHICLES; i ++) if(IsEngineVehicle(i) && GetEngineStatus(i))
    {
        if(GetVehicleFuel(i) > 0)
        {
			new fuel = GetVehicleFuel(i);
            SetVehicleFuel(i, fuel - 1);

            if(GetVehicleFuel(i) >= 1 && GetVehicleFuel(i) <= 20)
            {
               Info(GetVehicleDriver(i), "Kendaraan ingin habis bensin, Harap pergi ke SPBU ( Gas Station )");
            }
        }
        if(GetVehicleFuel(i) <= 0)
        {
            SetVehicleFuel(i, 0);
            SwitchVehicleEngine(i, false);
        }
    }
	foreach(new ii : PVehicles)
	{
		if(IsValidVehicle(pvData[ii][cVeh]))
		{
			if(pvData[ii][cPlateTime] != 0 && pvData[ii][cPlateTime] <= gettime())
			{
				format(pvData[ii][cPlate], 32, "NoHave");
				SetVehicleNumberPlate(pvData[ii][cVeh], pvData[ii][cPlate]);
				pvData[ii][cPlateTime] = 0;
			}
			if(pvData[ii][cRent] != 0 && pvData[ii][cRent] <= gettime())
			{
				pvData[ii][cRent] = 0;
				new query[128], xuery[128];
				mysql_format(g_SQL, query, sizeof(query), "DELETE FROM vehicle WHERE id = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, query);

				mysql_format(g_SQL, xuery, sizeof(xuery), "DELETE FROM vstorage WHERE owner = '%d'", pvData[ii][cID]);
				mysql_tquery(g_SQL, xuery);
				if(IsValidVehicle(pvData[ii][cVeh])) DestroyVehicle(pvData[ii][cVeh]);
				pvData[ii][cVeh] = INVALID_VEHICLE_ID;
				//iter_SafeRemove(PVehicles, ii, ii);
			}
		}
		if(pvData[ii][cClaimTime] != 0 && pvData[ii][cClaimTime] <= gettime())
		{
			pvData[ii][cClaimTime] = 0;
		}
	}
}
public OnVehicleDeath(vehicleid, killerid)
{
    foreach(new i : PVehicles)
    {
        if(pvData[i][cVeh] == vehicleid)
        {
            pvData[i][cStolen] = gettime() + 15;
        }
    }
    return 1;
}

public OnVehicleSpawn(vehicleid)
{
    //LoadedTrash[vehicleid] = 0;
    foreach(new ii : PVehicles)
    {
        if(vehicleid == pvData[ii][cVeh] && pvData[ii][cRent] == 0 && pvData[ii][cStolen] > gettime())
        {
            if(pvData[ii][cInsu] > 0)
            {
                pvData[ii][cStolen] = 0;

                pvData[ii][cClaim] = 1;
                pvData[ii][cClaimTime] = gettime() + (1 * 1200);
                foreach(new pid : Player) if (pvData[ii][cOwner] == pData[pid][pID])
                {
                    Info(pid, "Kendaraan anda hancur, silahkan ambil di kantor insurance.");
                }
                if(IsValidVehicle(pvData[ii][cVeh]))
                    DestroyVehicle(pvData[ii][cVeh]);

                pvData[ii][cVeh] = INVALID_VEHICLE_ID;
            }
        }
    }
    return 1;
}
ptask PlayerVehicleUpdate[200](playerid)
{
	new vehicleid = GetPlayerVehicleID(playerid);
	if(IsValidVehicle(vehicleid))
	{
		if(!GetEngineStatus(vehicleid) && IsEngineVehicle(vehicleid))
		{	
			SwitchVehicleEngine(vehicleid, false);
		}
		if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			new Float:fHealth;
			GetVehicleHealth(vehicleid, fHealth);
			if(IsValidVehicle(vehicleid) && fHealth <= 250.0)
			{
				SetValidVehicleHealth(vehicleid, 300.0);
				SwitchVehicleEngine(vehicleid, false);
				ErrorMsg(playerid, "Mesin kendaraan anda rusak, segera perbaiki");
			}
		}
		if(IsPlayerInAnyVehicle(playerid) && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
		{
			if(pData[playerid][pHBEMode] == 1)
			{
				new Float:fDamage, Float:fFuel, color1, color2, fuelstr[50], veh[50];
				new tstr[64];

				GetVehicleColor(vehicleid, color1, color2);

				GetVehicleHealth(vehicleid, fDamage);

				//fDamage = floatdiv(1000 - fDamage, 10) * 1.42999;

				if(fDamage <= 350.0) fDamage = 0.0;
				else if(fDamage > 8000.0) fDamage = 8000.0;

				fFuel = GetVehicleFuel(vehicleid);

				// if(fFuel < 0.0) fFuel = 0.0;
				// else if(fFuel > 300.0) fFuel = 300.0;

				if(fFuel <= 100.0) veh = "~g~";
				else if(fFuel <= 70.0) veh = "~y~";
				else if(fFuel <= 45.0) veh = "~r~";


				if(!GetEngineStatus(vehicleid))
				{
					PlayerTextDrawSetString(playerid, spedobodyruq[playerid][5], "MATI");
				}
				else
				{
					PlayerTextDrawSetString(playerid, spedobodyruq[playerid][5], "HIDUP");
				}

				format(fuelstr, sizeof(fuelstr), "%s%.0f", veh, fFuel);
				PlayerTextDrawSetString(playerid, spedobodyruq[playerid][3], fuelstr);

				// new string[4], vehruq, Float:speed, Float:x, Float:y, Float:z, model;
				// for (new playerid = GetPlayerPoolSize(); playerid > -1; playerid--)
				// {
				// 	if (!use_speedo[playerid] || GetPlayerState(playerid) != 2) continue;
				// 	vehruq = GetPlayerVehicleID(playerid);
				// 	model = GetVehicleModel(vehruq);
				// 	GetVehicleVelocity(vehruq, x, y, z);
				// 	speed = floatmul(floatsqroot(floatadd(floatmul(x, x), floatmul(y, y))), 180.0);
				// 	format(string, 4, "%.0f", speed);
				// 	PlayerTextDrawSetString(playerid, speedo[playerid], string);
				// 	ShowPlayerCircleProgress(playerid, floatround(speed / VEHICLE_TOP_SPEEDS[model - 400] * 100.0), 596.500244, 374.259460, 0x0388FCFF);
				// }

				format(tstr, sizeof(tstr), "%.0f", GetVehicleSpeed(vehicleid));
				PlayerTextDrawSetString(playerid, spedobodyruq[playerid][0], tstr);
			}
			else
			{
			
			}
		}
	}
}
ptask PlayerUpdate[999](playerid)
{
    // AFK
	new StringF[50];
	if(afk_tick[playerid] > 10000) afk_tick[playerid] = 1, afk_check[playerid] = 0;
	if(afk_check[playerid] < afk_tick[playerid] && GetPlayerState(playerid)) afk_check[playerid] = afk_tick[playerid], afk_time[playerid] = 0;
	if(afk_check[playerid] == afk_tick[playerid] && GetPlayerState(playerid))
	{
		afk_time[playerid]++;
		if(afk_time[playerid] > 2)
		{
			format(StringF,sizeof(StringF), "Melamun....");
			SetPlayerChatBubble(playerid, StringF, COLOR_ORANGE, 15.0, 1200);
		}
	}
    if(pData[playerid][TempatHealing])
    {
        stresstimer[playerid] = SetTimerEx("StressBerkurang", 5000, true, "d", playerid);
    }
    if(pData[playerid][pBladder] <= 15)
    {
        pData[playerid][TempatHealing] = false;
        KillTimer(stresstimer[playerid]);
    }
    if(pData[playerid][AmbilAyam] == 8)
    {
        pData[playerid][AmbilAyam] = 0;
        pData[playerid][DutyAmbilAyam] = 0;
        SetPlayerPos(playerid, 1386.5592,767.5418,10.9203);
		SetPlayerFacingAngle(playerid, 194.2674);
    }
    //JOB BUS
    new vehicleid = GetPlayerVehicleID(playerid);
	if(pData[playerid][pBus] && GetVehicleModel(vehicleid) == 431 && pData[playerid][pBuswaiting])
	{
		if(pData[playerid][pBustime] > 0)
		{
			pData[playerid][pBustime]--;
			new str[512];
			format(str, sizeof(str), "Tunggu %d Detik", pData[playerid][pBustime]);
			Altruqtd(playerid, str, 1);
			PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
		}
		else
		{
			if(IsPlayerInRangeOfPoint(playerid, 2.0, 1965.075073,-1779.868530,13.479113))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 16;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 2, buspoint16, buspoint16, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 2763.975097,-2479.834228,13.575368))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 27;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, buspoint27, buspoint27, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1235.685913,-1855.510986,13.481544))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 59;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, buspoint59, buspoint59, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			//rute bus 2
			/*else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1909.409545,-1929.344238,12.945344))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 69;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, cpbus4, cpbus4, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 1825.054931,-1665.261474,12.955155))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 73;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, cpbus7, cpbus7, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}
			else if(IsPlayerInRangeOfPoint(playerid, 2.0, 2082.242187,-1777.502929,12.955197))
			{
				pData[playerid][pBuswaiting] = false;
				pData[playerid][pBustime] = 0;
				pData[playerid][pBus] = 77;
				DisablePlayerRaceCheckpoint(playerid);
				SetPlayerRaceCheckpoint(playerid, 1, cpbus11, cpbus11, 5.0);
				PlayerPlaySound(playerid, 43000, 0.0,0.0,0.0);
			}*/
		}
	}
	if(GetPlayerScore(playerid) < 5)//artinya kalau level dibawah 2 bakalan ke kick terkena anti cheat weapon hack
 	{
		if(GetPlayerWeapon(playerid) == 10)//id 25 sama dengan senjata shotgun
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 11)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 12)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 13)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 14)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 15)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 16)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
        if(GetPlayerWeapon(playerid) == 17)//id 38 sama dengan senjata minigun
		{	
			ResetPlayerWeaponsEx(playerid); 
		   	Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 18)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 19)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 20)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 21)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 22)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 23)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 24)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 25)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 26)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 27)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 28)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 29)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 30)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 32)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 32)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 33)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 34)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 35)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 36)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 37)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 38)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 39)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}
		if(GetPlayerWeapon(playerid) == 40)
		{
			ResetPlayerWeaponsEx(playerid);   
		    Kick(playerid);
		}		
	}
	//Anti-Cheat Vehicle health hack
	if(pData[playerid][pAdmin] < 2)
	{
		for(new v, j = GetVehiclePoolSize(); v <= j; v++) if(GetVehicleModel(v))
		{
			new Float:health;
			GetVehicleHealth(v, health);
			if( (health > VehicleHealthSecurityData[v]) && VehicleHealthSecurity[v] == false)
			{
				if(GetPlayerVehicleID(playerid) == v)
				{
					new playerState = GetPlayerState(playerid);
					if(playerState == PLAYER_STATE_DRIVER)
					{
						SetValidVehicleHealth(v, VehicleHealthSecurityData[v]);
						SendClientMessageToAllEx(COLOR_RED, "[ASIA LANE BOT]: telah menendang %s dari kota, Alasan: Vehicle Health!", pData[playerid][pName]);
						KickEx(playerid);
					}
				}
			}
			if(VehicleHealthSecurity[v] == true)
			{
				VehicleHealthSecurity[v] = false;
			}
			VehicleHealthSecurityData[v] = health;
		}
	}	
	//Anti-Money Hack
	if(GetPlayerMoney(playerid) > pData[playerid][pMoney])
	{
		ResetPlayerMoney(playerid);
		GivePlayerMoney(playerid, pData[playerid][pMoney]);
		//SendAdminMessage(COLOR_RED, "Possible money hacks detected on %s(%i). Check on this player. "LG_E"($%d).", pData[playerid][pName], playerid, GetPlayerMoney(playerid) - pData[playerid][pMoney]);
	}
	if(pData[playerid][pJail] <= 0)
	{
		if(pData[playerid][pHunger] > 100)
		{
			pData[playerid][pHunger] = 100;
		}
		if(pData[playerid][pHunger] < 0)
		{
			pData[playerid][pHunger] = 0;
		}
		if(pData[playerid][pBladder] > 100)
		{
			pData[playerid][pBladder] = 100;
		}
		if(pData[playerid][pBladder] < 0)
		{
			pData[playerid][pBladder] = 0;
		}
		if(pData[playerid][pEnergy] > 100)
		{
			pData[playerid][pEnergy] = 100;
		}
		if(pData[playerid][pEnergy] < 0)
		{
			pData[playerid][pEnergy] = 0;
		}
        // if(pData[playerid][pKencing] > 100)
		// {
		// 	pData[playerid][pKencing] = 100;
		// }
		// if(pData[playerid][pKencing] < 0)
		// {
		// 	pData[playerid][pKencing] = 0;
		// }
	}
	if(pData[playerid][pHBEMode] == 1 && pData[playerid][IsLoggedIn] == true)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);

		PlayerTextDrawShow(playerid, voiceaufa[playerid][0]);
		PlayerTextDrawShow(playerid, voiceaufa[playerid][1]);

		new str[32];
		format(str, sizeof(str), "%d", playerid);
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][7], str);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][7]);

		format(str, sizeof(str), "%s", GetLocation(x, y, z));
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][11], str);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][11]);

		new Float:rz;
		if(IsPlayerInAnyVehicle(playerid))
		{
			GetVehicleZAngle(GetPlayerVehicleID(playerid), rz);
		}
		else
		{
			GetPlayerFacingAngle(playerid, rz);
		}

		if(rz >= 348.75 || rz < 11.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "N");
		else if(rz >= 326.25 && rz < 348.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 303.75 && rz < 326.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 281.25 && rz < 303.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 258.75 && rz < 281.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "E");
		else if(rz >= 236.25 && rz < 258.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 213.75 && rz < 236.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 191.25 && rz < 213.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 168.75 && rz < 191.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "S");
		else if(rz >= 146.25 && rz < 168.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 123.25 && rz < 146.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 101.25 && rz < 123.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 78.75 && rz < 101.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "W");
		else if(rz >= 56.25 && rz < 78.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 33.75 && rz < 56.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 11.5 && rz < 33.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		PlayerTextDrawShow(playerid, HbeBaru[playerid][5]);
		new day, month, year;
		getdate(year,month,day);
		new string[256];
		format(string, sizeof string, "%02d %s %02d", day, GetMonthName(month), year);
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][12], string);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][12]);
		
		format(string, sizeof string, "%dms", GetPlayerPing(playerid));
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][4], string);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][4]);

		new AufaSampCode[1000];
		format(AufaSampCode, 250, "%d", pData[playerid][pHunger]);
		PlayerTextDrawSetString(playerid, LAPARBAR[playerid], AufaSampCode);
		PlayerTextDrawShow(playerid, LAPARBAR[playerid]);

		format(AufaSampCode, 250, "%d", pData[playerid][pEnergy]);
		PlayerTextDrawSetString(playerid, HAUSBAR[playerid], AufaSampCode);
		PlayerTextDrawShow(playerid, HAUSBAR[playerid]);

		format(AufaSampCode, 250, "%d", pData[playerid][pBladder]);
		PlayerTextDrawSetString(playerid, STRESBAR[playerid], AufaSampCode);
		PlayerTextDrawShow(playerid, STRESBAR[playerid]);

	}
	else if(pData[playerid][pHBEMode] == 2 && pData[playerid][IsLoggedIn] == true)
	{
		new Float:x, Float:y, Float:z;
		GetPlayerPos(playerid, x, y, z);

		// PlayerTextDrawHide(playerid, VoiceMode[playerid][0]);
		// PlayerTextDrawHide(playerid, VoiceMode[playerid][1]);
		
		new str[32];
		format(str, sizeof(str), "%d", playerid);
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][7], str);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][7]);

		format(str, sizeof(str), "%s", GetLocation(x, y, z));
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][11], str);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][11]);
		
		format(str, sizeof str, "%dms", GetPlayerPing(playerid));
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][4], str);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][4]);
		
		new Float:rz;
		if(IsPlayerInAnyVehicle(playerid))
		{
			GetVehicleZAngle(GetPlayerVehicleID(playerid), rz);
		}
		else
		{
			GetPlayerFacingAngle(playerid, rz);
		}

		if(rz >= 348.75 || rz < 11.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "N");
		else if(rz >= 326.25 && rz < 348.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 303.75 && rz < 326.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 281.25 && rz < 303.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 258.75 && rz < 281.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "E");
		else if(rz >= 236.25 && rz < 258.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 213.75 && rz < 236.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 191.25 && rz < 213.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 168.75 && rz < 191.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "S");
		else if(rz >= 146.25 && rz < 168.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 123.25 && rz < 146.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 101.25 && rz < 123.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 78.75 && rz < 101.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "W");
		else if(rz >= 56.25 && rz < 78.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 33.75 && rz < 56.25) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		else if(rz >= 11.5 && rz < 33.75) PlayerTextDrawSetString(playerid, HbeBaru[playerid][5], "!");
		PlayerTextDrawShow(playerid, HbeBaru[playerid][5]);
		new day, month, year;
		getdate(year,month,day);
		new string[128];
		format(string, sizeof string, "%02d %s %02d", day, GetMonthName(month), year);
		PlayerTextDrawSetString(playerid, HbeBaru[playerid][12], string);
		PlayerTextDrawShow(playerid, HbeBaru[playerid][12]);

	}
	if(pData[playerid][pHospital] == 1)
    {
		if(pData[playerid][pInjured] == 1)
		{
			SetPlayerPosition(playerid, 1538.1902,-1555.9956,68.4489,94.4637, 1);
		
			SetPlayerInterior(playerid, 1);
			SetPlayerVirtualWorld(playerid, playerid + 100);

			SetPlayerCameraPos(playerid, 1153.0083, -1315.9470, 2231.9749);
			SetPlayerCameraLookAt(playerid, 1153.0083, -1315.9470, 2231.9749);
			TogglePlayerControllable(playerid, 0);
			pData[playerid][pInjured] = 0;
			UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, "");
			ResetPlayerWeaponsEx(playerid);
		}
		pData[playerid][pHospitalTime]++;
		new mstr[64];
		format(mstr, sizeof(mstr), "~n~~n~~n~~w~Recovering... %d", 15 - pData[playerid][pHospitalTime]);
		InfoTD_MSG(playerid, 1000, mstr);

		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
		ApplyAnimation(playerid, "CRACK", "crckdeth2", 4.0, 1, 0, 0, 0, 0);
        if(pData[playerid][pHospitalTime] >= 15)
        {
            pData[playerid][pHospitalTime] = 0;
            pData[playerid][pHospital] = 0;
			pData[playerid][pHunger] = 100;
			pData[playerid][pEnergy] = 100;
			SetPlayerHealthEx(playerid, 100);
			pData[playerid][pBladder] = 0;
			// pData[playerid][pKencing] = 0;
			pData[playerid][pSick] = 0;
			GivePlayerMoneyEx(playerid, -1500);
			SetPlayerHealthEx(playerid, 100);
			HideTdDeath(playerid);

            for (new i; i < 20; i++)
            {
                SendClientMessage(playerid, -1, "");
            }

            InfoMsg(playerid, "Anda membayar $1,500 kerumah sakit.");
 
			SetPlayerPosition(playerid, 1187.1838,-1323.7324,13.5591,258.4347);

            TogglePlayerControllable(playerid, 1);
            SetCameraBehindPlayer(playerid);

            SetPlayerVirtualWorld(playerid, 0);
            SetPlayerInterior(playerid, 0);
			ClearAnimations(playerid);
			pData[playerid][pSpawned] = 1;
			SetPVarInt(playerid, "GiveUptime", -1);
		}
    }
	if(pData[playerid][pInjured] == 1 && pData[playerid][pHospital] != 1)
    {
		new string[30];
		format(string, sizeof(string), "(( Orang ini sedang Kejang))");
		UpdateDynamic3DTextLabelText(pData[playerid][pInjuredLabel], COLOR_ORANGE, string);

		ShowTdDeath(playerid);
		
		/*format(Death,1000,"%s Detik", 600 - pData[playerid][pHospital]);
		PlayerTextDrawSetString(playerid, Text_Player[playerid][8], Death)*/
		
		if(GetPVarInt(playerid, "GiveUptime") == -1)
		{
			SetPVarInt(playerid, "GiveUptime", gettime());
		}
		
		//aufa tes 
		if(GetPVarInt(playerid,"GiveUptime"))
        {
            if((gettime()-GetPVarInt(playerid, "GiveUptime")) > 600)
            {
                Info(playerid, "Kamu tidak bisa menggunakan ini, kamu harus menunggu 10 menit untuk menggunakan ini");
                SetPVarInt(playerid, "GiveUptime", 0);
            }
        }
		
        ApplyAnimation(playerid, "CRACK", "null", 4.0, 0, 0, 0, 1, 0, 1);
        ApplyAnimation(playerid, "CRACK", "crckdeth4", 4.0, 0, 0, 0, 1, 0, 1);
        SetPlayerHealthEx(playerid, 99999);
    }
	if(pData[playerid][pInjured] == 0 && pData[playerid][pGender] != 0) //Pengurangan Data
	{
		if(++ pData[playerid][pHungerTime] >= 200)
        {
            if(pData[playerid][pHunger] > 0)
            {
                pData[playerid][pHunger]--;
            }
            pData[playerid][pHungerTime] = 0;
        }
        if(++ pData[playerid][pEnergyTime] >= 200)
        {
            if(pData[playerid][pEnergy] > 0)
            {
                pData[playerid][pEnergy]--;
            }
            pData[playerid][pEnergyTime] = 0;
        }
		//notif warning makan
		// if(pData[playerid][pHunger] <= 15)
        // {
        // 	Info(playerid, "Sepertinya anda mengalami Kelaparan, silahkan segera Makan ( jika bar di bawah 2 persen maka anda akan pingsan ).");
        // 	SetPlayerDrunkLevel(playerid, 2200);
        // }
		if(pData[playerid][pHunger] <= 1)
        {
			{
				if(pData[playerid][pInjured] == 0)
      			{
            	pData[playerid][pInjured] = 1;
          		SetPlayerHealthEx(playerid, 99999);
				Info(playerid, "Sepertinya anda mengalami Kelaparan berat.");
       			}
			}      		
        }
		//notif warning minum
		// if(pData[playerid][pEnergy] <= 15)
        // {
        // 	Info(playerid, "Sepertinya anda mengalami dehidrasi, silahkan segera minum ( jika bar di bawah 2 persen maka anda akan pingsan ).");
        // 	SetPlayerDrunkLevel(playerid, 2200);
        // }
		if(pData[playerid][pEnergy] <= 1)
        {
			{
				if(pData[playerid][pInjured] == 0)
      			{
            		pData[playerid][pInjured] = 1;
          			SetPlayerHealthEx(playerid, 99999);
					Info(playerid, "Sepertinya anda dehidrasi.");
       			}
			}      		
        }

        if(++ pData[playerid][pBladderTime] >= 150)
        {
            if(pData[playerid][pBladder] < 97)
            {
                pData[playerid][pBladder]++;
            }
            else if(pData[playerid][pBladder] >= 90)
            {
          		Info(playerid, "Sepertinya anda stress, segeralah pergi ke pantai atau konsumsi pil untuk menghilangkan stress.");
          		SetPlayerDrunkLevel(playerid, 2200);
            }
            pData[playerid][pBladderTime] = 0;
        }
        // if(++ pData[playerid][pKencingTime] >= 60)
        // {
        //     if(pData[playerid][pKencing] < 97)
        //     {
        //         pData[playerid][pKencing]++;
        //     }
        //     else if(pData[playerid][pKencing] >= 90)
        //     {
        //   		Info(playerid, "Karakter anda merasa ingin kencing ( Gunakan CMD /kencing untuk kencing)");
        //     }
        //     pData[playerid][pKencingTime] = 0;
        // }
		if(pData[playerid][pSick] == 1)
		{
			if(++ pData[playerid][pSickTime] >= 200)
			{
				if(pData[playerid][pSick] >= 1)
				{
					new Float:hp;
					GetPlayerHealth(playerid, hp);
					Info(playerid, "Sepertinya anda sakit, segeralah pergi ke dokter.");
					pData[playerid][pSickTime] = 0;
				}
			}
		}
	}
	if (pData[playerid][pSpeedTime] > 0)
	{
	    pData[playerid][pSpeedTime]--;
	}
	if(pData[playerid][pLastChopTime] > 0)
    {
		pData[playerid][pLastChopTime]--;
		new mstr[64];
        format(mstr, sizeof(mstr), "Waktu Pencurian ~r~%d ~w~detik", pData[playerid][pLastChopTime]);
        InfoTD_MSG(playerid, 1000, mstr);
	}
	//Jail Player
	if(pData[playerid][pJail] > 0)
	{
		if(pData[playerid][pJailTime] > 0)
		{
			pData[playerid][pJailTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~Anda akan dibebaskan dalam ~w~%d ~b~~h~detik.", pData[playerid][pJailTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pJail] = 0;
			pData[playerid][pJailTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1508.1083,-1671.3943,14.0469, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			InfoMsg(playerid, "Anda Telah dibebaskan dari penjara");
		}
	}
	//Arreset Player
	if(pData[playerid][pArrest] > 0)
	{
		if(pData[playerid][pArrestTime] > 0)
		{
			pData[playerid][pArrestTime]--;
			new mstr[128];
			format(mstr, sizeof(mstr), "~b~~h~Anda dipenjara selama ~w~%d ~b~~h~detik.", pData[playerid][pArrestTime]);
			InfoTD_MSG(playerid, 1000, mstr);
		}
		else
		{
			pData[playerid][pArrest] = 0;
			pData[playerid][pArrestTime] = 0;
			//SpawnPlayer(playerid);
			SetPlayerPositionEx(playerid, 1508.1083,-1671.3943,14.0469, 2000);
			SetPlayerInterior(playerid, 0);
			SetPlayerVirtualWorld(playerid, 0);
			SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
			InfoMsg(playerid, "Anda telah dibebaskan dari penjara");
		}
	}
	return 1;
}
public OnPlayerExitVehicle(playerid, vehicleid)
{
    if(vehicleid == Car_Job[playerid])
    {
        timer_Car[playerid] = SetTimerEx("Detectare_Intrare", 1000, true, "i", playerid);
        Seconds_timer[playerid] = 0;
        SendClientMessage(playerid, ATENTIE, "Silahkan kembali ke kendaraan selama 120 detik.");
    }
	if(vehicleid == pData[playerid][pKendaraanKerja])
    {
        KeluarKerja[playerid] = SetTimerEx("KeluarKendaraanKerja", 1000, true, "i", playerid);
        TimerKeluar[playerid] = 0;
        InfoMsg(playerid, "Segera masuk kedalam kendaraan dalam 15 detik!");
    }
	if(GetPlayerState(playerid) == PLAYER_STATE_DRIVER) 
    { 
        vpara[playerid]=0; 
        DestroyDynamicObject(para[vehicleid]); 
    } 
    if(pData[playerid][pDriveLicApp] > 0)
	{
		//new vehicleid = GetPlayerVehicleID(playerid);
		if(GetVehicleModel(vehicleid) == 602)
		{
		    DisablePlayerCheckpoint(playerid);
			DisablePlayerRaceCheckpoint(playerid);
		    Info(playerid, "Anda Dengan Sengaja Keluar Dari Mobil Latihan, Anda Telah "RED_E"DIDISKUALIFIKASI.");
		    RemovePlayerFromVehicle(playerid);
		    pData[playerid][pDriveLicApp] = 0;
		    SetTimerEx("RespawnPV", 3000, false, "d", vehicleid);
		}
	}
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	if(PlayerData[playerid][pAdmin] > 0)
	{
		DisplayStats(clickedplayerid, playerid);
	}
	return 1;
}

public OnPlayerClickMap(playerid, Float:fX, Float:fY, Float:fZ)
{
	Waypoint_Set(playerid, GetLocation(fX, fY, fZ), fX, fY, fZ);
    if (pData[playerid][pAdmin] >= 4 && PlayerInfo[playerid][pAdminDuty] == 1)
    {
        new vehicleid = GetPlayerVehicleID(playerid);
        if(vehicleid > 0 && GetPlayerState(playerid) == PLAYER_STATE_DRIVER)
        {
                SetVehiclePos(vehicleid, fX, fY, fZ+10);
        }
        else
        {
                SetPlayerPosFindZ(playerid, fX, fY, 999.0);
                SetPlayerVirtualWorld(playerid, 0);
                SetPlayerInterior(playerid, 0);
        }
    }
    foreach (new i : Player)
	{
		if(pData[i][pClikmap] == pData[playerid][pClikmap] && pData[playerid][pClikmap] != 0 && pData[i][pClikmap] != 0)
		{
			SetPlayerCheckpoint(i, fX, fY, fZ, 3.0);
			Info(i, "Waypoint Sharing, Lihat pada map.");
		}
    }
    return 1;
}

stock SenjataHilang(playerid)
{
	new cQuery[4028];
	pData[playerid][pPeluru][0] = 0;
	pData[playerid][pPeluru][1] = 0;
	pData[playerid][pDe] = 0;
	pData[playerid][pKatana] = 0;
	pData[playerid][pMolotov] = 0;
	pData[playerid][p9mm] = 0;
	pData[playerid][pSg] = 0;
	pData[playerid][pSpas] = 0;
	pData[playerid][pMp5] = 0;
	pData[playerid][pM4] = 0;
	pData[playerid][pClip] = 0;
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET peluru_0 = 0, peluru_1 = 0 WHERE reg_id = %i", pData[playerid][pPeluru][0], pData[playerid][pPeluru][1], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET de = 0 WHERE reg_id = %i", pData[playerid][pDe], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET katana = 0 WHERE reg_id = %i", pData[playerid][pKatana], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET molotov = 0 WHERE reg_id = %i", pData[playerid][pMolotov], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET 9mm = 0 WHERE reg_id = %i", pData[playerid][p9mm], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET sg = 0 WHERE reg_id = %i", pData[playerid][pSg], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET spas = 0 WHERE reg_id = %i", pData[playerid][pSpas], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET mp5 = 0 WHERE reg_id = %i", pData[playerid][pMp5], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET m4 = 0 WHERE reg_id = %i", pData[playerid][pM4], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	mysql_format(g_SQL, cQuery, sizeof(cQuery), "UPDATE players SET clip = 0 WHERE reg_id = %i", pData[playerid][pClip], pData[playerid][pID]);
	mysql_tquery(g_SQL, cQuery);
	return 1;
}

stock SendDiscordMessage(channel, message[])
{
	new DCC_Channel:ChannelId;
	switch(channel)
	{
		//==[ Log Join & Leave ]
		case 0:
		{
			ChannelId = DCC_FindChannelById("1204853723579424868");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Command ]
		case 1:
		{
			ChannelId = DCC_FindChannelById("1202795937244905512");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log Chat IC ]
		// case 2:
		// {
		// 	ChannelId = DCC_FindChannelById("1144606076923293717");
		// 	DCC_SendChannelMessage(ChannelId, message);
		// 	return 1;
		// }
		//==[ Warning & Banned ]
		case 2:
		{
			ChannelId = DCC_FindChannelById("1202387101019283466");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Cheat Detect ]
		case 3:
		{
			ChannelId = DCC_FindChannelById("1202387101019283466");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		// //==[ Ucp ]
		// case 5:
		// {
		// 	ChannelId = DCC_FindChannelById("1099135730044907681");
		// 	DCC_SendChannelMessage(ChannelId, message);
		// 	return 1;
		// }
		// case 6://Korup
		// {
		// 	ChannelId = DCC_FindChannelById("985459255127732244");
		// 	DCC_SendChannelMessage(ChannelId, message);
		// 	return 1;
		// }
		case 4://Register
		{
			ChannelId = DCC_FindChannelById("1210813721102913577");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		// case 8://Bot Admin
		// {
		// 	ChannelId = DCC_FindChannelById("981567510006624266");
		// 	DCC_SendChannelMessage(ChannelId, message);
		// 	return 1;
		// }
		//==[ Log Death ]
		case 5:
		{
			ChannelId = DCC_FindChannelById("1204855099327905813");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
		//==[ Log CMD Admin ]
		// case 10:
		// {
		// 	ChannelId = DCC_FindChannelById("987326112227016786");
		// 	DCC_SendChannelMessage(ChannelId, message);
		// 	return 1;
		// }
		//==[ LOG STATUS SERVER ]==
		case 6:
		{
			ChannelId = DCC_FindChannelById("1202223015497039897");
			DCC_SendChannelMessage(ChannelId, message);
			return 1;
		}
	}
	return 1;
}

public OnPlayerClickTextDraw(playerid, Text:clickedid)
{	
	//dealer
	if(clickedid == DealerTD[0])//kiri
	{
	    cskin[playerid]--;
   		if(cskin[playerid] < 0) cskin[playerid] = sizeof Kendaraan - 1;
    	if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
   		pData[playerid][pKendaraanDealer] = CreateVehicle(Kendaraan[cskin[playerid]], 1853.037475,869.174865,10.910516,359.373474,0,0,-1);
   		PutPlayerInVehicle(playerid, pData[playerid][pKendaraanDealer], 0);
   		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", FormatMoney(GetVehicleCost(Kendaraan[cskin[playerid]])));
		TextDrawSetString(DealerTD[6], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[6]);
	    format(AtmInfo,1000,"%s", GetVehicleModelName(Kendaraan[cskin[playerid]]));
		TextDrawSetString(DealerTD[13], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[13]);
	    SetPlayerCameraPos(playerid,1850.219970,875.313476,10.910516);
		return 1;
	}
	if(clickedid == DealerTD[1])//kanan
	{
	    cskin[playerid]++;
	    if(cskin[playerid] >= sizeof Kendaraan) cskin[playerid] = 0;
	    if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
   		pData[playerid][pKendaraanDealer] = CreateVehicle(Kendaraan[cskin[playerid]], 1853.037475,869.174865,10.910516,359.373474,0,0,-1);
   		PutPlayerInVehicle(playerid, pData[playerid][pKendaraanDealer], 0);
   		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", FormatMoney(GetVehicleCost(Kendaraan[cskin[playerid]])));
		TextDrawSetString(DealerTD[6], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[6]);
	    format(AtmInfo,1000,"%s", GetVehicleModelName(Kendaraan[cskin[playerid]]));
		TextDrawSetString(DealerTD[13], AtmInfo);
	    TextDrawShowForPlayer(playerid, DealerTD[13]);
	    SetPlayerCameraPos(playerid,1850.219970,875.313476,10.910516);
   		return 1;
	}
	if(clickedid == DealerTD[2])//batal
	{
	    if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
   		for(new i = 0; i < 14; i++)
		{
			TextDrawHideForPlayer(playerid, DealerTD[i]);
		}
		CancelSelectTextDraw(playerid);
		SetPlayerPos(playerid, 1840.484130,883.824645,10.910516);
		SetPlayerFacingAngle(playerid, 180.544662);
		SetCameraBehindPlayer(playerid);
		delaydealer = false;
		pData[playerid][pLagiDealer] = 0;
	}
	if(clickedid == DealerTD[3])//Beli
	{
	    new modelid = Kendaraan[cskin[playerid]];
	    new cost = GetVehicleCost(modelid);
		if(pData[playerid][pMoney] < cost)
		{
			ErrorMsg(playerid, "Uang anda tidak mencukupi.!");
			return 1;
		}
   		new count = 0, limit = MAX_PLAYER_VEHICLE + pData[playerid][pVip];
		foreach(new ii : PVehicles)
		{
			if(pvData[ii][cOwner] == pData[playerid][pID])
			count++;
		}
		if(count >= limit)
		{
			ErrorMsg(playerid, "Slot kendaraan anda sudah penuh, silahkan jual beberapa kendaraan anda terlebih dahulu!");
			return 1;
		}
		GivePlayerMoneyEx(playerid, -cost);
		new duet[500];
		format(duet, sizeof(duet), "Removed_%sx", FormatMoney(cost));
		ShowItemBox(playerid, "Uang", duet, 1212, 2);
		new cQuery[1024];
		new Float:x,Float:y,Float:z, Float:a;
		if(IsValidVehicle(pData[playerid][pKendaraanDealer]))
   		DestroyVehicle(pData[playerid][pKendaraanDealer]);
		new model, color1, color2;
		color1 = 0;
		color2 = 0;
		model = modelid;
		x = 1837.052856;
		y = 870.937805;
		z = 10.910516;
		a = 94.845832;
		for(new i = 0; i < 14; i++)
		{
			TextDrawHideForPlayer(playerid, DealerTD[i]);
		}
		CancelSelectTextDraw(playerid);
		SetPlayerPos(playerid, 1840.484130,883.824645,10.910516);
		SetPlayerFacingAngle(playerid, 180.544662);
		SetCameraBehindPlayer(playerid);
		delaydealer = false;
		pData[playerid][pLagiDealer] = 0;
		mysql_format(g_SQL, cQuery, sizeof(cQuery), "INSERT INTO `vehicle` (`owner`, `model`, `color1`, `color2`, `price`, `x`, `y`, `z`, `a`) VALUES (%d, %d, %d, %d, %d, '%f', '%f', '%f', '%f')", pData[playerid][pID], model, color1, color2, cost, x, y, z, a);
		mysql_tquery(g_SQL, cQuery, "OnVehBuyPV", "ddddddffff", playerid, pData[playerid][pID], model, color1, color2, cost, x, y, z, a);
		return 1;
	}
	//close mneu pedagang aufa 
	if(clickedid == CLOSEPMENU)
	{
        for(new i = 0; i < 40; i++)
		{
			TextDrawHideForPlayer(playerid, PMENURUQ[i]);
			CancelSelectTextDraw(playerid);
		}
		TextDrawHideForPlayer(playerid, CLOSEPMENU);
		//
	}
	// //radial menu aufa
	// if(clickedid == CLOSERUQ) //keluar
	// {
    // 	for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// }
    // if(clickedid == INVENRUQ) //inventory
    // {
    //    callcmd::i(playerid, "");
	//    {
    // 	for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// }
    // }
    // if(clickedid == PHONERUQ) //hp
    // {
    //    callcmd::h(playerid, "");
	//    {
    // 	for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// }
    // }
    // if(clickedid == DOKUMENRUQ) //dokumen
    // {
    //    DisplayDokumen(playerid);
    //    {
    // 	for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// 	CancelSelectTextDraw(playerid);
    //    }
    // }
    // if(clickedid == VOICERUQQ) //voice
    // {
    //    ShowPlayerDialog(playerid, DIALOG_VOICE, DIALOG_STYLE_LIST, "Radial Menu | {7fffd4}Kota ASIA LANE", "Berbisik\nNormal\nTeriak", "Pilih", "Kembali");
    //     {
    //     for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// 	CancelSelectTextDraw(playerid);
    //    }
    // }
    // if(clickedid == AKSESORISRUQ) //toys
    // {
    //    callcmd::toys(playerid);
	//    {
    // 	for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// 	CancelSelectTextDraw(playerid);
	// }
    // }
	// if(clickedid == VEHPANELRUQ) //veh panel
	// {
	// 	callcmd::vpanel(playerid);
	// 	for(new i = 0; i < 20; i++)
    //     {
    //         TextDrawHideForPlayer(playerid, FUNGSIRADIAL[i]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	for(new txd; txd < 29; txd++)
    //     {
    //         PlayerTextDrawHide(playerid, BODYRADIAL[playerid][txd]);
    //         CancelSelectTextDraw(playerid);
    //     }
	// 	TextDrawHideForPlayer(playerid, CLOSERUQ);
    //     TextDrawHideForPlayer(playerid, INVENRUQ);
	// 	TextDrawHideForPlayer(playerid, PHONERUQ);
	// 	TextDrawHideForPlayer(playerid, DOKUMENRUQ);
	// 	TextDrawHideForPlayer(playerid, VOICERUQQ);
	// 	TextDrawHideForPlayer(playerid, AKSESORISRUQ);
	// 	TextDrawHideForPlayer(playerid, VEHPANELRUQ);
	// }
	//phone new
	//phone new
	if(clickedid == PhoneHome[20])
	{
        for(new i = 0; i < 39; i++)
		{
			TextDrawShowForPlayer(playerid, PlaystoreTD[i]);
		}
		TextDrawShowForPlayer(playerid, InstallG);
		TextDrawShowForPlayer(playerid, InstallB);
		TextDrawShowForPlayer(playerid, InstallM);
		TextDrawShowForPlayer(playerid, InstallT);
		TextDrawShowForPlayer(playerid, CLOSE4);
		TextDrawShowForPlayer(playerid, JAM4);
		//
		TweetAppStore(playerid);
		MapAppStore(playerid);
		BankAppStore(playerid);
		GojekAppStore(playerid);
		for(new i = 0; i < 62; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawHideForPlayer(playerid, CLOSE);
		TextDrawHideForPlayer(playerid, JAM);
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == CLOSE4)
	{
        for(new i = 0; i < 39; i++)
		{
			TextDrawHideForPlayer(playerid, PlaystoreTD[i]);
		}
		TextDrawHideForPlayer(playerid, InstallG);
		TextDrawHideForPlayer(playerid, InstallB);
		TextDrawHideForPlayer(playerid, InstallM);
		TextDrawHideForPlayer(playerid, InstallT);
		TextDrawHideForPlayer(playerid, CLOSE4);
		TextDrawHideForPlayer(playerid, JAM4);
		//
		for(new i = 0; i < 62; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawShowForPlayer(playerid, CLOSE);
		TextDrawShowForPlayer(playerid, JAM);
		PunyaMap(playerid);
    	PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == InstallB)
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda Sedang Mengunduh Aplikasi lain");
	    if(PlayerInfo[playerid][pInstallBank] == 1) return ErrorMsg(playerid,"Kamu Sudah Memiliki Apk Mbanking");
		ShowProgressbar(playerid, "Menginstall Mbanking..", 10);
		SetTimerEx("DownloadBank", 10000, false, "d", playerid);
	}
	if(clickedid == InstallG)
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda Sedang Mengunduh Aplikasi lain");
	    if(PlayerInfo[playerid][pInstallGojek] == 1) return ErrorMsg(playerid,"Kamu Sudah Memiliki Apk Gojek");
		ShowProgressbar(playerid, "Menginstall Gojek..", 10);
		SetTimerEx("DownloadGojek", 10000, false, "d", playerid);
	}
	if(clickedid == InstallT)
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda Sedang Mengunduh Aplikasi lain");
	    if(PlayerInfo[playerid][pInstallTweet] == 1) return ErrorMsg(playerid,"Kamu Sudah Memiliki Apk Twitter");
		ShowProgressbar(playerid, "Menginstall Twitter..", 10);
		SetTimerEx("DownloadTweet", 10000, false, "d", playerid);
	}
	if(clickedid == InstallM)
	{
	    if(PlayerInfo[playerid][pProgress] == 1) return ErrorMsg(playerid,"Anda Sedang Mengunduh Aplikasi lain");
	    if(PlayerInfo[playerid][pInstallMap] == 1) return ErrorMsg(playerid,"Kamu Sudah Memiliki Apk Google Maps");
		ShowProgressbar(playerid, "Menginstall Google Map..", 10);
		SetTimerEx("DownloadMap", 10000, false, "d", playerid);
	}
	//======== PHONE SYSTEM ======
	if(clickedid == CLOSE) //Keluar Phone
	{
        for(new i = 0; i < 62; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawHideForPlayer(playerid, JAM);
		TextDrawHideForPlayer(playerid, CLOSE);
		CancelSelectTextDraw(playerid);
		if(GetPlayerState(playerid) != PLAYER_STATE_ONFOOT || pData[playerid][pInjured] == 1 || pData[playerid][pCuffed] == 1) return Error(playerid, "You can't do at this moment.");
		ClearAnimations(playerid);
		StopLoopingAnim(playerid);
		SetPlayerSpecialAction(playerid, SPECIAL_ACTION_NONE);
		RemovePlayerAttachedObject(playerid, 9);
		TogglePlayerControllable(playerid, 1);
	}
	if(clickedid == PhoneHome[22]) // GPS
	{
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{7fffd4}ASIA LANE {ffffff}- GPS", "Lokasi Pekerjaan\nLokasi Umum\nToko Di Kota\nGarasi Kota\nWorkshop kota\nAtm Kota\n"RED_E"(Hapus Checkpoint GPS)", "Pilih", "Batal");
	}
	//MBANKING SYSTEM
	if(clickedid == PhoneHome[17])
	{
		for(new i = 0; i < 28; i++) //click muncul bank
		{
			TextDrawShowForPlayer(playerid, PhoneBank[i]);
		}
		TextDrawShowForPlayer(playerid, CLOSE1);
		TextDrawShowForPlayer(playerid, JAM2);
		TextDrawShowForPlayer(playerid, RekTD);
		 //LNRPBANK
		new Mbanking[560];
 		format(Mbanking,1000,"%s", GetName(playerid));
 		TextDrawSetString(PhoneBank[20], Mbanking);
 		format(Mbanking,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
 		TextDrawSetString(PhoneBank[21], Mbanking);
		format(Mbanking,1000,"%d", pData[playerid][pBankRek]);
 		TextDrawSetString(RekTD, Mbanking);
        //
		for(new i = 0; i < 62; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawHideForPlayer(playerid, CLOSE);
		TextDrawHideForPlayer(playerid, JAM);
		//
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == CLOSE1)
	{
	    for(new i = 0; i < 28; i++) //kembali ke menu
		{
			TextDrawHideForPlayer(playerid, PhoneBank[i]);
		}
		TextDrawHideForPlayer(playerid, CLOSE1);
		TextDrawHideForPlayer(playerid, JAM2);
		TextDrawHideForPlayer(playerid, RekTD);
		//
		for(new i = 0; i < 62; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawShowForPlayer(playerid, CLOSE);
		TextDrawShowForPlayer(playerid, JAM);
		//
    	PunyaMap(playerid);
    	PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
	}
	if(clickedid == PhoneBank[23]) //transfer
	{
	    ShowPlayerDialog(playerid, DIALOG_BANKREKENING, DIALOG_STYLE_INPUT, "Nama - Transfer", "Mohon masukan jumlah uang yang ingin di transfer:", "Transfer", "Batal");
	}
	//===================================
	if(clickedid == PhoneHome[21]) // Settings
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "Nama Phone - Setting", "Tentang Hp", "Pilih", "Kembali");
	}
	//========[ GOJEK ]==========
	if(clickedid == PhoneHome[19]) //click muncul gopay
	{
		for(new i = 0; i < 29; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneGopay[i]);
		}
/*		 new string[500],
         date[2];
         gettime(date[0], date[1]);
         format(string, sizeof (string), "%02d:%02d", date[1], date[2]);
        TextDrawSetString(JAM3, string);*/
		new Gopay[560];
		format(Gopay,1000,"$%s", FormatMoney(pData[playerid][pGopay]));
	    PlayerTextDrawSetString(playerid, SaldoG[playerid], Gopay);
		PlayerTextDrawShow(playerid, SaldoG[playerid]);
		TextDrawShowForPlayer(playerid, Pay);
		TextDrawShowForPlayer (playerid, Topup);
		TextDrawShowForPlayer(playerid, Gojek);
		TextDrawShowForPlayer(playerid, Goride);
		TextDrawShowForPlayer(playerid, Gofood);
		TextDrawShowForPlayer(playerid, CLOSE3);
		TextDrawShowForPlayer(playerid, JAM3);
		//
		for(new i = 0; i < 62; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawHideForPlayer(playerid, JAM);
		TextDrawHideForPlayer (playerid, CLOSE);
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == CLOSE3)
	{
		for(new i = 0; i < 29; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneGopay[i]);
		}
		TextDrawHideForPlayer(playerid, Pay);
		TextDrawHideForPlayer (playerid, Topup);
		TextDrawHideForPlayer(playerid, Gojek);
		TextDrawHideForPlayer(playerid, Goride);
		TextDrawHideForPlayer(playerid, Gofood);
		TextDrawHideForPlayer(playerid, CLOSE3);
		TextDrawHideForPlayer(playerid, JAM3);
		PlayerTextDrawHide(playerid, SaldoG[playerid]);
		//
        for(new i = 0; i < 62; i++) // Kembali Ke Menu
		{
			TextDrawShowForPlayer(playerid, PhoneHome[i]);
	    }
	    TextDrawShowForPlayer(playerid, CLOSE);
	    TextDrawShowForPlayer(playerid, JAM);
	    //
    	PunyaMap(playerid);
    	PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
		SelectTextDraw(playerid, COLOR_WHITE);
	}
	if(clickedid == Pay)
	{
	    ShowPlayerDialog(playerid, DIALOG_GOPAY, DIALOG_STYLE_INPUT, "GoJek App - GoPay", "Masukan jumlah uang yang ingin anda bayar", "Input", "Kembali");
	}
	if(clickedid == Topup)
	{
	    ShowPlayerDialog(playerid, DIALOG_GOTOPUP, DIALOG_STYLE_INPUT, "GoJek App - TopUp", "Masukan jumlah gopay yang ingin anda topup", "Input", "Kembali");
	}
	if(clickedid == Gojek)
	{
	    ShowPlayerDialog(playerid, DIALOG_GOJEK, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoJek", "Hai, kamu akan memesan GoJek. Mau kemana hari ini?", "Input", "Kembali");
	}
	if(clickedid == Goride)
	{
	    ShowPlayerDialog(playerid, DIALOG_GOCAR, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoCar", "Hai, kamu akan memesan GoCar. Mau kemana hari ini?", "Input", "Kembali");
	}
	if(clickedid == Gofood)
	{
	    ShowPlayerDialog(playerid, DIALOG_GOFOOD, DIALOG_STYLE_INPUT, "GoJek App - Pesan GoFood", "Hai, kamu akan memesan GoFood. Kamu mau pesan apa?", "Input", "Kembali");
	}
	//===========================================
	if(clickedid == PhoneHome[18])
	{
        ShowPlayerDialog(playerid, DIALOG_BABI, DIALOG_STYLE_INPUT, "Twitter", "Masukan text untuk post", "Kirim", "Kembali");
	}
	if(clickedid == PhoneHome[24]) //Kontak
	{
		if(pData[playerid][pPhoneBook] == 0)
		return ErrorMsg(playerid, "Anda Tidak memiliki buku telepon");

		ShowContacts(playerid);
		//
        for(new i = 0; i < 62; i++)
		{
			TextDrawHideForPlayer(playerid, PhoneHome[i]);
		}
		TextDrawHideForPlayer(playerid, JAM);
		TextDrawHideForPlayer(playerid, CLOSE);
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == PhoneHome[56]) //Sms
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_SENDSMS, DIALOG_STYLE_INPUT, "NamePhone - Kirim Pesan", "Masukan nomor yang akan anda kirimkan:", "Kirim", "Kembali");
	}
	if(clickedid == PhoneHome[23]) 
	{		
		ShowPlayerDialog(playerid, DIALOG_PHONE_DIALUMBER, DIALOG_STYLE_INPUT, "Nomor Telpon", "Masukkan Nomor telpon yang ingin anda telpon", "telpon", "Kembali");
	}





    if(clickedid == TUTUPHP)
	{
		SimpanHp(playerid);
	}
	if(clickedid == FINGERPRINT)
	{
	    TextDrawHideForPlayer(playerid, FINGERPRINT);
		TextDrawHideForPlayer(playerid, TANGGAL);
		TextDrawHideForPlayer(playerid, JAMLOCKSCREEN);

		for(new i = 0; i < 13; i++)
        {
			TextDrawShowForPlayer(playerid, APKNAME[i]);
	    }
		for(new u = 0; u < 13; u++)
        {
			PlayerTextDrawShow(playerid, APKLOGO[playerid][u]);
	    }

		TextDrawShowForPlayer(playerid, GPS);
	    TextDrawShowForPlayer(playerid, KONTAK);
		TextDrawShowForPlayer(playerid, AIRDROP);
		TextDrawShowForPlayer(playerid, GOJEK);
		TextDrawShowForPlayer(playerid, MBANKING);
		TextDrawShowForPlayer(playerid, TWITTER);
		TextDrawShowForPlayer(playerid, DARKWEB);
		TextDrawShowForPlayer(playerid, PLAYSTORE);
		TextDrawShowForPlayer(playerid, WHATSAPP);
		TextDrawShowForPlayer(playerid, CALL);
		TextDrawShowForPlayer(playerid, MUSIC);
		TextDrawShowForPlayer(playerid, SETTINGS);
		TextDrawShowForPlayer(playerid, KAMERA);
		TextDrawShowForPlayer(playerid, TUTUPHP);
		// PunyaSpotify(playerid);
		// PunyaDarkWeb(playerid);
  		PunyaMbanking(playerid);
		PunyaTwitter(playerid);
		PunyaGojek(playerid);
	}
	if(clickedid == GPS)
	{
		ShowPlayerDialog(playerid, DIALOG_GPS, DIALOG_STYLE_LIST, "{7fffd4}ASIA LANE {ffffff}- GPS", "Lokasi Pekerjaan\nLokasi Umum\nToko Di Kota\nGarasi Kota\nWorkshop kota\nAtm Kota\n"RED_E"(Hapus Checkpoint GPS)", "Pilih", "Batal");
	}
	if(clickedid == MBANKING)
	{
		SimpanHp(playerid);
		for(new u = 0; u < 11; u++)
        {
			PlayerTextDrawShow(playerid, MBANKINGAPP[playerid][u]);
	    }
	    for(new i = 0; i < 21; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneTD[i]);
		}
		PlayerTextDrawShow(playerid, TRANSFER[playerid]);
		PlayerTextDrawShow(playerid, NoRekening[playerid]);
		PlayerTextDrawShow(playerid, BNama[playerid]);
		PlayerTextDrawShow(playerid, BSaldo[playerid]);
		TextDrawShowForPlayer(playerid, TUTUPHP);
		new AtmInfo[560];
	   	format(AtmInfo,1000,"%s", GetName(playerid));
	   	PlayerTextDrawSetString(playerid, BNama[playerid], AtmInfo);
	   	format(AtmInfo,1000,"%s", FormatMoney(pData[playerid][pBankMoney]));
	   	PlayerTextDrawSetString(playerid, BSaldo[playerid], AtmInfo);
	   	format(AtmInfo,1000,"%d", pData[playerid][pBankRek]);
	   	PlayerTextDrawSetString(playerid, NoRekening[playerid], AtmInfo);
		SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(clickedid == PLAYSTORE)
	{
	    SimpanHp(playerid);
	    for(new i = 0; i < 21; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneTD[i]);
		}
		for(new u = 0; u < 31; u++)
        {
			PlayerTextDrawShow(playerid, PLAYSTOREAPP[playerid][u]);
	    }
	    TextDrawShowForPlayer(playerid, TUTUPHP);
	    SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(clickedid == SETTINGS)
	{
		ShowPlayerDialog(playerid, DIALOG_TOGGLEPHONE, DIALOG_STYLE_LIST, "ASIA LANE - Pengaturan", "Tentang Ponsel", "Pilih", "Kembali");
	}
	if(clickedid == KAMERA)
	{
		callcmd::selfie(playerid, "");
	}
	if(clickedid == MUSIC)
	{
		SimpanHp(playerid);
	    for(new u = 0; u < 12; u++)
        {
			PlayerTextDrawShow(playerid, MUSICAPP[playerid][u]);
	    }
	    for(new i = 0; i < 21; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneTD[i]);
		}
	    PlayerTextDrawShow(playerid, EARPHONE[playerid]);
	    PlayerTextDrawShow(playerid, BOOMBOX[playerid]);
	    TextDrawShowForPlayer(playerid, TUTUPHP);
	    SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(clickedid == GOJEK)
	{
		SimpanHp(playerid);
	    for(new u = 0; u < 17; u++)
        {
			PlayerTextDrawShow(playerid, GOJEKAPP[playerid][u]);
	    }
	    for(new i = 0; i < 21; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneTD[i]);
		}
		new Gopay[560];
	   	format(Gopay,1000,"%s", FormatMoney(pData[playerid][pGopay]));
	   	PlayerTextDrawSetString(playerid, GSALDO[playerid], Gopay);
	    PlayerTextDrawShow(playerid, GPAY[playerid]);
	    PlayerTextDrawShow(playerid, GTOPUP[playerid]);
	    PlayerTextDrawShow(playerid, GSALDO[playerid]);
	    PlayerTextDrawShow(playerid, GRIDE[playerid]);
	    PlayerTextDrawShow(playerid, GCAR[playerid]);
	    PlayerTextDrawShow(playerid, GFOOD[playerid]);
	    PlayerTextDrawShow(playerid, GSEND[playerid]);
	    TextDrawShowForPlayer(playerid, TUTUPHP);
	    SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(clickedid == DARKWEB)
	{
        //ShowPlayerDialog(playerid, DIALOG_IBANK, DIALOG_STYLE_LIST, "{6688FF}HoliBank", "Cek Saldo\nTransfer Uang", "Pilih", "Batal");
	}
	if(clickedid == TWITTER)
	{
		SimpanHp(playerid);
	    for(new u = 0; u < 4; u++)
        {
			PlayerTextDrawShow(playerid, TWEETAPP[playerid][u]);
	    }
	    for(new i = 0; i < 21; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneTD[i]);
		}
	    PlayerTextDrawShow(playerid, TWEET[playerid]);
	    PlayerTextDrawShow(playerid, TDAFTAR[playerid]);
	    PlayerTextDrawShow(playerid, TLOGOUT[playerid]);
	    PlayerTextDrawShow(playerid, TLOGIN[playerid]);
	    PlayerTextDrawShow(playerid, TWELCOME[playerid]);
	    TextDrawShowForPlayer(playerid, TUTUPHP);
	    SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(clickedid == KONTAK)
	{
		SimpanHp(playerid);
	    for(new u = 0; u < 3; u++)
        {
			PlayerTextDrawShow(playerid, KONTAKAPP[playerid][u]);
	    }
	    for(new i = 0; i < 21; i++)
		{
			TextDrawShowForPlayer(playerid, PhoneTD[i]);
		}
	    PlayerTextDrawShow(playerid, KONTAKBARU[playerid]);
	    PlayerTextDrawShow(playerid, DAFTARKONTAK[playerid]);
	    TextDrawShowForPlayer(playerid, TUTUPHP);
	    SelectTextDraw(playerid, COLOR_BLUE);
	}
	if(clickedid == WHATSAPP)
	{
		ShowPlayerDialog(playerid, DIALOG_PHONE_SENDSMS, DIALOG_STYLE_INPUT, "ASIA LANE - Sms", "Masukan nomor yang akan anda kirimkan:", "Kirim", "Kembali");
	}
	if(clickedid == CALL)
	{
		InfoMsg(playerid,  "Fitur telepon dalam perbaikan");
	}
    //BAJU SYSTEM Aufa
	if(clickedid == BajuTD[1])//exit
	{
	    SetPlayerSkin(playerid, pData[playerid][pSkin]);
        for(new i = 0; i < 17; i++)
		{
			TextDrawHideForPlayer(playerid, BajuTD[i]);
		}
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == BajuTD[2])//baju
	{
	    TextDrawShowForPlayer(playerid, BajuTD[4]);
		TextDrawShowForPlayer(playerid, BajuTD[5]);
		TextDrawShowForPlayer(playerid, BajuTD[6]);
		TextDrawShowForPlayer(playerid, BajuTD[7]);
		TextDrawShowForPlayer(playerid, BajuTD[13]);
		TextDrawShowForPlayer(playerid, BajuTD[14]);
		TextDrawShowForPlayer(playerid, BajuTD[15]);
		TextDrawShowForPlayer(playerid, BajuTD[16]);
	}
	if(clickedid == BajuTD[3])//aksesoris
	{
	    for(new i = 0; i < 17; i++)
		{
			TextDrawHideForPlayer(playerid, BajuTD[i]);
		}
		CancelSelectTextDraw(playerid);
	    new string[248];
		if(pToys[playerid][0][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 1\n");
		}
		else strcat(string, ""dot"Slot 1 "RED_E"(Used)\n");

		if(pToys[playerid][1][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 2\n");
		}
		else strcat(string, ""dot"Slot 2 "RED_E"(Used)\n");

		if(pToys[playerid][2][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 3\n");
		}
		else strcat(string, ""dot"Slot 3 "RED_E"(Used)\n");

		if(pToys[playerid][3][toy_model] == 0)
		{
			strcat(string, ""dot"Slot 4\n");
		}
		else strcat(string, ""dot"Slot 4 "RED_E"(Used)\n");
		ShowPlayerDialog(playerid, DIALOG_TOYBUY, DIALOG_STYLE_LIST, "ASIA LANE - Aksesoris", string, "Pilih", "Batal");
	}
	if(clickedid == BajuTD[4])//kiri
	{
	    cskin[playerid]--;
 		if(pData[playerid][pGender] == 1)
  		{
   			if(cskin[playerid] < 0) cskin[playerid] = sizeof PedMan - 1;
    		SetPlayerSkin(playerid, PedMan[cskin[playerid]]);
		}
		else
		{
			if(cskin[playerid] < 0) cskin[playerid] = sizeof PedMale - 1;
			SetPlayerSkin(playerid, PedMale[cskin[playerid]]);
		}
		return 1;
	}
	if(clickedid == BajuTD[5])//kanan
	{
	    cskin[playerid]++;
   		if(pData[playerid][pGender] == 1)
    	{
   			if(cskin[playerid] >= sizeof PedMan) cskin[playerid] = 0;
			SetPlayerSkin(playerid, PedMan[cskin[playerid]]);
		}
		else
		{
			if(cskin[playerid] >= sizeof PedMale) cskin[playerid] = 0;
			SetPlayerSkin(playerid, PedMale[cskin[playerid]]);
		}
		return 1;
	}
	if(clickedid == BajuTD[6])//beli
	{
	    pData[playerid][pSkin] = GetPlayerSkin(playerid);
        GivePlayerMoneyEx(playerid, -100);
        SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "> %s telah membeli baju seharga $100 <", ReturnName(playerid));
        ShowItemBox(playerid, "Uang", "Removed_$100", 1212, 3);
    	TextDrawHideForPlayer(playerid, BajuTD[4]);
		TextDrawHideForPlayer(playerid, BajuTD[5]);
		TextDrawHideForPlayer(playerid, BajuTD[6]);
		TextDrawHideForPlayer(playerid, BajuTD[7]);
		TextDrawHideForPlayer(playerid, BajuTD[13]);
		TextDrawHideForPlayer(playerid, BajuTD[14]);
		TextDrawHideForPlayer(playerid, BajuTD[15]);
		TextDrawHideForPlayer(playerid, BajuTD[16]);
		return 1;
	}
	if(clickedid == BajuTD[7])//exit
	{
	    SetPlayerSkin(playerid, pData[playerid][pSkin]);
	    TextDrawHideForPlayer(playerid, BajuTD[4]);
		TextDrawHideForPlayer(playerid, BajuTD[5]);
		TextDrawHideForPlayer(playerid, BajuTD[6]);
		TextDrawHideForPlayer(playerid, BajuTD[7]);
		TextDrawHideForPlayer(playerid, BajuTD[13]);
		TextDrawHideForPlayer(playerid, BajuTD[14]);
		TextDrawHideForPlayer(playerid, BajuTD[15]);
		TextDrawHideForPlayer(playerid, BajuTD[16]);
	}
	if(clickedid == NoMarket[8]) 
	{
	    for(new i = 0; i < 32; i++)
		{
			TextDrawHideForPlayer(playerid, NoMarket[i]);
		}
		CancelSelectTextDraw(playerid);
	}
	if(clickedid == NoMarket[1])
	{
	    static bizid = -1, price;
	    
	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
			price = bData[bizid][bP][0];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");

            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

			if(pData[playerid][pSprunk] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pSprunk]++;
			ShowItemBox(playerid, "Water", "Received_1x", 2958, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s membeli water seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}
	if(clickedid == NoMarket[2])
	{
	    static bizid = -1, price;

	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
			price = bData[bizid][bP][4];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");

            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

            if(pData[playerid][pSnack] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pSnack]++;
			ShowItemBox(playerid, "Snack", "Received_1x", 2821, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s membeli Snack seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}
	if(clickedid == NoMarket[4])
	{
	    static bizid = -1, price;

	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
			price = bData[bizid][bP][6];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");

            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

            if(pData[playerid][pCappucino] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pCappucino]++;
			ShowItemBox(playerid, "Cappucino", "Received_1x", 19835, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s membeli Cappucino seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}
	/*if(clickedid == MarketIndoSans[6])
	{
	    static bizid = -1, price;

	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
			price = bData[bizid][bP][2];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");

            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

            if(pData[playerid][pKebab] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pKebab]++;
			ShowItemBox(playerid, "Kebab", "Received_1x", 2769, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s membeli Kebab seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}*/
	if(clickedid == NoMarket[5])
	{
	    static bizid = -1, price;

	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
			price = bData[bizid][bP][1];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");

            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

            if(pData[playerid][pMilxMax] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pMilxMax]++;
			ShowItemBox(playerid, "Milx_Max", "Received_1x", 19570, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s membeli MilxMax seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}
	if(clickedid ==  NoMarket[3])
	{
	    static bizid = -1, price;

	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
			price = bData[bizid][bP][5];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");

            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

            if(pData[playerid][pStarling] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pStarling]++;
			ShowItemBox(playerid, "Starling", "Received_1x", 1455, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s membeli minuman Starling seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}
	if(clickedid == NoMarket[7])
	{
	    static bizid = -1, price;

	    if((bizid = pData[playerid][pInBiz]) != -1)
		{
	 		price = bData[bizid][bP][3];
			if(GetPlayerMoney(playerid) < price)
				return ErrorMsg(playerid, "Anda tidak memiliki uang!");
				
            if(price == 0)
				return ErrorMsg(playerid, "Harga produk belum di setel oleh pemilik bisnis");

			if(bData[bizid][bProd] < 1)
				return ErrorMsg(playerid, "Produk ini habis!");

            if(pData[playerid][pRoti] > 15) return ErrorMsg(playerid, "Anda tidak bisa membeli lebih dari 15");

			GivePlayerMoneyEx(playerid, -price);
			pData[playerid][pRoti]++;
			ShowItemBox(playerid, "Roti", "Received_1x", 19883, 3);
			SendNearbyMessage(playerid, 30.0, COLOR_WHITE, "ACTION: {7348EB}%s telah membeli Roti seharga %s.", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);

			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
	}
	if(clickedid == SpawnErn[1]) // Terminal
	{
		pData[playerid][PilihSpawn] = 2;
        InterpolateCameraPos(playerid, -644.3238,-484.9586,51.7151, -553.3467,-525.7678,44.5802, 3000);
		InterpolateCameraLookAt(playerid, -644.3238,-484.9586,51.7151, -553.3467,-525.7678,44.5802, 3000);
		SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SpawnErn[2]) // BANDARA
	{
		pData[playerid][PilihSpawn] = 1;
        InterpolateCameraPos(playerid, 1717.2083,-2250.4700,13.3828, 1676.7021,-2260.7058,13.5363, 3000);
		InterpolateCameraLookAt(playerid, 1717.2083,-2250.4700,13.3828, 1676.7021,-2260.7058,13.5363, 3000);
		SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SpawnErn[4]) // PELABUHAN
	{
		pData[playerid][PilihSpawn] = 5;
        InterpolateCameraPos(playerid, 2740.1541,-2440.6343,13.6432, 2771.3376,-2437.4644,13.6377, 3000);
		InterpolateCameraLookAt(playerid, 2740.1541,-2440.6343,13.6432, 2771.3376,-2437.4644,13.6377, 3000);
		SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SpawnErn[5]) // ORGANISASI
	{
	    if(pData[playerid][pFaction] == 0) return ErrorMsg(playerid, "Anda belum bergabung di organisasi manapun");
		pData[playerid][PilihSpawn] = 4;
        InterpolateCameraPos(playerid, 698.826049, -1404.027099, 16.206615, 2045.292480, -1425.237182, 128.337753, 60000);
		InterpolateCameraLookAt(playerid, 703.825317, -1404.041992, 16.120681, 2050.291992, -1425.306762, 128.361190, 50000);
		SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SpawnErn[6]) // LOKASI TERAKHIR
	{
		pData[playerid][PilihSpawn] = 3;
		InterpolateCameraPos(playerid, 1058.544433, -1086.021362, 83.586357, 595.605712, -1334.382934, 89.737655, 10000);
		InterpolateCameraLookAt(playerid, 1055.534057, -1082.029296, 83.555107, 590.985107, -1332.492675, 89.460456, 10000);
		SelectTextDraw(playerid, 0xC6E2FFFF);
	}
	if(clickedid == SpawnErn[7]) // MENDARAT BANDARA
	{
	    if(pData[playerid][PilihSpawn] == 0) // GAK MILIH
	    return ErrorMsg(playerid, "Anda belum memilih tempat mendarat");
	    
	    if(pData[playerid][PilihSpawn] == 1)
	    {
			pData[playerid][PilihSpawn] = 0;
			SetPlayerPos(playerid, 1918.1461,-2430.1875,23.5206);
			SetPlayerFacingAngle(playerid, 91.0118);
			SetCameraBehindPlayer(playerid);
			SetPlayerVirtualWorld(playerid, 0);
   			SetPlayerInterior(playerid, 0);
			SuccesMsg(playerid, "Anda Spawn Di Bandara ASIA LANE");
			TogglePlayerControllable(playerid, 1);
            PlayerData[playerid][pPos][0] =  1918.1461,
			PlayerData[playerid][pPos][1] = -2430.1875,
			PlayerData[playerid][pPos][2] = 23.5206;
			PlayerData[playerid][pPos][3] = 91.0118;
			InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
		}
		else if(pData[playerid][PilihSpawn] == 2)
	    {
	        pData[playerid][PilihSpawn] = 0;
		    SetPlayerPos(playerid, -603.9959,-471.3341,25.6234);
		    SetPlayerFacingAngle(playerid, 85.07);
		    SuccesMsg(playerid, "Anda Spawn Di Terminal Bus ASIA LANE");
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
			SetPlayerVirtualWorld(playerid, 0);
   			SetPlayerInterior(playerid, 0);
   			PlayerData[playerid][pPos][0] = -603.9959,
			PlayerData[playerid][pPos][1] = -471.3341,
			PlayerData[playerid][pPos][2] = 25.6234;
			PlayerData[playerid][pPos][3] = 85.07;
			InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
		}
		else if(pData[playerid][PilihSpawn] == 5)
	    {
	        pData[playerid][PilihSpawn] = 0;
		    SetPlayerPos(playerid, 2781.7881,-2390.6543,37.2239);
		    SetPlayerFacingAngle(playerid, 85.07);
		    SuccesMsg(playerid, "Anda Spawn Di Pelabuhan ASIA LANE");
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 1);
			SetPlayerVirtualWorld(playerid, 0);
   			SetPlayerInterior(playerid, 0);
   			PlayerData[playerid][pPos][0] = 2781.7881,
			PlayerData[playerid][pPos][1] = -2390.6543,
			PlayerData[playerid][pPos][2] = 37.2239;
			PlayerData[playerid][pPos][3] = 134.7004;
			InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
		}
		else if(pData[playerid][PilihSpawn] == 4)
	    {
	        if(pData[playerid][pFaction] == 1)
	        {
		        pData[playerid][PilihSpawn] = 0;
			    SetPlayerPos(playerid, 1538.3539,-1674.8812,13.5469);
			    SetPlayerFacingAngle(playerid, 92.3042);
			    SuccesMsg(playerid, "Anda Spawn Di Kepolisian ASIA LANE");
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerVirtualWorld(playerid, 0);
	   			SetPlayerInterior(playerid, 0);
	   			PlayerData[playerid][pPos][0] = 1538.3539,
				PlayerData[playerid][pPos][1] = -1674.8812,
				PlayerData[playerid][pPos][2] = 13.5469;
				PlayerData[playerid][pPos][3] = 92.3042;
				InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			}
			if(pData[playerid][pFaction] == 2)
	        {
		        pData[playerid][PilihSpawn] = 0;
			    SetPlayerPos(playerid, 1146.6381,-2037.2225,69.0078);
			    SetPlayerFacingAngle(playerid, 82.7700);
			    SuccesMsg(playerid, "Anda Spawn Di kantor pemerintahan ASIA LANE");
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerVirtualWorld(playerid, 0);
	   			SetPlayerInterior(playerid, 0);
	   			PlayerData[playerid][pPos][0] = 1146.6381,
				PlayerData[playerid][pPos][1] = -2037.2225,
				PlayerData[playerid][pPos][2] = 69.0078;
				PlayerData[playerid][pPos][3] = 82.7700;
				InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			}
			if(pData[playerid][pFaction] == 3)
	        {
		        pData[playerid][PilihSpawn] = 0;
			    SetPlayerPos(playerid, 1189.4769,-1323.7915,13.5668);
			    SetPlayerFacingAngle(playerid, 17.4953);
			    SuccesMsg(playerid, "Anda Spawn Di Rumah Sakit ASIA LANE");
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerVirtualWorld(playerid, 0);
	   			SetPlayerInterior(playerid, 0);
	   			PlayerData[playerid][pPos][0] = 1189.4769,
				PlayerData[playerid][pPos][1] = -1323.7915,
				PlayerData[playerid][pPos][2] = 13.5668;
				PlayerData[playerid][pPos][3] = 260.4662;
				InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			}
			if(pData[playerid][pFaction] == 4)
	        {
		        pData[playerid][PilihSpawn] = 0;
			    SetPlayerPos(playerid, 640.8828,-1357.5979,13.4077);
			    SetPlayerFacingAngle(playerid, 97.0644);
			    SuccesMsg(playerid, "Anda Spawn Di kantor berita ASIA LANE");
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerVirtualWorld(playerid, 0);
	   			SetPlayerInterior(playerid, 0);
	   			PlayerData[playerid][pPos][0] = 640.8828,
				PlayerData[playerid][pPos][1] = -1357.5979,
				PlayerData[playerid][pPos][2] = 13.4077;
				PlayerData[playerid][pPos][3] = 97.0644;
				InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			}
			if(pData[playerid][pFaction] == 5)
	        {
		        pData[playerid][PilihSpawn] = 0;
			    SetPlayerPos(playerid, 1070.7139,1334.3071,10.8203);
			    SetPlayerFacingAngle(playerid, 190.0479);
			    SuccesMsg(playerid, "Anda Spawn Di Pedagang ASIA LANE");
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerVirtualWorld(playerid, 0);
	   			SetPlayerInterior(playerid, 0);
	   			PlayerData[playerid][pPos][0] =  1070.7139,
				PlayerData[playerid][pPos][1] = 1334.3071,
				PlayerData[playerid][pPos][2] = 10.8203;
				PlayerData[playerid][pPos][3] = 190.0479;
				InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			}
			if(pData[playerid][pFaction] == 6)
	        {
		        pData[playerid][PilihSpawn] = 0;
			    SetPlayerPos(playerid, 1351.1227,-1746.4072,13.3765);
			    SetPlayerFacingAngle(playerid, 146.1327);
			    SuccesMsg(playerid, "Anda Spawn Di Gojek ASIA LANE");
				SetCameraBehindPlayer(playerid);
				TogglePlayerControllable(playerid, 1);
				SetPlayerVirtualWorld(playerid, 0);
	   			SetPlayerInterior(playerid, 0);
	   			PlayerData[playerid][pPos][0] = 1351.1227,
				PlayerData[playerid][pPos][1] = -1746.4072,
				PlayerData[playerid][pPos][2] = 13.3765;
				PlayerData[playerid][pPos][3] = 146.1327;
				InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
				InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
			}
		}
		else if(pData[playerid][PilihSpawn] == 3)
	    {
	        pData[playerid][PilihSpawn] = 0;
		    SetPlayerInterior(playerid, pData[playerid][pInt]);
			SetPlayerVirtualWorld(playerid, pData[playerid][pWorld]);
			SetPlayerPos(playerid, pData[playerid][pPosX], pData[playerid][pPosY], pData[playerid][pPosZ]);
			SetPlayerFacingAngle(playerid, pData[playerid][pPosA]);
			SetCameraBehindPlayer(playerid);
			TogglePlayerControllable(playerid, 0);
			SetPlayerSpawn(playerid);
			LoadAnims(playerid);
			PlayerData[playerid][pPos][0] = pData[playerid][pPosX],
			PlayerData[playerid][pPos][1] = pData[playerid][pPosY],
			PlayerData[playerid][pPos][2] = pData[playerid][pPosZ];
			PlayerData[playerid][pPos][3] = pData[playerid][pPosA];
			InterpolateCameraPos(playerid, PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1],250.00,PlayerData[playerid][pPos][0]-2.5, PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2]+2.5,2500,CAMERA_MOVE);
			InterpolateCameraLookAt(playerid, PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], PlayerData[playerid][pPos][0], PlayerData[playerid][pPos][1], PlayerData[playerid][pPos][2], 2500, CAMERA_MOVE);
		}
		for(new i = 0; i < 14; i++)
		{
			TextDrawHideForPlayer(playerid, SpawnErn[i]);
			CancelSelectTextDraw(playerid);
		}
		SetTimerEx("SetPlayerCameraBehind", 2500, false, "i", playerid);
	}
	return 1;
}
function SetPlayerCameraBehind(playerid)
{
	SetCameraBehindPlayer(playerid);
	ShowPlayerDialog(playerid, DIALOG_UNUSED, DIALOG_STYLE_MSGBOX, "{7fffd4}Login Sukses - Kota ASIA LANE", "{ffffff}Ingat ini adalah server Roleplay.\nMohon selalu beroleplay\n\nSilahkan Klik "YELLOW_E"SPAWN {ffffff} untuk mulai beroleplay\n\n\n"RED_E"Tambahan: {ffffff}server ini menggunakan "YELLOW_E"sistem voice only {ffffff} dilarang keras bisu atau tuli", "Spawn", "Tidak");
}
function SetPlayerCameraBehindAyam(playerid)
{
	SetCameraBehindPlayer(playerid);
}

public OnPlayerModelSelection(playerid, response, listid, modelid)
{
	if(listid == SpawnMale)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 2823.21,-2440.34,12.08,85.07, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
	}
	
	if(listid == SpawnFemale)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetSpawnInfo(playerid, 0, pData[playerid][pSkin], 2823.21,-2440.34,12.08,85.07, 0, 0, 0, 0, 0, 0);
			SpawnPlayer(playerid);
		}
   }

   //Locker Faction Skin
	if(listid == SAPDMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}
	
	if(listid == SAPDFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAPDWar)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAGSMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAGSFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAMDMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SAMDFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SANEWMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == SANEWFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}
	if(listid == MaleSkins)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli pakaian ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			Bisnis_Save(bizid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Info(playerid, "Anda tidak jadi membeli pakaian");
	}

	if(listid == FemaleSkins)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][0];
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			GivePlayerMoneyEx(playerid, -price);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d seharga %s.", ReturnName(playerid), modelid, FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			Bisnis_Save(bizid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Info(playerid, "Anda tidak jadi membeli pakaian");
	}
	if(listid == VIPMaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			Info(playerid, "Anda telah mengganti skin menjadi ID %d", modelid);
		}
		else return Servers(playerid, "Canceled buy skin");
	}

	if(listid == VIPFemaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}
	if(listid == VIPMaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengganti skin ID %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}

	if(listid == VIPFemaleSkins)
	{
		if(response)
		{
			pData[playerid][pSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah membeli skin ID %d.", ReturnName(playerid), modelid);
			SuccesMsg(playerid, "Anda telah membeli pakaian baru");
		}
		else return Servers(playerid, "Canceled buy skin");
	}
	if(listid == toyslist)
	{
		if(response)
		{
			new bizid = pData[playerid][pInBiz], price;
			price = bData[bizid][bP][1];
			
			GivePlayerMoneyEx(playerid, -price);
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			pToys[playerid][pData[playerid][toySelected]][toy_status] = 1;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Pilih", "Batal");
			
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "> %s telah membeli aksesoris seharga %s <", ReturnName(playerid), FormatMoney(price));
			bData[bizid][bProd]--;
			bData[bizid][bMoney] += Server_Percent(price);
			Server_AddPercent(price);
			new str[500];
			format(str, sizeof(str), "Removed_%s", FormatMoney(price));
			ShowItemBox(playerid, "Uang", str, 1212, 2);
            SuccesMsg(playerid, "Anda telah membeli aksesoris baru");
			new query[128];
			mysql_format(g_SQL, query, sizeof(query), "UPDATE bisnis SET prod='%d', money='%d' WHERE ID='%d'", bData[bizid][bProd], bData[bizid][bMoney], bizid);
			mysql_tquery(g_SQL, query);
		}
		else return ErrorMsg(playerid, "Batal membeli aksesoris");
	}

	//modshop
	if(listid == TransFender)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == Waa)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == LoCo)
	{
		if(response)
        {
            new
            price = 5000,
            vehicleid
            ;

            if(GetPlayerState(playerid) != PLAYER_STATE_DRIVER)
                return Error(playerid, "You need to be inside vehicle as driver");

            vehicleid = Vehicle_Nearest(playerid);

            if(vehicleid == -1)
                return 0;

            Vehicle_ObjectAddObjects(playerid, vehicleid, modelid, OBJECT_TYPE_BODY);

            SendClientMessageEx(playerid, COLOR_ARWIN,"MODSHOP: "WHITE_E"You have purchased a {00FFFF}%s "WHITE_E"for "GREEN_E"$%s.", GetVehObjectNameByModel(modelid), FormatMoney(price));
        }
	}

	if(listid == viptoyslist)
	{
		if(response)
		{
			if(pData[playerid][PurchasedToy] == false) MySQL_CreatePlayerToy(playerid);
			pToys[playerid][pData[playerid][toySelected]][toy_model] = modelid;
			pToys[playerid][pData[playerid][toySelected]][toy_status] = 1;
			new finstring[750];
			strcat(finstring, ""dot"Spine\n"dot"Head\n"dot"Left upper arm\n"dot"Right upper arm\n"dot"Left hand\n"dot"Right hand\n"dot"Left thigh\n"dot"Right tigh\n"dot"Left foot\n"dot"Right foot");
			strcat(finstring, "\n"dot"Right calf\n"dot"Left calf\n"dot"Left forearm\n"dot"Right forearm\n"dot"Left clavicle\n"dot"Right clavicle\n"dot"Neck\n"dot"Jaw");
			ShowPlayerDialog(playerid, DIALOG_TOYPOSISIBUY, DIALOG_STYLE_LIST, ""WHITE_E"Select Bone", finstring, "Pilih", "Batal");
			
			SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s telah mengambil object ID %d dilocker.", ReturnName(playerid), modelid);
		}
		else return Servers(playerid, "Canceled toys");
	}
	if(listid == PDGSkinMale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == PDGSkinFemale)
	{
		if(response)
		{
			pData[playerid][pFacSkin] = modelid;
			SetPlayerSkin(playerid, modelid);
			Servers(playerid, "Anda telah mengganti faction skin menjadi ID %d", modelid);
		}
	}

	if(listid == vtoylist)
	{
		if(response)
		{
			new x = pData[playerid][VehicleID], Float:vPosx, Float:vPosy, Float:vPosz;
			GetVehiclePos(x, vPosx, vPosy, vPosz);
			foreach(new i: PVehicles)
			if(x == pvData[i][cVeh])
			{
				new vehid = pvData[i][cVeh];
				new toyslotid = pvData[vehid][vtoySelected];
				vtData[vehid][toyslotid][vtoy_modelid] = modelid;

				if(pvData[vehid][PurchasedvToy] == false) 			// Cek kalo gada database di mysql auto di buat
				{
					MySQL_CreateVehicleToy(i);
				}

				printf("VehicleID: %d, Object: %d, Pos: (%f ,%f, %f), ToySlotID: %d", vehid, vtData[vehid][toyslotid][vtoy_modelid], vPosx, vPosy, vPosz, toyslotid);

				vtData[vehid][toyslotid][vtoy_model] = CreateObject(modelid, vPosx, vPosy, vPosz, 0.0, 0.0, 0.0);
				AttachObjectToVehicle(vtData[vehid][toyslotid][vtoy_model], vehid, vtData[vehid][toyslotid][vtoy_x], vtData[vehid][toyslotid][vtoy_y], vtData[vehid][toyslotid][vtoy_z], vtData[vehid][toyslotid][vtoy_rx], vtData[vehid][toyslotid][vtoy_ry], vtData[vehid][toyslotid][vtoy_rz]);
				SendNearbyMessage(playerid, 30.0, COLOR_PURPLE, "** %s memasang toys untuk vehicleid(%d) object ID %d", ReturnName(playerid), vehid, modelid);
				ShowPlayerDialog(playerid, DIALOG_MODTACCEPT, DIALOG_STYLE_MSGBOX, "Vehicle Toys", "Do You Want To Save it?", "Yes", "Batal");
			}
		}
		else return Servers(playerid, "Canceled buy toys");
	}
	return 1;
}
stock DisplayDokumen(playerid)
{
    new ktpstatus[36];
	if(pData[playerid][pIDCard] == 1)
	{
		format(ktpstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(ktpstatus, 36, ""RED_E"Tidak");
	}

	new simstatus[36];
	if(pData[playerid][pDriveLic] == 1)
	{
		format(simstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(simstatus, 36, ""RED_E"Tidak");
	}
	
	new weaponstatus[36];
	if(pData[playerid][pWeaponLic] == 1)
	{
		format(weaponstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(weaponstatus, 36, ""RED_E"Tidak");
	}
	new sksstatus[36];
	if(pData[playerid][pSks] == 1)
	{
		format(sksstatus, 36, ""LG_E"Ada");
	}
	else
	{
		format(sksstatus, 36, ""RED_E"Tidak");
	}
	new string[2048];
	format(string, sizeof(string),"Kartu Tanda Penduduk\t[%s]\nSurat Izin Mengemudi\t[%s]\nLisensi Senjata\t[%s]\nsurat keterangan sehat\t[%s]",
    ktpstatus,
	simstatus,
	weaponstatus);
	ShowPlayerDialog(playerid, DIALOG_DOKUMEN, DIALOG_STYLE_LIST, "ASIA LANE - Dokumen", string, "Tutup","");
}
forward TambahDetikFivEM();
public TambahDetikFivEM()
{
	DetikFivEm ++;

	if(DetikFivEm == 60)
	{
		DetikFivEm = 0;
		TambahJamFivEm();
	}

	SetWorldTime(JamFivEm);
}

// forward TambahDetikFivEM();
// public TambahDetikFivEM()
// {
// 	DetikFivEm ++;

// 	if(DetikFivEm == 60)
// 	{
// 		DetikFivEm = 0;
// 		TambahJamFivEm();
// 	}

// 	SetWorldTime(JamFivEm);
// }

forward TambahDetikCall(playerid);
public TambahDetikCall(playerid)
{
	DetikCall[playerid] ++;

	if(DetikCall[playerid] == 60)
	{
		DetikCall[playerid] = 0;
		TambahMenitCall(playerid);
	}
}

forward TambahMenitCall(playerid);
public TambahMenitCall(playerid)
{
	MenitCall[playerid] ++;

	if(MenitCall[playerid] == 60)
	{
		MenitCall[playerid] = 0;
		TambahJamCall(playerid);
	}
}

forward TambahJamCall(playerid);
public TambahJamCall(playerid)
{
	JamCall[playerid] ++;

	if(JamCall[playerid] == 24)
	{
		JamCall[playerid] = 0;
	}
}

forward TambahJamFivEm();
public TambahJamFivEm()
{
	JamFivEm ++;

	if(JamFivEm == 24)
	{
		JamFivEm = 0;
	}

	SetWorldTime(JamFivEm);
}

stock GetMonthName(months)
{
    new monthname_str[10];

	switch(months)
	{
		case 1: monthname_str = "Januari";
		case 2: monthname_str = "Februari";
		case 3: monthname_str = "Maret";
		case 4: monthname_str = "April";
		case 5: monthname_str = "Mei";
		case 6: monthname_str = "Juni";
		case 7: monthname_str = "Juli";
		case 8: monthname_str = "Augustus";
		case 9: monthname_str = "September";
		case 10: monthname_str = "Oktober";
		case 11: monthname_str = "November";
		case 12: monthname_str = "Desember";
	}

	return monthname_str;
}
function DownloadTweet(playerid)
{
	pData[playerid][pInstallTweet] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Twitter");
	TextDrawHideForPlayer(playerid, PlaystoreTD[24]);
	TextDrawSetString(PlaystoreTD[24], "Terinstall");
	TextDrawShowForPlayer(playerid, PlaystoreTD[24]);
	return 1;
}
function DownloadMap(playerid)
{
	pData[playerid][pInstallMap] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Google Map");
	TextDrawHideForPlayer(playerid, PlaystoreTD[26]);
	TextDrawSetString(PlaystoreTD[26], "Terinstall");
	TextDrawShowForPlayer(playerid, PlaystoreTD[26]);
	return 1;
}
function DownloadBank(playerid)
{
	pData[playerid][pInstallBank] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Mbanking");
	TextDrawHideForPlayer(playerid, PlaystoreTD[25]);
	TextDrawSetString(PlaystoreTD[25], "Terinstall");
	TextDrawShowForPlayer(playerid, PlaystoreTD[25]);
	return 1;
}
function DownloadGojek(playerid)
{
	pData[playerid][pInstallGojek] = 1;
	SuccesMsg(playerid, "AppStore telah selesai menginstall Gojek");
	TextDrawHideForPlayer(playerid, PlaystoreTD[18]);
	TextDrawSetString(PlaystoreTD[18], "Terinstall");
	TextDrawShowForPlayer(playerid, PlaystoreTD[18]);
	return 1;
}

function PunyaMap(playerid) 
{
    if(pData[playerid][pInstallMap])
	{
        return 1;
    }
    return 0; 
}

function PunyaMbanking(playerid)
{
	if(pData[playerid][pInstallBank])
	{
		return 1;
	}
	return 0;
}

function PunyaTwitter(playerid)
{
	if(pData[playerid][pInstallTweet])
	{
		return 1;
	}
	return 0;
}

function PunyaGojek(playerid)
{
	if(pData[playerid][pInstallGojek])
	{
		return 1;
	}
	return 0;
}

function GojekAppStore(playerid)
{
	if(pData[playerid][pInstallGojek])
	{
	    TextDrawSetString(PlaystoreTD[18], "Terinstall");
	}
	else
	{
 		TextDrawSetString(PlaystoreTD[18], "Install");
	}
}
function BankAppStore(playerid)
{
	if(pData[playerid][pInstallBank])
	{
	    TextDrawSetString(PlaystoreTD[25], "Terinstall");
	}
	else
	{
 		TextDrawSetString(PlaystoreTD[25], "Install");
	}
}
function MapAppStore(playerid)
{
	if(pData[playerid][pInstallMap])
	{
	    TextDrawSetString(PlaystoreTD[26], "Terinstall");
	}
	else
	{
 		TextDrawSetString(PlaystoreTD[26], "Install");
	}
}
function TweetAppStore(playerid)
{
	if(pData[playerid][pInstallTweet])
	{
	    TextDrawSetString(PlaystoreTD[24], "Terinstall");
	}
	else
	{
 		TextDrawSetString(PlaystoreTD[24], "Install");
	}
}

function HIDETWEET(playerid)
{
	for(new i = 0; i < 16; i ++)
	{
		TextDrawHideForAll(NotifTwitt[i]);
	}
    return 1;
}


