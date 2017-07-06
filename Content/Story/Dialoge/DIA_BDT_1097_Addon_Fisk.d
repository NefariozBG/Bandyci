//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Fisk_EXIT(C_INFO)
{
	npc             = BDT_1097_Addon_Fisk;
	nr              = 999;
	condition	= DIA_Addon_Fisk_EXIT_Condition;
	information	= DIA_Addon_Fisk_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Fisk_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Fisk_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WannaEarnSomeMoney
//========================================

INSTANCE DIA_Addon_Fisk_WannaEarnSomeMoney (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_WannaEarnSomeMoney_Condition;
   information  = DIA_Addon_Fisk_WannaEarnSomeMoney_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Fisk_WannaEarnSomeMoney_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_WannaEarnSomeMoney_Info()
{
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_01"); //Zaczekaj chwil�. Chcesz zarobi�?
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_02"); //Pewnie.
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_03"); //�wietnie. Przejd� si� po paru wa�nych osobach w obozie i niech spisz� towary, kt�re s� im potrzebne od pirat�w.
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_04"); //A te osoby to kto?
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_05"); //Przed jedn� stoisz. Reszta to kowal Huno, kucharz Snaf, Thorus, handlarz Scatty i szef my�liwych Fletcher.
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_06"); //Dobra. Zabieram si� do roboty.
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_07"); //Poczekaj chwil�.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_08"); //Na tej kartce zapisa�em swoje towary, oni niech r�wnie� si� tu dopisz�.
    AI_Output (self, other ,"DIA_Addon_Fisk_WannaEarnSomeMoney_03_09"); //I niech si� podpisz�. B�dzie wiadomo p�niej co komu rozda�.
    AI_Output (other, self ,"DIA_Addon_Fisk_WannaEarnSomeMoney_15_10"); //Nied�ugo wr�c� z list�.
	Npc_ExchangeRoutine  (self,"START");

    MIS_List_of_Goods = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_List_of_Goods, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_List_of_Goods, LOG_RUNNING);
    B_LogEntry                     (TOPIC_List_of_Goods,"Fisk zleci� mi abym przeszed� si� po obozie i spisa� list� towar�w, kt�rych potrzebuj�. S� to Huno, Snaf, Thorus, Scatty i Fletcher. D�ugo mi to nie zajmie.");
};

//========================================
//-----------------> GotYourList
//========================================

INSTANCE DIA_Addon_Fisk_GotYourList (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_GotYourList_Condition;
   information  = DIA_Addon_Fisk_GotYourList_Info;
   permanent	= FALSE;
   description	= "Mam twoj� list�.";
};

FUNC INT DIA_Addon_Fisk_GotYourList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Scatty_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Thorus_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Snaf_BroughtList))
    && (Npc_KnowsInfo (other, DIA_Addon_Huno_BroughtList))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_GotYourList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_01"); //Mam twoj� list�.
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_02"); //�wietnie! Niech no na ni� spojrz�...
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_03"); //Hmm...
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_04"); //Piraci to za�atwi�.
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_05"); //Co z nagrod�?
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_06"); //A teraz id� do Toma.
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_07"); //Ale...
    AI_Output (self, other ,"DIA_Addon_Fisk_GotYourList_03_08"); //Id�, id�. Op�aci ci si�.
    AI_Output (other, self ,"DIA_Addon_Fisk_GotYourList_15_09"); //Jasne.
    B_LogEntry                     (TOPIC_List_of_Goods,"Teraz Fisk odsy�a mnie do Toma. Jestem bardzo ciekaw tej nagrody...");
    CreateInvItems (self, ItWr_ListOfGoods, 1);
    B_GiveInvItems (self, other, ItWr_ListOfGoods, 1);
};

//========================================
//-----------------> DeliveredTheList
//========================================

INSTANCE DIA_Addon_Fisk_DeliveredTheList (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_DeliveredTheList_Condition;
   information  = DIA_Addon_Fisk_DeliveredTheList_Info;
   permanent	= FALSE;
   description	= "Zanios�em list� Tomowi. M�wi�, �e ju� jutro b�dzie.";
};

