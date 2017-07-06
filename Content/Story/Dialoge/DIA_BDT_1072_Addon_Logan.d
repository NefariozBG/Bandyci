//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Logan_EXIT(C_INFO)
{
	npc             = BDT_1072_Addon_Logan;
	nr              = 999;
	condition	= DIA_Addon_Logan_EXIT_Condition;
	information	= DIA_Addon_Logan_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Logan_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Logan_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> REPORT
//========================================

INSTANCE DIA_Addon_Logan_REPORT (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_REPORT_Condition;
   information  = DIA_Addon_Logan_REPORT_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Logan_REPORT_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    && (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_REPORT_Info()
{
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_01"); //Oho nowy! Witaj w�r�d nas. 
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_02"); //Ja r�wnie� witam. Jestem Vinc, a ty?
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_03"); //Zw� mnie Logan. Jestem my�liwym. Ale nie takim paniczykiem co poluje na wilki czy �cierwojady. 
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_04"); //Mam rozumie�, �e jeste� gotowy.
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_05"); //Na co?
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_06"); //Fletcher.
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_07"); //Ah tak. �wietnie, �e pytasz. Czekam w�a�nie na jego ruch. Przy okazji, przeka� mu, �e niedaleko st�d, na polance, s� b�otne w�e. 
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_08"); //B�otne w�e?
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_09"); //Bardzo niebezpieczne stworzenia. �yj� na bagnach jak, ich nazwa wskazuje. Pami�taj. Dobry b�otny w��, to martwy b�otny w��.
    AI_Output (other, self ,"DIA_Addon_Logan_REPORT_15_10"); //Jasne. Przeka�� Fletcherowi, �e czekasz na prac�.
    AI_Output (self, other ,"DIA_Addon_Logan_REPORT_03_11"); //Dzi�ki.
    B_LogEntry                     (TOPIC_Report,"Pozna�em Logana. Powiedzia�, �e jest my�liwym i wspomnia� mi o b�otnych w�ach, a przy okazji czeka na robot�. Fletchera to ucieszy.");
};

//========================================
//-----------------> RealHunter
//========================================

INSTANCE DIA_Addon_Logan_RealHunter (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_RealHunter_Condition;
   information  = DIA_Addon_Logan_RealHunter_Info;
   permanent	= FALSE;
   description	= "A wi�c jeste� prawdziwym my�liwym?";
};

FUNC INT DIA_Addon_Logan_RealHunter_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_REPORT))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_RealHunter_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_RealHunter_15_01"); //A wi�c jeste� prawdziwym my�liwym?
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_02"); //He he, potraktuj to jako samochwalstwo. Owszem, polowanie na b�otne w�e to niebezpieczne zaj�cie.
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_03"); //Ale poluj� tak�e na inne zwierz�ta. Zwykle z paroma ch�opakami idziemy w g��b wyspy i zdobywamy mi�so. Tyle ile upolujemy lub ile damy rady unie��.
    AI_Output (other, self ,"DIA_Addon_Logan_RealHunter_15_04"); //Co� gro�nego?
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_05"); //Kilka dni temu trafili�my na z�bacze. Tak bardzo nas zaskoczy�y, �e musieli�my ucieka�!
    AI_Output (self, other ,"DIA_Addon_Logan_RealHunter_03_06"); //Ca�e stado bieg�o w nasz� stron�! Cholerne bestie. Od tamtej pory zmienili�my tryb polowa�.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Addon_Logan_AnyNews (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_AnyNews_Condition;
   information  = DIA_Addon_Logan_AnyNews_Info;
   permanent	= TRUE;
   description	= "Co� ciekawego?";
};

FUNC INT DIA_Addon_Logan_AnyNews_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Logan_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_AnyNews_15_01"); //Co� ciekawego?
    if (KAPITEL >= 3)
    {
        AI_Output (self, other ,"DIA_Addon_Logan_AnyNews_03_02"); //Franko zabi� Fletchera. Ale to ju� pewnie wiesz.
    }
    else
    {
        AI_Output (self, other ,"DIA_Addon_Logan_AnyNews_03_03"); //Na razie nic. Pilnuj� obozu.
    };
};


//========================================
//-----------------> LetsHunt
//========================================

INSTANCE DIA_Addon_Logan_LetsHunt (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_LetsHunt_Condition;
   information  = DIA_Addon_Logan_LetsHunt_Info;
   permanent	= FALSE;
   description	= "Mam ci pom�c w walce z tymi w�ami.";
};

FUNC INT DIA_Addon_Logan_LetsHunt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_MoreWork))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_LetsHunt_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_LetsHunt_15_01"); //Mam ci pom�c w walce z tymi w�ami.
    AI_Output (self, other ,"DIA_Addon_Logan_LetsHunt_03_02"); //Kto� odwa�ny. To lubi�. Reszta ch�opak�w niezbyt garnie si� do pomocy, a do pomocy przy b�otnych w�ach to ju� w og�le. 
    AI_Output (self, other ,"DIA_Addon_Logan_LetsHunt_03_03"); //Chod� za mn�. Na polance s� trzy. Damy rad�.
    Npc_ExchangeRoutine (self, "Hunt");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> SwampsharksDead
//========================================

