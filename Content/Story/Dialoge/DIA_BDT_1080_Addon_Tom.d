var int WaitDayForTom;

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Tom_EXIT(C_INFO)
{
	npc             = BDT_1080_Addon_Tom;
	nr              = 999;
	condition	= DIA_Addon_Tom_EXIT_Condition;
	information	= DIA_Addon_Tom_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Tom_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Tom_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> IHaveTheList
//========================================

INSTANCE DIA_Addon_Tom_IHaveTheList (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_IHaveTheList_Condition;
   information  = DIA_Addon_Tom_IHaveTheList_Info;
   permanent	= FALSE;
   description	= "Cze�� Tom. Mam list� towar�w dla pirat�w.";
};

FUNC INT DIA_Addon_Tom_IHaveTheList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_GotYourList))
    && (Npc_HasItems (other, ItWr_ListOfGoods) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_IHaveTheList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_01"); //Cze�� Tom. Mam list� towar�w dla pirat�w.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_02"); //�wietnie. W�a�nie czeka�em kiedy Fisk si� z ni� ruszy.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_03"); //Te� z ni� czeka�em.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_04"); //Fisk to Fisk. Znaj�c go, to dostaniesz od niego niez�� nagrod�.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_05"); //Co na przyk�ad?
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_06"); //Jak�� niez�� bro�, t�, kt�r� ja posiadam otrzyma�em w�a�nie od niego.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_07"); //Za�atwi�em mu od pirat�w nie lada zlecenie i op�aci�o mi si�.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_08"); //Klasztor warty jest �wi�ce�...
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_09"); //Co? (zdziwienie)
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_10"); //Nie, nic.
    AI_Output (self, other ,"DIA_Addon_Tom_IHaveTheList_03_11"); //Dobra. Powiedz Fiskowi, �e nied�ugo wyruszam. Mo�liwe, �e b�d� jutro.
    AI_Output (other, self ,"DIA_Addon_Tom_IHaveTheList_15_12"); //Przeka�� mu.
	WaitDayForTom = Wld_GetDay();
    B_LogEntry                     (TOPIC_List_of_Goods,"Tom o�wiadczy�, �e nied�ugo wyruszy i mo�liwe, �e spotkam go ju� jutro. Pora i�� do Fiska.");
    B_GiveInvItems (other, self, ItWr_ListOfGoods, 1);
};

//========================================
//-----------------> GotThePacks
//========================================

INSTANCE DIA_Addon_Tom_GotThePacks (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_GotThePacks_Condition;
   information  = DIA_Addon_Tom_GotThePacks_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Tom_GotThePacks_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_IHaveTheList))
    && (WaitDayForTom < Wld_GetDay() )
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_GotThePacks_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_GotThePacks_03_01"); //Witaj. Mam paczki od pirat�w. Cholernie ci�kie.
    AI_Output (other, self ,"DIA_Addon_Tom_GotThePacks_15_02"); //Roznie��?
    AI_Output (self, other ,"DIA_Addon_Tom_GotThePacks_03_03"); //By�oby mi�o. Oddaj to tym, co wpisali si� na list�.
    AI_Output (other, self ,"DIA_Addon_Tom_GotThePacks_15_04"); //Jasna sprawa.
    MIS_Packs_from_Pirates = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Packs_from_Pirates, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Packs_from_Pirates, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Tom powr�ci� od pirat�w. Przyni�s� paczki, kt�re od nich zakupi�, a ja podj��em si� ich rozdania. Czasami w tym obozie jest cholernie nudno.");
    CreateInvItems (other, ItMi_Packet_Snaf, 1);
    CreateInvItems (other, ItMi_Packet_Scatty, 1);
    CreateInvItems (other, ItMi_Packet_Huno, 1);
    CreateInvItems (other, ItMi_Packet_Fletcher, 1);
    CreateInvItems (other, ItMi_Packet_Thorus, 1);
    CreateInvItems (other, ItMi_Packet_Fisk, 1);
};

//========================================
//-----------------> PackagesGiven
//========================================

INSTANCE DIA_Addon_Tom_PackagesGiven (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_PackagesGiven_Condition;
   information  = DIA_Addon_Tom_PackagesGiven_Info;
   permanent	= FALSE;
   description	= "Paczki rozdane.";
};

FUNC INT DIA_Addon_Tom_PackagesGiven_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Scatty_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Huno_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Fletcher_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Thorus_PackageForYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Fisk_PackageForYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_PackagesGiven_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_PackagesGiven_15_01"); //Paczki rozdane.
    AI_Output (self, other ,"DIA_Addon_Tom_PackagesGiven_03_02"); //�wietnie. Nied�ugo zn�w udam si� do pirat�w. Jakby� czego� potrzebowa�, to wiesz do kogo i��.
    AI_Output (other, self ,"DIA_Addon_Tom_PackagesGiven_15_03"); //Jasna sprawa.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Ka�dy otrzyma� swoj� paczk� od pirat�w. Moje zadanie sko�czone.");
    Log_SetTopicStatus       (TOPIC_Packs_from_Pirates, LOG_SUCCESS);
    MIS_Packs_from_Pirates = LOG_SUCCESS;
};

