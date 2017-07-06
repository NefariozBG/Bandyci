var int SnafAngered;

//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Snaf_EXIT(C_INFO)
{
	npc             = BDT_1098_Addon_Snaf;
	nr              = 999;
	condition	= DIA_Addon_Snaf_EXIT_Condition;
	information	= DIA_Addon_Snaf_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Snaf_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Snaf_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> BroughtList
//========================================

INSTANCE DIA_Addon_Snaf_BroughtList (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_BroughtList_Condition;
   information  = DIA_Addon_Snaf_BroughtList_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_BroughtList_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fisk_WannaEarnSomeMoney))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_BroughtList_Info()
{
    AI_Output (self, other ,"DIA_Addon_Snaf_BroughtList_03_01"); //Ju� s�ysza�em o tym. Daj mi t� list�.
    AI_Output (other, self ,"DIA_Addon_Snaf_BroughtList_15_02"); //Dobry z ciebie ober�ysta.
    B_UseFakeScroll ();
    AI_Output (self, other ,"DIA_Addon_Snaf_BroughtList_03_03"); //Dlatego nim jestem.
    B_LogEntry                     (TOPIC_List_of_Goods,"Snaf, jak to on, wiedzia� o moim spacerku z list�. Bez oci�gania si� wpisa� swoje przyprawy.");
};

//========================================
//-----------------> PackageForYou
//========================================

INSTANCE DIA_Addon_Snaf_PackageForYou (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_PackageForYou_Condition;
   information  = DIA_Addon_Snaf_PackageForYou_Info;
   permanent	= FALSE;
   description	= "Patrz co mam.";
};

FUNC INT DIA_Addon_Snaf_PackageForYou_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_GotThePacks))
    && (Npc_HasItems (other, ItMi_Packet_Snaf) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_PackageForYou_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_PackageForYou_15_01"); //Patrz co mam.
    AI_Output (self, other ,"DIA_Addon_Snaf_PackageForYou_03_02"); //Nareszcie! Teraz zrobi� nowe dania. Dzi�ki, kolego.
    B_GiveInvItems (other, self, ItMi_Packet_Snaf, 1);
    B_LogEntry                     (TOPIC_Packs_from_Pirates,"Snaf si� ucieszy� z paczki.");
};

//========================================
//-----------------> ImHungry
//========================================

INSTANCE DIA_Addon_Snaf_ImHungry (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_ImHungry_Condition;
   information  = DIA_Addon_Snaf_ImHungry_Info;
   permanent	= FALSE;
   description	= "Jestem g�odny.";
};

FUNC INT DIA_Addon_Snaf_ImHungry_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Paul_GoToStaf))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_ImHungry_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_01"); //Jestem g�odny.
    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_02"); //Domy�lam si�. Prosz� oto gulasz. Smacznego.

    CreateInvItems (self, ItFo_Stew, 1);
    B_GiveInvItems (self, other, ItFo_Stew, 1);
    B_UseItem (other, ItFo_Stew);

    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_03"); //Od razu lepiej wygl�dasz. Marniejesz w oczach, co� nie tak?
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_04"); //Nie s�ysza�e� o �mierci Fletchera?
    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_05"); //Pewnie, �e s�ysza�em.
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_06"); //To czemu... Aaa... co jest? (zaczyna si� ko�ysa�)
    AI_Output (self, other ,"DIA_Addon_Snaf_ImHungry_03_07"); //Hej, co jest?
	Info_ClearChoices	(DIA_Addon_Snaf_ImHungry);
    Info_AddChoice		(DIA_Addon_Snaf_ImHungry, "S�a.. s�abo si� czuj�.", DIA_Addon_Snaf_ImHungry_Sick);
};

