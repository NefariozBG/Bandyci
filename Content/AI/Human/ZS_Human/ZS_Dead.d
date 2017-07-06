// *****************************************
// ZS_Dead
// -------
// wird auch nach jedem Load Game ausgef�hrt
// wird auch vom Spieler ausgef�hrt
// *****************************************

func void ZS_Dead ()
{	
	// ------ aivars resetten ------
	self.aivar[AIV_RANSACKED] = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	
	B_StopLookAt	(self);
	AI_StopPointAt	(self);
		
	// ------ XP ------
	if ( Npc_IsPlayer(other) || (other.aivar[AIV_PARTYMEMBER]==TRUE) )
	&& (self.aivar[AIV_VictoryXPGiven] == FALSE)							
	{
		B_GivePlayerXP (self.level * XP_PER_VICTORY);			
		
		self.aivar[AIV_VictoryXPGiven] = TRUE;
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Swampshark_Logan))
	{
		LogansDeadSwampsharks = LogansDeadSwampsharks + 1;
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Edgor_Bloodfly))
	{
		EdgorsDeadBloodflies = EdgorsDeadBloodflies + 1;
	};


	// ------ Sumpfdrohne -------
	if (self.aivar[AIV_MM_REAL_ID] == ID_SWAMPDRONE)
	{
		if (Npc_GetDistToNpc(self, other) < 300)
		{
			other.attribute[ATR_HITPOINTS] -= 50;
			//Npc_ChangeAttribute(other, ATR_HITPOINTS, -50);
		};
	};
	
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(SwampDrone_Journal))
	{
		B_LogEntry	(TOPIC_Raven,"Zbada�em piedesta� na bagnie. Tam te� mo�na co� umie�ci�.");
		checkedTeleport = TRUE;
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Green_Journal))
	{
		B_LogEntry	(TOPIC_Raven,"Nie licz�c kurzu i mroku, niezbyt du�o tu widz�. Pe�no jest tutaj jaki� dziwnych malowide�, kt�rych nie jestem w stanie zrozumie� ani rozczyta�. Najlepiej b�dzie jak p�jd� dalej i zobacz� co tam jest.");
	};
	if (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(Gobbo_Green_Journal_MainHall))
	{
		B_LogEntry	(TOPIC_Raven,"Widz� jedn� z tych platform. Powiem Krukowi, �e znalaz�em jedn� w tych ruinach.");
		B_LogEntry	(TOPIC_Raven,"Nie licz�c kolumn i zamkni�tych kamiennych drzwi, nic tu nie ma. Po co wysy�a� mnie na zbadanie pustki?");
		checkedTemple = TRUE;
	};

		
	// ------ weil sonst H�ndler bevor man zum ersten Mal TRADE gew�hlt hat nix haben ------
	B_GiveTradeInv(self);//Joly:	STEHEN LASSEN!!!!!!!!!!!!!!!

	// ------ Monster-Inventory abh�ngig vom Spieler-Talent ------
	B_GiveDeathInv(self);
	B_ClearRuneInv(self); //klaue alle runen!!
	
	// ------ PetzCounter meiner Home-Location runtersetzen ------
	B_DeletePetzCrime (self); //hat bei CRIME_NONE (oder keiner Home-Location) keine Auswirkungen
	self.aivar[AIV_NpcSawPlayerCommit] = CRIME_NONE;
	
	// ------ Equippte Waffen k�nnen nicht genommen werden! ------
	AI_UnequipWeapons (self);
	
	self.aivar[AIV_TAPOSITION] = FALSE;
};

func int ZS_Dead_loop ()
{
	// Drachen 
	if (self.aivar[AIV_TAPOSITION] == FALSE)
	{
		
	self.aivar[AIV_TAPOSITION] = TRUE;
	};
	
	return LOOP_CONTINUE;
};
