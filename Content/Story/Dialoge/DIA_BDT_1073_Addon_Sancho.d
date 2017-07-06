//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Sancho_EXIT(C_INFO)
{
	npc             = BDT_1073_Addon_Sancho;
	nr              = 999;
	condition	= DIA_Sancho_EXIT_Condition;
	information	= DIA_Sancho_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Sancho_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Sancho_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> Plan
//========================================

INSTANCE DIA_Addon_Sancho_Plan (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 1;
   condition    = DIA_Addon_Sancho_Plan_Condition;
   information  = DIA_Addon_Sancho_Plan_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Sancho_Plan_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    && (Npc_KnowsInfo (other, DIA_Addon_Carlos_ExplainThePlan))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_Plan_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_01"); //S�uchaj. Ty i Senyan b�dziecie os�ania� nas, a p�niej pilnowa� wi�ni�w. Jakie� pytania?
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_02"); //Nie, �adnych. Piwka?

    Info_ClearChoices		(DIA_Addon_Sancho_Plan);
    Info_AddChoice		(DIA_Addon_Sancho_Plan, "Nie, dzi�ki.", DIA_Addon_Sancho_Plan_NoThanks);
    Info_AddChoice		(DIA_Addon_Sancho_Plan, "Z ch�ci�.", DIA_Addon_Sancho_Plan_Sure);
};

FUNC VOID DIA_Addon_Sancho_Plan_NoThanks()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_NoThanks_15_01"); //Nie, dzi�ki.
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_NoThanks_03_02"); //A ja bardzo ch�tnie.
    CreateInvItems (self, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_03"); //Opowiem ci co masz robi�.
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_04"); //M�w.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_05"); //Ty i Senyan os�aniacie nas, a po udanej transakcji pilnujecie niewolnik�w. Pytania?
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_06"); //Nie.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_07"); //�wietnie.
    Info_ClearChoices		(DIA_Addon_Sancho_Plan);
};

FUNC VOID DIA_Addon_Sancho_Plan_Sure()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_Sure_15_01"); //Z ch�ci�.
    CreateInvItems (self, ItFo_Beer, 1);
    CreateInvItems (other, ItFo_Beer, 1);
    B_UseItem (self, ItFo_Beer);
    B_UseItem (other, ItFo_Beer);
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_03"); //Opowiem ci co masz robi�.
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_04"); //M�w.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_05"); //Ty i Senyan os�aniacie nas, a po udanej transakcji pilnujecie niewolnik�w. Pytania?
    AI_Output (self, other ,"DIA_Addon_Sancho_Plan_03_06"); //Nie.
    AI_Output (other, self ,"DIA_Addon_Sancho_Plan_15_07"); //�wietnie.
    Info_ClearChoices		(DIA_Addon_Sancho_Plan);
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Sancho_WheresArvo (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 1;
   condition    = DIA_Addon_Sancho_WheresArvo_Condition;
   information  = DIA_Addon_Sancho_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Widzia�e� Arvo?";
};

FUNC INT DIA_Addon_Sancho_WheresArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Kyrrus_WheresArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WheresArvo_15_01"); //Widzia�e� Arvo?
    AI_Output (self, other ,"DIA_Addon_Sancho_WheresArvo_03_02"); //Nie. Odk�d tu stoj� ani razu go nie widzia�em.
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Addon_Sancho_WhoAreYou (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 1;
   condition    = DIA_Addon_Sancho_WhoAreYou_Condition;
   information  = DIA_Addon_Sancho_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Witaj, kim jeste�?";
};

FUNC INT DIA_Addon_Sancho_WhoAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Sancho_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WhoAreYou_15_01"); //Witaj, kim jeste�?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_02"); //Sancho, a ty?
    AI_Output (other, self ,"DIA_Addon_Sancho_WhoAreYou_15_03"); //Jestem Vinc.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_04"); //Mi�o pozna�. Aktualnie pilnuj� rzeczy z tego magazynu, ale lepsze to ni� pi�owanie desek lub walenie m�otkiem.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_05"); //Chc� popracowa� tutaj i dosta� si� do kopalni z�ota.
    AI_Output (other, self ,"DIA_Addon_Sancho_WhoAreYou_15_06"); //Emm, z�ota?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_07"); //Nie pr�buj si� ze mn� droczy�. Te� chcesz tam i�� i zdoby� par� samorodk�w.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhoAreYou_03_08"); //Ale dop�ki nie wejdziemy wy�ej, to o z�ocie mo�emy co najwy�ej pomarzy�.
};

