//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Huno_EXIT(C_INFO)
{
	npc             = BDT_1099_Addon_Huno;
	nr              = 999;
	condition	= DIA_Addon_Huno_EXIT_Condition;
	information	= DIA_Addon_Huno_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Huno_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Huno_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//----------------------------------------------------------------------
//	Info Trade
//----------------------------------------------------------------------
INSTANCE DIA_Addon_Huno_Trade  (C_INFO)
{
	npc         = BDT_1099_Addon_Huno;
	nr          = 888;
	condition   = DIA_Addon_Huno_Trade_Condition;
	information = DIA_Addon_Huno_Trade_Info;
	permanent   = TRUE;
	trade		= TRUE;
	description = DIALOG_TRADE;
};
FUNC INT DIA_Addon_Huno_Trade_Condition()
{		
	return TRUE;
};
FUNC VOID DIA_Addon_Huno_Trade_Info()
{	
	AI_Output (other, self ,"DIA_Addon_Huno_Trade_15_01"); //Poka� mi, co masz.
	B_GiveTradeInv(self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Huno_BroughtList (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_BroughtList_Condition;
   information  = DIA_Addon_Huno_BroughtList_Info;
   permanent	= FALSE;
   description	= "Przychodz� z list� od Fiska. Prosi�, aby� si� w niej podpisa�.";
};

FUNC INT DIA_Addon_Huno_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_BroughtList_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_BroughtList_15_01"); //Przychodz� z list� od Fiska. Prosi�, aby� si� w niej podpisa�.
    AI_Output (self, other ,"DIA_Addon_Huno_BroughtList_03_02"); //�wietnie. Daj mi j� tutaj.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Huno_BroughtList_03_03"); //Prosz�. To mi si� przyda.
    AI_Output (other, self ,"DIA_Addon_Huno_BroughtList_15_04"); //Nie przeszkadzam.
    AI_Output (self, other ,"DIA_Addon_Huno_BroughtList_03_05"); //Do zobaczenia.
    B_LogEntry                     (TOPIC_List_of_Goods,"Huno wpisa� si� do listy.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Huno_PackageForYou (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_PackageForYou_Condition;
   information  = DIA_Addon_Huno_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Pr�ty prosto od pirat�w.";
};

FUNC INT DIA_Addon_Huno_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Huno) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_PackageForYou_15_01"); //Pr�ty prosto od pirat�w.
    AI_Output (self, other ,"DIA_Addon_Huno_PackageForYou_03_02"); //Mam nadziej�, �e to wystarczy. W przeciwnym razie Tom znowu b�dzie musia� to za�atwi�.
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Huno nie podzi�kowa� i zmartwi� si� czy, aby na pewno wystarczy mu pr�t�w.");
    B_GiveInvItems (other, self, ItMi_Packet_Huno, 1);
	Npc_RemoveInvItems (self, ItMi_Packet_Huno,1);
};

//========================================
//-----------------> NeedBetterArmour
//========================================

INSTANCE DIA_Addon_Huno_NeedBetterArmour (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_NeedBetterArmour_Condition;
   information  = DIA_Addon_Huno_NeedBetterArmour_Info;
   permanent	= FALSE;
   description	= "Przychodz� po lepszy pancerz.";
};

FUNC INT DIA_Addon_Huno_NeedBetterArmour_Condition()
{
    if (GetNewArmour == TRUE)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_NeedBetterArmour_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_NeedBetterArmour_15_01"); //Przychodz� po lepszy pancerz.
    AI_Output (self, other ,"DIA_Addon_Huno_NeedBetterArmour_03_02"); //To ci� b�dzie kosztowa�...
    AI_Output (other, self ,"DIA_Addon_Huno_NeedBetterArmour_15_03"); //Przysy�a mnie Fletcher.
    AI_Output (self, other ,"DIA_Addon_Huno_NeedBetterArmour_03_04"); //Czy�by? W takim razie zap�a� mi 500 sztuk z�ota i masz pancerz.
};

//========================================
//-----------------> GoldForArmour
//========================================

INSTANCE DIA_Addon_Huno_GoldForArmour (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 2;
   condition    = DIA_Addon_Huno_GoldForArmour_Condition;
   information  = DIA_Addon_Huno_GoldForArmour_Info;
   permanent	= FALSE;
   description	= "Oto z�oto.";
};

FUNC INT DIA_Addon_Huno_GoldForArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_NeedBetterArmour))
    && (Npc_HasItems (other, ItMi_Gold) >=500)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_GoldForArmour_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_GoldForArmour_15_01"); //Oto z�oto.
    AI_Output (self, other ,"DIA_Addon_Huno_GoldForArmour_03_02"); //Trzymaj. Co prawda te pancerze nosi�y te gnidy z Nowego Obozu, ale to ju� przesz�o��.
    AI_Output (self, other ,"DIA_Addon_Huno_GoldForArmour_03_03"); //Zreszt� nie mam nawet plan�w pancerzy Starego Obozu...
    AI_Output (other, self ,"DIA_Addon_Huno_GoldForArmour_15_04"); //Do zobaczenia.
	Wld_InsertNpc (BDT_1090_Addon_Raven ,"BL_MINE_RAVEN");
    B_GiveInvItems (other, self, ItMi_Gold, 500);
    CreateInvItems (other, ITAR_BDT_H, 1);
    B_LogEntry                     (TOPIC_Better_Armour,"Kupi�em pancerz od Huno. Czas zacz�� prace u tego Kruka i jego jak�e mi�ego s�ugi Bloodwyna.");
    Log_SetTopicStatus       (TOPIC_Better_Armour, LOG_SUCCESS);
    MIS_Better_Armour = LOG_SUCCESS;
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Huno_Hello (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_Hello_Condition;
   information  = DIA_Addon_Huno_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj kowalu.";
};

