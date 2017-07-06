//========================================
//-----------------> HowsTheMine
//========================================

INSTANCE DIA_Addon_Emilio_HowsTheMine (C_INFO)
{
   npc          = BDT_10015_Addon_Emilio;
   nr           = 1;
   condition    = DIA_Addon_Emilio_HowsTheMine_Condition;
   information  = DIA_Addon_Emilio_HowsTheMine_Info;
   permanent	= FALSE;
   description	= "Jak idzie kopanie?";
};

FUNC INT DIA_Addon_Emilio_HowsTheMine_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Emilio_HowsTheMine_Info()
{
    AI_Output (other, self ,"DIA_Addon_Emilio_HowsTheMine_15_01"); //Jak idzie kopanie?
    AI_Output (self, other ,"DIA_Addon_Emilio_HowsTheMine_03_02"); //A nie wida�? Jestem zaj�ty i nie mam czasu na pogaw�dki.
    AI_Output (other, self ,"DIA_Addon_Emilio_HowsTheMine_15_03"); //Jaka� rada co do kopania?
    AI_Output (self, other ,"DIA_Addon_Emilio_HowsTheMine_03_04"); //Pewnie. Zacznij kopa� od g�ry do do�u. Tym sposobem wydob�dziesz wi�cej, mniejszym nak�adem si�y.
    AI_Output (other, self ,"DIA_Addon_Emilio_HowsTheMine_15_05"); //Dzi�ki.
    AI_Output (self, other ,"DIA_Addon_Emilio_HowsTheMine_03_06"); //A teraz pozw�l, �e wr�c� do pracy.
	B_Upgrade_Hero_HackChance (10);
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Emilio_GoAway (C_INFO)
{
   npc          = BDT_10015_Addon_Emilio;
   nr           = 2;
   condition    = DIA_Addon_Emilio_GoAway_Condition;
   information  = DIA_Addon_Emilio_GoAway_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Emilio_GoAway_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Emilio_HowsTheMine))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Emilio_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Emilio_GoAway_03_01"); //Nie przeszkadzaj mi! Mo�e p�niej porozmawiamy.
    AI_StopProcessInfos	(self);
};

