//----------------------------------------------------------------------
//	Info EXIT 
//----------------------------------------------------------------------
INSTANCE DIA_Addon_BDT_10014_Thorus_EXIT   (C_INFO)
{
	npc         = BDT_10014_Addon_Thorus;
	nr          = 999;
	condition   = DIA_Addon_Thorus_EXIT_Condition;
	information = DIA_Addon_Thorus_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Thorus_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Thorus_BroughtList (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_BroughtList_Condition;
   information  = DIA_Addon_Thorus_BroughtList_Info;
   permanent	= FALSE;
   description	= "Potrzebujesz czego�?";
};

FUNC INT DIA_Addon_Thorus_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_BroughtList_15_01"); //Potrzebujesz czego�?
    AI_Output (self, other ,"DIA_Addon_Thorus_BroughtList_03_02"); //H�?
    AI_Output (other, self ,"DIA_Addon_Thorus_BroughtList_15_03"); //Mam list� od Fiska. Jest tu lista towar�w dla pirat�w.
    AI_Output (self, other ,"DIA_Addon_Thorus_BroughtList_03_04"); //Mikstury lecznicze si� przydadz�. Daj mi list�.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Thorus_BroughtList_03_05"); //Trzymaj.
    B_LogEntry                     (TOPIC_List_of_Goods,"Kr�tka rozmowa z Thorusem i kolejna osoba, kt�ra wpisa�a mi si� do listy.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Thorus_PackageForYou (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 2;
   condition    = DIA_Addon_Thorus_PackageForYou_Condition;
   information  = DIA_Addon_Thorus_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Mam twoj� paczk�.";
};

FUNC INT DIA_Addon_Thorus_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Thorus) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_PackageForYou_15_01"); //Mam twoj� paczk�.
    AI_Output (self, other ,"DIA_Addon_Thorus_PackageForYou_03_02"); //Znakomicie. Przydajesz si�. Oby tak dalej.
    B_GiveInvItems (other, self, ItMi_Packet_Thorus, 1);
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Thorus stwierdzi�, �e jestem przydatny. Dobrze to s�ysze�.");
};

//========================================
//-----------------> WhatCanIDo
//========================================

INSTANCE DIA_Addon_Thorus_WhatCanIDo (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_WhatCanIDo_Condition;
   information  = DIA_Addon_Thorus_WhatCanIDo_Info;
   permanent	= FALSE;
   description	= "Jest co� co mog� zrobi�?";
};

FUNC INT DIA_Addon_Thorus_WhatCanIDo_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Thorus_WhatCanIDo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_01"); //Jest co� co mog� zrobi�?
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_02"); //Pewnie, dla nowego zawsze znajdzie si� robota. We�miesz udzia� w pewnym szczeg�lnym transporcie.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_03"); //Piraci maj� dla nas dostaw� niewolnik�w, kt�rych potrzebuje Kruk. Naszym zadaniem jest natomiast mu ich dostarcza�.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_04"); //Gdzie odb�dzie si� wymiana?
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_05"); //W centralnej cz�ci tej krainy s� ruiny. Niedaleko nich jest pewien w�w�z.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_06"); //Zreszt�, Carlos ci� tam zaprowadzi.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_07"); //Ilu z nas tam p�jdzie?
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_08"); //Ty, Carlos, Senyan i Sancho. Przyda si� tym dw�m ostatnim troch� ruchu.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatCanIDo_03_09"); //Carlos b�dzie dowodzi�, wi�c si� go s�uchaj.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatCanIDo_15_10"); //Jasne.

    MIS_Transport = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Transport, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Transport, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Transport,"Dosta�em od Thorusa jedno z wa�niejszych zada�. Wraz z Carlosem, Senyanem i Sancho mamy i�� do w�wozu, gdzie odb�dzie si� dostawa niewolnik�w. Nie wiem jeszcze po co ci niewolnicy, ale zapewne wkr�tce si� dowiem. Udam si� do Carlosa i om�wi� z nim spraw�.");

    Npc_ExchangeRoutine (PIR_1371_Addon_Hank, "Trade");
    Npc_ExchangeRoutine (PIR_1370_Addon_Angus, "Trade");
    Npc_ExchangeRoutine (PIR_1355_Addon_Skip, "Trade");

    Wld_InsertNpc (STRF_1120_Addon_Tonak, "ADW_TRADE_PIR_SLAVE");
    Wld_InsertNpc (STRF_1122_Addon_Pardos, "ADW_ENTRANCE_2_PIRATECAMP_03");
    Wld_InsertNpc (STRF_1119_Addon_Monty, "ADW_TRADE_PIR_SLAVE");
    Wld_InsertNpc (STRF_1121_Addon_Telbor, "ADW_ENTRANCE_2_PIRATECAMP_03");

    Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "WaitForHero");
    Npc_ExchangeRoutine (BDT_1084_Addon_Senyan, "WaitForHero");
};