FUNC VOID DIA_Addon_Snaf_ImHungry_Sick()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ImHungry_15_08"); //S�a.. s�abo si� czuj�.
	Info_ClearChoices		(DIA_Addon_Snaf_ImHungry);
    AI_StopProcessInfos	(self);
    I_FadeScreenToBlack(1);
    Npc_SetRefuseTalk (self,5);

    MIS_Illness = LOG_RUNNING;
    Log_CreateTopic            (TOPIC_Illness, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Illness, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Illness,"Cholera, co si� sta�o! Snaf da� mi gulasz po kt�rym omal nie umar�em. Da� mi trucizn�? To jaki� �art? Musz� z nim szczerze porozmawia�.");

    AI_Teleport (other, "BL_INN_UPSIDE_SLEEP_03");
    Npc_ExchangeRoutine (self, "Poisoning");
    AI_Teleport (self, "BL_INN_UP_SIDE_01");
};

//========================================
//-----------------> YouHaveAwaken
//========================================

INSTANCE DIA_Addon_Snaf_YouHaveAwaken (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 2;
   condition    = DIA_Addon_Snaf_YouHaveAwaken_Condition;
   information  = DIA_Addon_Snaf_YouHaveAwaken_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_YouHaveAwaken_Condition()
{
    if (Npc_RefuseTalk(self) == false)
    && (Npc_KnowsInfo (other, DIA_Addon_Snaf_ImHungry))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_YouHaveAwaken_Info()
{
    I_FadeScreenFromBlack(1);
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_01"); //Wsta�e�. A ja my�la�em, �e...
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_02"); //Ty �mieciu, jak mog�e� to zrobi�! I to mi?
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_03"); //Nie mia�em �adnego interesu, by ci� tru�. Przysi�gam.
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_04"); //Nie wierz� ci.
    AI_PlayAni (self, "T_SEARCH");
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_05"); //Uwierz mi.
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_06"); //Czemu si� rozgl�dasz?
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_07"); //Id� do Miguela.
    AI_Output (other, self ,"DIA_Addon_Snaf_YouHaveAwaken_15_08"); //Hej, co si�...
    AI_Output (self, other ,"DIA_Addon_Snaf_YouHaveAwaken_03_09"); //Id� ju�.
	Wld_InsertNpc (BDT_1091_Addon_Lucia ,"BL_INN_05_D");
	Npc_ExchangeRoutine (self, "Start");
    B_LogEntry                     (TOPIC_Illness,"Ta ca�a sprawa �mierdzi na odleg�o��. Mam mocne b�le na ca�ym ciele. Piekielnie boli mnie g�owa, a Snaf nic mi nie chce powiedzie�. Odsy�a mnie teraz do Miguela. Mo�e on mi w czym� pomo�e.");
};

//========================================
//-----------------> ItWasArvo
//========================================

INSTANCE DIA_Addon_Snaf_ItWasArvo (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_ItWasArvo_Condition;
   information  = DIA_Addon_Snaf_ItWasArvo_Info;
   permanent	= FALSE;
   description	= "To by� Arvo. Wiem o wszystkim.";
};

FUNC INT DIA_Addon_Snaf_ItWasArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_WhatHappened))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_ItWasArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_15_01"); //To by� Arvo. Wiem o wszystkim.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_03_02"); //(smutno) Tak, to by� on.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_03_03"); //Wybaczysz mi to? Prosz�...

    Info_ClearChoices		(DIA_Addon_Snaf_ItWasArvo);
    Info_AddChoice		(DIA_Addon_Snaf_ItWasArvo, "Wybaczenie to jedno, a zapomnienie to co innego.", DIA_Addon_Snaf_ItWasArvo_Forgive);
    Info_AddChoice		(DIA_Addon_Snaf_ItWasArvo, "Wybaczenie to nie jest co�, czego nale�y oczekiwa�. ", DIA_Addon_Snaf_ItWasArvo_DontForgive);
};

