//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Esker_EXIT(C_INFO)
{
	npc             = BDT_1077_Esker;
	nr              = 999;
	condition	= DIA_Esker_EXIT_Condition;
	information	= DIA_Esker_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Esker_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Esker_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatDoYouWant
//========================================

INSTANCE DIA_Esker_WhatDoYouWant (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_WhatDoYouWant_Condition;
   information  = DIA_Esker_WhatDoYouWant_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Esker_WhatDoYouWant_Condition()
{
    if (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WhatDoYouWant_Info()
{
    AI_Output (self, other ,"DIA_Esker_WhatDoYouWant_03_01"); //Czego chcesz?
    AI_Output (other, self ,"DIA_Esker_WhatDoYouWant_15_02"); //Nic. Chcia�em pogada�. 
    AI_Output (self, other ,"DIA_Esker_WhatDoYouWant_03_03"); //Jestem Esker. Jak widzisz, nie mam nic do roboty.
    AI_Output (self, other ,"DIA_Esker_WhatDoYouWant_03_04"); //By� mo�e Fletcher nied�ugo da mi jakie� zadanie.
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Esker_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 2;
   condition    = DIA_Esker_WhereAreYouFrom_Condition;
   information  = DIA_Esker_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk�d jeste�?";
};

FUNC INT DIA_Esker_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Esker_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_01"); //Sk�d jeste�?
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_02"); //Ka�dy mnie ju� chyba o to zapyta�. Pochodz� z jednej z wysp Wschodniego Archipelagu.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_03"); //Mia�em wyl�dowa� w kolonii, ale na m�j konw�j napad�a inna grupa bandyt�w.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_04"); //Mia�em szcz�cie. Ta banda musia�a pomyli� konwoje. Zdo�a�em uciec.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_05"); //�wietnie walcz� mieczem i da�em sobie rad�. A po jaki� trzech miesi�cach upad�a bariera.
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_06"); //I co by�o dalej?
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_07"); //Nale�a�em ju� wtedy do bandyt�w. Znaczy do niewielkiej grupki.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_08"); //Gdy wraca�em z polowania widzia�em, jak zostali zabici przez stra�.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_09"); //P�niej spotka�em Fletchera i cz�� tej grupki. I tak oto wyl�dowa�em tutaj.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_10"); //A ty? To ty jeste� ten morderca �o�nierzy?
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_11"); //Tak, to ja. Chocia� nie wiem, co mnie do tego sk�oni�o.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_12"); //Czasami jedna chwila zmienia �ycie. Wiesz dlaczego mnie aresztowano?
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_13"); //Pewnej nocy us�ysza�em o nielegalnych walkach. Nawet nie zacz�a si� moja walka, gdy wpad�o wojsko i aresztowa�o wszystkich. 
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_14"); //Ka�dy bandyta to inna historia. 
    AI_Output (other, self ,"DIA_Esker_WhereAreYouFrom_15_15"); //Trudno si� nie zgodzi�.
    AI_Output (self, other ,"DIA_Esker_WhereAreYouFrom_03_16"); //Dam ci rad�. Nie ka�dy z nas jest taki ''mi�y''. Pami�taj, �e komu� mo�e nie spodoba� si� twoja g�ba. Miej si� na baczno�ci.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Esker_WhatsUp (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_WhatsUp_Condition;
   information  = DIA_Esker_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co s�ycha�?";
};

FUNC INT DIA_Esker_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Esker_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Esker_WhatsUp_15_01"); //Co s�ycha�?
    if (KAPITEL >= 3)
    {
        AI_Output (self, other ,"DIA_Esker_WhatsUp_03_02"); //Franko przej�� stery po Fletcherze. Lepiej uwa�aj.
    }
    else
    {
        AI_Output (self, other ,"DIA_Esker_WhatsUp_03_03"); //Wszystko po staremu.
    };
};

//========================================
//-----------------> CanYouTeachMe
//========================================

INSTANCE DIA_Esker_CanYouTeachMe (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_CanYouTeachMe_Condition;
   information  = DIA_Esker_CanYouTeachMe_Info;
   permanent	= FALSE;
   description	= "Mo�esz mnie pouczy� walki?";
};

