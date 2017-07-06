//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Scatty_EXIT(C_INFO)
{
	npc             = BDT_1086_Addon_Scatty;
	nr              = 999;
	condition	= DIA_Addon_Scatty_EXIT_Condition;
	information	= DIA_Addon_Scatty_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Scatty_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Scatty_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Scatty_BroughtList (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_BroughtList_Condition;
   information  = DIA_Addon_Scatty_BroughtList_Info;
   permanent	= FALSE;
   description	= "Hej Scatty. Mam tu list� od Fiska. Chcesz co� od pirat�w?";
};

FUNC INT DIA_Addon_Scatty_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_BroughtList_15_01"); //Hej Scatty. Mam tu list� od Fiska. Chcesz co� od pirat�w?
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_02"); //Hmm. Sam nie wiem. Wszystko mam.
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_03"); //Chocia� czekaj. Daj mi list�.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_04"); //To powinno wystarczy�.
    AI_Output (other, self ,"DIA_Addon_Scatty_BroughtList_15_05"); //Nie b�d� przeszkadza�.
    AI_Output (self, other ,"DIA_Addon_Scatty_BroughtList_03_06"); //Nie ma problemu.
    B_LogEntry                     (TOPIC_List_of_Goods,"Scatty tak�e wpisa� si� na li�cie.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Scatty_PackageForYou (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_PackageForYou_Condition;
   information  = DIA_Addon_Scatty_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Hej Scatty. Przesy�ka dla ciebie.";
};

FUNC INT DIA_Addon_Scatty_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Scatty) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_PackageForYou_15_01"); //Hej Scatty. Przesy�ka dla ciebie.
    AI_Output (self, other ,"DIA_Addon_Scatty_PackageForYou_03_02"); //Dzi�ki. Przyda si� do asortymentu moich towar�w.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Scatty jest zadowolony z przesy�ki.");
    B_GiveInvItems (other, self, ItMi_Packet_Scatty, 1);
};

//========================================
//-----------------> GoodBeer
//========================================

INSTANCE DIA_Addon_Scatty_GoodBeer (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_GoodBeer_Condition;
   information  = DIA_Addon_Scatty_GoodBeer_Info;
   permanent	= FALSE;
   description	= "Jak samopoczucie?";
};

FUNC INT DIA_Addon_Scatty_GoodBeer_Condition()
{
    if (MIS_List_of_Goods == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_GoodBeer_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_01"); //Jak samopoczucie?
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_02"); //Emm, napi�bym si� piwa. Od kilkunastu dni go nie pi�em, mo�e zechcesz pom�c?
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_03"); //Na pewno mam jakie� piwko przy sobie.
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_04"); //Nie, nie. Ja chc� piwa, ale od Lou. Ten stary gorzelnik wie, co dobre, ma zapewne jeszcze kilka butelek dobrego porteru. 
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_05"); //Pyszne piwko z piank�...
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_06"); //No dobra. Nied�ugo dostaniesz takie piwo. Tylko powiedz mi, czemu nie zapisa�e� tego w swojej li�cie towar�w?
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_07"); //Eee, no wiesz... Zapomnia�em. My�la�em, �e Snaf albo Fisk to za�atwi�.
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_08"); //Umiesz liczy�? Licz na siebie...
    AI_Output (self, other ,"DIA_Addon_Scatty_GoodBeer_03_09"); //Co? (zdziwienie)
    AI_Output (other, self ,"DIA_Addon_Scatty_GoodBeer_15_10"); //Nie, nic. Nied�ugo wracam.
    MIS_Strong_Beer = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Strong_Beer, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Strong_Beer, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Strong_Beer,"Scatty zapomnia� o dopisaniu piwa do swojej listy towar�w i nasz�o go teraz pragnienie. Napi�by si� piwa od Lou. Przynios� mu to piwo.");
};

//========================================
//-----------------> HeresTheBeer
//========================================

INSTANCE DIA_Addon_Scatty_HeresTheBeer (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_HeresTheBeer_Condition;
   information  = DIA_Addon_Scatty_HeresTheBeer_Info;
   permanent	= FALSE;
   description	= "Mam piwo.";
};

