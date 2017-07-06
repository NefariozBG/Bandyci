//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Finn_Hello (C_INFO)
{
   npc          = BDT_10004_Addon_Finn;
   nr           = 1;
   condition    = DIA_Addon_Finn_Hello_Condition;
   information  = DIA_Addon_Finn_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_Addon_Finn_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Finn_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_02"); //Witam.
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_03"); //Od razu wida�, �e jeste� profesjonalist�.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_04"); //Racja. Jestem 35 lat w tym zawodzie. Pracowa�em w wielu kopalniach i wykopaliskach.
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_05"); //Dasz mi jak�� rad�?
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_06"); //Pewnie. Czas po�upa� troch� z�ota. Gdy uderzasz, to zdecyduj si� na si��. Czasami mocne uderzenia nic nie daj�, a gdy tak robisz, to szybko si� m�czysz.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_07"); //Pierwsze uderzenia powinny sprawdza� �y�� z�ota. Rada od do�wiadczonego Finna. 
    B_Upgrade_Hero_HackChance (10);
    AI_Output (other, self ,"DIA_Addon_Finn_Hello_15_08"); //Jestem Vinc. Dzi�ki za porad�.
    AI_Output (self, other ,"DIA_Addon_Finn_Hello_03_09"); //Do us�ug.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> NotNow
//========================================

INSTANCE DIA_Addon_Finn_NotNow (C_INFO)
{
   npc          = BDT_10004_Addon_Finn;
   nr           = 2;
   condition    = DIA_Addon_Finn_NotNow_Condition;
   information  = DIA_Addon_Finn_NotNow_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Finn_NotNow_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Finn_Hello))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Finn_NotNow_Info()
{
    AI_Output (self, other ,"DIA_Addon_Finn_NotNow_03_01"); //Jak widzisz mam robot�. Mo�e jak sko�cz� to pogadamy.
    AI_StopProcessInfos	(self);
};

