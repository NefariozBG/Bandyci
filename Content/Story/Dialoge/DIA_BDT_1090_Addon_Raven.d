//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Raven_EXIT(C_INFO)
{
	npc             = BDT_1090_Addon_Raven;
	nr              = 999;
	condition	= DIA_Addon_Raven_EXIT_Condition;
	information	= DIA_Addon_Raven_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Raven_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Raven_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> FinallyYouAreHere
//========================================

INSTANCE DIA_Addon_Raven_FinallyYouAreHere (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_FinallyYouAreHere_Condition;
   information  = DIA_Addon_Raven_FinallyYouAreHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Raven_FinallyYouAreHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_GoToRaven))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_FinallyYouAreHere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_01"); //No, jeste� wreszcie. S�ysza�em o twoich dzia�aniach tutaj, w obozie. Nie�le jak na kogo� kto zabawi� tutaj tak kr�tko. Od czas�w kolonii nie widzia�em takiego zaanga�owania.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_02"); //Morderstwo dw�ch �o�nierzy da�o ci niez�� reputacj�.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_03"); //Ale do rzeczy. Masz zbada� kompleks korytarzy w centralnej cz�ci krainy.
    AI_Output (other, self ,"DIA_Addon_Raven_FinallyYouAreHere_15_04"); //By�em tam ju� par� razy.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_05"); //Czy pozwoli�em ci m�wi�?! Masz zwiedzi� ten kompleks i powiedzie� czy jest tam co� ciekawego. Rozumiesz?
    AI_Output (other, self ,"DIA_Addon_Raven_FinallyYouAreHere_15_06"); //Tak.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_07"); //I zbadaj jeszcze piedesta�y obok tych platform.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_08"); //Jeden taki piedesta� jest pono� na bagnie, znajdziesz go bez problemu.
    AI_Output (other, self ,"DIA_Addon_Raven_FinallyYouAreHere_15_09"); //Rozumiem.
    AI_Output (self, other ,"DIA_Addon_Raven_FinallyYouAreHere_03_10"); //Ruszaj ju�. Nie wracaj dop�ki nie wykonasz polecenia.
    MIS_Raven = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Raven, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Raven, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Raven,"Porozmawia�em z Krukiem. Niezwykle nerwowy go��. Chyba ju� wiem od kogo Bloodwyn naby� tego swojego pysza�kowatego i aroganckiego charakteru. Dosta�em od niego zadanie zbadania kompleksu ruin w centrum doliny. Drug� cz�ci� zadania jest zbadanie piedesta��w, kt�re s� tu� obok tych dziwnych platform. Jedna taka platforma jest gdzie� na bagnie. Czeka mnie d�ugi spacer.");

    Wld_InsertNpc (SwampDrone_Journal,"ADW_SOUTHEAST_TELEPORTSTATION");

    Wld_InsertNpc (Gobbo_Green_Journal,"ADW_PORTALTEMPEL_14");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_14");
    Wld_InsertNpc (Gobbo_Green,"FP_ITEM_ADWPORTAL_02");

    Wld_InsertNpc (Gobbo_Green_Journal_MainHall,"ADW_PORTALTEMPEL_06");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_07");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_TELEPORTSTATION");
    Wld_InsertNpc (Gobbo_Green,"ADW_PORTALTEMPEL_08B");
};

//========================================
//-----------------> LookedAtPedestals
//========================================

INSTANCE DIA_Addon_Raven_LookedAtPedestals (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_LookedAtPedestals_Condition;
   information  = DIA_Addon_Raven_LookedAtPedestals_Info;
   permanent	= FALSE;
   description	= "Zbada�em te piedesta�y.";
};

