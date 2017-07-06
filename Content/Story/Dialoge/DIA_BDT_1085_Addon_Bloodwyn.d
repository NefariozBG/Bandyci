//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Bloodwyn_EXIT(C_INFO)
{
	npc             = BDT_1085_Addon_Bloodwyn;
	nr              = 999;
	condition	= DIA_Addon_Bloodwyn_EXIT_Condition;
	information	= DIA_Addon_Bloodwyn_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Bloodwyn_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Bloodwyn_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WelcomeNewcomer
//========================================

INSTANCE DIA_Addon_Bloodwyn_WelcomeNewcomer (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_WelcomeNewcomer_Condition;
   information  = DIA_Addon_Bloodwyn_WelcomeNewcomer_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_WelcomeNewcomer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Thorus_FoundButch))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_WelcomeNewcomer_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_01"); //To ty jeste� ten nowy! S�ysza�em o tobie wiele ciekawych rzeczy. Pono� jeste� obiecuj�cy nabytkiem na przysz�o��.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_02"); //My�l�, �e tak.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_03"); //Pos�uchaj mnie uwa�nie. Przyj�li�my ci� do nas, bo zabi�e� dw�ch �o�nierzy. Nie lada wyczyn jak na takiego m�odzika.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_04"); //Mam dla ciebie ofert�. Mo�esz sta� si� kim� w tym obozie. Mo�esz by� jednym z NAS!
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_05"); //Stra�nikiem Kruka.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_06"); //A co mam zrobi�?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_07"); //Wykonywa� rozkazy i zadania od Kruka, a czego si� spodziewa�e�?!
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_08"); //Ale z takim pancerzem to ty zejd� na ziemi�.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_09"); //Dostan� taki jak tw�j?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_10"); //JAK �MIESZ! Jestem najlepszym wojownikiem w tym obozie. Nabierz szacunku.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_11"); //Je�li zas�u�ysz, to taki dostaniesz. Ale teraz id�, za�atw sobie mocniejszy pancerz. Fletcher ci w tym pomo�e.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_15_12"); //Nied�ugo wr�c�.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_WelcomeNewcomer_03_13"); //No to na co czekasz?
    MIS_Better_Armour = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Better_Armour, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Better_Armour, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Better_Armour,"Spotka�em Bloodwyna. Powiedzia�, �e mog� sta� si� stra�nikiem Kruka, o ile b�d� wykonywa� jego zadania. Ale �eby te zadania wykona�, to musz� dosta� lepszy pancerz. Czas odwiedzi� Fletchera.");
};

//========================================
//-----------------> GetSomeArmour
//========================================

INSTANCE DIA_Addon_Bloodwyn_GetSomeArmour (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 2;
   condition    = DIA_Addon_Bloodwyn_GetSomeArmour_Condition;
   information  = DIA_Addon_Bloodwyn_GetSomeArmour_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_GetSomeArmour_Condition()
{
    if (MIS_Better_Armour == LOG_RUNNING)
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_GetSomeArmour_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_GetSomeArmour_03_01"); //Bez lepszego pancerza nie dostaniesz �adnego zadania! Id� ju�!
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoToRaven
//========================================

INSTANCE DIA_Addon_Bloodwyn_GoToRaven (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_GoToRaven_Condition;
   information  = DIA_Addon_Bloodwyn_GoToRaven_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_GoToRaven_Condition()
{
	var C_Item BDTArmour; BDTArmour = Npc_GetEquippedArmor(other);
	
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_GoldForArmour))
    && (Hlp_IsItem(BDTArmour, ITAR_BDT_H) == TRUE)
    {
		return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_GoToRaven_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_GoToRaven_03_01"); //Od razu lepiej. Kruk czeka na ciebie przed wej�ciem do kopalni. Lepiej si� zachowuj.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FinallyYouAreHere
//========================================

INSTANCE DIA_Addon_Bloodwyn_FinallyYouAreHere (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_FinallyYouAreHere_Condition;
   information  = DIA_Addon_Bloodwyn_FinallyYouAreHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_FinallyYouAreHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_GoodJob))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_FinallyYouAreHere_Info()
{
    Npc_ExchangeRoutine (BDT_1090_Addon_Raven, "WaitBeforeAttack");
	AI_Teleport		(BDT_1090_Addon_Raven, "ADW_MINE_16");
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_01"); //No jeste� wreszcie. Teraz czeka nas wyzwanie.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_15_02"); //Co trzeba zrobi�?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_03"); //Niewolnicy dokopali si� do grobowca. Kruk bardzo chce go zbada�, a naszym zadaniem b�dzie ochranianie go.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_15_04"); //Co robimy?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_05"); //My? Niewolnicy otworz� wej�cie. Ja, ty i Alvaro b�dziemy na tyle wraz z Krukiem.
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_15_06"); //Co� niebezpiecznego tam b�dzie?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_07"); //Zadajesz zbyt du�o pyta�. Oczywi�cie, �e tak. Zanim tu przyszed�e� za�atwili�my ze trzy tuziny kamiennych stra�nik�w.
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_03_08"); //Kruk s�dzi, �e ich tu spotkamy. Wi�c si� pilnuj.

    Info_ClearChoices		(DIA_Addon_Bloodwyn_FinallyYouAreHere);
    Info_AddChoice		(DIA_Addon_Bloodwyn_FinallyYouAreHere, "Kiedy zaczynamy?", DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart);
};

FUNC VOID DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart()
{
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart_15_01"); //Kiedy zaczynamy?
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_FinallyYouAreHere_WhenDoWeStart_03_02"); //Idzie Kruk.
    Info_ClearChoices		(DIA_Addon_Bloodwyn_FinallyYouAreHere);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AttackEnded
//========================================

INSTANCE DIA_Addon_Bloodwyn_AttackEnded (C_INFO)
{
   npc          = BDT_1085_Addon_Bloodwyn;
   nr           = 1;
   condition    = DIA_Addon_Bloodwyn_AttackEnded_Condition;
   information  = DIA_Addon_Bloodwyn_AttackEnded_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Bloodwyn_AttackEnded_Condition()
{
    var C_NPC whodie0; 	whodie0 = Hlp_GetNpc(Stoneguardian_Tomb);
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_StartAttack))
    && (Npc_IsDead(whodie0))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Bloodwyn_AttackEnded_Info()
{
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_AttackEnded_03_01"); //A teraz wynocha st�d!
    AI_Output (other, self ,"DIA_Addon_Bloodwyn_AttackEnded_15_02"); //A je�li b�d� po...
    AI_Output (self, other ,"DIA_Addon_Bloodwyn_AttackEnded_03_03"); //Wyno� si� powiedzia�em!
    B_LogEntry                     (TOPIC_Tomb,"Uda�o si� nam otworzy� wej�cie do grobowca. Wybieg�a z niego ca�a chmara kamiennych maszkar. Poradzili�my sobie z nimi. Po wszystkim Kruk znikn�� w grobowcu, a Bloodwyn kaza� mi si� wynosi�. Nie mam zamiaru zosta� w tej kopalni.");
    Log_SetTopicStatus       (TOPIC_Tomb, LOG_SUCCESS);
    MIS_Tomb = LOG_SUCCESS;
	Npc_ExchangeRoutine (BDT_10014_Addon_Thorus, "AfterAttack");
};

