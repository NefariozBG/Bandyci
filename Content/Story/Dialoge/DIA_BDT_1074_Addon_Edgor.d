
//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Edgor_EXIT(C_INFO)
{
	npc             = BDT_1074_Addon_Edgor;
	nr              = 999;
	condition	= DIA_Addon_Edgor_EXIT_Condition;
	information	= DIA_Addon_Edgor_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Edgor_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Edgor_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> HEY
//========================================

INSTANCE DIA_Addon_Edgor_HEY (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_HEY_Condition;
   information  = DIA_Addon_Edgor_HEY_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_HEY_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_HEY_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_01"); //Hej nowy!
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_15_02"); //Vinc. 
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_03"); //Vinc. Ja jestem Edgor.
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_15_04"); //Przychodz� od Fletchera. Mam spyta�, czy jeste� gotowy do roboty.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_05"); //No pewnie! On zna si� na organizacji obozu. Przeka� mu, �e jestem got�w.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_06"); //No i witamy w�r�d bandyt�w. Jak podr� morska?
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_15_07"); //Nie rozumiem.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_03_08"); //Rzyga�e�? 

    Info_ClearChoices		(DIA_Addon_Edgor_HEY);
    Info_AddChoice		(DIA_Addon_Edgor_HEY, "Tak.", DIA_Addon_Edgor_HEY_YES);
    Info_AddChoice		(DIA_Addon_Edgor_HEY, "Nie.", DIA_Addon_Edgor_HEY_NO);
};

FUNC VOID DIA_Addon_Edgor_HEY_YES()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_YES_15_01"); //Tak.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_YES_03_02"); //Ja tak samo. Pewnej sztormowej nocy zarzyga�em im ca�y statek.
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_YES_15_03"); //Spodziewaj si� nied�ugo jakiej� pracy.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_YES_03_04"); //Jasna sprawa.
    Info_ClearChoices		(DIA_Addon_Edgor_HEY);
    B_LogEntry                     (TOPIC_Report,"Spotka�em Edgora. To ciekawa osoba i wydaje si� by� bardzo dobrze nastawiony. Z niecierpliwo�ci� czeka na prac� od Fletchera. No i wspomnia� o zarzyganiu statku pirat�w. Tylko ciekawe czy ja w te pozosta�o�ci przypadkiem nie wlaz�em...?");
};

FUNC VOID DIA_Addon_Edgor_HEY_NO()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_NO_15_01"); //Nie.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_NO_03_02"); //To mia�e� szcz�cie. Ja podczas sztormowej nocy zarzyga�em im ca�y statek.
    AI_Output (other, self ,"DIA_Addon_Edgor_HEY_NO_15_03"); //Spodziewaj si� nied�ugo jakiej� pracy.
    AI_Output (self, other ,"DIA_Addon_Edgor_HEY_NO_03_04"); //Jasna sprawa.
    Info_ClearChoices		(DIA_Addon_Edgor_HEY);
    B_LogEntry                     (TOPIC_Report,"Spotka�em Edgora. To ciekawa osoba i wydaje si� by� bardzo dobrze nastawiony. Z niecierpliwo�ci� czeka na prac� od Fletchera. No i wspomnia� o zarzyganiu statku pirat�w. Tylko ciekawe czy ja w te pozosta�o�ci przypadkiem nie wlaz�em...?");
};

//========================================
//-----------------> GoodToSee
//========================================

INSTANCE DIA_Addon_Edgor_GoodToSee (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_GoodToSee_Condition;
   information  = DIA_Addon_Edgor_GoodToSee_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_GoodToSee_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_FinishedHunt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_GoodToSee_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_01"); //Dobrze, �e ci� widz�.
    AI_Output (other, self ,"DIA_Addon_Edgor_GoodToSee_15_02"); //O co chodzi?
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_03"); //Chc� zapolowa� na krwiopijce. S� niedaleko st�d. Ale nikt nie garnie si� do pomocy.
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_04"); //Nieroby chc� wej�� do kopalni.
    AI_Output (other, self ,"DIA_Addon_Edgor_GoodToSee_15_05"); //Gdzie s� te krwiopijce?
    AI_Output (self, other ,"DIA_Addon_Edgor_GoodToSee_03_06"); //S� obok starego budynku. Chocia� to ruina, a nie stary budynek. To co, idziemy?
};

//========================================
//-----------------> LetsHunt
//========================================

INSTANCE DIA_Addon_Edgor_LetsHunt (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_LetsHunt_Condition;
   information  = DIA_Addon_Edgor_LetsHunt_Info;
   permanent	= FALSE;
   description	= "Dobra. Zapolujmy na te wredne owady.";
};

FUNC INT DIA_Addon_Edgor_LetsHunt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_GoodToSee))
    {
    return TRUE;
    };
};