FUNC VOID DIA_Addon_Snaf_ItWasArvo_Forgive()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_Forgive_15_01"); //Wybaczenie to jedno, a zapomnienie to co innego.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_Forgive_03_02"); //Co to znaczy?
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_Forgive_15_03"); //By�e� zastraszony i jestem ci sk�onny wybaczy�, ale b�d� pami�ta� o tej truci�nie do ko�ca �ycia.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_Forgive_03_04"); //Dzi�kuj� ci. Przynajmniej nie ma mi�dzy nami konfliktu.
    B_LogEntry                     (TOPIC_Illness,"Wybaczy�em Snafowi jego czyn, ale nie zapomn� mu tego.");
    Info_ClearChoices		(DIA_Addon_Snaf_ItWasArvo);
};

FUNC VOID DIA_Addon_Snaf_ItWasArvo_DontForgive()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_15_01"); //Wybaczenie to nie jest co�, czego nale�y oczekiwa�. Na to trzeba sobie zapracowa�. 
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_03_02"); //Pomog�em ci przecie�.
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_15_03"); //Jak? Zanios�e� mnie do ��ka, abym nie zgin�� na zimnej pod�odze?!
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_03_04"); //Dawa�em ci jedzenie i wod�. Lucia mo�e potwierdzi�.
    AI_Output (other, self ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_15_05"); //Jeste� tym, kim chcesz by�. Dla mnie jeste� ju� nikim.
    AI_Output (self, other ,"DIA_Addon_Snaf_ItWasArvo_DontForgive_03_06"); //Nie chc� ci� zna�.
    SnafAngered = TRUE;
    Info_ClearChoices		(DIA_Addon_Snaf_ItWasArvo);
    B_LogEntry                     (TOPIC_Illness,"Snaf nie zas�uguje na wybaczenie! Mo�e zapomnie� o naszej przyja�ni.");
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Snaf_GoAway (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_GoAway_Condition;
   information  = DIA_Addon_Snaf_GoAway_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_GoAway_Condition()
{
    if (SnafAngered == TRUE)
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Snaf_GoAway_03_01"); //Zostaw mni� w spokoju.
    AI_StopProcessInfos	(self);
};

//========================================
//-----------------> AreYouHungry
//========================================

INSTANCE DIA_Addon_Snaf_AreYouHungry (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 1;
   condition    = DIA_Addon_Snaf_AreYouHungry_Condition;
   information  = DIA_Addon_Snaf_AreYouHungry_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Snaf_AreYouHungry_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Snaf_AreYouHungry_Info()
{
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_01"); //G�odny?
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_02"); //Ty jeste� pewnie Snaf.
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_03"); //Tak jest ch�opcze. Jestem Snaf, a ty?
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_04"); //Vinc.
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_05"); //Mi�o mi Vinc. A wi�c Fletcher pozwoli� ci tu wej��.
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_06"); //Tak. Wykona�em dla niego par� zada�.
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_07"); //I zabi�e� par� b�otnych w�y.
    AI_Output (other, self ,"DIA_Addon_Snaf_AreYouHungry_15_08"); //Sk�d to wiesz?
    AI_Output (self, other ,"DIA_Addon_Snaf_AreYouHungry_03_09"); //(�miech) Taka moja rola.
};

//========================================
//-----------------> YoureFromTheColony
//========================================

INSTANCE DIA_Addon_Snaf_YoureFromTheColony (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 2;
   condition    = DIA_Addon_Snaf_YoureFromTheColony_Condition;
   information  = DIA_Addon_Snaf_YoureFromTheColony_Info;
   permanent	= FALSE;
   description	= "Ty te� jeste� z kolonii...";
};

FUNC INT DIA_Addon_Snaf_YoureFromTheColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_AreYouHungry))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_YoureFromTheColony_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_01"); //Ty te� jeste� z kolonii...
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_02"); //Tak. Jestem ze Starego Obozu. (do siebie) Kto by pomy�la�, �e nazwa nadal pasuje...
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_03"); //By�y jeszcze dwa obozy: Nowy Ob�z i Sekta.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_04"); //Albo bractwo, ob�z na bagnie. Akurat to miejsce mia�o par� nazw.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_05"); //Hmm, chocia� je�li chodzi o �cis�o�� to gdzie� w g�rach by� ob�z bandyt�w...
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_06"); //Bandyt�w?
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_07"); //Wiem, wiem. Teraz to brzmi idiotycznie.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_08"); //No i by� jeszcze teren ork�w. Ale ja tam nigdy nie chodzi�em.
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_09"); //Orkowie, s�ysza�em o nich. Toczyli�cie z nimi jakie� bitwy, potyczki?
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_10"); //Ca�kiem w�cibski z ciebie go��. Kilka tygodni temu pozna�em takiego jak ty.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_11"); //Przyni�s� dla mnie par� chrz�szczy i grzyb�w, nast�pnie spyta� o pewnego stra�nika i tyle go widzia�em.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_12"); //Nawet nie pami�tam jego twarzy...
    AI_Output (other, self ,"DIA_Addon_Snaf_YoureFromTheColony_15_13"); //Hej, opowiedz mi o tych orkach.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_14"); //Tak, tak. O ile pami�� mnie nie myli, jeszcze przed barier� wojsko toczy�o z nimi bitwy. Niezbyt wielkie, ale by�y.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_15"); //Jednak po powstaniu bariery, sytuacja mocno si� uspokoi�a. Starcia z orkami by� znikome.
    AI_Output (self, other ,"DIA_Addon_Snaf_YoureFromTheColony_03_16"); //Chocia� paru uda�o si� nam z�apa� i zmusi� do pracy w kopalni.
};