FUNC INT DIA_Esker_CanYouTeachMe_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Esker_WhatDoYouWant))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_CanYouTeachMe_Info()
{
    AI_Output (other, self ,"DIA_Esker_CanYouTeachMe_15_01"); //Mo�esz mnie pouczy� walki?
    AI_Output (self, other ,"DIA_Esker_CanYouTeachMe_03_02"); //Pewnie. Walka broni� jednor�czn� to jedna z najlepszych sztuk.
    AI_Output (self, other ,"DIA_Esker_CanYouTeachMe_03_03"); //Warto mie� przewag� szybko�ci nad przeciwnikiem.
    AI_Output (self, other ,"DIA_Esker_CanYouTeachMe_03_04"); //Przychod� kiedy chcesz.
	EskerTeach1H = TRUE;
};

INSTANCE DIA_Esker_Teach(C_INFO)
{
	npc			= BDT_1077_Esker;
	nr			= 7;
	condition	= DIA_Esker_Teach_Condition;
	information	= DIA_Esker_Teach_Info;
	permanent	= TRUE;
	description = "Zacznijmy trening.";
};                       

FUNC INT DIA_Esker_Teach_Condition()
{
	if (EskerTeach1H == TRUE)
	{
		return TRUE;
	};	
};
 
FUNC VOID DIA_Esker_Teach_Info()
{	
	AI_Output (other,self ,"DIA_Esker_Teach_15_00"); //Zacznijmy trening.		
	Info_ClearChoices 	(DIA_Esker_Teach);
	Info_AddChoice 		(DIA_Esker_Teach,	DIALOG_BACK		,DIA_Esker_Teach_Back);
	Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Esker_Teach_1H_1);
	Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Esker_Teach_1H_5);
};

FUNC VOID DIA_Esker_Teach_Back ()
{
	Info_ClearChoices (DIA_Esker_Teach);
};

var int EskerOneTime;

FUNC VOID DIA_Esker_Teach_1H_1 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 1, 75)
	{
		if ((Npc_GetTalentSkill (other, NPC_TALENT_1H) == 1) && (EskerOneTime != 1))
		{
			AI_Output (self, other ,"DIA_Esker_Teach_03_01"); //Czas nabra� wprawy we w�adaniu takim or�em.
			AI_Output (self, other ,"DIA_Esker_Teach_03_02"); //Rozstaw stopy szeroko, bro� trzymaj u boku, ostrzem do g�ry.
			AI_Output (self, other ,"DIA_Esker_Teach_03_03"); //Musisz nauczy� si� zgra� twoje ruchy z bezw�adno�ci� or�a.
			AI_Output (self, other ,"DIA_Esker_Teach_03_04"); //Dzi�ki temu twoje ruchy b�d� szybsze i bardziej zaskocz� przeciwnika.
			AI_Output (self, other ,"DIA_Esker_Teach_03_04"); //A i jeszcze co�. Podczas walki zauwa�ysz, �e twoje ataki spowoduj� wi�ksze obra�enia ni� zwykle. Oczywi�cie wraz z nauk� takie ataki b�d� zdarza� si� cz�ciej.
			EskerOneTime = 1;
		};
		Info_ClearChoices 	(DIA_Esker_Teach);
		Info_AddChoice 		(DIA_Esker_Teach,	DIALOG_BACK		,DIA_Esker_Teach_Back);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Esker_Teach_1H_1);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Esker_Teach_1H_5);
	};
};
FUNC VOID DIA_Esker_Teach_1H_5 ()
{
	if B_TeachFightTalentPercent (self, other, NPC_TALENT_1H, 5, 75)
	{
		Info_ClearChoices 	(DIA_Esker_Teach);
		Info_AddChoice 		(DIA_Esker_Teach,	DIALOG_BACK		,DIA_Esker_Teach_Back);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h1	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 1))			,DIA_Esker_Teach_1H_1);
		Info_AddChoice		(DIA_Esker_Teach, B_BuildLearnString(PRINT_Learn1h5	, B_GetLearnCostTalent(other, NPC_TALENT_1H, 5))			,DIA_Esker_Teach_1H_5);
	};	
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Esker_WheresArvo (C_INFO)
{
   npc          = BDT_1077_Esker;
   nr           = 1;
   condition    = DIA_Esker_WheresArvo_Condition;
   information  = DIA_Esker_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Widzia�e� Arvo?";
};

FUNC INT DIA_Esker_WheresArvo_Condition()
{
    if (MIS_Arvo == LOG_SUCCESS)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Esker_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Esker_WheresArvo_15_01"); //Widzia�e� Arvo?
    AI_Output (self, other ,"DIA_Esker_WheresArvo_03_02"); //Nie. Spytaj kogo� innego.
};

