//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Franco_EXIT(C_INFO)
{
	npc             = BDT_1093_Addon_Franco;
	nr              = 999;
	condition	= DIA_Franco_EXIT_Condition;
	information	= DIA_Franco_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Franco_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Franco_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Franco_WhatsUp (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_WhatsUp_Condition;
   information  = DIA_Addon_Franco_WhatsUp_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Addon_Franco_WhatsUp_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Franco_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WhatsUp_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Addon_Franco_WhatsUp_03_02"); //Daj mi spok�j.
};

//========================================
//-----------------> NotYourBusiness
//========================================

INSTANCE DIA_Addon_Franco_NotYourBusiness (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_NotYourBusiness_Condition;
   information  = DIA_Addon_Franco_NotYourBusiness_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Franco_NotYourBusiness_Condition()
{
    if (MIS_Pouches_for_Miguel == LOG_SUCCESS)
    && (MIS_Edgors_Hunt == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Franco_NotYourBusiness_Info()
{
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_03_01"); //No prosz�, kogo my tu mamy?
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_15_02"); //To samo mog� powiedzie� i ja.
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_03_03"); //Pos�uchaj mnie uwa�nie. Nie wtykaj nosa w nie swoje sprawy.
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_15_04"); //Pe�no jest ludzi, co nie zas�uguj�, by do nich m�wi�.
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_03_05"); //Uwa�aj co m�wisz! Nie b�d� powtarza�. Zejd� mi z oczu i nie pokazuj si� wi�cej.

    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    Info_AddChoice		(DIA_Addon_Franco_NotYourBusiness, "(odchodzimy)", DIA_Addon_Franco_NotYourBusiness_GoAway);
    Info_AddChoice		(DIA_Addon_Franco_NotYourBusiness, "(nic nie m�wimy)", DIA_Addon_Franco_NotYourBusiness_SayNothing);
    Info_AddChoice		(DIA_Addon_Franco_NotYourBusiness, "Ludzie maj� prawo by� g�upimi.", DIA_Addon_Franco_NotYourBusiness_Continue);
};

FUNC VOID DIA_Addon_Franco_NotYourBusiness_GoAway()
{
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_GoAway_15_01"); //Jak sobie chcesz.
    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    AI_StopProcessInfos	(self);
    MIS_Franco = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Franco, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Franco, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Franco,"Spotka�em Franko. Ten typek grozi� mi, abym nie wtyka� nosa w nie swoje sprawy. Ten go�� mo�e sprawia� problemy.");
    Npc_ExchangeRoutine (self, "Start");
};

FUNC VOID DIA_Addon_Franco_NotYourBusiness_SayNothing()
{
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_SayNothing_15_01"); //...
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_SayNothing_03_02"); //Widz�, �e masz troch� rozs�dku.
    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    AI_StopProcessInfos	(self);
    MIS_Franco = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Franco, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Franco, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Franco,"Spotka�em Franko. Ten typek grozi� mi, abym nie wtyka� nosa w nie swoje sprawy. Ten go�� mo�e sprawia� problemy.");
    Npc_ExchangeRoutine (self, "Start");
};

FUNC VOID DIA_Addon_Franco_NotYourBusiness_Continue()
{
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_Continue_15_01"); //Ludzie maj� prawo by� g�upimi.
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_Continue_03_02"); //Wystawiasz sobie swoj� w�asn� ocen�. 
    AI_Output (other, self ,"DIA_Addon_Franco_NotYourBusiness_Continue_15_03"); //To nie by�a moja ocena...
    AI_Output (self, other ,"DIA_Addon_Franco_NotYourBusiness_Continue_03_04"); //Ty bezczelny �mieciu. Jeszcze tego po�a�ujesz.
    MIS_Franco = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Franco, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Franco, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Franco,"Spotka�em Franko. Ten typek grozi� mi, abym nie wtyka� nosa w nie swoje sprawy. Ten go�� mo�e sprawia� problemy.");
    Npc_ExchangeRoutine (self, "Start");
    Info_ClearChoices		(DIA_Addon_Franco_NotYourBusiness);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatHappenedHere
//========================================

INSTANCE DIA_Addon_Franco_WhatHappenedHere (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_WhatHappenedHere_Condition;
   information  = DIA_Addon_Franco_WhatHappenedHere_Info;
   permanent	= FALSE;
   description	= "Co si� tu sta�o?!";
};

FUNC INT DIA_Addon_Franco_WhatHappenedHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_WhatHappenedThere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Franco_WhatHappenedHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WhatHappenedHere_15_01"); //Co si� tu sta�o?!
    AI_Output (self, other ,"DIA_Addon_Franco_WhatHappenedHere_03_02"); //Ooo, prosz�. Stawiasz mi takie pytania? (�miej si�) Ha ha. Jeszcze tu jeste�?
    AI_Output (other, self ,"DIA_Addon_Franco_WhatHappenedHere_15_03"); //Czemu go zabi�e�?
    AI_Output (self, other ,"DIA_Addon_Franco_WhatHappenedHere_03_04"); //Bo by� s�aby i bezu�yteczny? Zejd� mi z oczu, ch�ystku. Masz wst�p do obozu, to wracaj tam i pilnuj swojego nosa.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Tego si� nie spodziewa�em. Fletcher nie �yje. Zabi� go ten Franko. Cholera! Co si� dzieje? Pogadam z innymi. Edgor i reszta mo�e wiedz� wi�cej na ten temat.");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Franco_WheresArvo (C_INFO)
{
   npc          = BDT_1093_Addon_Franco;
   nr           = 1;
   condition    = DIA_Addon_Franco_WheresArvo_Condition;
   information  = DIA_Addon_Franco_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Gdzie jest Arvo?";
};

FUNC INT DIA_Addon_Franco_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Franco_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Franco_WheresArvo_15_01"); //Gdzie jest Arvo?
    AI_Output (self, other ,"DIA_Addon_Franco_WheresArvo_03_02"); //A czego od niego chcesz? Zreszt�, co mnie to obchodzi.
    AI_Output (self, other ,"DIA_Addon_Franco_WheresArvo_03_03"); //Je�li masz co� do niego to go poszukaj. A teraz zejd� mi z oczu.
    B_LogEntry                     (TOPIC_Arvo,"Franko chyba go kryje. Ale mi to i tak nie przeszkodzi. Spytam kogo� innego. Ten idiota nie m�g� odej�� za daleko.");
};

