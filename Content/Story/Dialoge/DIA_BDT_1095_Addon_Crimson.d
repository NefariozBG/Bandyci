//---------------------------------------------------------------------
//	Info EXIT 
//---------------------------------------------------------------------
INSTANCE DIA_Addon_Crimson_EXIT   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 999;
	condition   = DIA_Addon_Crimson_EXIT_Condition;
	information = DIA_Addon_Crimson_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Crimson_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Crimson_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> WhatAreYouDoing
//========================================

INSTANCE DIA_Addon_Crimson_WhatAreYouDoing (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 1;
   condition    = DIA_Addon_Crimson_WhatAreYouDoing_Condition;
   information  = DIA_Addon_Crimson_WhatAreYouDoing_Info;
   permanent	= FALSE;
   description	= "Co robisz?";
};

FUNC INT DIA_Addon_Crimson_WhatAreYouDoing_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Crimson_WhatAreYouDoing_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatAreYouDoing_15_01"); //Co robisz?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_02"); //Siekam cebulk�. Nie widzisz? Siedz� i si� nudz�.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatAreYouDoing_15_03"); //Chcesz jak�� robot�?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_04"); //A kto by nie chcia�? Za�atw mi jak��.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_05"); //Najlepiej w kopalni. Umiem wytapia� z�oto.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_06"); //Kiedy� by�em, to znaczy jestem kowalem, nic specjalnego.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_07"); //Umiem naprawi� bro� czy narz�dzie. Jednak jak wspomnia�em lepszy jest ze mnie przetapiacz.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_08"); //Kiedy� pracowa�em w pewnej kopalni. Niestety zamkni�to j� z powodu ko�cz�cych si� �y� kruszcu.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatAreYouDoing_15_09"); //Co� ci za�atwi�.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatAreYouDoing_03_10"); //Postaraj si�, prosz�.
    MIS_Bored_Crimson = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Bored_Crimson, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Bored_Crimson, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Bored_Crimson,"Crimson jako zawodowy przetapiacz szuka roboty. Wspomnia�em mu, �e pomog�. My�l�, �e nie b�dzie to trudne.");
};

//========================================
//-----------------> GotWorkForYou
//========================================

INSTANCE DIA_Addon_Crimson_GotWorkForYou (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 1;
   condition    = DIA_Addon_Crimson_GotWorkForYou_Condition;
   information  = DIA_Addon_Crimson_GotWorkForYou_Info;
   permanent	= FALSE;
   description	= "Koniec siekania cebulki! Od teraz b�dziesz pracowa� w kopalni.";
};

FUNC INT DIA_Addon_Crimson_GotWorkForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_CrimsonNeedsWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_GotWorkForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_GotWorkForYou_15_01"); //Koniec siekania cebulki! Od teraz b�dziesz pracowa� w kopalni.
    AI_Output (self, other ,"DIA_Addon_Crimson_GotWorkForYou_03_02"); //Niesamowicie! Dzi�ki.
    AI_Output (other, self ,"DIA_Addon_Crimson_GotWorkForYou_15_03"); //A co z nagrod�?
    AI_Output (self, other ,"DIA_Addon_Crimson_GotWorkForYou_03_04"); //Wpadnij do kopalni za jaki� czas. B�dzie co� w sam raz dla ciebie.
    B_LogEntry                     (TOPIC_Bored_Crimson,"Od teraz Crimson b�dzie pracowa� w kopalni. Zadanie zako�czone. Powinienem odwiedzi� Crimsona za jaki� czas. A mo�e przy okazji dam mu cebul�, aby j� wreszcie posieka�?");
    Log_SetTopicStatus       (TOPIC_Bored_Crimson, LOG_SUCCESS);
    MIS_Bored_Crimson = LOG_SUCCESS;
    Npc_ExchangeRoutine (self, "Mine");
};

//========================================
//-----------------> SoYouAreAGoldsmith
//========================================

INSTANCE DIA_Addon_Crimson_SoYouAreAGoldsmith (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 1;
   condition    = DIA_Addon_Crimson_SoYouAreAGoldsmith_Condition;
   information  = DIA_Addon_Crimson_SoYouAreAGoldsmith_Info;
   permanent	= FALSE;
   description	= "A wi�c znasz si� na z�ocie.";
};

FUNC INT DIA_Addon_Crimson_SoYouAreAGoldsmith_Condition()
{
    if ((MIS_Bored_Crimson == LOG_RUNNING)
	|| (MIS_Bored_Crimson == LOG_SUCCESS))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_SoYouAreAGoldsmith_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_01"); //A wi�c znasz si� na z�ocie.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_02"); //Pewnie, �e tak. By�em jednym z lepszych wytapiaczy.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_03"); //Ale, jak wspomnia�em, straci�em robot�. Pomy�la�em sobie � pop�yn� do Khorinis, tam na pewno jest dla mnie jaka� praca.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_04"); //I co? Wyl�dowa�em na bruku, bo pr�no szuka� roboty.
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_05"); //A czemu jeste� tutaj?
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_06"); //Po upadku bariery zrobi�o si� jeszcze gorzej. Wyszed�em z miasta, by pomy�le� co dalej.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_07"); //I wtedy spotka�em pewn� zgraje bandyt�w.
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_08"); //Nie zabili ci�?
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_09"); //Nie. Przywlekli mnie do jakiego� ciemnego typa w czerwonym pancerzu.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_10"); //Fisk nosi podobny pancerz. To po jaki� cieniach czy jako� tak.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_11"); //Powiedzia�em im o mojej specjalno�ci i przyp�yn��em tutaj.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_12"); //Chyba mia�em wed�ug nich harowa� w kopalni, ale Fletcher si� za mn� wstawi�.
    AI_Output (other, self ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_15_13"); //W jakim sensie?
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_14"); //Powiedzia�, �e wytapiacz bardziej si� przyda w ku�ni, ni� wal�c kilofem w �y�y z�ota.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_15"); //Ale nie by�o tak �atwo. Huno by� ju� kowalem i nie widzia� mnie w ku�ni, Esteban nawet nie chcia� ze mn� gada�, a Thorus by� zbyt zaj�ty na my�lenie o mojej sprawie.
    AI_Output (self, other ,"DIA_Addon_Crimson_SoYouAreAGoldsmith_03_16"); //I tak siedz� tutaj bezczynnie.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Crimson_WhatsUp (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 2;
   condition    = DIA_Addon_Crimson_WhatsUp_Condition;
   information  = DIA_Addon_Crimson_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co s�ycha�? Mo�e chcesz cebulki?";
};

