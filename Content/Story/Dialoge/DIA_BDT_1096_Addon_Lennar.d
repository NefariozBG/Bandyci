//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Lennar_Hello (C_INFO)
{
   npc          = BDT_1096_Addon_Lennar;
   nr           = 1;
   condition    = DIA_Addon_Lennar_Hello_Condition;
   information  = DIA_Addon_Lennar_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_Addon_Lennar_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Lennar_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Lennar_Hello_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Addon_Lennar_Hello_03_02"); //Witaj. Nie mam teraz czasu, bo kopi� z�oto.
    AI_Output (other, self ,"DIA_Addon_Lennar_Hello_15_03"); //Dasz mi jak�� rad�?
    AI_Output (self, other ,"DIA_Addon_Lennar_Hello_03_04"); //Pewnie. Maj�c kilof w r�ku zastan�w si�, w kt�rym miejscu b�dziesz kopa� zanim w nie uderzysz.
    AI_Output (self, other ,"DIA_Addon_Lennar_Hello_03_05"); //Podstawa pracy to dobra organizacja, zapami�taj to.
    B_Upgrade_Hero_HackChance (5);
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NotNow
//========================================

INSTANCE DIA_Addon_Lennar_NotNow (C_INFO)
{
   npc          = BDT_1096_Addon_Lennar;
   nr           = 2;
   condition    = DIA_Addon_Lennar_NotNow_Condition;
   information  = DIA_Addon_Lennar_NotNow_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Lennar_NotNow_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Lennar_Hello))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Lennar_NotNow_Info()
{
    AI_Output (self, other ,"DIA_Addon_Lennar_NotNow_03_01"); //Nie teraz, zaj�ty jestem.
    AI_StopProcessInfos	(self);
};