//========================================
//-----------------> WhatHappened
//========================================

INSTANCE DIA_Addon_Tom_WhatHappened (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_WhatHappened_Condition;
   information  = DIA_Addon_Tom_WhatHappened_Info;
   permanent	= FALSE;
   important	= TRUE;
};

FUNC INT DIA_Addon_Tom_WhatHappened_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_AreYouOkay))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatHappened_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_01"); //Ch�opie, �yjesz?
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_02"); //Jedyny, kt�ry spyta�.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_03"); //Upad�e� na ziemi� z du�ym hukiem. Miguel da� mi jak�� receptur�, �eby by�o ci lepiej.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_04"); //Mia�e� gor�czk�. Lucia nieustannie by�a obok ciebie.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_05"); //Lucia...?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_06"); //Nie my�l o niej teraz. Wygl�dasz ju� lepiej.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_07"); //Wiesz kto m�g� mi to zrobi�?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_08"); //Wiem. 
    AI_Output (other, self ,"DIA_Addon_Tom_WhatHappened_15_09"); //(spokojnie) Kto?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_10"); //Jak po�o�yli�my ci� na g�rze, spotka�em noc� Arvo.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_11"); //By� strasznie z�y i chyba przestraszony. Zwykle kogo� zaczepia przechodz�c, ale mnie ca�kowicie ola�. Jakbym by� duchem.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatHappened_03_12"); //I wtedy wypad�a mu pewna kartka. Sam j� przeczytaj.

    CreateInvItems (self, ItWr_ArvoPoisoning, 1);
    B_GiveInvItems (self, other, ItWr_ArvoPoisoning, 1);

	Npc_ExchangeRoutine (BDT_10316_Arvo, "Final");
	AI_Teleport (BDT_10316_Arvo, "ADW_CANYON_PATH_TO_BANDITS_06E");
	
    B_LogEntry                     (TOPIC_Illness,"Tom jak zwykle by� pomocny. Ale teraz czas na szczer� rozmow� ze Snafem.");
};

//========================================
//-----------------> WhatDidYouDo
//========================================

INSTANCE DIA_Addon_Tom_WhatDidYouDo (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_WhatDidYouDo_Condition;
   information  = DIA_Addon_Tom_WhatDidYouDo_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Tom_WhatDidYouDo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_ItWasArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatDidYouDo_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_01"); //Co zrobi�e� ze Snafem?
    if (SnafAngered == TRUE)
    {
        AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_02"); //Nie wybacz� mu tego nigdy.
        AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_03"); //Ale czy to dobra droga? Zreszt� ja tego nie oceniam.
    }
    else
    {
        AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_04"); //Wybaczy�em mu to, ale zapami�tam to sobie.
        AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_05"); //Nie wiem czy ja by�bym sk�onny co� takiego wybaczy�.
    };
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_06"); //A co z Arvo?
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_07"); //Dorw� go i zabije. 
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_08"); //Uwa�aj lepiej na siebie.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_09"); //Nic mi nie... Aaa...

    Mdl_ApplyOverlayMds(other,"HUMANS_DRUNKEN.MDS");

    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_10"); //Spokojnie. Usi�d� i odpocznij. Jeste� nadal os�abiony.
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDidYouDo_15_11"); //Nie!

    Mdl_RemoveOverlayMds(other,"HUMANS_DRUNKEN.MDS");

    AI_Output (self, other ,"DIA_Addon_Tom_WhatDidYouDo_03_12"); //Zrobisz jak uwa�asz. Ale pami�taj o tym co ci powiedzia�em.

    B_LogEntry                     (TOPIC_Illness,"Wiem ju� �e ta trucizna by�a win� Arvo. Teraz pora dzia�a�.");
    Log_SetTopicStatus       (TOPIC_Illness, LOG_SUCCESS);
    MIS_Illness = LOG_SUCCESS;

    MIS_Arvo = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Arvo, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Arvo, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Arvo,"Przyszed� czas na tego �miecia. Arvo zap�aci krwi� za to co chcia� mi zrobi�!");
};

//========================================
//-----------------> Hi
//========================================

