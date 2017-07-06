//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Arvo_EXIT(C_INFO)
{
	npc             = BDT_10316_Arvo;
	nr              = 999;
	condition	= DIA_Arvo_EXIT_Condition;
	information	= DIA_Arvo_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Arvo_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Arvo_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Arvo_WhatsUp (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhatsUp_Condition;
   information  = DIA_Arvo_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Arvo_WhatsUp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Arvo_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WhatsUp_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Addon_Arvo_WhatsUp_03_02"); //Nie m�wi�em �eby� spada�?
};


//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Arvo_WhoAreYou (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhoAreYou_Condition;
   information  = DIA_Arvo_WhoAreYou_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhoAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhoAreYou_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_01"); //H�?
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_02"); //Jeste� Arvo, jak mniemam? 
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_03"); //Wiesz co mnie obchodzi twoje mniemanie? Daj mi spok�j.
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_04"); //To wiedz o pracy jak� dostaniesz od Fletchera.
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_05"); //Jakiej znowu pracy?!
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_06"); //Widzisz? Fletcher zbiera ludzi do pracy. Trzeba organizowa� ob�z.
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_07"); //Wiesz co? Daj mi spok�j. 
    AI_Output (other, self ,"DIA_Arvo_WhoAreYou_15_08"); //Przeka�� o twojej "gotowo�ci" do roboty.
    AI_Output (self, other ,"DIA_Arvo_WhoAreYou_03_09"); //Spadaj st�d.
    B_LogEntry                     (TOPIC_Report,"Mia�em ''niezwyk�� przyjemno��'' rozmowy z Arvo. Ten typ to jaka� pora�ka. Musz� na niego uwa�a�. Co� czuj�, �e to k�amliwy �mie�.");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatDoYouWant
//========================================

INSTANCE DIA_Arvo_WhatDoYouWant (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhatDoYouWant_Condition;
   information  = DIA_Arvo_WhatDoYouWant_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhatDoYouWant_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_WhatToDo))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhatDoYouWant_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_01"); //Czego u licha chcesz?
    AI_Output (other, self ,"DIA_Arvo_WhatDoYouWant_15_02"); //P�jdziemy pozwiedza� bagna. Ruszaj si�.
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_03"); //Grozisz mi? Wiesz kim JA jestem?
    AI_Output (other, self ,"DIA_Arvo_WhatDoYouWant_15_04"); //Tak? To wr�c� do Estebana i powiem mu kim TY jeste�. (z ironi�)
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_05"); //Hej, hej! Nie r�b czego� pochopnie.
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_06"); //Znam Estebana. Powiedzia�, �e przy�le mi kogo� do pomocy.
    AI_Output (other, self ,"DIA_Arvo_WhatDoYouWant_15_07"); //No to chod�.
    AI_Output (self, other ,"DIA_Arvo_WhatDoYouWant_03_08"); //Jasne. Za mn�. (nikczemnie)
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Gdy Arvo dowiedzia� si�, �e przychodz� od Estebana, zmieni� lekko swoje nastawienie. Ale nadal jest �mieciem. Musz� na niego uwa�a�.");
    Npc_ExchangeRoutine (self, "Guide");
};

//========================================
//-----------------> DamnBeasts
//========================================