FUNC VOID DIA_Addon_Edgor_LetsHunt_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_LetsHunt_15_01"); //Dobra. Zapolujmy na te wredne owady.
    AI_Output (self, other ,"DIA_Addon_Edgor_LetsHunt_03_02"); //I o to chodzi. Za mn�!
    Npc_ExchangeRoutine (self, "Hunt");
    AI_StopProcessInfos	(self);
	
    MIS_Edgors_Hunt = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Edgors_Hunt, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Edgors_Hunt, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Edgors_Hunt,"Wraz z Edgorem id� zapolowa� na krwiopijce. Nie lubi� ich i z ch�ci� na nie zapoluje.");
};

//========================================
//-----------------> BloodfliesDead
//========================================

INSTANCE DIA_Addon_Edgor_BloodfliesDead (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_BloodfliesDead_Condition;
   information  = DIA_Addon_Edgor_BloodfliesDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_BloodfliesDead_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_LetsHunt))
    && (EdgorsDeadBloodflies >= 8)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_BloodfliesDead_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_01"); //No! To by�o polowanie. 
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_02"); //Nie lubi� krwiopijc�w. 
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_03"); //Mi�o to s�ysze�. Ja tych sukinsyn�w nienawidz� jeszcze bardziej ni� ty.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_04"); //Zanim tu przyp�yn��em, w swoich stronach by�em mistrzem w polowaniu na nie.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_05"); //Umiem wyrwa� z nich skrzyd�a, ��d�o i wydzielin�. Ooo tak, wyrywa�...
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_06"); //Ciesz� si�, �e pomog�em. 
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_07"); //A ty sk�d jeste�? Bo nie pyta�em.
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_08"); //Z Khorinis.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_09"); //Heh, mog�em si� domy�li�. S�ysza�em, �e za�atwi�e� dw�ch stra�nik�w.
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_10"); //Jak zobaczyli noc� pioruny i huk bariery zatrzymali si�, nie wiedz�c co dalej. Uzna�em to za dobry moment ataku i ich za�atwi�em.
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_11"); //Zobaczy�a to cz�� z was. Po kr�tkiej rozmowie do��czy�em do waszego zgrupowania.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_12"); //Jeste� w porz�dku. Spotkajmy si� za jaki� czas w karczmie Lou. Stawiam pierwsz� kolejk�. 
    AI_Output (other, self ,"DIA_Addon_Edgor_BloodfliesDead_15_13"); //Nie ma sprawy.
    AI_Output (self, other ,"DIA_Addon_Edgor_BloodfliesDead_03_14"); //I dzi�ki za pomoc przy krwiopijcach.
	Npc_ExchangeRoutine (self, "Drink");
    B_LogEntry                     (TOPIC_Edgors_Hunt,"Krwiopijcy s� ju� za nami. Edgor bardzo ich nie lubi. Nawet jeszcze bardziej ni� ja. Zaprosi� mnie tak�e do karczmy niejakiego Lou. Dawno czego� nie pi�em. Skorzystam z okazji.");
    Log_SetTopicStatus       (TOPIC_Edgors_Hunt, LOG_SUCCESS);
    MIS_Edgors_Hunt = LOG_SUCCESS;
	Npc_ExchangeRoutine (BDT_1093_Addon_Franco, "Fletcher");
	AI_Teleport	(BDT_1093_Addon_Franco, "ADW_PATH_TO_BL_02");
};

//========================================
//-----------------> WhatHappened
//========================================

INSTANCE DIA_Addon_Edgor_WhatHappened (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_WhatHappened_Condition;
   information  = DIA_Addon_Edgor_WhatHappened_Info;
   permanent	= FALSE;
   description	= "Co si� tu sta�o?";
};

FUNC INT DIA_Addon_Edgor_WhatHappened_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WhatHappened_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_WhatHappened_15_01"); //Co si� tu sta�o?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_02"); //Sukinsyn zabi� Fletchera i zabroni� ka�demu dost�pu do obozu.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_03"); //Kaza� Sanchowi pilnowa� wej�cia, �eby ''unikn�� szpieg�w''.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_04"); //Beznadziejny pomys�. Kto znajdzie nas na tym zat�ch�ym bagnie.
    AI_Output (other, self ,"DIA_Addon_Edgor_WhatHappened_15_05"); //Dlaczego go zamordowa�?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_06"); //Po prostu go zabi�. Bez ostrze�enia. Zaraz po tym krzykn��, �e to on rz�dzi w obozie.
    AI_Output (other, self ,"DIA_Addon_Edgor_WhatHappened_15_07"); //Kawa� �miecia. Fletcher by� w porz�dku.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhatHappened_03_08"); //Lepiej odejd�. Nie zwracajmy na siebie uwagi.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Edgor powiedzia�, �e Franko od tak sobie zabi� Fletchera i przej�� w�adz� nad t� cz�ci� obozu. Nie zdziwi� si�, je�li nie spotkam Edgora w obozie...");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Edgor_WheresArvo (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_WheresArvo_Condition;
   information  = DIA_Addon_Edgor_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Wiesz gdzie jest Arvo?";
};