INSTANCE DIA_Addon_Tom_Hi (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 1;
   condition    = DIA_Addon_Tom_Hi_Condition;
   information  = DIA_Addon_Tom_Hi_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Tom_Hi_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_Hi_Info()
{
    AI_Output (self, other ,"DIA_Addon_Tom_Hi_03_01"); //Cze�� m�okosie. Widz�, �e uda�o ci si� dosta�.
    AI_Output (self, other ,"DIA_Addon_Tom_Hi_03_02"); //Jestem Tom. Gdyby� czego� potrzebowa� to zg�o� si� do mnie.
    AI_Output (other, self ,"DIA_Addon_Tom_Hi_15_03"); //Nazywam si� Vinc.
    AI_Output (self, other ,"DIA_Addon_Tom_Hi_03_04"); //Mi�o mi, Vinc.
};

//========================================
//-----------------> WhatDoYouDo
//========================================

INSTANCE DIA_Addon_Tom_WhatDoYouDo (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 2;
   condition    = DIA_Addon_Tom_WhatDoYouDo_Condition;
   information  = DIA_Addon_Tom_WhatDoYouDo_Info;
   permanent	= FALSE;
   description	= "Czym si� zajmujesz?";
};

FUNC INT DIA_Addon_Tom_WhatDoYouDo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_Hi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatDoYouDo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_WhatDoYouDo_15_01"); //M�wi�e�, �e gdybym czego� potrzebowa� to mam zg�osi� si� do ciebie. Czym si� zajmujesz?
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDoYouDo_03_02"); //Handluj� z piratami. Mam z nimi bardzo dobre kontakty.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDoYouDo_03_03"); //Bez fa�szywej skromno�ci � najlepsze w tym obozie.
    AI_Output (self, other ,"DIA_Addon_Tom_WhatDoYouDo_03_04"); //Za�atwiam mn�stwo rzeczy dla ca�ego obozu.
};

//========================================
//-----------------> WhyAreYouHere
//========================================

INSTANCE DIA_Addon_Tom_WhyAreYouHere (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 3;
   condition    = DIA_Addon_Tom_WhyAreYouHere_Condition;
   information  = DIA_Addon_Tom_WhyAreYouHere_Info;
   permanent	= FALSE;
   description	= "Mog� spyta� za co tu jeste�?";
};

FUNC INT DIA_Addon_Tom_WhyAreYouHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_Hi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhyAreYouHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_01"); //Mog� spyta� za co tu jeste�?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_02"); //Pewnie, to nie jest �adna tajemnica.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_03"); //Kiedy� by�em przemytnikiem. Wraz ze swoj� grup� handlowali�my, szmuglowali�my r�ne towary.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_04"); //Spotka�em naprawd� wiele r�nych os�b � w tym tych samych pirat�w z kt�rymi teraz handluj�.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_05"); //A jak wpad�e�?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_06"); //Zostali�my zdradzeni. Zrobili�my kilka naprawd� udanych akcji i przynios�a nam to du�e zyski.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_07"); //Ale i jeszcze wi�ksz� uwag� �o�nierzy. Ju� wtedy wystawiono za nami listy go�cze.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_08"); //Mieli�my spotka� si� z piratami. Oni mieli da� nam grog i rum, a my im paczki stali.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_09"); //Nie przyp�yn�li do zatoki w kt�rej si� spotykali�my. Tego dnia wieczorem otoczy� nas ca�y oddzia� gwardzist�w kr�la.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_10"); //Kto was zdradzi�?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_11"); //M�j najlepszy �przyjaciel� Badger. Sukinsyn zrobi� to dla z�ota i pewnej amnestii.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_12"); //Jakiej amnestii?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_13"); //Nie zosta� aresztowany oraz mia� szans� uciec, gdzie pieprz ro�nie.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_14"); //Co si� sta�o z reszt� twojej grupy?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_15"); //Jeden wyskoczy� ze statku, ale nie uda�o mu si� w starciu z morzem.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_16"); //Reszta trafi�a do kolonii.
    AI_Output (other, self ,"DIA_Addon_Tom_WhyAreYouHere_15_17"); //Jak uda�o ci si� tam przetrwa�?
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_18"); //Tylko dzi�ki moim umiej�tno�ciom i znajomo�ciom. Cho� to drugie to czysty przypadek.
    AI_Output (self, other ,"DIA_Addon_Tom_WhyAreYouHere_03_19"); //A teraz dalej zajmuj� si� tym, czym umiem najlepiej.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Tom_WhatsUp (C_INFO)
{
   npc          = BDT_1080_Addon_Tom;
   nr           = 4;
   condition    = DIA_Addon_Tom_WhatsUp_Condition;
   information  = DIA_Addon_Tom_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Addon_Tom_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_Hi))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Tom_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Tom_WhatsUp_15_01"); //Co s�ycha�?
    if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Addon_Tom_WhatsUp_03_02"); //To raczej ja powinienem zapyta�. Uwa�aj na siebie m�okosie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Addon_Tom_WhatsUp_03_03"); //U mnie po staremu.
    };
};