//========================================
//-----------------> MeatbugsAndMushrooms
//========================================

INSTANCE DIA_Addon_Snaf_MeatbugsAndMushrooms (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 3;
   condition    = DIA_Addon_Snaf_MeatbugsAndMushrooms_Condition;
   information  = DIA_Addon_Snaf_MeatbugsAndMushrooms_Info;
   permanent	= FALSE;
   description	= "M�wi�e� co� o robakach i grzybach.";
};

FUNC INT DIA_Addon_Snaf_MeatbugsAndMushrooms_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_YoureFromTheColony))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_MeatbugsAndMushrooms_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_15_01"); //M�wi�e� co� o robakach i grzybach.
    AI_Output (self, other ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_03_02"); //M�j w�asny przepis: potrawka z chrz�szcza a la Snaf z ry�em i grzybami.
    AI_Output (other, self ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_15_03"); //Chrz�szcze? Do jedzenia?
    AI_Output (self, other ,"DIA_Addon_Snaf_MeatbugsAndMushrooms_03_04"); //Nie by�by� taki wybredny jakby� poby� w kolonii.
};

//========================================
//-----------------> TellMeAboutTheColony
//========================================

INSTANCE DIA_Addon_Snaf_TellMeAboutTheColony (C_INFO)
{
   npc          = BDT_1098_Addon_Snaf;
   nr           = 4;
   condition    = DIA_Addon_Snaf_TellMeAboutTheColony_Condition;
   information  = DIA_Addon_Snaf_TellMeAboutTheColony_Info;
   permanent	= FALSE;
   description	= "Opowiesz mi o kolonii?";
};

FUNC INT DIA_Addon_Snaf_TellMeAboutTheColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_MeatbugsAndMushrooms))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_Info()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_15_01"); //Opowiesz mi o kolonii?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_03_02"); //A o czym dok�adnie?

    Info_ClearChoices		(DIA_Addon_Snaf_TellMeAboutTheColony);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "Powiedz mi co� o obozach.", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "Opowiedz mi co� o ludziach z kolonii.", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople);
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_15_01"); //Powiedz mi co� o obozach.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_03_02"); //O kt�rym konkretnie?

    Info_ClearChoices		(DIA_Addon_Snaf_TellMeAboutTheColony);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "O Starym Obozie.", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_OldCamp);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "Opowiesz mi o tym Nowym Obozie?", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_NewCamp);
    Info_AddChoice		(DIA_Addon_Snaf_TellMeAboutTheColony, "A ten ca�y ob�z na bagnie?", DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_SwampCamp);
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_01"); //Opowiedz mi co� o ludziach z kolonii.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_02"); //C�, kolonia rz�dzi�a si� swoimi prawami. Cz�sto wilczymi.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_03"); //Czasami znajdowali�my jakie� truch�a obok rzeki, obozu czy w lesie.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_04"); //Zapewne to kto� ich mordowa�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_05"); //Tak w�a�nie by�o. Kiedy� s�ysza�em histori�, �e jeden kopacz zabi� drugiego w zamian za niezardzewia�y kilof.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_06"); //Za kilof? (zdziwienie)
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_07"); //Powody morderstw by�y r�ne. Na przyk�ad jaki� cie� chcia� zabi� pewnego maga.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_08"); //Maga?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_09"); //Gdy ten mag spa�, cie� zakrad� si� do niego.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_10"); //Rano znale�li�my niedosz�ego morderc�.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_11"); //Co mu zrobi� ten mag?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_12"); //No c�. Cie� by� dos�ownie wsz�dzie � w ca�ym zewn�trznym pier�cieniu.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_13"); //Dlaczego chcia� go zabi�?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_14"); //Nikt tego nie wie. Mo�e zg�upia�? Albo kto� mu zap�aci�?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_15"); //Nie rozmy�laj nad tym teraz. To ju� przesz�o��.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_16"); //Wi�kszo�� ludzi by�a niebezpieczna z tego co s�ysz�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_17"); //Jak dla mnie s�owo "gro�ni" nawet tego nie opisz�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_18"); //By�e� silniejszy to mia�e� lepiej. By�e� s�abszy � mia�e� marne szanse.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_19"); //Czasami trzeba by�o kombinowa�, je�li wiesz co mam na my�li.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_15_20"); //Wiem dobrze. W Khorinis by�o czasami podobnie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutPeople_03_21"); //Czasy kolonii jednak si� sko�czy�y.
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_OldCamp()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_01"); //O Starym Obozie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_02"); //Jasne, m�j stary dom.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_03"); //Zosta� tak nazwany, bo by� pierwszym obozem w dolinie. Wok� zamku powsta�o wiele drewnianych chatek oraz palisada. To by� zewn�trzny pier�cie�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_04"); //By� to najpot�niejszy ob�z w kolonii. Handlowali�my z kr�lem. My dawali�my mu worki z rud�, a on nam �ywno��, bro�, wod�. Po prostu wszystko czego chcieli�my.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_05"); //Mieli�my tam aren�, targowisko...
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_06"); //A co by�o w zamku?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_07"); //Nie by�em tam. To znaczy raz uda�o mi si� zwiedzi� plac zamkowy.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_08"); //I co tam si� znajdowa�o?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_09"); //By�a ku�nia, kaplica mag�w, sale stra�nik�w i rzecz jasna siedziba magnat�w.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_10"); //Obozem rz�dzi� Gomez, a jego praw� r�k� by� Kruk. Gomez mia� wszystko co chcia�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_11"); //Kobiety, alkohol, najlepsze jedzenie, w�asn� �wit� i stra�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_12"); //W obozie byli kopacze, cienie, stra�nicy, magowie ognia oraz magnaci. To by�a ca�a hierarchia obozu.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_13"); //Co jeszcze ciekawego mi opowiesz?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_14"); //Par� lat temu zawali�a si� wie�a w obozie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_15"); //Pono� jacy� rabusie ukradli worek rudy i porwali kobiet� Gomeza.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_16"); //Wpadli w pu�apk� wchodz�c do wie�y, ale mimo to zabarykadowali drzwi.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_17"); //Wtedy jeden z mag�w rzuci� jaki� czar i wie�a run�a.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_18"); //Ciekawa historia.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_19"); //A wiesz jaki by� huk? Paru kopaczy przyp�aci�o za to �yciem.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_15_20"); //A co z rabusiami?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_21"); //Nie odnaleziono ich, ale ilo�� plotek i domys��w na ich temat by�a ogromna.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_OldCamp_03_22"); //Ale ma�o kto z tych, co tutaj s�, pami�ta to zdarzenie.
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_NewCamp()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_01"); //Opowiesz mi o tym Nowym Obozie?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_02"); //Teraz to ju� nie Nowy Ob�z, he he.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_03"); //Powsta� bardzo szybko, cho� nie wiem dok�adnie po jakim czasie. W kolonii nie by�em od samego pocz�tku.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_04"); //By�a tam banda ludzi, kt�rzy uznali, �e uciekn� z kolonii.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_05"); //W jaki spos�b?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_06"); //Ich magowie mieli zdetonowa� kopiec rudy czy co�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_07"); //Mag�w chroni� by�y genera� kr�la � Lee. On dowodzi� grup� najemnik�w, kt�ra ich chroni�a.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_08"); //By�y jeszcze szkodniki. Paru z nich mia�o ochron� od mag�w, bo byli kurierami. Ale zdecydowana wi�kszo�� robi�a co im si� podoba.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_09"); //Na przyk�ad co?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_10"); //Krad�a, mordowa�a, napada�a na wszystko.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_11"); //Stary i Nowy Ob�z nigdy si� nie lubi�y. Ale do wi�kszego starcia nigdy nie dosz�o.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_12"); //Czemu?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_13"); //Gomez co prawda mia� du�o ludzi, ale Lee mia� talent taktyczny. Sytuacja by�a patowa.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_14"); //Ale wszystko ma sw�j koniec.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_15"); //Co si� sta�o?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_16"); //Kilka tygodni temu run�a nasza kopalnia. Kilku kopaczy przybieg�o ze strasznymi wie�ciami.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_17"); //Woda wdar�a si� do kopalni i p�k�y podpory.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_18"); //Katastrofa.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_19"); //Ma�o powiedziane. No i wtedy w�a�nie Gomez kaza� zaatakowa� kopalnie Nowego Obozu.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_15_20"); //Wtedy kolonia sta�a si� jeszcze bardziej niebezpieczna.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_NewCamp_03_21"); //Ale to stare czasy.
};