FUNC INT DIA_Addon_Scatty_HeresTheBeer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_MoneyForBeer))
    && (Npc_HasItems (other, ItFo_Beer_Lou) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_HeresTheBeer_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_15_01"); //Mam piwo.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_03_02"); //(z rado�ci�) Ile masz tego?

    Info_ClearChoices		(DIA_Addon_Scatty_HeresTheBeer);
	if (Npc_HasItems (other, ItFo_Beer_Lou) >= 2)
	{
		Info_AddChoice		(DIA_Addon_Scatty_HeresTheBeer, "Dwie butelki.", DIA_Addon_Scatty_HeresTheBeer_Two);
	};
	Info_AddChoice		(DIA_Addon_Scatty_HeresTheBeer, "Tylko jedn�.", DIA_Addon_Scatty_HeresTheBeer_One);
};

FUNC VOID DIA_Addon_Scatty_HeresTheBeer_One()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_One_15_01"); //Tylko jedn�.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_02"); //A to sknera. Pewnie ma wi�cej i nie chce si� podzieli�.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_03"); //Ale z niego kawa�...
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_One_15_04"); //Bandyty?
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_05"); //Emm, no, po prawdzie to tak.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_One_15_06"); //Wypij moje zdrowie.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_One_03_07"); //Wypij� to piwko wieczorem przy ognisku. Trzymaj par� z�otych samorodk�w.

    B_LogEntry                     (TOPIC_Strong_Beer,"Da�em Scattiemu tylko jedno piwo. Nazwa� Lou skner�, kt�ry nie chce si� dzieli�. Ale zadanie wykona�em. Otrzyma�em tak�e kilka z�otych samorodk�w.");
    Log_SetTopicStatus       (TOPIC_Strong_Beer, LOG_SUCCESS);
    MIS_Strong_Beer = LOG_SUCCESS;

    B_GiveInvItems (other, self, ItFo_Beer_Lou, 1);

    CreateInvItems (self, ItMi_GoldNugget_Addon, 6);
    B_GiveInvItems (self, other, ItMi_GoldNugget_Addon, 6);
	
    Info_ClearChoices		(DIA_Addon_Scatty_HeresTheBeer);
};

FUNC VOID DIA_Addon_Scatty_HeresTheBeer_Two()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_01"); //Dwie butelki.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_Two_03_02"); //Lepsze to ni� nic. Chocia� i tak z niego sknera. M�g�by si� dzieli� bardziej.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_03"); //Hej�e, przecie� to JA kupi�em te piwa. Zawsze mog�em ci odda� jedn� butelk�.
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_Two_03_04"); //No mog�e�, ale uczciwy jeste�.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_05"); //Uczciwy bandyta?
    AI_Output (self, other ,"DIA_Addon_Scatty_HeresTheBeer_Two_03_06"); //Ju� nie napuszaj si� tak. Masz tu par� z�otych samorodk�w. Na pewno co� z nimi zrobisz.
    AI_Output (other, self ,"DIA_Addon_Scatty_HeresTheBeer_Two_15_07"); //Pewnie.

    B_LogEntry                     (TOPIC_Strong_Beer,"Odda�em Scattiemu dwie butelki piwa. Nazwa� mnie uczciwym bandyt� i w nagrod� da� par� z�otych samorodk�w.");
    Log_SetTopicStatus       (TOPIC_Strong_Beer, LOG_SUCCESS);
    MIS_Strong_Beer = LOG_SUCCESS;

    B_GiveInvItems (other, self, ItFo_Beer_Lou, 2);

    CreateInvItems (self, ItMi_GoldNugget_Addon, 6);
    B_GiveInvItems (self, other, ItMi_GoldNugget_Addon, 6);

    Info_ClearChoices		(DIA_Addon_Scatty_HeresTheBeer);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Scatty_Hello (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 1;
   condition    = DIA_Addon_Scatty_Hello_Condition;
   information  = DIA_Addon_Scatty_Hello_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Scatty_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Scatty_Hello_Info()
{
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_01"); //Witaj ��todziobie. Jestem Scatty.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_02"); //Nazywam si� Vinc.
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_03"); //Wi�c to ty jeste� ten morderca �o�nierzy.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_04"); //Zabi�em tylko dw�ch...
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_05"); //He he, skromno��, co?
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_06"); //Spokojnie, tak sobie gadam. W kolonii by� pewien kopacz, kt�ry twierdzi�, �e zabi� go�ymi r�koma dwunastu ludzi.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_07"); //To by�a prawda?
    AI_Output (self, other ,"DIA_Addon_Scatty_Hello_03_08"); //No co ty. Po prostu chcia� wzbudzi� strach w�r�d innych lub przy nowych. Oprych jakich ma�o.
    AI_Output (other, self ,"DIA_Addon_Scatty_Hello_15_09"); //Racja.
};