//========================================
//-----------------> FinishedTransport
//========================================

INSTANCE DIA_Addon_Thorus_FinishedTransport (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_FinishedTransport_Condition;
   information  = DIA_Addon_Thorus_FinishedTransport_Info;
   permanent	= FALSE;
   description	= "Transport zako�czony sukcesem.";
};

FUNC INT DIA_Addon_Thorus_FinishedTransport_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_SanchoStays))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_FinishedTransport_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_FinishedTransport_03_00"); //Transport zako�czony sukcesem.
    AI_Output (self, other ,"DIA_Addon_Thorus_FinishedTransport_15_01"); //�wietnie. Kruk si� ucieszy.
    AI_Output (other, self ,"DIA_Addon_Thorus_FinishedTransport_03_02"); //Ja my�l�. To wszystko?
    AI_Output (self, other ,"DIA_Addon_Thorus_FinishedTransport_03_03"); //A czego si� jeszcze spodziewasz? To dla ciebie. Sakiewka ze z�otem.

    CreateInvItems (self, ItSe_GoldPocket100, 1);
    B_GiveInvItems (self, other, ItSe_GoldPocket100, 1);

    B_LogEntry                     (TOPIC_Transport,"Koniec transportu wi�ni�w. Thorus da� mi par� leczniczych mikstur, a niewolnicy poszli do kopalni. Robota zako�czona.");
    Log_SetTopicStatus       (TOPIC_Transport, LOG_SUCCESS);
    MIS_Transport = LOG_SUCCESS;
};

//========================================
//-----------------> CrimsonNeedsWork
//========================================

INSTANCE DIA_Addon_Thorus_CrimsonNeedsWork (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_CrimsonNeedsWork_Condition;
   information  = DIA_Addon_Thorus_CrimsonNeedsWork_Info;
   permanent	= FALSE;
   description	= "Pewien wytapiacz z�ota szuka roboty.";
};

FUNC INT DIA_Addon_Thorus_CrimsonNeedsWork_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Crimson_WhatAreYouDoing))
    && (Npc_KnowsInfo (other, DIA_Addon_Thorus_FinishedTransport))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_CrimsonNeedsWork_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_CrimsonNeedsWork_15_01"); //Pewien wytapiacz z�ota szuka roboty.
    AI_Output (self, other ,"DIA_Addon_Thorus_CrimsonNeedsWork_03_02"); //Przyda si� kto� taki w kopalni. Powiedz temu komu�, aby szed� do kopalni.
    AI_Output (other, self ,"DIA_Addon_Thorus_CrimsonNeedsWork_15_03"); //Crimson si� zapewne ucieszy.
    AI_Output (self, other ,"DIA_Addon_Thorus_CrimsonNeedsWork_03_04"); //Zapewne tak.
    B_LogEntry                     (TOPIC_Bored_Crimson,"Thorus powiedzia�, �e przyda si� kto� do kopalni. Crimson nie b�dzie ju� bezrobotny.");
};

//========================================
//-----------------> LostSpy
//========================================

INSTANCE DIA_Addon_Thorus_LostSpy (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_LostSpy_Condition;
   information  = DIA_Addon_Thorus_LostSpy_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Thorus_LostSpy_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Carlos_GoToThorus))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_LostSpy_Info()
{
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_01"); //Dobrze, �e jeste�.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_03"); //S�ysza�em o tej akcji z Arvo.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_04"); //Jestem niewinny.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_05"); //Jak ka�dy bandyta. Nie chodzi mi o to.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_06"); //To o co?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_07"); //Arvo jest zwyk�ym �mieciem i czyim� przydupasem.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_08"); //Ale ty jeste� inny. Zlec� ci wa�ne zadanie. Dostaniesz si� dzi�ki temu do obozu.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_09"); //Do rzeczy.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_10"); //Wymiana handlowa z piratami jest bardzo wa�na. Ale czujno�ci nigdy za ma�o.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_11"); //Mam ich obserwowa�?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_12"); //Nie, nie ty. Wys�a�em przed tob� pewnego kolesia.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_13"); //Ale od tego czasu nie mam z nim kontaktu.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_14"); //M�g� zdradzi�?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_15"); //Pr�dzej zosta� zabitym.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_16"); //Piraci?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_17"); //Raczej jaka� bestia. Mog�em wys�a� kogo� innego.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_18"); //Ale organizacja nowego miejsca na ob�z poch�ania du�o czasu.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_19"); //I nie wy�l� byle kogo kto zaraz zostanie po�arty.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_20"); //Mia� co� szczeg�lnego ze sob�?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_21"); //To jeden z dawnych szkodnik�w pewnego obozu.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_22"); //Na imi� mia� Butch. Wys�ali�my go tylko dlatego, bo uchodzi� za gro�nego i niebezpiecznego.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_23"); //Opinie s� k�amliwe, a zw�aszcza czyje�.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_24"); //Zanim polaz�, pochwali� si� paru osobom, jakoby okrad� maga. M�wi� 'niby stra�nik, a �lepy'.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_25"); //M�g� ukra��?
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_26"); //Jak dla mnie to temu magowi wypad� ten pier�cie�.
    AI_Output (other, self ,"DIA_Addon_Thorus_LostSpy_15_27"); //Poszukiwania mog� troch� zaj��.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_28"); //Je�li nie masz mapy tej cz�ci wyspy, to kup j� od Fiska.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_29"); //Butch mia� przej�� przez centralne ruiny.
    AI_Output (self, other ,"DIA_Addon_Thorus_LostSpy_03_30"); //Tam zacznij poszukiwania.
    MIS_Spy = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Spy, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Spy, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Spy,"Mam znale�� kolesia imieniem Butch. W�r�d zbieg�w z kolonii karnej kr��y�a opinia, �e jest on niebezpiecznym typem. Thorus wys�a� go na przeszpiegi u pirat�w, uwa�a on jednak, �e zosta� po�arty przez jakie� bestie. Poleci� mi, abym poszukiwania zacz�� od centralnych ruin w tej cz�ci wyspy.");
};