FUNC INT DIA_Addon_Raven_LookedAtPedestals_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_FinallyYouAreHere))
    && (checkedTemple == TRUE)
    && (checkedTeleport == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_LookedAtPedestals_Info()
{
    AI_Output (other, self ,"DIA_Addon_Raven_LookedAtPedestals_15_01"); //Zbada�em te piedesta�y. Maj� one jakie� niewielkie ��obienia, w kt�re mo�na co� umie�ci�.
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_02"); //Znakomicie... A ruiny?
    AI_Output (other, self ,"DIA_Addon_Raven_LookedAtPedestals_15_03"); //W ruinach nie ma nic ciekawego, nie licz�c piedesta�u oraz...
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_04"); //Wystarczy, wystarczy! Nie obchodzi mnie reszta. Teraz mam wa�niejsze sprawy.
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_05"); //Potrzebuj� pi�ciu starych kamiennych tablic. Przynie� mi je.
    AI_Output (other, self ,"DIA_Addon_Raven_LookedAtPedestals_15_06"); //A gdzie ja je...
    AI_Output (self, other ,"DIA_Addon_Raven_LookedAtPedestals_03_07"); //NA co ty czekasz! Ruszaj si�!
    B_LogEntry                     (TOPIC_Raven,"Kruk nie zareagowa� w og�le na moje zbadanie ruin i piedesta��w. Zby� mnie gadk�, �e potrzebuje jaki� starych tabliczek. Na par� z nich ju� si� natkn��em.");
};

//========================================
//-----------------> GotTheTablets
//========================================

INSTANCE DIA_Addon_Raven_GotTheTablets (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 2;
   condition    = DIA_Addon_Raven_GotTheTablets_Condition;
   information  = DIA_Addon_Raven_GotTheTablets_Info;
   permanent	= FALSE;
   description	= "Mam ju� te tabliczki.";
};

FUNC INT DIA_Addon_Raven_GotTheTablets_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Raven_LookedAtPedestals))
    && (Npc_HasItems (other, ItWr_StonePlateCommon_Addon) >=5)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_GotTheTablets_Info()
{
    AI_Output (other, self ,"DIA_Addon_Raven_GotTheTablets_15_01"); //Mam ju� te tabliczki.
    AI_Output (self, other ,"DIA_Addon_Raven_GotTheTablets_03_02"); //Daj mi je. Hmm...
    B_GiveInvItems (other, self, ItWr_StonePlateCommon_Addon, 5);
    B_UseFakeTablet();
    AI_Output (self, other ,"DIA_Addon_Raven_GotTheTablets_03_03"); //Dobra. Zbierz mi kilku stra�nik�w. Maj� wej�� do �wi�tyni. Powiedz im, �e to JA wyda�em to polecenie.
    AI_Output (other, self ,"DIA_Addon_Raven_GotTheTablets_15_04"); //Jasne.
    B_LogEntry                     (TOPIC_Raven,"Oczywi�cie Kruk wyda� mi kolejne polecenie. Mam zebra� paru stra�nik�w do �wi�tyni. To znaczy oni maj� tam wej��, a ja mam im to powiedzie�. Co za bezsens.");
};

//========================================
//-----------------> GoodJob
//========================================

INSTANCE DIA_Addon_Raven_GoodJob (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_GoodJob_Condition;
   information  = DIA_Addon_Raven_GoodJob_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Raven_GoodJob_Condition()
{
    if (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple2))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple3))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple4))
    && (Npc_KnowsInfo (other, DIA_RavenGuard_GoToTemple5))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_GoodJob_Info()
{
    AI_Output (self, other ,"DIA_Addon_Raven_GoodJob_03_01"); //Znakomicie! To teraz id� do Bloodwyna. Jest w kopalni. Ja zaraz do was do��cz�.
    AI_StopProcessInfos	(self);

    B_LogEntry                     (TOPIC_Raven,"Zadanie zako�czone. �adnej zap�aty i podzi�kowania. Nie bardzo mi si� chce pomaga� Krukowi. Ale po tym co zrobi�em na Khorinis, to nie mam innego wyj�cia.");
    Log_SetTopicStatus       (TOPIC_Raven, LOG_SUCCESS);
    MIS_Raven = LOG_SUCCESS;

    MIS_Tomb = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Tomb, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Tomb, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Tomb,"Teraz mam i�� do kopalni, gdzie czeka na mnie Bloodwyn. Nie mam poj�cia co oni planuj�, ale nie mam chyba innego wyj�cia ni� p�j�� tam i zobaczy� co si� dzieje.");
	
	Wld_InsertNpc	(Stoneguardian_Tomb, "ADW_MINE_SKLAVENTOD_03");
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_04");
	Wld_InsertNpc	(Stoneguardian, "ADW_MINE_SKLAVENTOD_05");
};

//========================================
//-----------------> StartAttack
//========================================

INSTANCE DIA_Addon_Raven_StartAttack (C_INFO)
{
   npc          = BDT_1090_Addon_Raven;
   nr           = 1;
   condition    = DIA_Addon_Raven_StartAttack_Condition;
   information  = DIA_Addon_Raven_StartAttack_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Raven_StartAttack_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Bloodwyn_FinallyYouAreHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Raven_StartAttack_Info()
{
    AI_Output (self, other ,"DIA_Addon_Raven_StartAttack_03_01"); //Wszystko ju� rozumiem. Fortuno przesta� by� u�yteczny. A co do ciebie...
    AI_Output (self, other ,"DIA_Addon_Raven_StartAttack_03_02"); //Tymi tabliczkami bardzo si� przys�u�y�e�. Teraz wiem wszystko.
    AI_Output (self, other ,"DIA_Addon_Raven_StartAttack_03_03"); //Do dzie�a!
    Npc_ExchangeRoutine (self, "Attack");
    Npc_ExchangeRoutine (BDT_1085_Addon_Bloodwyn, "Attack");
    Npc_ExchangeRoutine (BDT_10019_Alvaro, "Attack");
    B_LogEntry                     (TOPIC_Tomb,"Wed�ug planu Bloodwyna mam wraz z paroma stra�nikami walczy� z kamiennymi stra�nikami. Przyn�t� b�d� niewolnicy. Kruk mamrota� co� tak�e o braku przydatno�ci Fortuno. Nie wiem co z tego wyniknie.");
    AI_StopProcessInfos	(self);
};

