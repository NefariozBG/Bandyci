//--------------------------------------------------------------------
//	Info EXIT 
//--------------------------------------------------------------------
INSTANCE DIA_Addon_Lucia_EXIT   (C_INFO)
{
	npc         = BDT_1091_Addon_Lucia;
	nr          = 999;
	condition   = DIA_Addon_Lucia_EXIT_Condition;
	information = DIA_Addon_Lucia_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Lucia_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Lucia_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> HowAreYou
//========================================

INSTANCE DIA_Addon_Lucia_HowAreYou (C_INFO)
{
   npc          = BDT_1091_Addon_Lucia;
   nr           = 1;
   condition    = DIA_Addon_Lucia_HowAreYou_Condition;
   information  = DIA_Addon_Lucia_HowAreYou_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Lucia_HowAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Lucia_HowAreYou_Info()
{
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_15_01"); //I jak si� czujesz?
    AI_Output (other, self ,"DIA_Addon_Lucia_HowAreYou_03_02"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_15_03"); //Nie udawaj, �e mnie nie znasz. Jestem Lucia.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowAreYou_03_04"); //Nie udaj�.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_15_05"); //No dobrze. Zreszt� nigdy nie s�dzi�am, �e kto� z Khorinis tutaj b�dzie.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_03_06"); //A ju� w szczeg�lno�ci taki ch�opak jak ty...
    AI_Output (other, self ,"DIA_Addon_Lucia_HowAreYou_15_07"); //Nie jestem w nastroju do takiej rozmowy.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowAreYou_03_08"); //(westchnienie) Szkoda... Ale gdyby� chcia� porozmawia� to wiesz gdzie mnie znale��.
};

//========================================
//-----------------> TomSaid
//========================================

INSTANCE DIA_Addon_Lucia_TomSaid (C_INFO)
{
   npc          = BDT_1091_Addon_Lucia;
   nr           = 2;
   condition    = DIA_Addon_Lucia_TomSaid_Condition;
   information  = DIA_Addon_Lucia_TomSaid_Info;
   permanent	= FALSE;
   description	= "Tom wspomnia�, �e mi pomog�a� gdy by�em zatruty.";
};

FUNC INT DIA_Addon_Lucia_TomSaid_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Tom_WhatHappened))
    && (Npc_KnowsInfo (other, DIA_Addon_Lucia_HowAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Lucia_TomSaid_Info()
{
    AI_Output (other, self ,"DIA_Addon_Lucia_TomSaid_15_01"); //Tom wspomnia�, �e mi pomog�a� gdy by�em zatruty.
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_02"); //Gdy tu przyby�am, zobaczy�am jak zanosili ci� na g�r�. By�e� strasznie blady.
    AI_Output (other, self ,"DIA_Addon_Lucia_TomSaid_15_03"); //Co by�o dalej?
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_04"); //(�miech) A co by� chcia�?
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_05"); //Mia�e� gor�czk� i wymiotowa�e�. Tom przyrz�dza� jakie� lekarstwo dla ciebie, a ja dba�am o tw�j stan.
    AI_Output (other, self ,"DIA_Addon_Lucia_TomSaid_15_06"); //Dzi�kuj�.
    AI_Output (self, other ,"DIA_Addon_Lucia_TomSaid_03_07"); //Nie ma za co. (puszcza oko)
};

//========================================
//-----------------> HowDidYouGetHere
//========================================

INSTANCE DIA_Addon_Lucia_HowDidYouGetHere (C_INFO)
{
   npc          = BDT_1091_Addon_Lucia;
   nr           = 3;
   condition    = DIA_Addon_Lucia_HowDidYouGetHere_Condition;
   information  = DIA_Addon_Lucia_HowDidYouGetHere_Info;
   permanent	= FALSE;
   description	= "Jak si� tutaj zjawi�a�?";
};

FUNC INT DIA_Addon_Lucia_HowDidYouGetHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Lucia_HowAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Lucia_HowDidYouGetHere_Info()
{
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_01"); //Jak si� tutaj zjawi�a�?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_02"); //Uciek�am razem z moim by�ym ch�opakiem. Mieli�my do�� miasta.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_03"); //By�ym? Nie �yje?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_04"); //Gdyby wtedy pad� martwy to op�akiwa�abym go.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_05"); //Ale to by� tch�rz jakich ma�o!
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_06"); //Napadli na nas bandyci, a on nic nie zrobi�.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_07"); //Poza tym mia�am do�� tego co zaczn� robi� stra�nicy i paladyni!
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_08"); //Du�o s�ysza�am od klient�w co si� dzieje na kontynencie. Wojna z orkami trwa zbyt d�ugo.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_09"); //A co s�dzisz o tym obozie?
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_10"); //Podoba mi si� tutaj, ch�opaki nie�le si� tu urz�dzili. Zreszt� sp�jrz na te dolin�.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_11"); //Bez statku i znajomo�ci tych klif�w nie dasz rady tu przyp�yn��.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_12"); //Wi�c ani paladyni ani orkowie tutaj nie przyp�yn�.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_13"); //Doskonale ci� rozumiem.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_14"); //Je�li by� czego� ode mnie chcia� wiesz gdzie mnie jestem.
    AI_Output (other, self ,"DIA_Addon_Lucia_HowDidYouGetHere_15_15"); //Nie zapomn�.
    AI_Output (self, other ,"DIA_Addon_Lucia_HowDidYouGetHere_03_16"); //No ja my�l�...
};