FUNC INT DIA_Addon_Edgor_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_WheresArvo_15_01"); //Wiesz gdzie jest Arvo?
    AI_Output (self, other ,"DIA_Addon_Edgor_WheresArvo_03_02"); //Daj mi spok�j z tym g�wnem. Mam do�� w�asnych problem�w.
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Addon_Edgor_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 1;
   condition    = DIA_Addon_Edgor_WhereAreYouFrom_Condition;
   information  = DIA_Addon_Edgor_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk�d pochodzisz?";
};

FUNC INT DIA_Addon_Edgor_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_HEY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_WhereAreYouFrom_15_01"); //Sk�d pochodzisz?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_02"); //Pochodz� z okolic Waldfried. To bardzo lesista kraina, gdzie wi�kszo�� wyspy to lasy.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_03"); //Tam nauczy�em si� polowa�.
    AI_Output (other, self ,"DIA_Addon_Edgor_WhereAreYouFrom_15_04"); //By�e� my�liwym?
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_05"); //Nadal nim jestem. Teraz przewa�nie poluj� z Loganem i kilkoma ch�opakami na polecenie Fletchera.
    AI_Output (self, other ,"DIA_Addon_Edgor_WhereAreYouFrom_03_06"); //Swoj� drog�, ciekawski z ciebie go��.
};

//========================================
//-----------------> WaitingForYou
//========================================

INSTANCE DIA_Addon_Edgor_WaitingForYou (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 2;
   condition    = DIA_Addon_Edgor_WaitingForYou_Condition;
   information  = DIA_Addon_Edgor_WaitingForYou_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Edgor_WaitingForYou_Condition()
{
    if (Wld_IsTime (18,00,20,00))
    && (Npc_KnowsInfo (other, DIA_Addon_Edgor_BloodfliesDead))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_WaitingForYou_Info()
{
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_01"); //O jeste� ju�! Czeka�em na ciebie.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_02"); //Nie zapomnia�em. Stawiasz pierwsz� kolejk�.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_03"); //No to chlust.
    CreateInvItems (other, ItFo_Beer, 1);
    CreateInvItems (self, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    B_UseItem (other, ItFo_Beer);
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_04"); //Niesamowity smak.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_05"); //Stary Lou wie co dobre. M�wi�e�, �e jeste� z Khorinis. Jak oceniasz to miasto?
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_06"); //Cz�� ludzi by�a w porz�dku, a cz�� mia�a co� na sumieniu.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_07"); //Jak to w mie�cie bywa. Jeste� strasznie m�ody, a przynajmniej na takiego wygl�dasz.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_08"); //S�ysza�em to kiedy�.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_09"); //No to co? Pijemy drugie piwo.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_10"); //A masz co�?
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_11"); //Pewnie!
    CreateInvItems (other, ItFo_Beer, 1);
    CreateInvItems (self, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    B_UseItem (other, ItFo_Beer);    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_12"); //Aaaa. B�d� si� zbiera�, bo Fletcher nie pozwoli� mi by� tu za d�ugo.
    AI_Output (other, self ,"DIA_Addon_Edgor_WaitingForYou_15_13"); //Do zobaczenia.
    AI_Output (self, other ,"DIA_Addon_Edgor_WaitingForYou_03_14"); //Trzymaj si�, ch�opcze.
    Npc_ExchangeRoutine (self, "Start");
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Edgor_HowAreYou (C_INFO)
{
   npc          = BDT_1074_Addon_Edgor;
   nr           = 3;
   condition    = DIA_Addon_Edgor_HowAreYou_Condition;
   information  = DIA_Addon_Edgor_HowAreYou_Info;
   permanent	= TRUE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Addon_Edgor_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Edgor_HEY))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Edgor_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Edgor_HowAreYou_15_01"); //Co u ciebie?
    if (KAPITEL == 1)
    {
        AI_Output (self, other ,"DIA_Addon_Edgor_HowAreYou_03_02"); //Jest dobrze.
    }
    else if (KAPITEL == 2)
    {
        AI_Output (self, other ,"DIA_Addon_Edgor_HowAreYou_03_03"); //S�ysza�em, �e Fletcher pozwoli� ci na dobre wej�� do obozu. Powodzenia.
    }
    else if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Addon_Edgor_HowAreYou_03_04"); //Sam widzisz, fatalnie.
    };
};