FUNC INT DIA_Addon_Crimson_WhatsUp_Condition()
{
    if ((MIS_Bored_Crimson == LOG_SUCCESS)
	&& (Npc_GetDistToWP (self, "ADW_MINE_HOEHLE_03") < 200))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_01"); //Co s�ycha�? Mo�e chcesz cebulki?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_02"); //Bardzo zabawne. Mam lepsze rzeczy do roboty.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_03"); //Co takiego?
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_04"); //Kruk da� mi matryc� do wybijania monet. S� naprawd� dobre.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_05"); //Od razu ci lepiej przy robocie.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_06"); //Bym zapomnia�.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_07"); //Zwykle za jeden samorodek daj� 10 sztuk z�ota.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_08"); //Cena jak dla przyjaciela.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_09"); //Wszyscy jeste�my tutaj przyjaci�mi.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_10"); //Trudno si� nie zgodzi�. (�miech)
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_11"); //Ale w zamian za zorganizowanie mi tej roboty dam ci 15 sztuk z�ota.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_12"); //Przyjmuj� ofert�.
    AI_Output (self, other ,"DIA_Addon_Crimson_WhatsUp_03_13"); //Wiedzia�em, �e si� dogadamy. Ale cicho sza i nie m�w ch�opakom.
    AI_Output (other, self ,"DIA_Addon_Crimson_WhatsUp_15_14"); //Jasne.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Addon_Crimson_AnyNews (C_INFO)
{
   npc          = BDT_1095_Addon_Crimson;
   nr           = 3;
   condition    = DIA_Addon_Crimson_AnyNews_Condition;
   information  = DIA_Addon_Crimson_AnyNews_Info;
   permanent	= TRUE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Crimson_AnyNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Crimson_WhatsUp))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Crimson_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Addon_Crimson_AnyNews_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Crimson_AnyNews_03_02"); //Nie widzisz? Wybijam monety.
};

INSTANCE DIA_Addon_Crimson_Gold   (C_INFO)
{
	npc         = BDT_1095_Addon_Crimson;
	nr          = 99;
	condition   = DIA_Addon_Crimson_Gold_Condition;
	information = DIA_Addon_Crimson_Gold_Info;
	permanent   = TRUE;
	description = "(wymie� samorodki z�ota.)";
};
FUNC INT DIA_Addon_Crimson_Gold_Condition()
{	
	if Npc_KnowsInfo (other, DIA_Addon_Crimson_WhatsUp)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_Info()
{
	AI_Output (other, self, "DIA_Addon_Crimson_Gold_15_00");//Pohandlujmy.
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymie� wszystkie samorodki z�ota",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymie� 1 samorodek z�ota",DIA_Addon_Crimson_Gold_1);
	}
	else
	{
		AI_Output (self, other, "DIA_Addon_Crimson_Gold_10_01");//Ale nie masz �adnych samorodk�w.
	};
};	
FUNC VOID DIA_Addon_Crimson_Gold_BACK()
{
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
};
FUNC VOID DIA_Addon_Crimson_Gold_ALLE()
{
	var int CurrentNuggets;
	CurrentNuggets = Npc_HasItems (other, ItMi_GoldNugget_Addon);
	
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, CurrentNuggets);
	B_GiveInvItems (self, other, ItMI_Gold, (CurrentNuggets * 15));
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymie� wszystkie samorodki z�ota",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymie� 1 samorodek z�ota",DIA_Addon_Crimson_Gold_1);
	};
};
FUNC VOID DIA_Addon_Crimson_Gold_1()
{
	B_GiveInvItems (other, self, ItMi_GoldNugget_Addon, 1);
	B_GiveInvItems (self, other, ItMI_Gold, 15);
	
	Info_ClearChoices (DIA_Addon_Crimson_Gold);
	Info_AddChoice (DIA_Addon_Crimson_Gold,DIALOG_BACK,DIA_Addon_Crimson_Gold_BACK);
	
	if (Npc_HasItems (other,ItMi_GoldNugget_Addon ) >= 1)
	{
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymie� wszystkie samorodki z�ota",DIA_Addon_Crimson_Gold_ALLE);
		Info_AddChoice (DIA_Addon_Crimson_Gold,"Wymie� 1 samorodek z�ota",DIA_Addon_Crimson_Gold_1);
	};
};