INSTANCE DIA_Arvo_DamnBeasts (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 2;
   condition    = DIA_Arvo_DamnBeasts_Condition;
   information  = DIA_Arvo_DamnBeasts_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_DamnBeasts_Condition()
{
    if (Npc_GetDistToWP (self, "ADW_CANYON_PATH_TO_BANDITS_06E") < 200)
    && (Npc_KnowsInfo (other, DIA_Arvo_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_DamnBeasts_Info()
{
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_01"); //Cholerne bestie!
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_02"); //Uspok�j si�, przecie� ju� nie �yj�.
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_03"); //Widz� przecie�. Zreszt� niewa�ne. Stan� na warcie przed wej�ciem.
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_04"); //Po co? Nikt nas nie napadnie.
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_05"); //A jak przyjd� nagle jakie� inne potwory?
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_06"); //Och�o� troch�.
    AI_Output (self, other ,"DIA_Arvo_DamnBeasts_03_07"); //NIE! B�d� tu sta�, a ty kop.
    AI_Output (other, self ,"DIA_Arvo_DamnBeasts_15_08"); //Jasne. Ca�a brudna robota dla mnie.
	Npc_ExchangeRoutine (self, "Wait");
	AI_GotoWP	(BDT_10316_Arvo, "ADW_CAVE_ARVO");
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatIsIt
//========================================

INSTANCE DIA_Arvo_WhatIsIt (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 3;
   condition    = DIA_Arvo_WhatIsIt_Condition;
   information  = DIA_Arvo_WhatIsIt_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhatIsIt_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_DamnBeasts))
    && (Npc_HasItems (other, ItWr_StonePlate_Cave) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhatIsIt_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhatIsIt_03_01"); //Widz�, �e co� masz. Co to?
    AI_Output (other, self ,"DIA_Arvo_WhatIsIt_15_02"); //Tabliczka? (z ironi�)
    AI_Output (self, other ,"DIA_Arvo_WhatIsIt_03_03"); //Nie z�o�� si� tak. Pomog�em ci przecie�. Wr�c� do obozu. A ty zanie� to Estebanowi.
    AI_Output (other, self ,"DIA_Arvo_WhatIsIt_15_04"); //Jasne.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WaitAMinute
//========================================

INSTANCE DIA_Arvo_WaitAMinute (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 4;
   condition    = DIA_Arvo_WaitAMinute_Condition;
   information  = DIA_Arvo_WaitAMinute_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WaitAMinute_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_WhatIsIt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WaitAMinute_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WaitAMinute_03_01"); //Chwila, zaczekaj!
    AI_Output (self, other ,"DIA_Arvo_WaitAMinute_03_02"); //Logan ci� szuka�.
    AI_Output (other, self ,"DIA_Arvo_WaitAMinute_15_03"); //A co on ode mnie chcia�?
    AI_Output (self, other ,"DIA_Arvo_WaitAMinute_03_04"); //A sk�d mam wiedzie�? Przypomnia�o mi si� w�a�nie teraz. Id� do niego.
    AI_Output (other, self ,"DIA_Arvo_WaitAMinute_15_05"); //Taa, jasne.
    Npc_ExchangeRoutine (self, "Start");
    AI_StopProcessInfos	(self);
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Oczywi�cie ca�e kopanie spad�o na moje barki, bo Arvo 'zabezpiecza�' ty�y. Na dodatek przypomnia�o mu si�, �e Logan ma do mnie jak�� spraw�. Odwiedz� go, bo do Estebana niespecjalnie mi si� �pieszy.");
};

//========================================
//-----------------> WhoDoWeHaveHere
//========================================

INSTANCE DIA_Arvo_LoganDidntWantAnything (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_LoganDidntWantAnything_Condition;
   information  = DIA_Arvo_LoganDidntWantAnything_Info;
   permanent	= FALSE;
   description	= "Logan nic ode mnie nie chcia�...";
};

FUNC INT DIA_Arvo_LoganDidntWantAnything_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Logan_WereYouLookingForMe))
    && (!Npc_KnowsInfo (other, DIA_Addon_Esteban_FinallyYouAreHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_LoganDidntWantAnything_Info()
{
    AI_Output (other, self ,"LoganDidntWantAnything_03_01"); //Logan nic ode mnie nie chcia�...
    AI_Output (self, other ,"LoganDidntWantAnything_15_02"); //Tak? Mo�e si� pomyli�em. W ka�dym razie, id� oddaj t� tabliczk� Estebanowi.
};

//========================================
//-----------------> WhoDoWeHaveHere
//========================================

INSTANCE DIA_Arvo_WhoDoWeHaveHere (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_WhoDoWeHaveHere_Condition;
   information  = DIA_Arvo_WhoDoWeHaveHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_WhoDoWeHaveHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_FinallyYouAreHere))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_WhoDoWeHaveHere_Info()
{
    AI_Output (self, other ,"DIA_Arvo_WhoDoWeHaveHere_03_01"); //Oh. Kogo my tu mamy. I jak tam rozmowa z...
    AI_Output (other, self ,"DIA_Arvo_WhoDoWeHaveHere_15_02"); //Pewnego dnia lub nocy, gdy nikogo nie b�dzie obok, dopadn� ci�.
    AI_Output (self, other ,"DIA_Arvo_WhoDoWeHaveHere_03_03"); //Nie strasz, nie strasz. Nie boj� si� takich gnojk�w jak ty.
    AI_Output (self, other ,"DIA_Arvo_WhoDoWeHaveHere_03_04"); //Twoje pojawienie si� w obozie by�o b��dem.
    AI_Output (other, self ,"DIA_Arvo_WhoDoWeHaveHere_15_05"); //Jeszcze zobaczymy.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> StillHere
//========================================

INSTANCE DIA_Arvo_StillHere (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_StillHere_Condition;
   information  = DIA_Arvo_StillHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_StillHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_StillHere_Info()
{
    AI_Output (self, other ,"DIA_Arvo_StillHere_03_01"); //Jeszcze tu jeste�?
    AI_Output (other, self ,"DIA_Arvo_StillHere_15_02"); //Ty...
    AI_Output (self, other ,"DIA_Arvo_StillHere_03_03"); //Franko rz�dzi tutaj. Lepiej st�d id�. (arogancko) I uwa�aj na siebie.
    AI_Output (other, self ,"DIA_Arvo_StillHere_15_04"); //Jeszcze zobaczymy.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Arvo ostrzeg� mnie, abym nie panoszy� si� po obozie. Mam ju� go do��.");
};

//========================================
//-----------------> Finale
//========================================

INSTANCE DIA_Arvo_Finale (C_INFO)
{
   npc          = BDT_10316_Arvo;
   nr           = 1;
   condition    = DIA_Arvo_Finale_Condition;
   information  = DIA_Arvo_Finale_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Arvo_Finale_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Arvo_Finale_Info()
{
    Npc_ExchangeRoutine (BDT_10017_Addon_Juan, "Final");
	AI_Teleport (BDT_10017_Addon_Juan, "ADW_CANYON_PATH_TO_BANDITS_06F");
	AI_GotoWP	(BDT_10017_Addon_Juan, "ADW_CANYON_PATH_TO_BANDITS_06E");
    AI_Output (self, other ,"DIA_Arvo_Finale_03_01"); //Nareszcie! Teraz mi si� nie wymskniesz!
    AI_Output (other, self ,"DIA_Arvo_Finale_15_02"); //Czy�by? (kpi�cym g�osem)
    AI_Output (other, self ,"DIA_Arvo_Finale_03_03"); //�adnej pokory nawet w obliczu �mierci. �a�osne.
    AI_Output (self, other ,"DIA_Arvo_Finale_03_04"); //To samo mog� powiedzie� i tobie. Prawda Huan?
    AI_Output (other, self ,"DIA_Arvo_Finale_15_05"); //(zdziwienie) Huan?
	AI_StopProcessInfos (self);
};

INSTANCE DIA_Addon_Arvo_End (C_INFO)
{
	npc          = BDT_10316_Arvo;
	nr           = 1;
	condition    = DIA_Addon_Arvo_End_Condition;
	information  = DIA_Addon_Arvo_End_Info;
	permanent	= FALSE;
	important	= TRUE;
};

FUNC INT DIA_Addon_Arvo_End_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Huan_Finale))
    {
		return TRUE;
    };
};

FUNC VOID DIA_Addon_Arvo_End_Info()
{
	AI_StopProcessInfos (self);
    B_Extro_Avi();
};