//========================================
//-----------------> FoundButch
//========================================

INSTANCE DIA_Addon_Thorus_FoundButch (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 2;
   condition    = DIA_Addon_Thorus_FoundButch_Condition;
   information  = DIA_Addon_Thorus_FoundButch_Info;
   permanent	= FALSE;
   description	= "Odnalaz�em twojego szpiega. Jest ju� w innym �wiecie.";
};

FUNC INT DIA_Addon_Thorus_FoundButch_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(Butch_StonePuma);
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_LostSpy))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_FoundButch_Info()
{
    AI_Output (other, self ,"DIA_Addon_Thorus_FoundButch_15_01"); //Odnalaz�em twojego szpiega. Jest ju� w innym �wiecie.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_02"); //Wiedzia�em, �e zgin��. Dobrze, �e go odnalaz�e�.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_03"); //Pier�cie� sobie zatrzymaj. Nie jest mi potrzebny.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_04"); //Reszt� zajmie si� pewnie Kruk.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_05"); //A co do ciebie. Masz moje pozwolenie, a teraz odejd�, bo mam wa�niejsze sprawy na g�owie.
    AI_Output (self, other ,"DIA_Addon_Thorus_FoundButch_03_06"); //Nied�ugo cz�� z nas si� pozabija, �eby wej�� do kopalni. Trzeba ogarn�� ten burdel.
    AI_Output (other, self ,"DIA_Addon_Thorus_FoundButch_15_07"); //Do zobaczenia.
    B_LogEntry                     (TOPIC_Spy,"Uzyska�em pozwolenie od Thorusa na wej�cie do kopalni. Wol� trzyma� si� jego ni� tego idioty Estebana. Nie zdziwi� si�, jak pewnego dnia kto� go wykiwa i zabije. Pogratulowa�bym temu cz�owiekowi za wykonan� przys�ug�.");
    Log_SetTopicStatus       (TOPIC_Spy, LOG_SUCCESS);
    MIS_Spy = LOG_SUCCESS;
};

//========================================
//-----------------> WhatHappenedThere
//========================================

INSTANCE DIA_Addon_Thorus_WhatHappenedThere (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_WhatHappenedThere_Condition;
   information  = DIA_Addon_Thorus_WhatHappenedThere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Thorus_WhatHappenedThere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_AttackEnded))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_WhatHappenedThere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_01"); //Mia�em zobaczy� co si� dzieje w kopalni.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatHappenedThere_15_02"); //Kruk otworzy� grobowiec. Pokonali�my kamiennych stra�nik�w, kt�rzy stamt�d wyszli. Nast�pnie Kruk wszed� do grobowca.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatHappenedThere_15_03"); //A Bloodwyn kaza� mi si� wynosi�.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_04"); //Pos�uchaj mnie teraz. Gdy mia�em wej�� do kopalni, jeden ze stra�nik�w powiedzia� o jaki� zamieszkach na dole.
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_05"); //W obozie my�liwych. Fletcher b�dzie wiedzia� wi�cej. Id� do niego. Sam mia�em si� tym zaj��, ale...
    AI_Output (self, other ,"DIA_Addon_Thorus_WhatHappenedThere_03_06"); //Musz� zobaczy� na w�asne oczy co si� sta�o w kopalni.
    AI_Output (other, self ,"DIA_Addon_Thorus_WhatHappenedThere_15_07"); //Nie ma sprawy, sprawdz� to.

    IntroduceChapter (KapWechsel_3,KapWechsel_3_Text,"chapter3.tga","chapter_01.wav", 6000);
	KAPITEL = 3;
    MIS_Riot_in_Hunters_Camp = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Riot_in_Hunters_Camp, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Riot_in_Hunters_Camp, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Thorus wysy�a mnie do obozu Fletchera, bo by�y tam jakie� zamieszki. Musz� to sprawdzi�.");

    B_KillNpc	 (BDT_10315_Fletcher);
    Npc_ExchangeRoutine (BDT_10316_Arvo, "FletcherDead");
	AI_Teleport (BDT_10316_Arvo, "BL_FIGHT_01");
	
	Npc_ExchangeRoutine (BDT_1073_Addon_Sancho, "Final");
    Npc_ExchangeRoutine (BDT_1093_Addon_Franco, "Fletcher");
};

