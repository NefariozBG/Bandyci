///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skinner_EXIT   (C_INFO)
{
	npc         = BDT_1082_Addon_Skinner;
	nr          = 999;
	condition   = DIA_Addon_Skinner_EXIT_Condition;
	information = DIA_Addon_Skinner_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Skinner_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Skinner_EXIT_Info()
{
	AI_StopProcessInfos (self);
};
///////////////////////////////////////////////////////////////////////
//	Info Hi
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Skinner_Hi   (C_INFO)
{
	npc         = BDT_1082_Addon_Skinner;
	nr          = 2;
	condition   = DIA_Addon_Skinner_Hi_Condition;
	information = DIA_Addon_Skinner_Hi_Info;
	permanent   = TRUE;
	important   = TRUE;
};
FUNC INT DIA_Addon_Skinner_Hi_Condition()
{	
	if  Npc_IsInState (self, ZS_Talk)
	{	
		return TRUE;
	};
};
FUNC VOID DIA_Addon_Skinner_Hi_Info()
{
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_New_08_00");//Nooowy, co? Ty jeszcze nie wiesz w co si� w�a�nie wpl�ta�e�.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_New_08_01");//Ale pozw�l, �e ci wyja�ni�. Masz dwie mo�liwo�ci: ucieka� lub zgin�� od mojej Betty.
	AI_Output (self, other, "DIA_Addon_Skinner_Hi_New_08_02");//Nic nie m�w. Obie opcje b�d� dla ciebie zgub�.
	
	AI_StopProcessInfos (self);
	B_Attack (self, other, AR_NONE,1);
};
