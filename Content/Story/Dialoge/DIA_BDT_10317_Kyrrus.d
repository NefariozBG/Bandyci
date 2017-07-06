//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Kyrrus_EXIT(C_INFO)
{
	npc             = BDT_10317_Kyrrus;
	nr              = 999;
	condition	= DIA_Kyrrus_EXIT_Condition;
	information	= DIA_Kyrrus_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Kyrrus_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Kyrrus_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Kyrrus_WhoAreYou (C_INFO)
{
   npc          = BDT_10317_Kyrrus;
   nr           = 1;
   condition    = DIA_Kyrrus_WhoAreYou_Condition;
   information  = DIA_Kyrrus_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Kyrrus_WhoAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Kyrrus_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Kyrrus_WhoAreYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Kyrrus_WhoAreYou_03_02"); //Nowy, co? Jestem Kyrrus. Zajmuj� si� tu gotowaniem. Chocia� profesjonalnym kucharzem nie jestem.
    AI_Output (self, other ,"DIA_Kyrrus_WhoAreYou_03_03"); //Ale oczywi�cie to co ugotuj� jest zjadliwe i nikt jeszcze nie marudzi�.
    AI_Output (other, self ,"DIA_Kyrrus_WhoAreYou_15_04"); //Rozumiem. Ja jestem Vinc. 
    AI_Output (self, other ,"DIA_Kyrrus_WhoAreYou_03_05"); //Jasne, Vinc. G�odny?
    AI_Output (other, self ,"DIA_Kyrrus_WhoAreYou_15_06"); //Pewnie.
    AI_Output (self, other ,"DIA_Kyrrus_WhoAreYou_03_07"); //Masz tutaj kawa�ek chleba i gulasz. 
    AI_Output (other, self ,"DIA_Kyrrus_WhoAreYou_15_08"); //Dzi�ki.
    CreateInvItems (self, ItFo_Bread, 1);
    B_GiveInvItems (self, other, ItFo_Bread, 1);
    CreateInvItems (self, ItFo_Stew, 1);
    B_GiveInvItems (self, other, ItFo_Stew, 1);
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Kyrrus_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_10317_Kyrrus;
   nr           = 2;
   condition    = DIA_Kyrrus_WhereAreYouFrom_Condition;
   information  = DIA_Kyrrus_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk�d pochodzisz?";
};

FUNC INT DIA_Kyrrus_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Kyrrus_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyrrus_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Kyrrus_WhereAreYouFrom_15_01"); //Sk�d pochodzisz?
    AI_Output (self, other ,"DIA_Kyrrus_WhereAreYouFrom_03_02"); //Z niewielkiej wysepki Kyrus.
    AI_Output (other, self ,"DIA_Kyrrus_WhereAreYouFrom_15_03"); //Masz imi� podobne do nazwy wyspy.
    AI_Output (self, other ,"DIA_Kyrrus_WhereAreYouFrom_03_04"); //Ojciec mi je nada�. Nigdy nie dowiedzia�em si� dlaczego. 
    AI_Output (self, other ,"DIA_Kyrrus_WhereAreYouFrom_03_05"); //A je�li chodzi o to za co tu jestem, to ju� t�umacz�. Nie zap�aci�em podatku. Wyl�dowa�em w kolonii. No i tyle tego by�o.
    AI_Output (other, self ,"DIA_Kyrrus_WhereAreYouFrom_15_06"); //Ja jestem z Khorinis. Ale nie wyl�dowa�em w kolonii. Skazali mnie za...
    AI_Output (self, other ,"DIA_Kyrrus_WhereAreYouFrom_03_07"); //Daj sobie spok�j. Szczerze mam gdzie� dlaczego ciebie skazali. I tak jedziemy na tym samym wozie.
    AI_Output (other, self ,"DIA_Kyrrus_WhereAreYouFrom_15_08"); //Racja. Do zobaczenia.
    AI_Output (self, other ,"DIA_Kyrrus_WhereAreYouFrom_03_09"); //Trzymaj si� ch�opcze.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Kyrrus_AnyNews (C_INFO)
{
   npc          = BDT_10317_Kyrrus;
   nr           = 3;
   condition    = DIA_Kyrrus_AnyNews_Condition;
   information  = DIA_Kyrrus_AnyNews_Info;
   permanent	= TRUE;
   description	= "Co� nowego?";
};

FUNC INT DIA_Kyrrus_AnyNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Kyrrus_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyrrus_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Kyrrus_AnyNews_15_01"); //Co� nowego?
    if (KAPITEL >= 3)
    {
        AI_Output (self, other ,"DIA_Kyrrus_AnyNews_03_02"); //Lepiej uwa�aj. Franko przej�� tutaj rz�dy.
    }
    else
    {
        AI_Output (self, other ,"DIA_Kyrrus_AnyNews_03_03"); //Nic ciekawego.
    };
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Kyrrus_WheresArvo (C_INFO)
{
   npc          = BDT_10317_Kyrrus;
   nr           = 1;
   condition    = DIA_Kyrrus_WheresArvo_Condition;
   information  = DIA_Kyrrus_WheresArvo_Info;
   permanent	= FALSE;
   description	= "By� tu Arvo?";
};

FUNC INT DIA_Kyrrus_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_RUNNING)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Kyrrus_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Kyrrus_WheresArvo_15_01"); //By� tu Arvo?
    AI_Output (self, other ,"DIA_Kyrrus_WheresArvo_03_02"); //Chyba wyszed� z obozu. Spytaj kogo� dalej.
    B_LogEntry                     (TOPIC_Arvo,"Kyrrus m�wi�, �e Arvo wychodzi� z obozu. Zapytam Miguela i Sancho czy go nie widzieli.");
};

