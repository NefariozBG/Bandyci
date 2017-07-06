//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Miguel_EXIT(C_INFO)
{
	npc             = BDT_10022_Addon_Miguel;
	nr              = 999;
	condition	= DIA_Addon_Miguel_EXIT_Condition;
	information	= DIA_Addon_Miguel_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Miguel_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Miguel_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> LookingForMiguel
//========================================

INSTANCE DIA_Addon_Miguel_LookingForMiguel (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_LookingForMiguel_Condition;
   information  = DIA_Addon_Miguel_LookingForMiguel_Info;
   permanent	= FALSE;
   description	= "Szukam Miguela.";
};

FUNC INT DIA_Addon_Miguel_LookingForMiguel_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_WELCOME))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_LookingForMiguel_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_01"); //Szukam Miguela.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_02"); //Witaj. To ja nim jestem.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_03"); //Witam ci�. Jestem Vinc. 
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_04"); //Emm, nie jeste� troch� za stary na bandyt�? 
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_05"); //(�miech) Ha ha. Dawno si� tak nie u�mia�em.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_06"); //Wybacz je�li ci� urazi�em. 
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_07"); //Jeste� z Khorinis, prawda?
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_08"); //Tak. Sk�d wiedzia�e�?
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_09"); //Masz w sobie troch� kultury. Wiem, �e to akurat niezbyt dobra cecha dla bandyty. Wi�kszo�� bandy zgrywa twardziel�w.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_10"); //Ale wracaj�c. Ja tak�e jestem z Khorinis. Znasz mo�e Ignaza?
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_11"); //To taki hmm... Dziwny alchemik z portu. Wydaje si� mie� co� z g�ow�.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_12"); //To przez m�j nieudany eksperyment. Kiedy� by� o wiele powa�niejszym cz�owiekiem. Niestety, po tym incydencie sta� si� nieco irracjonalny.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_13"); //Jeste� gotowy na prac� od Fletchera?
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForMiguel_03_14"); //Tak. Przeka� mu prosz�, �e czekam. Wspomnij jeszcze o zio�ach, kt�re tu rosn�.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForMiguel_15_15"); //Nie zapomn�.
    B_LogEntry                     (TOPIC_Report,"Spotka�em Miguela. To bardzo przyjazny i uprzejmie nastawiony starszy cz�owiek. Czeka na robot� od Fletchera. Przy okazji mam wspomnie� o zio�ach, kt�re rosn� na bagnach. My�l�, �e Fletcher si� ucieszy.");
};

//========================================
//-----------------> HelpMe
//========================================

INSTANCE DIA_Addon_Miguel_HelpMe (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_HelpMe_Condition;
   information  = DIA_Addon_Miguel_HelpMe_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Miguel_HelpMe_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_FinishedHunt))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_HelpMe_Info()
{
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_01"); //Ch�opcze, pomo�esz mi?
    AI_Output (other, self ,"DIA_Addon_Miguel_HelpMe_15_02"); //W czym rzecz?
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_03"); //Nazbiera�em tyle zi�, �e nie mam gdzie ich schowa�.
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_04"); //Przyda�yby mi si� teraz jakie� sakiewki. Najlepiej sk�rzane.
    AI_Output (other, self ,"DIA_Addon_Miguel_HelpMe_15_05"); //Wiesz gdzie mog� by�?
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_06"); //Fletcher powinien mie� kilka w zrobionym przez nas, prowizorycznym magazynie. M�g�by� mi przynie�� kilka sakiew?
    AI_Output (other, self ,"DIA_Addon_Miguel_HelpMe_15_07"); //Pewnie. Nic nie mam do roboty.
    AI_Output (self, other ,"DIA_Addon_Miguel_HelpMe_03_08"); //To dobrze.
    MIS_Pouches_for_Miguel = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Pouches_for_Miguel, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Pouches_for_Miguel, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Pouches_for_Miguel,"Miguel potrzebuje sk�rzanych sakiewek do przechowania zi�. Wspomnia� o prowizorycznym magazynie. My�l�, �e Fletcher b�dzie wiedzia�, czy maj� na sk�adzie co� takiego.");
};

//========================================
//-----------------> HereAreYourPouches
//========================================

INSTANCE DIA_Miguel_HereAreYourPouches (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Miguel_HereAreYourPouches_Condition;
   information  = DIA_Miguel_HereAreYourPouches_Info;
   permanent	= FALSE;
   description	= "Mam sakiewki.";
};

