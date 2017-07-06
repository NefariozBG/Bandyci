//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Fletcher_EXIT(C_INFO)
{
	npc             = BDT_10315_Fletcher;
	nr              = 999;
	condition	= DIA_Fletcher_EXIT_Condition;
	information	= DIA_Fletcher_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Fletcher_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WELCOME
//========================================

INSTANCE DIA_Fletcher_WELCOME (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_WELCOME_Condition;
   information  = DIA_Fletcher_WELCOME_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fletcher_WELCOME_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Fletcher_WELCOME_Info()
{
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_01"); //Witaj �wie�aku. Jestem Fletcher.
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_15_02"); //Nazywam si� Vinc.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_03"); //Dobra, opowiem ci co i jak. Jak widzisz zorganizowali�my ob�z. Ale nadal brakuje mu jeszcze du�o do dobrze zorganizowanego. 
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_04"); //Ja dowodz� pierwsz� cz�ci� obozu. Tutaj znajdziesz my�liwych oraz tych, kt�rzy nie mog� wej�� do obozu.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_05"); //Ale ty mo�esz to zmieni�. Nikt nie powiedzia�, �e musisz tu stercze�.
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_15_06"); //Czyli jestem w waszej bandzie?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_07"); //Oczywi�cie! Od teraz jeste� jednym z poszukiwanych przez wojsko i stra� Khorinis.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_08"); //We� ten pancerz i bro�. Nie jest to jaki� szczyt dobrego ekwipunku, ale to tutaj ci si� przyda.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_03_09"); //I pozb�d� si� tego starego ubrania. Teraz jeste� bandyt�.
    CreateInvItems (self, ItMw_1h_Sld_Axe, 1);
    B_GiveInvItems (self, other, ItMw_1h_Sld_Axe, 1);
    CreateInvItems (other, ITAR_BDT_M, 1);


    Info_ClearChoices		(DIA_Fletcher_WELCOME);
    Info_AddChoice		(DIA_Fletcher_WELCOME, "Dobra, pozb�d� si� tych �ach�w.", DIA_Fletcher_WELCOME_IWILLBURN);
};

FUNC VOID DIA_Fletcher_WELCOME_IWILLBURN()
{
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_IWILLBURN_15_01"); //Dobra, pozb�d� si� tych �ach�w.
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_02"); //�wietnie. Przy okazji dostaniesz pierwsze zadanie.
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_IWILLBURN_15_03"); //Zadanie?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_04"); //Tak. Nie zamierzasz chyba nic nie robi� jak reszta bandy?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_05"); //Organizacja tego obozu to podstawa. Przejd� si� i spytaj par� os�b o ich gotowo��. 
    AI_Output (other, self ,"DIA_Fletcher_WELCOME_IWILLBURN_15_06"); //Kogo dok�adnie?
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_07"); //Logan, Edgor, Ramon, Arvo i Miguel. 
    AI_Output (self, other ,"DIA_Fletcher_WELCOME_IWILLBURN_03_08"); //Przy okazji zapoznasz si� z nasz� band�.
    MIS_Report = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Report, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Report, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Report,"Fletcher przyj�� mnie w poczet bandyt�w. Nigdy bym si� nie spodziewa�, �e do��cz� do takich ludzi. Ale nie pozosta� mi �aden wyb�r po zdarzeniach w Khorinis. Moim pierwszym zadaniem jest wypyta� paru go�ci czy s� gotowi. Nic trudnego. Poznam przynajmniej ludzi i b�d� nieco bezpieczniejszy. Ciekawi mnie jeszcze miejsce, w kt�rym si� znajdujemy. W mie�cie nikt nie wiedzia� o tej cie�ninie, kt�r� przep�yn��em...");
    Info_ClearChoices		(DIA_Fletcher_WELCOME);
	KAPITEL = 1;
	IntroduceChapter (KapWechsel_1,KapWechsel_1_Text,"chapter1.tga","chapter_01.wav", 6000);
};

//========================================
//-----------------> AboutTheReport
//========================================

INSTANCE DIA_Fletcher_AboutTheReport (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_AboutTheReport_Condition;
   information  = DIA_Fletcher_AboutTheReport_Info;
   permanent	= FALSE;
   description	= "Co do gotowo�ci...";
};