//========================================
//-----------------> FletcherIsDead
//========================================

INSTANCE DIA_Addon_Thorus_FletcherIsDead (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_FletcherIsDead_Condition;
   information  = DIA_Addon_Thorus_FletcherIsDead_Info;
   permanent	= FALSE;
   description	= "Mam smutne wie�ci. Fletcher nie �yje.";
};

FUNC INT DIA_Addon_Thorus_FletcherIsDead_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_WhatDoYouKnow))
    && (Npc_KnowsInfo (other, DIA_Addon_Miguel_WhyDidHeKill))
    && (Npc_KnowsInfo (other, DIA_Addon_Edgor_WhatHappened))
    && (Npc_KnowsInfo (other, DIA_Arvo_StillHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Thorus_FletcherIsDead_Info()
{
	Npc_ExchangeRoutine (BDT_1070_Addon_Paul, "GoToSnaf");
	AI_Teleport (BDT_1070_Addon_Paul,"BL_SMITH_STAIRS");
	AI_GotoWP	(BDT_1070_Addon_Paul,"BL_SMITH_STAIRS");

    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_01"); //Mam smutne wie�ci. Fletcher nie �yje.
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_02"); //Kto go zabi�?
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_03"); //Franko. Po prostu zaszed� go i zabi�. Og�osi� si� samozwa�czym szefem. Teraz ka�dy si� go boi.
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_04"); //W zastraszaniu pom�g� mu Arvo...
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_05"); //Banda �mieci!
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_06"); //Co z Frankiem? Zabijemy go?
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_07"); //Nie, nie... Ka�de morderstwo to roz�am w obozie.
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_08"); //Daj mi spok�j. Id� ju� st�d.
    AI_Output (other, self ,"DIA_Addon_Thorus_FletcherIsDead_15_09"); //Nie rozumiem.
    AI_Output (self, other ,"DIA_Addon_Thorus_FletcherIsDead_03_10"); //Po prostu id� st�d! Musz� pomy�le� na spokojnie.

    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Thorus wydawa� si� w�ciek�y, ale w jaki� spos�b opanowa� zdenerwowanie. Szkoda mi Fletchera. Sam bym zabi� tego Franko. Chocia�by z zemsty. Ale pami�tam s�owa, aby nie lekcewa�y� nikogo. Cholera! Co ja mam teraz zrobi�?");
    Log_SetTopicStatus       (TOPIC_Riot_in_Hunters_Camp, LOG_SUCCESS);
    MIS_Riot_in_Hunters_Camp = LOG_SUCCESS;
};

//========================================
//-----------------> DontGoThere
//========================================

INSTANCE DIA_Addon_Thorus_DontGoThere (C_INFO)
{
   npc          = BDT_10014_Addon_Thorus;
   nr           = 1;
   condition    = DIA_Addon_Thorus_DontGoThere_Condition;
   information  = DIA_Addon_Thorus_DontGoThere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Thorus_DontGoThere_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Thorus_DontGoThere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_01"); //Nawet nie my�l o p�j�ciu dalej.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_02"); //Nawet nie my�la�em.
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_03"); //�wietnie, �e si� zgadzamy. Gdyby� jednak czego� potrzebowa� to zg�o� si� do mnie.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_04"); //Dobrze.
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_05"); //Jestem Thorus. Zapami�taj to imi�.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_06"); //Jasne. Ja jestem Vinc.
    AI_Output (self, other ,"DIA_Addon_Thorus_DontGoThere_03_07"); //Pogada�bym z tob� o tym wydarzeniu z �o�nierzami, ale mam mas� spraw na g�owie.
    AI_Output (other, self ,"DIA_Addon_Thorus_DontGoThere_15_08"); //Nie przeszkadzam.
};