FUNC INT DIA_Miguel_HereAreYourPouches_Condition()
{
    if ((Npc_KnowsInfo (other, DIA_Addon_Miguel_HelpMe))
    && (Npc_HasItems (other, ItSe_Empty) >=4))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Miguel_HereAreYourPouches_Info()
{
    AI_Output (other, self ,"DIA_Miguel_HereAreYourPouches_15_01"); //Mam sakiewki.
    AI_Output (self, other ,"DIA_Miguel_HereAreYourPouches_03_02"); //Dzi�kuj�. Nikt mi tu nie pomaga, ale ty jeste� inny, ch�opcze.
    AI_Output (other, self ,"DIA_Miguel_HereAreYourPouches_15_03"); //Mali ludzie czerpi� olbrzymi� rado�� z b��d�w i gaf pope�nianych przez ludzi wielkich.
    AI_Output (self, other ,"DIA_Miguel_HereAreYourPouches_03_04"); //Jakie to prawdziwe. Jeszcze raz dzi�kuj�.
	B_GiveInvItems (other, self, ItSe_Empty, 4);
	Npc_RemoveInvItems (self, ItSe_Empty,4); 
    B_LogEntry                     (TOPIC_Pouches_for_Miguel,"Pomog�em staremu Miguelowi. Od teraz b�dzie mia� gdzie chowa� ro�liny.");
    Log_SetTopicStatus       (TOPIC_Pouches_for_Miguel, LOG_SUCCESS);
    MIS_Pouches_for_Miguel = LOG_SUCCESS;
};

//========================================
//-----------------> CanWeTrade
//========================================

INSTANCE DIA_Addon_Miguel_CanWeTrade (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_CanWeTrade_Condition;
   information  = DIA_Addon_Miguel_CanWeTrade_Info;
   permanent	= FALSE;
   description	= "Skoro zbierasz zio�a, to mo�e sprzedasz mi ich par�?";
};

FUNC INT DIA_Addon_Miguel_CanWeTrade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_LookingForMiguel))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_CanWeTrade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_CanWeTrade_15_01"); //Skoro zbierasz zio�a, to mo�e sprzedasz mi ich par�?
    AI_Output (self, other ,"DIA_Addon_Miguel_CanWeTrade_03_02"); //Oczywi�cie. Czego potrzebujesz?
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Addon_Miguel_Trade (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 2;
   condition    = DIA_Addon_Miguel_Trade_Condition;
   information  = DIA_Addon_Miguel_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Mog� kupi� zio�a?";
};

FUNC INT DIA_Addon_Miguel_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_CanWeTrade))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_Trade_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_Trade_15_01"); //Mog� kupi� zio�a?
    AI_Output (self, other ,"DIA_Addon_Miguel_Trade_03_02"); //Pewnie.
    B_GiveTradeInv (self);
};

//========================================
//-----------------> LookingForSwampweed
//========================================

INSTANCE DIA_Addon_Miguel_LookingForSwampweed (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_LookingForSwampweed_Condition;
   information  = DIA_Addon_Miguel_LookingForSwampweed_Info;
   permanent	= FALSE;
   description	= "Szukam bagiennego ziela. ";
};

FUNC INT DIA_Addon_Miguel_LookingForSwampweed_Condition()
{
	if (MIS_Swampweed == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Addon_Miguel_LookingForSwampweed_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForSwampweed_15_01"); //Szukam bagiennego ziela. 
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForSwampweed_03_02"); //Dobrze trafi�e�. Tutaj znajdziesz tego pe�no. Mog� zapyta� po co ci ono?
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForSwampweed_15_03"); //Fortuno potrzebuje tego zielska.
    AI_Output (self, other ,"DIA_Addon_Miguel_LookingForSwampweed_03_04"); //Fortuno... Nie znam go. Ale uwa�aj z tym zielem. Mo�e ono prowadzi� do bardzo szkodliwych dzia�a�.
    AI_Output (other, self ,"DIA_Addon_Miguel_LookingForSwampweed_15_05"); //B�d� o tym pami�ta�.
};

//========================================
//-----------------> WhatsUp
//========================================

INSTANCE DIA_Addon_Miguel_WhatsUp (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_WhatsUp_Condition;
   information  = DIA_Addon_Miguel_WhatsUp_Info;
   permanent	= FALSE;
   description	= "Co u ciebie?";
};

FUNC INT DIA_Addon_Miguel_WhatsUp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Miguel_HereAreYourPouches))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_WhatsUp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_WhatsUp_15_01"); //Co u ciebie?
    if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Addon_Miguel_WhatsUp_03_02"); //Fletcher nie �yje. Boj� si� Franka.
    }
    else if (KAPITEL == 2)
    {
        AI_Output (self, other ,"DIA_Addon_Miguel_WhatsUp_03_03"); //Widz�, �e pniesz si� w hierarchii obozu. Uwa�aj na siebie.
    }
    else
    {
        AI_Output (self, other ,"DIA_Addon_Miguel_WhatsUp_03_04"); //Wreszcie mam w co zbiera� ro�liny. Dzi�kuj�.
    };
};