//========================================
//-----------------> WhyAreYouHere
//========================================

INSTANCE DIA_Addon_Sancho_WhyAreYouHere (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 2;
   condition    = DIA_Addon_Sancho_WhyAreYouHere_Condition;
   information  = DIA_Addon_Sancho_WhyAreYouHere_Info;
   permanent	= FALSE;
   description	= "Za co ci� skazano?";
};

FUNC INT DIA_Addon_Sancho_WhyAreYouHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Sancho_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_WhyAreYouHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WhyAreYouHere_15_01"); //Za co ci� skazano?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_02"); //A co tu du�o m�wi�, pracowa�em na statku. P�ywa�em od kontynentu do Khorinis i z powrotem.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_03"); //A� pewnego dnia po paru piwach kolega nam�wi� mnie do pewnego oszustwa.
    AI_Output (other, self ,"DIA_Addon_Sancho_WhyAreYouHere_15_04"); //Jakiego oszustwa?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_05"); //Chcieli�my ukry� pewien worek rudy przed �o�nierzami, a p�niej mieli�my to sprzeda� z zyskiem.
    AI_Output (self, other ,"DIA_Addon_Sancho_WhyAreYouHere_03_06"); //Ale nie uda�o si� nam. Oto ca�a moja historia.
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Sancho_HowAreYou (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 3;
   condition    = DIA_Addon_Sancho_HowAreYou_Condition;
   information  = DIA_Addon_Sancho_HowAreYou_Info;
   permanent	= FALSE;
   description	= "Co tam?";
};

FUNC INT DIA_Addon_Sancho_HowAreYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Sancho_WhoAreYou))
    && (KAPITEL != 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_HowAreYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_HowAreYou_15_01"); //Co tam?
    AI_Output (self, other ,"DIA_Addon_Sancho_HowAreYou_03_02"); //Jestem prawie pewien, �e ju� nied�ugo Fletcher powie: Sancho zas�ugujesz na wej�cie do obozu.
    AI_Output (other, self ,"DIA_Addon_Sancho_HowAreYou_15_03"); //Powodzenia!
};

//========================================
//-----------------> FletcherDead
//========================================

INSTANCE DIA_Addon_Sancho_FletcherDead (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 4;
   condition    = DIA_Addon_Sancho_FletcherDead_Condition;
   information  = DIA_Addon_Sancho_FletcherDead_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Sancho_FletcherDead_Condition()
{
    if (KAPITEL == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_FletcherDead_Info()
{
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_01"); //Niech to diabli! Franko zabi� Fletchera. Dodatkowo powiedzia�, �e nic nie robi�em. I od teraz mam pilnowa�, aby nikt ''niepowo�any'' nie wszed� do obozu.
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_02"); //Rozumiesz? Mam wykrywa� szpieg�w!
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_03"); //Jakby na tym ko�cu �wiata kto� wiedzia� o naszej obecno�ci tutaj.
    AI_Output (other, self ,"DIA_Addon_Sancho_FletcherDead_15_04"); //Szkoda Fletchera.
    AI_Output (self, other ,"DIA_Addon_Sancho_FletcherDead_03_05"); //By� dobrym szefem� Cholera, lepiej id� ju�. Lepiej �eby Franko nie widzia�, �e nie wype�niam jego ''zadania''.
};

//========================================
//-----------------> WhatIsIt
//========================================

INSTANCE DIA_Addon_Sancho_WhatIsIt (C_INFO)
{
   npc          = BDT_1073_Addon_Sancho;
   nr           = 5;
   condition    = DIA_Addon_Sancho_WhatIsIt_Condition;
   information  = DIA_Addon_Sancho_WhatIsIt_Info;
   permanent	= TRUE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Addon_Sancho_WhatIsIt_Condition()
{
    if (KAPITEL == 3)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Sancho_WhatIsIt_Info()
{
    AI_Output (other, self ,"DIA_Addon_Sancho_WhatIsIt_15_01"); //Co s�ycha�?
    AI_Output (self, other ,"DIA_Addon_Sancho_WhatIsIt_03_02"); //Sam widzisz. Nudy jak cholera.
};