FUNC INT DIA_Addon_Fisk_DeliveredTheList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_IHaveTheList))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_DeliveredTheList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_DeliveredTheList_15_01"); //Zanios�em list� Tomowi. M�wi�, �e ju� jutro b�dzie.
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_02"); //Znakomicie. Tom to obrotny cz�owiek. Da sobie rad�.
    AI_Output (other, self ,"DIA_Addon_Fisk_DeliveredTheList_15_03"); //A co do wynagrodzenia...
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_04"); //Widz� do czego zmierzasz.
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_05"); //Gdy wr�ci Tom, dostan� swoje rzeczy. W�r�d nich b�dzie pewna bro�.
    AI_Output (self, other ,"DIA_Addon_Fisk_DeliveredTheList_03_06"); //Dostaniesz j�. Pasuje?
    AI_Output (other, self ,"DIA_Addon_Fisk_DeliveredTheList_15_07"); //No pewnie. Do jutra.
    B_LogEntry                     (TOPIC_List_of_Goods,"Sprawa za�atwiona. Tom wyruszy� do pirat�w i zapewne jutro wr�ci. A wraz z nim moja nowiutka bro�. Ten handel jest bardzo korzystny. Mam nadziej�, �e bandyci tego nie zrujnuj�.");
    Log_SetTopicStatus       (TOPIC_List_of_Goods, LOG_SUCCESS);
    MIS_List_of_Goods = LOG_SUCCESS;
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Fisk_PackageForYou (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_PackageForYou_Condition;
   information  = DIA_Addon_Fisk_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Zobacz co mam. Paczka od Toma.";
};

FUNC INT DIA_Addon_Fisk_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_PackageForYou_15_01"); //Zobacz co mam. Paczka od Toma.
    AI_Output (self, other ,"DIA_Addon_Fisk_PackageForYou_03_02"); //Widzisz. Uda�o mu si�.
    AI_Output (other, self ,"DIA_Addon_Fisk_PackageForYou_15_03"); //A moja nagroda?
    AI_Output (self, other ,"DIA_Addon_Fisk_PackageForYou_03_04"); //We� ten miecz. Bardzo ci si� przyda.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Fisk by� zadowolony. Otrzyma�em od niego tak�e swoj� nagrod�. Ten miecz bardzo mi si� przyda.");
    B_GiveInvItems (other, self, ItMi_Packet_Fisk, 1);
	Npc_RemoveInvItems (self, ItMi_Packet_Fisk,1);
    CreateInvItems (self, ItMw_Schwert1, 1);
    B_GiveInvItems (self, other, ItMw_Schwert1, 1);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Fisk_Hello (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 1;
   condition    = DIA_Addon_Fisk_Hello_Condition;
   information  = DIA_Addon_Fisk_Hello_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Fisk_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Fisk_Hello_Info()
{
    AI_Output (self, other ,"DIA_Addon_Fisk_Hello_03_01"); //Witaj nieznajomy, nazywam si� Fisk. Je�li czego� potrzebujesz zajrzyj do mnie.
    AI_Output (other, self ,"DIA_Addon_Fisk_Hello_15_02"); //Jestem Vinc. Gdy tylko zajdzie taka potrzeba trafi� do ciebie.
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Addon_Fisk_Trade (C_INFO)
{
   npc          = BDT_1097_Addon_Fisk;
   nr           = 2;
   condition    = DIA_Addon_Fisk_Trade_Condition;
   information  = DIA_Addon_Fisk_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Poka� swoje towary.";
};

FUNC INT DIA_Addon_Fisk_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fisk_Trade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fisk_Trade_15_01"); //Poka� swoje towary.
    AI_Output (self, other ,"DIA_Addon_Fisk_Trade_03_02"); //Pewnie.
    B_GiveTradeInv (self);
};