//========================================
//-----------------> WhyDidHeKill
//========================================

INSTANCE DIA_Addon_Miguel_WhyDidHeKill (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_WhyDidHeKill_Condition;
   information  = DIA_Addon_Miguel_WhyDidHeKill_Info;
   permanent	= FALSE;
   description	= "Dlaczego Franko zabi� Fletchera?";
};

FUNC INT DIA_Addon_Miguel_WhyDidHeKill_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Franco_WhatHappenedHere))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_WhyDidHeKill_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_WhyDidHeKill_15_01"); //Dlaczego Franko zabi� Fletchera?
    AI_Output (self, other ,"DIA_Addon_Miguel_WhyDidHeKill_03_02"); //Nie my�la�em o tym...
    AI_Output (other, self ,"DIA_Addon_Miguel_WhyDidHeKill_15_03"); //Do cholery! Fletcher organizowa� ob�z. Co z tob�?
    AI_Output (self, other ,"DIA_Addon_Miguel_WhyDidHeKill_03_04"); //On... Po prostu podszed� i zabi� go. Na dodatek Arvo zastraszy� cz�� obozu.
    AI_Output (self, other ,"DIA_Addon_Miguel_WhyDidHeKill_03_05"); //Prosz�, odejd� ju�. Nie... Nie chc� o tym rozmawia�.
    B_LogEntry                     (TOPIC_Riot_in_Hunters_Camp,"Swoim czynem Franko wystraszy� cz�� obozu. Miguel nie by� skory do rozmowy. Wspomnia� natomiast, �e Arvo zastraszy� par� os�b.");
};

//========================================
//-----------------> AreYouOkay
//========================================

INSTANCE DIA_Addon_Miguel_AreYouOkay (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_AreYouOkay_Condition;
   information  = DIA_Addon_Miguel_AreYouOkay_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Miguel_AreYouOkay_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_YouHaveAwaken))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_AreYouOkay_Info()
{
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_01"); //Jeste� ca�y?
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_02"); //Teraz si� o mnie martwicie?
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_03"); //Franko zakaza� mi wej�cia do obozu. Chcia�em ci pom�c.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_04"); //Co mi si� sta�o?
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_05"); //Ten, kto poda� ci trucizn�, by� wyj�tkowo g�upi.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_06"); //Znam kilku takich.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_07"); //Nie obwiniaj Snafa. On by tego nie zrobi�.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_08"); //Ten, kto chcia� ci� otru�, wla� ci tylko po�ow� zawarto�ci. Gdyby to by�a ca�a fiolka, ju� by� nie �y�.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_09"); //Masz szcz�cie w nieszcz�ciu. Twoje cia�o jest nadal sparali�owane.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_10"); //Znajd� tego go�cia. Zap�aci mi za to.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_11"); //Wy�pij si� lepiej.
    AI_Output (other, self ,"DIA_Addon_Miguel_AreYouOkay_15_12"); //Nie! Znajd� go teraz.
    AI_Output (self, other ,"DIA_Addon_Miguel_AreYouOkay_03_13"); //Zrobisz jak uwa�asz.
    B_LogEntry                     (TOPIC_Illness,"Miguel powiedzia�, �e ten, kto wla� mi trucizn�, by� g�upi, bo nie wla� ca�ej zawarto�ci. Znajd� tego, kto mi to zrobi�. Zaczn� od tych, co s� najbli�ej knajpy Lou.");
};

//========================================
//-----------------> WheresArvo
//========================================

INSTANCE DIA_Addon_Miguel_WheresArvo (C_INFO)
{
   npc          = BDT_10022_Addon_Miguel;
   nr           = 1;
   condition    = DIA_Addon_Miguel_WheresArvo_Condition;
   information  = DIA_Addon_Miguel_WheresArvo_Info;
   permanent	= FALSE;
   description	= "Jedno wa�ne pytanie. Gdzie jest Arvo?";
};

FUNC INT DIA_Addon_Miguel_WheresArvo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Kyrrus_WheresArvo))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Miguel_WheresArvo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Miguel_WheresArvo_15_01"); //Jedno wa�ne pytanie. Gdzie jest Arvo?
    AI_Output (self, other ,"DIA_Addon_Miguel_WheresArvo_03_02"); //Szed� na p�noc. Tam gdzie ty z Loganem polowali�cie na b�otne w�e.
    AI_Output (other, self ,"DIA_Addon_Miguel_WheresArvo_15_03"); //To mi wystarczy.
    B_LogEntry                     (TOPIC_Arvo,"Arvo poszed� w kierunku p�nocnym. Niedawno tam by�em. Czas to zako�czy�.");
};

