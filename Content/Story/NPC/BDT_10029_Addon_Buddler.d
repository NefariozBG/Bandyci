instance BDT_10029_Addon_Buddler (Npc_Default)
{
	// ------ NSC ------
	name 		= NAME_Addon_Buddler;
	guild 		= GIL_BDT;
	id 			= 10029;
	voice 		= 6;
	flags      	= NPC_FLAG_IMMORTAL;
	npctype		= NPCTYPE_BL_MAIN;
	
	// ------ Attribute ------
	B_SetAttributesToChapter (self, 4);
	
	// ------ Kampf-Taktik ------
	fight_tactic = FAI_HUMAN_NORMAL;	
	
	// ------ Equippte Waffen ------																	
	
	// ------ Inventory ------
	B_CreateAmbientInv (self); 
	
	// ------ visuals ------																		
	B_SetNpcVisual 		(self, MALE, "Hum_Head_Bald", Face_L_Jackal, BodyTex_L, ITAR_Prisoner);	
	Mdl_SetModelFatness	(self, 1);
	Mdl_ApplyOverlayMds	(self, "Humans_Militia.mds"); 

	// ------ NSC-relevante Talente vergeben ------
	B_GiveNpcTalents (self);
	
	// ------ Kampf-Talente ------																		
	B_SetFightSkills (self, 30); 

	// ------ TA anmelden ------
	daily_routine 	= Rtn_Start_10029;
};
FUNC VOID Rtn_Start_10029()
{
	TA_Stand_Drinking	(06,00,12,00,"ADW_MINE_25");
	TA_Stand_Drinking	(12,00,06,00,"ADW_MINE_25");
};
FUNC VOID Rtn_Work_10029()
{
	TA_Pick_Ore	 (08,00,23,00,"ADW_MINE_PICK_01");
    TA_Pick_Ore	 (23,00,08,00,"ADW_MINE_PICK_01");
};

