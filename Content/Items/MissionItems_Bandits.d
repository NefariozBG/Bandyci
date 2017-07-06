INSTANCE ItSe_Empty	(C_Item)
{
	name 				=	"Pusta sakiewka";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	25;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_METAL;
	
	description			= 	name;
	
	TEXT[5]				= 	NAME_Value;	COUNT[5]	= value;
};

INSTANCE ItWr_ListOfGoods		(C_Item)
{
	name 				=	"Lista towar�w";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";
	material 			=	MAT_LEATHER;
	description			= 	name;
};

INSTANCE ItMi_Packet_Snaf(C_Item)
{
	name 				=	"Paczka Snafa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Niezwykle lekka paczka. Snaf z pewno�ci� ma tam jakie� przyprawy.";
};

INSTANCE ItMi_Packet_Scatty(C_Item)
{
	name 				=	"Paczka Scattiego";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Du�o r�nych rzeczy.";
};

INSTANCE ItMi_Packet_Huno(C_Item)
{
	name 				=	"Paczka Huno";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Ci�ka paczka. S� tam pr�ty.";
};

INSTANCE ItMi_Packet_Fletcher(C_Item)
{
	name 				=	"Paczka Fletchera";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Du�a paczka. Strza�y, be�ty, narz�dzia i gwo�dzie.";
	TEXT[3]				= 	"To co potrzeba do obozu.";
};

INSTANCE ItMi_Packet_Thorus(C_Item)
{
	name 				=	"Paczka Thorusa";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Mikstury lecznicze, kt�rych potrzebuje Thorus.";
	TEXT[3]				= 	"Lepiej abym ich nie upu�ci�.";
};

INSTANCE ItMi_Packet_Fisk(C_Item)
{
	name 				=	"Paczka Fiska";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItMi_Packet.3ds";
	material 			=	MAT_LEATHER;
	description			= 	name;
	TEXT[2]				= 	"Kilka broni i czego� jeszcze. To towar Fiska.";
};

INSTANCE ItSe_Pirates	(C_Item)
{
	name 				=	"Sk�rzane sakiewki";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MULTI;

	value 				=	0;

	visual 				=	"ItMi_Pocket.3ds";
	material 			=	MAT_METAL;
	
	description			= 	name;
	
	TEXT[2]				= 	"Dla pirat�w.";
};

instance ItWr_StonePlate_Cave (C_Item)
{
	name 				=	"Stara kamienna tablica";

	mainflag 			=	ITEM_KAT_NONE;
	flags 				=	ITEM_MISSION;

	value 				=	value_StonePlateCommon;

	visual 				=	"ItMi_StonePlate_Read_06.3ds"; 
	
	material 			=	 MAT_LEATHER;
	
	inv_rotx			=  - 90;
	inv_roty			=   0;
	inv_rotz			=   0;
	
	description			= 	name;
	TEXT[2]				= 	"Znaleziona w skale.";
};

INSTANCE ItFo_Beer_Lou (C_Item)
{	
	name 				=	"Mocne piwo";

	mainflag 			=	ITEM_KAT_FOOD;
	flags 				=	ITEM_MULTI;
	
	value 				=	Value_Beer;
	
	visual 				=	"ItFo_Beer.3DS";
	material 			=	MAT_GLAS;
	scemeName			=	"POTIONFAST";
	on_state[0]			=	Use_Beer_Lou;

	description			= 	name;
	TEXT[1]				= 	NAME_Bonus_HP;		COUNT[1]	= HP_Beer * 2;
	TEXT[2]				= 	NAME_Bonus_Mana;	COUNT[2]	= Mana_Beer * 2;
	
	TEXT[5]				= 	NAME_Value;		COUNT[5]	= Value_Beer;

};

FUNC VOID Use_Beer_Lou()
{
	Npc_ChangeAttribute	(self,	ATR_HITPOINTS,	HP_Beer * 2);
	Npc_ChangeAttribute	(self,	ATR_MANA,	Mana_Beer * 2);	 
};

INSTANCE ItWr_ArvoPoisoning		(C_Item)
{
	name 				=	"Kartka Arvo";

	mainflag 			=	ITEM_KAT_DOCS;
	flags 				=	ITEM_MISSION;

	value 				=	0;

	visual 				=	"ItWr_Scroll_01.3DS";	//VARIATIONEN: ItWr_Scroll_01.3DS, ItWr_Scroll_02.3DS
	material 			=	MAT_LEATHER;
	on_state[0]			=   UseItWrArvoPoisoning;
	scemeName			=	"MAP";
	description			= 	name;
};
func void UseItWrArvoPoisoning ()
{
		var int nDocID;

		nDocID = 	Doc_Create		()			  ;							// DocManager
					Doc_SetPages	( nDocID,  1 	);                         //wieviel Pages
					Doc_SetPage 	( nDocID,  0, "letters.TGA"  , 0 		);
					Doc_SetFont 	( nDocID,  0, FONT_BookHeadline  			); 	// -1 -> all pages
					Doc_SetMargins	( nDocID, -1, 50, 50, 50, 50, 1   		);  //  0 -> margins are in pixels
					Doc_SetFont 	( nDocID,  0, FONT_Book		); 	// -1 -> all pages
					Doc_PrintLine	( nDocID,  0, "Arvo!");
					Doc_PrintLine	( nDocID,  0, "");
					Doc_PrintLines	( nDocID,  0, "Nasi szefowie nie s� zadowoleni. Jak mog�e� spapra� tak precyzyjny plan? Wiesz, �e cz�� ch�opak�w go lubi i nie obesz�o si� bez plotek? Damy ci jednak drug� szans�. Teraz za�atw to dobrze � bo to CIEBIE, a nie jego sprz�tniemy.");
					Doc_PrintLines	( nDocID,  0, "I nast�pnym razem ty to zr�b, a nie ten gruby kucharz.");

					Doc_Show		( nDocID );
};