FUNC INT DIA_Fletcher_AboutTheReport_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_REPORT))
    && (Npc_KnowsInfo (other, DIA_Addon_Edgor_HEY))
    && (Npc_KnowsInfo (other, DIA_Addon_Ramon_WhoAreYou))
    && (Npc_KnowsInfo (other, DIA_Arvo_WhoAreYou))
    && (Npc_KnowsInfo (other, DIA_Addon_Miguel_LookingForMiguel))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_AboutTheReport_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_01"); //Co do gotowo�ci...
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_02"); //Hm?
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_03"); //Pozna�em Logana. Czeka na robot� od ciebie i przekazuj� informacje od niego. Na polance niedaleko s� b�otne w�e. 
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_04"); //Nie pr�nowa�. Dobra robota. B�dzie trzeba si� nimi zaj��.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_05"); //Edgor bardzo ch�tnie czeka na prac�.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_06"); //Doskonale. B�dzie sporo pracy.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_07"); //Spotka�em Miguela. Czeka na robot� od ciebie oraz powiedzia� abym wspomnia� ci o zio�ach, kt�re tu rosn�.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_08"); //Nie znam si� na ro�linach, ale Miguel z pewno�ci� zrobi z nich u�ytek. Alternatywa dla mikstur leczniczych bardzo si� przyda.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_09"); //Ramon nie chcia� zbyt ze mn� rozmawia�.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_10"); //Daj sobie z nim spok�j. Gbur z niego i tyle. Zapewne dostanie robot� stra�nika.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheReport_15_11"); //A co do Arvo...
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_12"); //Zwyk�y �mie�. Jest z nami odk�d do��czy� do nas Esteban i paru jego ludzi.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_13"); //Dam mu jak�� robot�, aby nie pa��ta� si� mi tutaj.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheReport_03_14"); //Dobra robota. Pomog�e� mi. Teraz czeka na ciebie nowe zadanie. 
    B_LogEntry                     (TOPIC_Report,"Je�li to by� test zaufania to z pewno�ci� zdany. Pozna�em cz�� bandy. Teraz czeka mnie kolejna robota od Fletchera.");
    Log_SetTopicStatus       (TOPIC_Report, LOG_SUCCESS);
    MIS_Report = LOG_SUCCESS;

    B_GivePlayerXP (250);
};

//========================================
//-----------------> MoreWork
//========================================

INSTANCE DIA_Fletcher_MoreWork (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_MoreWork_Condition;
   information  = DIA_Fletcher_MoreWork_Info;
   permanent	= FALSE;
   description	= "Nowa robota?";
};

FUNC INT DIA_Fletcher_MoreWork_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_AboutTheReport))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_MoreWork_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_MoreWork_15_01"); //Nowa robota?
    AI_Output (self, other ,"DIA_Fletcher_MoreWork_03_02"); //Oczywi�cie. M�wi�e� o b�otnych w�ach. P�jdziesz z Loganem i zapolujesz na nie.
    AI_Output (self, other ,"DIA_Fletcher_MoreWork_03_03"); //Nie chc� mie� tych potwor�w zbyt blisko obozu.
    AI_Output (other, self ,"DIA_Fletcher_MoreWork_15_04"); //Dobra. Zapoluj� na te okropie�stwa.
    MIS_Help_Logan = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Help_Logan, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Help_Logan, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Help_Logan,"Mam now� robot�. Wraz z Loganem mamy zapolowa� na b�otne w�e niedaleko jakiej� polanki. Loganowi spodoba si�, �e nie p�jdzie tam sam.");
};

//========================================
//-----------------> FinishedHunt
//========================================

INSTANCE DIA_Fletcher_FinishedHunt (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_FinishedHunt_Condition;
   information  = DIA_Fletcher_FinishedHunt_Info;
   permanent	= FALSE;
   description	= "Sprawa za�atwiona. B�otne w�e nie stanowi� zagro�enia.";
};