FUNC INT DIA_Addon_Huno_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Huno_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_Hello_15_01"); //Witaj kowalu.
    AI_Output (self, other ,"DIA_Addon_Huno_Hello_03_02"); //Hmm, witaj. Jestem Huno. Mo�e i bym pogada�, ale zaj�ty jestem.
    AI_Output (other, self ,"DIA_Addon_Huno_Hello_15_03"); //Jestem Vinc. Nie b�d� przeszkadza�.
    AI_Output (self, other ,"DIA_Addon_Huno_Hello_03_04"); //Masz racj�, bo naprawiam i wytwarzam przedmioty potrzebne do obozu.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Huno_WhatsUp (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 2;
   condition    = DIA_Addon_Huno_WhatsUp_Condition;
   information  = DIA_Addon_Huno_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Addon_Huno_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_WhatsUp_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Addon_Huno_WhatsUp_03_02"); //Widzisz jak jest. Miecz, top�r, kilof � wszystko wymaga naostrzenia lub ponownego przekucia.
};

//========================================
//-----------------> NeedAPickaxe
//========================================

INSTANCE DIA_Addon_Huno_NeedAPickaxe (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 1;
   condition    = DIA_Addon_Huno_NeedAPickaxe_Condition;
   information  = DIA_Addon_Huno_NeedAPickaxe_Info;
   permanent	= FALSE;
   description	= "Potrzebuj� kilofa. Masz jaki� na stanie?";
};

FUNC INT DIA_Addon_Huno_NeedAPickaxe_Condition()
{
    if (MIS_Move_up_the_Hierarchy == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_NeedAPickaxe_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_NeedAPickaxe_15_01"); //Potrzebuj� kilofa. Masz jaki� na stanie?
    AI_Output (self, other ,"DIA_Addon_Huno_NeedAPickaxe_03_02"); //Co za dziwne pytanie. Pewnie, �e mam. 50 sztuk z�ota i jest tw�j.
};

//========================================
//-----------------> HeresTheGold
//========================================

INSTANCE DIA_Addon_Huno_HeresTheGold (C_INFO)
{
   npc          = BDT_1099_Addon_Huno;
   nr           = 2;
   condition    = DIA_Addon_Huno_HeresTheGold_Condition;
   information  = DIA_Addon_Huno_HeresTheGold_Info;
   permanent	= FALSE;
   description	= "Bierz to z�oto.";
};

FUNC INT DIA_Addon_Huno_HeresTheGold_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Huno_NeedAPickaxe))
    && (Npc_HasItems (other, ItMi_Gold) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Huno_HeresTheGold_Info()
{
    AI_Output (other, self ,"DIA_Addon_Huno_HeresTheGold_15_01"); //Bierz to z�oto.
    AI_Output (self, other ,"DIA_Addon_Huno_HeresTheGold_03_02"); //A oto i nowiutki kilof. Niech ci s�u�y.
    B_GiveInvItems (other, self, ItMi_Gold, 50);
    CreateInvItems (self, ItMw_2H_Axe_L_01, 1);
    B_GiveInvItems (self, other, ItMw_2H_Axe_L_01, 1);
};