//========================================
//-----------------> YouWereInColony
//========================================

INSTANCE DIA_Addon_Scatty_YouWereInColony (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 2;
   condition    = DIA_Addon_Scatty_YouWereInColony_Condition;
   information  = DIA_Addon_Scatty_YouWereInColony_Info;
   permanent	= FALSE;
   description	= "Jeste� z kolonii, tak?";
};

FUNC INT DIA_Addon_Scatty_YouWereInColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_YouWereInColony_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_01"); //Jeste� z kolonii, tak?
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_02"); //Tak, ale jak widzisz, wolno�ci nadal nie mam. To znaczy ciesz� si�, �e nie siedz� pod barier�.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_03"); //Jednak wola�bym ju� siedzie� w mie�cie, w karczmie, przy pysznym piwie i pieczonym mi�siwie.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_04"); //Zaraz, ty jeste� z miasta. Opowiedz mi co� o nim.
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_05"); //A co chcesz wiedzie�?
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_06"); //Po prostu opowiedz mi co� o Khorinis.
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_07"); //W mie�cie jest pewien mag wody o imieniu Vatras. Lubi�em s�ucha� jego opowiada� o bogach. Cz�sto te� z nim rozmawia�em na wszelakie tematy.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_08"); //Mag wody, hmm. Byli pewni w kolonii. O ile pami�tam, to te� byli to magowie wody.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_09"); //A powiesz co� o samym mie�cie?
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_10"); //No c�, przyp�ywa�y statki z kontynentu, handel sta� na wysokim poziomie. Ka�dy m�g� znale�� prac�.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_11"); //A Czerwona Latarnia nadal jest?
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_12"); //Tak, nadal tam jest. Czemu pytasz?
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_13"); //Emm, nooo... emm...
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_14"); //Dobra rozumiem.
    AI_Output (self, other ,"DIA_Addon_Scatty_YouWereInColony_03_15"); //Bardzo lubi�em spotyka� tam pewn� kobiet�.
    AI_Output (other, self ,"DIA_Addon_Scatty_YouWereInColony_15_16"); //Jasne.
};

//========================================
//-----------------> HowsBusiness
//========================================

INSTANCE DIA_Addon_Scatty_HowsBusiness (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 3;
   condition    = DIA_Addon_Scatty_HowsBusiness_Condition;
   information  = DIA_Addon_Scatty_HowsBusiness_Info;
   permanent	= TRUE;
   description	= "Jak tam maj� si� sprawy?";
};

FUNC INT DIA_Addon_Scatty_HowsBusiness_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_HowsBusiness_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HowsBusiness_15_01"); //Jak tam maj� si� sprawy?
    AI_Output (self, other ,"DIA_Addon_Scatty_HowsBusiness_03_02"); //Kopacze kopi� z�oto, niewolnicy kopi� co� dla Kruka. Z�oto p�ynie.
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Scatty_HowAreYou (C_INFO)
{
   npc          = BDT_1086_Addon_Scatty;
   nr           = 4;
   condition    = DIA_Addon_Scatty_HowAreYou_Condition;
   information  = DIA_Addon_Scatty_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Addon_Scatty_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Scatty_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Scatty_HowAreYou_15_01"); //Co u ciebie?
    AI_Output (self, other ,"DIA_Addon_Scatty_HowAreYou_03_02"); //Wszystko po staremu. �adnych zmian.
};