FUNC INT DIA_Fletcher_FinishedHunt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_SwampsharksDead))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_FinishedHunt_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_FinishedHunt_15_01"); //Sprawa za�atwiona. B�otne w�e nie stanowi� zagro�enia.
    AI_Output (self, other ,"DIA_Fletcher_FinishedHunt_03_02"); //�wietnie. Mamy pewno��, �e nie podp�yn� one w nocy i nie po�r� jednego z nas.
    AI_Output (other, self ,"DIA_Fletcher_FinishedHunt_15_03"); //Logan rozejrzy si� po okolicy.
    AI_Output (self, other ,"DIA_Fletcher_FinishedHunt_03_04"); //Dobrze. To nawet lepiej. Mia�em dla ciebie jeszcze robot�, ale s� pewne problemy, kt�rymi musz� si� zaj��. Pogadaj z reszt� ch�opak�w, mo�e znajd� ci zaj�cie, na pewno wp�ynie to na korzy�� obozu.
    AI_Output (self, other ,"DIA_Fletcher_FinishedHunt_03_05"); //W nagrod� we� te eliksiry. Pochodz� one prosto od mag�w z kolonii.
    B_LogEntry                     (TOPIC_Help_Logan,"Robota zako�czona. W nagrod� dosta�em eliksiry lecznicze. Teraz Fletcher ma inne sprawy na g�owie. Mog� spokojnie rozejrze� si� po obozie i pom�c reszcie. Ale nigdy nie spodziewa�bym si�, �e bandyci to b�dzie moja nowa �cie�ka w �yciu...");
    Log_SetTopicStatus       (TOPIC_Help_Logan, LOG_SUCCESS);
    MIS_Help_Logan = LOG_SUCCESS;

    B_GivePlayerXP (200);
    CreateInvItems (self, ItPo_Health_01, 6);
    B_GiveInvItems (self, other, ItPo_Health_01, 6);
};

//========================================
//-----------------> AnyPouches
//========================================

INSTANCE DIA_Fletcher_AnyPouches (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_AnyPouches_Condition;
   information  = DIA_Fletcher_AnyPouches_Info;
   permanent	= FALSE;
   description	= "Jest sprawa.";
};

FUNC INT DIA_Fletcher_AnyPouches_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_HelpMe)
	&& (!Npc_KnowsInfo (other, DIA_Miguel_HereAreYourPouches)))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_AnyPouches_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_AnyPouches_15_01"); //Jest sprawa. Czy w magazynie nie ma jaki� sk�rzanych sakiew?
    AI_Output (self, other ,"DIA_Fletcher_AnyPouches_03_02"); //Jest co� takiego. Z kolonii zabrali�my tyle, ile ud�wign�li�my. W tej najmniejszej skrzyni b�dzie par� sztuk.
    AI_Output (self, other ,"DIA_Fletcher_AnyPouches_03_03"); //We� je. Na t� chwil� s� nam do niczego niepotrzebne.
    AI_Output (other, self ,"DIA_Fletcher_AnyPouches_15_04"); //To dla Miguela, zbiera zio�a i nie ma gdzie ich pochowa�.
    AI_Output (self, other ,"DIA_Fletcher_AnyPouches_03_05"); //Dobrze, �e co� robisz. 
    B_LogEntry                     (TOPIC_Pouches_for_Miguel,"Sakiewki znajd� w skrzyni w prowizorycznym magazynie.");
};

//========================================
//-----------------> BeCareful
//========================================

INSTANCE DIA_Fletcher_BeCareful (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_BeCareful_Condition;
   information  = DIA_Fletcher_BeCareful_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fletcher_BeCareful_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_NotYourBusiness))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_BeCareful_Info()
{
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_03_01"); //Uwa�aj na niego.

    Info_ClearChoices		(DIA_Fletcher_BeCareful);
    Info_AddChoice		(DIA_Fletcher_BeCareful, "Jest niebezpieczny.", DIA_Fletcher_BeCareful_HeIsDangerous);
    Info_AddChoice		(DIA_Fletcher_BeCareful, "Mam go gdzie�. Nie stanowi dla mnie zagro�enia.", DIA_Fletcher_BeCareful_HesNoDanger);
};