FUNC VOID DIA_Addon_Snaf_TellMeAboutTheColony_TellMeAboutCamps_SwampCamp()
{
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_01"); //A ten ca�y ob�z na bagnie?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_02"); //Powsta� jakie� 5 lat temu. Jeden z kopaczy mia� jak�� wizj� o jakim� nowym b�stwie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_03"); //Przekona� on kilkana�cie os�b i odeszli z obozu. Osiedlili si� na bagnach.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_04"); //By�em w ich obozie kilka razy. Mieli wielki kamienny plac i domki na drzewach. Wi�kszo�� ich architektury opiera�a si� na drewnie.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_05"); //Ka�dy z nich pali� bagienne ziele. I to ca�kiem sporo.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_06"); //Przez ca�y okres ich istnienia rz�dzi� nimi Y'Berion. By� on tym kopaczem, kt�remu przy�ni�o si� to b�stwo � �ni�cy.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_07"); //Wi�c to by�a sekta?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_08"); //Jak dla mnie tak, bo w ostatnim miesi�cu przysz�y wie�ci, �e czcili demona.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_09"); //Ale po co ja ci to m�wi�? Te obozy to przesz�o��.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_10"); //Fortuno mo�e ci co� opowie o sekcie. On by� w ich obozie.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_11"); //Nie omieszkam si� go o to zapyta�.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_12"); //Ale jeszcze o tej sekcie. Byli tam guru, nowicjusze oraz stra� �wi�tynna.
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_13"); //Stra�nikami rz�dzi� Angar. Em, to znaczy Cor Angar.
    AI_Output (other, self ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_15_14"); //Cor?
    AI_Output (self, other ,"DIA_Addon_Snaf_TellMeAboutTheColony_SwampCamp_03_15"); //Mieli dziwne tytu�y. Spytaj si� o to Fortuno.
};