INSTANCE DIA_Addon_Logan_SwampsharksDead (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 2;
   condition    = DIA_Addon_Logan_SwampsharksDead_Condition;
   information  = DIA_Addon_Logan_SwampsharksDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Logan_SwampsharksDead_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_LetsHunt))
    && (LogansDeadSwampsharks >= 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_SwampsharksDead_Info()
{
    AI_Output (self, other ,"DIA_Addon_Logan_SwampsharksDead_03_01"); //Dobry b�otny w��, to martwy b�otny w��. 
    AI_Output (other, self ,"DIA_Addon_Logan_SwampsharksDead_15_02"); //Racja. S� trudne do pokonania.
    AI_Output (self, other ,"DIA_Addon_Logan_SwampsharksDead_03_03"); //Nabierzesz wprawy. O to si� nie martw. 
    AI_Output (self, other ,"DIA_Addon_Logan_SwampsharksDead_03_04"); //Okolica jest bardzo ciekawa. Rozejrz� si� tutaj. Ty powiedz Fletcherowi o sukcesie.
    AI_Output (other, self ,"DIA_Addon_Logan_SwampsharksDead_15_05"); //Tak zrobi�.
	Npc_ExchangeRoutine (self, "Stay");
    B_LogEntry                     (TOPIC_Help_Logan,"Sprawa za�atwiona. Nigdy nie walczy�em z takimi stworzeniami, ale da�em rad�. Logan rozejrzy si� po okolicy. Mi pozostaje tylko powiadomi� Fletchera o wszystkim.");
};

//========================================
//-----------------> WereYouLookingForMe
//========================================

INSTANCE DIA_Addon_Logan_WereYouLookingForMe (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_WereYouLookingForMe_Condition;
   information  = DIA_Addon_Logan_WereYouLookingForMe_Info;
   permanent	= FALSE;
   description	= "Szuka�e� mnie?";
};

FUNC INT DIA_Addon_Logan_WereYouLookingForMe_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_WaitAMinute))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_WereYouLookingForMe_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_01"); //Szuka�e� mnie?
    AI_Output (self, other ,"DIA_Addon_Logan_WereYouLookingForMe_03_02"); //Ja? Sk�d.
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_03"); //Kto� mi powiedzia�, �e tak.
    AI_Output (self, other ,"DIA_Addon_Logan_WereYouLookingForMe_03_04"); //A ten kto� to kto?
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_05"); //W sumie nikt wa�ny.
    AI_Output (self, other ,"DIA_Addon_Logan_WereYouLookingForMe_03_06"); //To po co si� go s�uchasz? Nie daj si� zwie��.
    AI_Output (other, self ,"DIA_Addon_Logan_WereYouLookingForMe_15_07"); //Zapami�tam.
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Co ten Arvo kombinuje? Logan nic ode mnie nie chcia� i wyszed�em na idiot�. Chyba b�d� musia� si� nim zaj��.");
};

//========================================
//-----------------> WhatDoYouKnow
//========================================

INSTANCE DIA_Addon_Logan_WhatDoYouKnow (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_WhatDoYouKnow_Condition;
   information  = DIA_Addon_Logan_WhatDoYouKnow_Info;
   permanent	= FALSE;
   description	= "Co wiesz o zab�jstwie Fletchera?";
};

FUNC INT DIA_Addon_Logan_WhatDoYouKnow_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_WhatDoYouKnow_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_WhatDoYouKnow_15_01"); //Co wiesz o zab�jstwie Fletchera?
    AI_Output (self, other ,"DIA_Addon_Logan_WhatDoYouKnow_03_02"); //Pos�uchaj, ja... Chc� si� dosta� do obozu. Musz� tam by�.
    AI_Output (other, self ,"DIA_Addon_Logan_WhatDoYouKnow_15_03"); //Logan, nie poznaj� ci�. Co si� dzieje?
    AI_Output (self, other ,"DIA_Addon_Logan_WhatDoYouKnow_03_04"); //Nie mieszaj si� w to. Masz wst�p do obozu, to tam zosta�.
    AI_Output (self, other ,"DIA_Addon_Logan_WhatDoYouKnow_03_05"); //A teraz zostaw mnie samego.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Logan jest nie do poznania. Po kr�tkiej rozmowie �atwo stwierdzi�, �e jego te� kto� zastraszy�.");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Logan_WheresArvo (C_INFO)
{
   npc          = BDT_1072_Addon_Logan;
   nr           = 1;
   condition    = DIA_Addon_Logan_WheresArvo_Condition;
   information  = DIA_Addon_Logan_WheresArvo_Info;
   permanent	= FALSE;
   description	= "By� tu Arvo?";
};

FUNC INT DIA_Addon_Logan_WheresArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_WheresArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Logan_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_01"); //By� tu Arvo?
    AI_Output (self, other ,"DIA_Addon_Logan_WheresArvo_03_02"); //By� tutaj przez chwil� i st�d poszed�.
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_03"); //Gdzie?
    AI_PointAtNpc(self, BDT_10316_Arvo);
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_04"); //Tam! By� w�ciek�y i bredzi� co� po nosem.
    AI_StopPointAt(self);
    AI_Output (self, other ,"DIA_Addon_Logan_WheresArvo_03_05"); //Ciesz� si�, �e nie zawraca� mi g�owy.
    AI_Output (other, self ,"DIA_Addon_Logan_WheresArvo_15_06"); //Jasne.
    B_LogEntry                     (TOPIC_Arvo,"Logan powiedzia� mi o kierunku w kt�rym uda� si� Arvo. Mniej wi�cej tam gdzie by�a jaskinia z tabliczk�. Zemszcz� si�!");
};