FUNC VOID DIA_Fletcher_BeCareful_HeIsDangerous()
{
    AI_Output (other, self ,"DIA_Fletcher_BeCareful_HeIsDangerous_15_01"); //Jest niebezpieczny.
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_HeIsDangerous_03_02"); //Pono� mia� kiedy� w�asn� band� i straci� j�. 
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_HeIsDangerous_03_03"); //Jak ju� wspomnia�e� jest niebezpieczny. Miej go na uwadze. Ten typ mo�e narobi� w obozie niez�ego zamieszania.
	MIS_Franco = LOG_SUCCESS;
    Log_SetTopicStatus       (TOPIC_Franco, LOG_SUCCESS);
    B_LogEntry                     (TOPIC_Franco,"Fletcher przestrzeg� mnie przed tym Franko. Musz� bardziej na niego uwa�a�. Ten bandyta b�dzie sprawia� k�opoty. ");
    Info_ClearChoices		(DIA_Fletcher_BeCareful);
};

FUNC VOID DIA_Fletcher_BeCareful_HesNoDanger()
{
    AI_Output (other, self ,"DIA_Fletcher_BeCareful_HesNoDanger_15_01"); //Mam go gdzie�. Nie stanowi dla mnie zagro�enia.
    AI_Output (self, other ,"DIA_Fletcher_BeCareful_HesNoDanger_03_02"); //Nie lekcewa� nigdy nikogo i miej si� na baczno�ci, m�odzie�cze. Nowi, tacy jak ty, mog� wielu rzeczy nie dostrzega�.
	MIS_Franco = LOG_SUCCESS;
    Log_SetTopicStatus       (TOPIC_Franco, LOG_SUCCESS);
    B_LogEntry                     (TOPIC_Franco,"Fletcher przestrzeg� mnie przed tym Franko. Musz� bardziej na niego uwa�a�. Ten bandyta b�dzie sprawia� k�opoty. ");
    Info_ClearChoices		(DIA_Fletcher_BeCareful);
};

//========================================
//-----------------> AboutTheMages
//========================================

INSTANCE DIA_Fletcher_AboutTheMages (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_AboutTheMages_Condition;
   information  = DIA_Fletcher_AboutTheMages_Info;
   permanent	= FALSE;
   description	= "O jakich magach m�wi�e�?";
};

FUNC INT DIA_Fletcher_AboutTheMages_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_FinishedHunt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_AboutTheMages_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_01"); //O jakich magach m�wi�e�?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_02"); //O tych, co stworzyli barier�. W Starym Obozie byli magowie ognia, a w Nowym Obozie magowie wody.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_03"); //Co si� sta�o z tymi magami?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_04"); //Je�li chodzi o mag�w wody to jestem przekonany, �e zdo�ali opu�ci� dolin�.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_05"); //Ale magowie ognia ju� nie.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_06"); //Dlaczego?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_07"); //Wszyscy nie �yj�. Sprzeciwili si� Gomezowi. By�emu najpot�niejszemu cz�owiekowi w kolonii karnej.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_08"); //Zamordowali�cie mag�w ognia?! (zdziwienie)
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_09"); //Pos�uchaj. Nie by�o mnie przy tym i ja tego nie zrobi�em. Poza tym nie zna�e� tych mag�w ognia. Oni wszyscy byli aroganccy.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_10"); //Hmm...
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_11"); //Dodam, �e zostali �pomszczeni�. Pasuje?
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_12"); //Kto ich pom�ci�?
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_13"); //Nie znam jego imienia. Widzia�em go tylko par� razy.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_14"); //Za pierwszym razem pyta� si� mnie o Neka. P�niej go nie widzia�em. Ale du�o s�ysza�em.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_15"); //Pomaga� �wirom z sekty, a p�niej magom wody. Zaraz po tym zawali�a si� Stara Kopalnia. Wtedy magowie ognia sprzeciwili si� Gomezowi. Po kilku dniach do zamku wpad� ten go��.
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_16"); //Jego kr�tka wizyta zaowocowa�a w �mier� wi�kszo�ci stra�nik�w i magnat�w. Pono� mia� przy sobie niespotykane dot�d ostrze. Jeden stra�nik zgin�� od p�omieni. 
    AI_Output (self, other ,"DIA_Fletcher_AboutTheMages_03_17"); //Nie chc� mie� do czynienia z takimi przedmiotami.
    AI_Output (other, self ,"DIA_Fletcher_AboutTheMages_15_18"); //Ciekawa historia.
};

//========================================
//-----------------> WhoWasNek
//========================================

