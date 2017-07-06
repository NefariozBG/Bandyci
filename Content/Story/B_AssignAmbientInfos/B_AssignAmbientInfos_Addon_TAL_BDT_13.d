// *************************************************************************
// 									EXIT
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_EXIT(C_INFO)
{
	nr			= 999;
	condition	= DIA_Addon_TAL_BDT_13_EXIT_Condition;
	information	= DIA_Addon_TAL_BDT_13_EXIT_Info;
	permanent	= TRUE;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Addon_TAL_BDT_13_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};
// *************************************************************************
// 							Hi
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Hi(C_INFO)
{
	nr			= 2;
	condition	= DIA_Addon_TAL_BDT_13_Hi_Condition;
	information	= DIA_Addon_TAL_BDT_13_Hi_Info;
	permanent	= TRUE;
	description = "Co s�ycha�?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Hi_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Hi_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Hi_15_00_New");//Co s�ycha�?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_01");//Po�re ci� jaka� bestia albo sko�czysz w brzuchu jakiego� bydl�cia.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Hi_13_02");//To bagno b�dzie naszym grobem...
};
// *************************************************************************
// 							Tal
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_Tal(C_INFO)
{
	nr			= 3;
	condition	= DIA_Addon_TAL_BDT_13_Tal_Condition;
	information	= DIA_Addon_TAL_BDT_13_Tal_Info;
	permanent	= TRUE;
	description = "Co wiesz o tej dolinie?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_Tal_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_Tal_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_Tal_15_00_New");//Co wiesz o tej dolinie?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_01");//Pe�no w niej starych rzeczy. Kruk kaza� nam wszystko zbiera�.
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_Tal_13_02");//Nie mam poj�cia, po co mu to, ale nikt przy zdrowych zmys�ach nie b�dzie nadstawia� karku za par� kamyk�w...
};
// *************************************************************************
// 							WhereAreWe
// *************************************************************************
instance DIA_Addon_TAL_BDT_13_WhereAreWe(C_INFO)
{
	nr			= 4;
	condition	= DIA_Addon_TAL_BDT_13_WhereAreWe_Condition;
	information	= DIA_Addon_TAL_BDT_13_WhereAreWe_Info;
	permanent	= TRUE;
	description = "Co to za miejsce?";
};                       

FUNC INT DIA_Addon_TAL_BDT_13_WhereAreWe_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_TAL_BDT_13_WhereAreWe_Info()
{	
	AI_Output (other, self, "DIA_Addon_TAL_BDT_13_WhereAreWe_15_00");//Co to za miejsce?
	AI_Output (self, other, "DIA_Addon_TAL_BDT_13_WhereAreWe_13_01");//�rodek bagna. Okropnie tu �mierdzi i pe�no komar�w.
};


FUNC VOID B_AssignAmbientInfos_Addon_TAL_BDT_13(var C_NPC slf)
{
	DIA_Addon_TAL_BDT_13_EXIT.npc  = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_HI.npc	   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_TAL.npc   = Hlp_GetInstanceID (slf);
	DIA_Addon_TAL_BDT_13_WhereAreWe.npc  = Hlp_GetInstanceID (slf);
}; 


