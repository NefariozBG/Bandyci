//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Addon_Esteban_EXIT(C_INFO)
{
	npc             = BDT_1083_Addon_Esteban;
	nr              = 999;
	condition	= DIA_Addon_Esteban_EXIT_Condition;
	information	= DIA_Addon_Esteban_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Addon_Esteban_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Addon_Esteban_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhatToDo
//========================================

INSTANCE DIA_Addon_Esteban_WhatToDo (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 1;
   condition    = DIA_Addon_Esteban_WhatToDo_Condition;
   information  = DIA_Addon_Esteban_WhatToDo_Info;
   permanent	= FALSE;
   description	= "Wi�c co musz� zrobi�, �eby dosta� si� wy�ej?";
};

FUNC INT DIA_Addon_Esteban_WhatToDo_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_YouAreEsteban))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_WhatToDo_Info()
{
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_01"); //Wi�c co musz� zrobi�, �eby dosta� si� wy�ej?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_02"); //Najlepiej nie spadnij na sam d�.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_03"); //Nie �artuj sobie!
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_04"); //Prosz�, a� tak ci zale�y? Dobra, dam ci szans�.
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_05"); //Wpuszczam tylko utalentowanych kopaczy. Nie wygl�dasz mi na takiego. Mam dla ciebie co� innego.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_06"); //S�ucham?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_07"); //W jakiej� jaskini na bagnie jest pono� ukryta tablica.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_08"); //Hm?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_09"); //Zlecenie z g�ry. Uda ci si� to wejdziesz. Nie uda... Lepiej nie przychod�.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_10"); //Jasne. Gdzie ta jaskinia?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_11"); //Przecie� m�wi�, �e gdzie� na bagnie.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_12"); //A dok�adniej?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_13"); //Id� do Arvo.
    AI_Output (other, self ,"DIA_Addon_Esteban_WhatToDo_15_14"); //A co on ma do tego?
    AI_Output (self, other ,"DIA_Addon_Esteban_WhatToDo_03_15"); //On ci� tam zaprowadzi, a teraz zejd� mi z oczu.
    MIS_Move_up_the_Hierarchy = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Move_up_the_Hierarchy, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Move_up_the_Hierarchy, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"Aby dosta� si� do ostatniej cz�ci obozu musz� znale�� dla Estebana jak�� tabliczk�. Oczywi�cie ten idiota pos�a� mnie do Arvo, bo tylko on wie gdzie jest ta jaskinia. Zapowiada si� �wietna robota, przed wyruszeniem powinienem zajrze� do Huno i kupi� kilof. Kto wie, mo�e si� przyda.");
};

//========================================
//-----------------> FinallyYouAreHere
//========================================

INSTANCE DIA_Addon_Esteban_FinallyYouAreHere (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 1;
   condition    = DIA_Addon_Esteban_FinallyYouAreHere_Condition;
   information  = DIA_Addon_Esteban_FinallyYouAreHere_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Esteban_FinallyYouAreHere_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Arvo_WaitAMinute))
    && (Npc_HasItems (other, ItWr_StonePlate_Cave) >=1)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_FinallyYouAreHere_Info()
{
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_01"); //NO jeste� ju�! Nie s�dzi�em, �e tu przyjdziesz.
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_02"); //O co ci chodzi?
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_03"); //Masz tabliczk�?
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_04"); //Trzymaj.
    B_GiveInvItems (other, self, ItWr_StonePlate_Cave, 1);
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_05"); //I jak posz�o?
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_06"); //Musia�em kopa� w poszukiwaniu tej tabliczki, podczas gdy Arvo nic nie zrobi�.
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_07"); //Czy�by? Arvo m�wi� co innego.
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_08"); //Co znowu?
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_09"); //Pono� to TY nic nie robi�e�. A Arvo musia� kopa�.
    AI_Output (other, self ,"DIA_Addon_Esteban_FinallyYouAreHere_15_10"); //Bzdury.
    AI_Output (self, other ,"DIA_Addon_Esteban_FinallyYouAreHere_03_11"); //Zejd� mi z oczu. Jeste� bezu�ytecznym �mieciem.
    B_LogEntry                     (TOPIC_Move_up_the_Hierarchy,"�wietnie! Arvo zrobi� z siebie ofiar�, a teraz nie mam wst�pu do kopalni. Nie wiem, jak ta banda mo�e utrzymywa� takiego mazgaja. Jak spotkam Arvo, to wyrw� mu ten k�amliwy j�zyk.");
    Log_SetTopicStatus       (TOPIC_Move_up_the_Hierarchy, LOG_SUCCESS);
    MIS_Move_up_the_Hierarchy = LOG_SUCCESS;
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> YouAreEsteban
//========================================

INSTANCE DIA_Addon_Esteban_YouAreEsteban (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 1;
   condition    = DIA_Addon_Esteban_YouAreEsteban_Condition;
   information  = DIA_Addon_Esteban_YouAreEsteban_Info;
   permanent	= FALSE;
   description	= "Ty jeste� Esteban?";
};

FUNC INT DIA_Addon_Esteban_YouAreEsteban_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_GoodNews))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_YouAreEsteban_Info()
{
    AI_Output (other, self ,"DIA_Addon_Esteban_YouAreEsteban_15_01"); //Ty jeste� Esteban?
    AI_Output (self, other ,"DIA_Addon_Esteban_YouAreEsteban_03_02"); //Tak, to ja. A ty to kto?
    AI_Output (other, self ,"DIA_Addon_Esteban_YouAreEsteban_15_03"); //Vinc.
    AI_Output (self, other ,"DIA_Addon_Esteban_YouAreEsteban_03_04"); //I czego ode mnie chcesz?
    AI_Output (other, self ,"DIA_Addon_Esteban_YouAreEsteban_15_05"); //Dosta� si� kopalni.
    AI_Output (self, other ,"DIA_Addon_Esteban_YouAreEsteban_03_06"); //(�miech) A kto by nie chcia�?
};

//========================================
//-----------------> GoAway
//========================================

INSTANCE DIA_Addon_Esteban_GoAway (C_INFO)
{
   npc          = BDT_1083_Addon_Esteban;
   nr           = 2;
   condition    = DIA_Addon_Esteban_GoAway_Condition;
   information  = DIA_Addon_Esteban_GoAway_Info;
   permanent	= TRUE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Esteban_GoAway_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Esteban_FinallyYouAreHere))
    && (Npc_IsInState (self,ZS_Talk))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Esteban_GoAway_Info()
{
    AI_Output (self, other ,"DIA_Addon_Esteban_GoAway_03_01"); //Wyno� si� st�d!
    AI_StopProcessInfos	(self);
};