INSTANCE DIA_Fletcher_WhoWasNek (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 2;
   condition    = DIA_Fletcher_WhoWasNek_Condition;
   information  = DIA_Fletcher_WhoWasNek_Info;
   permanent	= FALSE;
   description	= "Kim by� Nek?";
};

FUNC INT DIA_Fletcher_WhoWasNek_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_AboutTheMages))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_WhoWasNek_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_WhoWasNek_15_01"); //Kim by� Nek?
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_02"); //Szkoda gada�. Wraz z nim patrolowali�my okolice areny. Tyle, �e Nek lubi� popi� z kimkolwiek.
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_03"); //Skumplowa� si� z paroma bandytami z Nowego Obozu. Po paru dniach dowiedzia�em si�, �e nie �yje.
    AI_Output (other, self ,"DIA_Fletcher_WhoWasNek_15_04"); //Smutna historia.
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_05"); //Eee tam! Wed�ug mnie ta szuja zabi�a jakiego� kopacza i da�a nog� do szkodnik�w.
    AI_Output (self, other ,"DIA_Fletcher_WhoWasNek_03_06"); //Zreszt� to stare dzieje. 
};

//========================================
//-----------------> HowAreThings
//========================================

INSTANCE DIA_Fletcher_HowAreThings (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_HowAreThings_Condition;
   information  = DIA_Fletcher_HowAreThings_Info;
   permanent	= FALSE;
   description	= "Jak si� maj� sprawy?";
};

FUNC INT DIA_Fletcher_HowAreThings_Condition()
{
    if (MIS_Report == LOG_SUCCESS)
    && (KAPITEL == 1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_HowAreThings_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_HowAreThings_15_01"); //Jak si� maj� sprawy?
    AI_Output (self, other ,"DIA_Fletcher_HowAreThings_03_02"); //Ca�kiem nie�le. Paru co� buduje lub pi�uje deski. Jest paru my�liwych i paru obibok�w.
    AI_Output (self, other ,"DIA_Fletcher_HowAreThings_03_03"); //No i jest ca�kiem pracowity go��!
    AI_Output (other, self ,"DIA_Fletcher_HowAreThings_15_04"); //Kto taki?
    AI_Output (self, other ,"DIA_Fletcher_HowAreThings_03_05"); //No ty! A kt� inny? (�miech)
};

//========================================
//-----------------> GoodNews
//========================================

INSTANCE DIA_Fletcher_GoodNews (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_GoodNews_Condition;
   information  = DIA_Fletcher_GoodNews_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Fletcher_GoodNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_BeCareful))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_GoodNews_Info()
{
    AI_Output (self, other ,"DIA_Fletcher_GoodNews_03_01"); //Mam dobre wie�ci. Od teraz masz wst�p do obozu. 
    AI_Output (other, self ,"DIA_Fletcher_GoodNews_15_02"); //�wietnie... To znaczy dzi�ki. Jakie� rady?
    AI_Output (self, other ,"DIA_Fletcher_GoodNews_03_03"); //Nie daj si� nikomu! Je�li jednak chcesz mie� wst�p do kopalni, to pogadaj z Estebanem. To on decyduje o tym. Powodzenia.
	IntroduceChapter (KapWechsel_2,KapWechsel_2_Text,"chapter2.tga","chapter_01.wav", 6000);
	KAPITEL = 2;
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Fletcher_BroughtList (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_BroughtList_Condition;
   information  = DIA_Fletcher_BroughtList_Info;
   permanent	= FALSE;
   description	= "Mam tu list� od Fiska.";
};

FUNC INT DIA_Fletcher_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_BroughtList_15_01"); //Mam tu list� od Fiska.
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_02"); //Oh, �wietnie. Be�ty, strza�y, troch� wytrych�w...
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_03"); //Narz�dzia i gwo�dzie.
    AI_Output (other, self ,"DIA_Fletcher_BroughtList_15_04"); //Dobra. Zapisz to.
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_05"); //Chwila.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_06"); //Za�atwione.
    AI_Output (other, self ,"DIA_Fletcher_BroughtList_15_07"); //To ja nie przeszkadzam.
    AI_Output (self, other ,"DIA_Fletcher_BroughtList_03_08"); //Do zobaczenia.
    B_LogEntry                     (TOPIC_List_of_Goods,"Kolejna osoba z listy za�atwiona. Fletcher dopisa� potrzebne materia�y.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Fletcher_PackageForYou (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_PackageForYou_Condition;
   information  = DIA_Fletcher_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Mam dla ciebie towar od pirat�w.";
};

FUNC INT DIA_Fletcher_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Fletcher) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_PackageForYou_15_01"); //Mam dla ciebie towar od pirat�w.
    AI_Output (self, other ,"DIA_Fletcher_PackageForYou_03_02"); //�wietnie, ch�opcze! Oto w�a�nie chodzi. Nie jeste� nierobem. Oby tak dalej.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Fletcher pochwali� robot�. I kolejna paczka z g�owy.");
    B_GiveInvItems (other, self, ItMi_Packet_Fletcher, 1);
	Npc_RemoveInvItems (self, ItMi_Packet_Fletcher,1); 
};

//========================================
//-----------------> NeedBetterArmour
//========================================

INSTANCE DIA_Fletcher_NeedBetterArmour (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 1;
   condition    = DIA_Fletcher_NeedBetterArmour_Condition;
   information  = DIA_Fletcher_NeedBetterArmour_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� lepszego pancerza.";
};

FUNC INT DIA_Fletcher_NeedBetterArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_WelcomeNewcomer))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_NeedBetterArmour_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_NeedBetterArmour_15_01"); //Potrzebuj� lepszego pancerza.
    AI_Output (self, other ,"DIA_Fletcher_NeedBetterArmour_03_02"); //Ho ho, s�ysza�em o twojej rozmowie z Bloodwynem.
    AI_Output (other, self ,"DIA_Fletcher_NeedBetterArmour_15_03"); //Wie�ci szybko si� roznosz�.
    AI_Output (self, other ,"DIA_Fletcher_NeedBetterArmour_03_04"); //A jeszcze niedawno raczkowa�e� w tym obozie.
    AI_Output (self, other ,"DIA_Fletcher_NeedBetterArmour_03_05"); //Dam ci taki pancerz, ale jak zrobisz co� dla obozu.
};

//========================================
//-----------------> CanIGetArmour
//========================================

INSTANCE DIA_Fletcher_CanIGetArmour (C_INFO)
{
   npc          = BDT_10315_Fletcher;
   nr           = 2;
   condition    = DIA_Fletcher_CanIGetArmour_Condition;
   information  = DIA_Fletcher_CanIGetArmour_Info;
   permanent	= TRUE;
   description	= "Czy mog� ju� dosta� pancerz?";
};

FUNC INT DIA_Fletcher_CanIGetArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_NeedBetterArmour))
    && (GetNewArmour != TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Fletcher_CanIGetArmour_Info()
{
    AI_Output (other, self ,"DIA_Fletcher_CanIGetArmour_15_01"); //Czy mog� ju� dosta� pancerz?
    AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_02"); //Niech no pomy�l�...
    if (MIS_List_of_Goods == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_03"); //Pogada�e� z ch�opakami o li�cie towar�w. W tym i ze mn�.
        GetNewArmour += 1;
    };
    if (MIS_Packs_from_Pirates == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_04"); //Rozda�e� paczki pirat�w, kt�re za�atwi� Tom.
        GetNewArmour += 1;
    };
    if (MIS_Transport == LOG_SUCCESS)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_05"); //No i by�e� w konwoju wi�ni�w do kopalni.
        GetNewArmour += 1;
    };
    if (GetNewArmour == 3)
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_06"); //Id� do Huno i powiedz, �e to ja ci� przysy�am.
        AI_Output (other, self ,"DIA_Fletcher_CanIGetArmour_15_07"); //Dobra. Dzi�ki za pomoc.
        GetNewArmour = TRUE;
        B_LogEntry                     (TOPIC_Better_Armour,"Fletcher kaza� mi i�� do kowala Huno i powiedzie�, �e to on mnie przys�a�. Wtedy dostan� ten pancerz.");
    }
    else
    {
        AI_Output (self, other ,"DIA_Fletcher_CanIGetArmour_03_08"); //To nie wystarczy, musisz zrobi� co� jeszcze dla obozu.
        GetNewArmour = 0;
    };
};

