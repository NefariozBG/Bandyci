//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Lou_EXIT(C_INFO)
{
	npc             = BDT_10318_Lou;
	nr              = 999;
	condition		= DIA_Lou_EXIT_Condition;
	information		= DIA_Lou_EXIT_Info;
	permanent		= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Lou_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Lou_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> ScattyWantsBeer
//========================================

INSTANCE DIA_Lou_ScattyWantsBeer (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 1;
   condition    = DIA_Lou_ScattyWantsBeer_Condition;
   information  = DIA_Lou_ScattyWantsBeer_Info;
   permanent	= FALSE;
   description	= "Scatty chcia�by si� napi� piwa.";
};

FUNC INT DIA_Lou_ScattyWantsBeer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Scatty_GoodBeer))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_ScattyWantsBeer_Info()
{
    AI_Output (other, self ,"DIA_Lou_ScattyWantsBeer_15_01"); //Scatty chcia�by si� napi� piwa.
    AI_Output (self, other ,"DIA_Lou_ScattyWantsBeer_03_02"); //A kto by nie chcia�? (�miech)
    AI_Output (other, self ,"DIA_Lou_ScattyWantsBeer_15_03"); //To jak, masz co�?
    AI_Output (self, other ,"DIA_Lou_ScattyWantsBeer_03_04"); //Mam par� ostatnich butelek. Dok�adnie dwie.
    AI_Output (other, self ,"DIA_Lou_ScattyWantsBeer_15_05"); //Nie s�dz�, aby mu to wystarczy�o.
    AI_Output (self, other ,"DIA_Lou_ScattyWantsBeer_03_06"); //To b�dzie musia�o. Daj mi 50 sztuk z�ota i masz butelczyny.
};

//========================================
//-----------------> MoneyForBeer
//========================================

INSTANCE DIA_Lou_MoneyForBeer (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 2;
   condition    = DIA_Lou_MoneyForBeer_Condition;
   information  = DIA_Lou_MoneyForBeer_Info;
   permanent	= FALSE;
   description	= "Oto twoje pieni�dze. (50 sztuk z�ota)";
};

FUNC INT DIA_Lou_MoneyForBeer_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_ScattyWantsBeer))
    && (Npc_HasItems (other, ItMi_Gold) >=50)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_MoneyForBeer_Info()
{
    AI_Output (other, self ,"DIA_Lou_MoneyForBeer_15_01"); //Oto twoje pieni�dze.
    AI_Output (self, other ,"DIA_Lou_MoneyForBeer_03_02"); //Hehe, prosz�. Jeszcze zimne. Przy okazji zawsze mo�esz wypi� jedn� butelk� i da� mu tylko t� drug�.
    B_LogEntry                     (TOPIC_Strong_Beer,"Lou da� mi dwie butelki zimnego piwa i zasugerowa�, �ebym odda� Scattiemu tylko jedn� butelk�, a drug� sam wypi�.");
    B_GiveInvItems (other, self, ItMi_Gold, 50);
    CreateInvItems (self, ItFo_Beer_Lou, 2);
    B_GiveInvItems (self, other, ItFo_Beer_Lou, 2);
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Lou_Hello (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 1;
   condition    = DIA_Lou_Hello_Condition;
   information  = DIA_Lou_Hello_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Lou_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Lou_Hello_Info()
{
    AI_Output (self, other ,"DIA_Lou_Hello_03_01"); //Witaj m�odzie�cze, nazywam si� Lou. Mo�e chcesz si� napi�?
    AI_Output (other, self ,"DIA_Lou_Hello_15_02"); //A co oferujesz?
    AI_Output (self, other ,"DIA_Lou_Hello_03_03"); //Mam najlepsze trunki w tym obozie. Jak skosztujesz to zobaczysz.
    AI_Output (other, self ,"DIA_Lou_Hello_15_04"); //�wietnie. Co mo�esz mi sprzeda�?
    AI_Output (self, other ,"DIA_Lou_Hello_03_05"); //Alkohol rzecz jasna. Powiedz, je�li b�dziesz czego� potrzebowa�.
};

//========================================
//-----------------> Trade
//========================================

INSTANCE DIA_Lou_Trade (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 2;
   condition    = DIA_Lou_Trade_Condition;
   information  = DIA_Lou_Trade_Info;
   permanent	= TRUE;
   trade        = TRUE;
   description	= "Chc� si� napi�.";
};

FUNC INT DIA_Lou_Trade_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_Trade_Info()
{
    B_GiveTradeInv (self);
    AI_Output (other, self ,"DIA_Lou_Trade_15_01"); //Chc� si� napi�.
    AI_Output (self, other ,"DIA_Lou_Trade_03_02"); //�mia�o, czego potrzebujesz?
};

//========================================
//-----------------> WhereAreYouFrom
//========================================

INSTANCE DIA_Lou_WhereAreYouFrom (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 3;
   condition    = DIA_Lou_WhereAreYouFrom_Condition;
   information  = DIA_Lou_WhereAreYouFrom_Info;
   permanent	= FALSE;
   description	= "Sk�d pochodzisz?";
};

FUNC INT DIA_Lou_WhereAreYouFrom_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhereAreYouFrom_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_01"); //Sk�d pochodzisz?
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_02"); //Du�o by o tym gada�, ch�opcze. By�em w tak wielu miejscach, �e trudno powiedzie� sk�d.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_03"); //Przez ca�e �ycie zajmowa�em si� alkoholem. Rzecz jasna to zmusza�o mnie do koczowniczego �ycia.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_04"); //Nigdy nie zagrza�em w jednym miejscu zbyt du�o czasu. A ty, gdzie wcze�niej przebywa�e�?
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_05"); //Pochodz� z Khorinis...
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_06"); //Khorinis... Pami�tam pewien szczeg�lny budynek w porcie.
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_07"); //Domy�lam si�.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_08"); //A jak ci na imi�?
    AI_Output (other, self ,"DIA_Lou_WhereAreYouFrom_15_09"); //Jestem Vinc.
    AI_Output (self, other ,"DIA_Lou_WhereAreYouFrom_03_10"); //Wpadaj kiedy chcesz, Vinc.
};

//========================================
//-----------------> WhatAreYouDoing
//========================================

INSTANCE DIA_Lou_WhatAreYouDoing (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 4;
   condition    = DIA_Lou_WhatAreYouDoing_Condition;
   information  = DIA_Lou_WhatAreYouDoing_Info;
   permanent	= FALSE;
   description	= "Co porabiasz?";
};

FUNC INT DIA_Lou_WhatAreYouDoing_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_Hello))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhatAreYouDoing_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_15_01"); //Co porabiasz?
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_02"); //Mi�o, �e pytasz. Ostatnio wpad�em na ciekawe receptury alkoholowe.
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_15_03"); //Na przyk�ad jakie?
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_04"); //My�la�em o alkoholu na bazie bagiennego ziela...
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_15_05"); //Co takiego? (zdziwienie)
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_06"); //Co w tym dziwnego? Kiedy� uwa�a�em, i� w�da z ziemniak�w to najgorsze okropie�stwo.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_03_07"); //A smakuje dobrze. Tylko nie m�w ch�opcze, �e nie pi�e�.

    Info_ClearChoices		(DIA_Lou_WhatAreYouDoing);
    Info_AddChoice		(DIA_Lou_WhatAreYouDoing, "Raz si� tego napi�em.", DIA_Lou_WhatAreYouDoing_IDid);
    Info_AddChoice		(DIA_Lou_WhatAreYouDoing, "Nigdy nie pr�bowa�em.", DIA_Lou_WhatAreYouDoing_IDidNot);
};

FUNC VOID DIA_Lou_WhatAreYouDoing_IDid()
{
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDid_15_01"); //Raz si� tego napi�em.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDid_03_02"); //I jak?
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDid_15_03"); //Paskudztwo jakich ma�o.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDid_03_04"); //Ha ha, te� tak kiedy� uwa�a�em.
    Info_ClearChoices		(DIA_Lou_WhatAreYouDoing);
};

FUNC VOID DIA_Lou_WhatAreYouDoing_IDidNot()
{
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDidNot_15_01"); //Nigdy nie pr�bowa�em.
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDidNot_03_02"); //Ha ha, mnie nie oszukasz, ch�opcze. Dobrze znam ludzi.
    AI_Output (other, self ,"DIA_Lou_WhatAreYouDoing_IDidNot_15_03"); //Hmm...
    AI_Output (self, other ,"DIA_Lou_WhatAreYouDoing_IDidNot_03_04"); //Dobrze, nie denerwuj si�. Nie oceniam w ten spos�b.
    Info_ClearChoices		(DIA_Lou_WhatAreYouDoing);
};

//========================================
//-----------------> ContinuedConversation
//========================================

INSTANCE DIA_Lou_ContinuedConversation (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 5;
   condition    = DIA_Lou_ContinuedConversation_Condition;
   information  = DIA_Lou_ContinuedConversation_Info;
   permanent	= FALSE;
   description	= "Lepiej r�b alkohole ze sk�adnikami jakie masz pod r�k�.";
};

FUNC INT DIA_Lou_ContinuedConversation_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_WhatAreYouDoing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_ContinuedConversation_Info()
{
    AI_Output (other, self ,"DIA_Lou_ContinuedConversation_15_01"); //Lepiej r�b alkohole ze sk�adnikami jakie masz pod r�k�.
    AI_Output (self, other ,"DIA_Lou_ContinuedConversation_03_02"); //Jeszcze si� zdziwisz co ja zrobi�.
    AI_Output (other, self ,"DIA_Lou_ContinuedConversation_15_03"); //Nie zapomnij mi o tym powiedzie�.
    AI_Output (self, other ,"DIA_Lou_ContinuedConversation_03_04"); //Nie zapomn�.
};

//========================================
//-----------------> TellMeAboutAdventures
//========================================

INSTANCE DIA_Lou_TellMeAboutAdventures (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 6;
   condition    = DIA_Lou_TellMeAboutAdventures_Condition;
   information  = DIA_Lou_TellMeAboutAdventures_Info;
   permanent	= FALSE;
   description	= "Opowiesz mi o swoich trunkowych przygodach?";
};

FUNC INT DIA_Lou_TellMeAboutAdventures_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_ContinuedConversation))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_TellMeAboutAdventures_Info()
{
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_01"); //Opowiesz mi o swoich trunkowych przygodach?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_02"); //Jasne. Tylko gdzie ja podzia�em butelk�, hmm.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_03"); //O, jest tutaj!
    CreateInvItems (self, ItFo_Addon_Rum, 2);
    B_UseItem (self, ItFo_Addon_Rum);
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_04"); //Aaa, dobrze s�uchaj uwa�nie.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_05"); //Par�na�cie lat temu pierwszy raz przyp�yn��em do Khorinis.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_06"); //By�o to przed powstaniem tej magicznej bariery. Miasto jak to miasto, t�tni�o �yciem. Pozna�em par� os�b, ale nie by�em tam zbyt d�ugo.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_07"); //Znalaz�em za to ciekawe miejsce do destylacji alkoholowej. To by�a jaskinia za latarni� morsk�, obok ciemnego lasu.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_08"); //Nigdy si� tam nie zapuszcza�em. Niebezpieczne miejsce.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_09"); //Wierutne bzdury, nie by�o tak �le. Co nie si��, to rozumem jak to m�wi�. Mia�em umow� z pewnym my�liwym.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_10"); //Jak� umow�?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_11"); //On co jaki� czas zabija� te zwierz�ta, kt�re nie dawa�y mi spokoju i by�y dla mnie zagro�eniem, a w zamian dawa�em mu cz�� pe�nych butelek.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_12"); //Op�aca�o mu si�?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_13"); //Pewnie. Nie do��, �e mia� jakie� trofea z tych zwierz�t, to m�g� jeszcze sprzeda� te butelki i dorobi� sobie. No, albo je wypi�.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_14"); //M�w dalej.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_15"); //Poczekaj chwil�. Zasch�o mi w gardle.
    B_UseItem (self, ItFo_Addon_Rum);
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_16"); //No, na czym to ja sko�czy�em?
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_17"); //O uk�adzie z my�liwym.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_18"); //Ah tak... Wi�c troch� tam porobi�em alkoholu i przyszed� czas na sprzedanie tego.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_19"); //Takie wej�cie do miasta kosztowa�o mnie osiem butelczyn, a zawsze wychodzi�em z pe�n� sakiewk�.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_20"); //Co by�o dalej?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_21"); //W ko�cu kto� wykry�, �e wartownicy przy bramie s� przekupni i zbyt du�o nielegalnego alkoholu jest w mie�cie. Musia�em si� zwija�.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_22"); //Wsiad�em na statek i postanowi�em uda� si� na kontynent.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_23"); //Uda�o ci si�?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_24"); //Oczywi�cie, �e nie. Napadli na nas piraci. Gdyby� wiedzia� jaka to by�a doskona�a organizacja aborda�u. Ich kapitanem by� taki czarnobrody jegomo��. Tylko jak on mia� na imi�...
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_25"); //Hmm, niewa�ne, ale wracaj�c. Wpad�em w ich �apska. Chcieli mnie rzuci� rekinom na po�arcie, a ja wtedy zacz��em krzycze�, �e jestem bimbrownikiem i to jednym z najlepszych.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_26"); //I co? (zaciekawiony)
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_27"); //Wy�miali mnie w niebo g�osy, ale dali mi szans�. Przyp�yn�li�my do ich obozu, gdzie poszed�em z takim jednym piratem do jaskini i tak musia�em zrobi� rum.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_28"); //Jak ci posz�o?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_29"); //Nigdy nie robi�em rumu i obawia�em si�, �e mi nie wyjdzie.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_30"); //Po miesi�cu przyszed� czas na degustacj�. Bardzo si� ba�em, a jak si� okaza�o, niepotrzebnie. M�j rum smakowa� ch�opakom.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_31"); //Co prawda m�wili, �e robota Samuela jest o wiele lepsza, ale i tak sukces z mojej strony.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_32"); //Samuela?
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_33"); //Samuel to ten pirat, kt�ry zaprowadzi� mnie do swojej jaskini.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_34"); //I wtedy piraci mnie wypu�cili. Uznali mnie za nawet porz�dnego szczura l�dowego. Wypi�em z nimi troch�, a z Samuelem wymieni�em si� do�wiadczeniem bimbrownika, ha ha ha.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_35"); //Bardzo ciekawa historia.
    AI_Output (self, other ,"DIA_Lou_TellMeAboutAdventures_03_36"); //�eby� wiedzia�, ch�opcze. Mo�e kiedy� opowiem ci co� jeszcze. Teraz zmykaj, bo mam co robi�.
    AI_Output (other, self ,"DIA_Lou_TellMeAboutAdventures_15_37"); //Jasna sprawa.
};

//========================================
//-----------------> WhenDidYouStartBrewing
//========================================

INSTANCE DIA_Lou_WhenDidYouStartBrewing (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 7;
   condition    = DIA_Lou_WhenDidYouStartBrewing_Condition;
   information  = DIA_Lou_WhenDidYouStartBrewing_Info;
   permanent	= FALSE;
   description	= "Kiedy zacz��e� bawi� si� w bimbrownictwo?";
};

FUNC INT DIA_Lou_WhenDidYouStartBrewing_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_TellMeAboutAdventures))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhenDidYouStartBrewing_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhenDidYouStartBrewing_15_01"); //Kiedy zacz��e� bawi� si� w bimbrownictwo?
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_02"); //Wiesz, to by�o szmat czasu temu, ale zacznijmy od samego pocz�tku.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_03"); //Jak sko�czy�em dziesi�� lat, ojciec kaza� mi si� czym� zaj��. Zacz��em si� uczy� alchemii od miejscowego alchemika Hortenca.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_04"); //Z pocz�tku by�y to jakie� wywary i esencje. Bardzo szybko pod�apa�em ten zaw�d. A� pewnego dnia m�j mistrz zmar�, a jego syn sprzeda� jego laboratorium.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_05"); //Wtedy pozna�em znajomego Hortenca. Opowiedzia� mi o swoim zaj�ciu i, �e przyda�by si� mu kto� taki jak ja.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_06"); //I tak oto w�a�nie m�ody Lou zacz�� sw�j fach.
    AI_Output (other, self ,"DIA_Lou_WhenDidYouStartBrewing_15_07"); //Nie �a�owa�e� czasami tego wyboru?
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_08"); //Niby dlaczego? Gdy by�em mniej wi�cej w twoim wieku, opu�ci�em Starego � bo tak kaza� si� nazywa� � i uda�em si� w �wiat.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_09"); //Mo�e ci kiedy� o tym opowiem. Zwiedzi�em naprawd� wiele.
    AI_Output (other, self ,"DIA_Lou_WhenDidYouStartBrewing_15_10"); //Z ch�ci� pos�ucham.
    AI_Output (self, other ,"DIA_Lou_WhenDidYouStartBrewing_03_11"); //Nie zapomn� o tym.
};

//========================================
//-----------------> WhatAboutThem
//========================================

INSTANCE DIA_Lou_WhatAboutThem (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 8;
   condition    = DIA_Lou_WhatAboutThem_Condition;
   information  = DIA_Lou_WhatAboutThem_Info;
   permanent	= FALSE;
   description	= "Opowiesz mi o Hortencie i Starym?";
};

FUNC INT DIA_Lou_WhatAboutThem_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_WhenDidYouStartBrewing))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhatAboutThem_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_01"); //Opowiesz mi o Hortencie i Starym?
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_02"); //Czemu by nie? Zaczn� od Hortenca.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_03"); //By� to znany alchemik, kt�ry s�yn�� ze swojej dobroci. By� bardzo spokojny i opanowany.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_04"); //Niestety, mia� on k�opoty z sercem. Gdy uczy� mnie podstaw leku na czarn� gor�czk�, pad� na pod�og� i ju� si� nie podni�s�.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_05"); //Jego syn mia� w nosie dorobek ojca. Jak ju� powiedzia�em wcze�niej, sprzeda� wszystko.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_06"); //A ja wyl�dowa�em na bruku. Snu�em si� po ulicy i wpad�em na Starego. Hortenc kilka razy o nim mi wspomnia�. M�wi�: to wariat, ale uczciwy.
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_07"); //Ciekawe.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_08"); //No nie? Stary m�wi�, �e jak chc� to mog� u niego si� uczy�, bo potrzebuje kogo� takiego jak ja.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_09"); //Przyj��em ofert�. Pami�tam min� ojca, gdy przynios�em mu pieni�dze. ''Widzisz? Mieszanie butelek si� op�aca''. Tak powiedzia�.
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_10"); //Wiedzia� co robi�e�?
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_11"); //Chyba tak, sam nie wiem. Po paru latach opu�ci�em dom i odp�yn��em w inne strony.
    AI_Output (other, self ,"DIA_Lou_WhatAboutThem_15_12"); //Zostawi�e� ojca?
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_13"); //Pok��ci�em si� z nim, a powodem by�a w�a�nie ta podr�. Zreszt� relacje by�y czasami napi�te mi�dzy nami.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_14"); //Ale je�li chodzi o Starego... Mia� bardzo oryginalne podej�cie do pracy. Co dzie� z rana wypija� szklank� alkoholu.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_15"); //Z czasem musia�em coraz cz�ciej pilnowa� destylacji, gdy on albo szuka� sk�adnik�w albo mia� mocnego kaca.
    AI_Output (self, other ,"DIA_Lou_WhatAboutThem_03_16"); //Tydzie� po tygodniu uczy� mnie jak i z czego robi� ka�dy alkohol. Stare czasy.
};

//========================================
//-----------------> WhatAboutCave
//========================================

INSTANCE DIA_Lou_WhatAboutCave (C_INFO)
{
   npc          = BDT_10318_Lou;
   nr           = 9;
   condition    = DIA_Lou_WhatAboutCave_Condition;
   information  = DIA_Lou_WhatAboutCave_Info;
   permanent	= FALSE;
   description	= "A co z t� jaskini� w Khorinis?";
};

FUNC INT DIA_Lou_WhatAboutCave_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Lou_TellMeAboutAdventures))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Lou_WhatAboutCave_Info()
{
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_01"); //A co z t� jaskini� w Khorinis?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_02"); //Stoi chyba pusta, a na pewno zamkni�ta.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_03"); //Kto� j� przej�� po tobie?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_04"); //Je�li mnie pami�� nie myli, to go�� nazywa� si� Vino.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_05"); //Vino? Chyba go znam. To jeden z parobk�w Lobarta.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_06"); //Lobart? Szmat czasu go nie widzia�em. Ale nie m�wmy o nim, pyta�e� o jaskini�.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_07"); //Gdy powsta�a ta ca�a bariera, wytw�rnie nielegalnego alkoholu by�y jeszcze bardziej ryzykowne.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_08"); //Pami�tam, �e kr�l og�osi� bardzo ostre prawa.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_09"); //Te� to pami�tam. Biedny Jeremiasz przekona� si� o tym na w�asnej sk�rze.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_10"); //Jeremiasz?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_11"); //Gdy powsta�a bariera by�em na wyspie ju� kolejny raz. W tej jaskini ja, Vino i Jeremiasz destylowali�my trunki.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_12"); //Zrobili�my tyle butelek, �e nie mieli�my ju� w co wlewa� wytworzonego alkoholu.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_13"); //Wi�c postanowili�my �pozby� si� towaru. Jeremiasz podj�� si� udania na farm� w�a�ciciela ziemskiego. Chcia� tam sprzeda� z zyskiem nasz towar.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_14"); //I wpad�.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_15"); //Niestety tak. Akurat wtedy stra� zbiera�a plony na rzecz armii.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_16"); //Biedny Jeremiasz nawet nie mia� szans na ucieczk�. Ale z�ego demony nie bior�!
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_17"); //Hm?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_18"); //Od paru os�b s�ysza�em, �e w kolonii robi� alkohol z ry�u.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_19"); //(�miech) To si� nazywa mie� fach w r�ku.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_20"); //�eby� wiedzia�, ale sam wiesz, bariera upad�a...
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_21"); //A co wtedy zrobili�cie z Vino?
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_22"); //Vino by� bardziej wystraszony ni� ja. Chocia� jego wystraszy� nie jest trudno. Wystarczy, �e zobaczy� cie� w lesie i bra� nogi za pas.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_23"); //Aa, zagada�em si�. Po tygodniu rozeznali�my si� w terenie. Postanowili�my sprzeda� towar w ma�ych ilo�ciach.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_24"); //Uda�o si� nam, a Vino nawet nabra� pewno�ci siebie. Rozstali�my si� w zgodzie.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_25"); //On produkowa� dalej alkohol, a ja opu�ci�em wysp�. Tym razem uda�o mi si� dotrze� na kontynent. Sp�dzi�em tam kilka lat i wr�ci�em tu na wysp�.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_26"); //W ko�cu bariera upad�a i trafi�em na bandyt�w. Od teraz to m�j dom.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_27"); //�ycie bez podr�y jest jak potrawa bez soli.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_28"); //Oho, chyba odkry�em twoj� ciekawo�� �wiata. Powiedz teraz co� o sobie.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_29"); //A co tu m�wi�. Tydzie� sp�dzi�em w wi�zieniu w koszarach. Nast�pnie stra�nicy odprowadzali mnie do G�rniczej Doliny.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_30"); //Ale ich zabi�e�. Dlaczego? Co ci� do tego sk�oni�o?
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_31"); //Sam nie wiem...
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_32"); //Nie chcesz to nie m�w.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_33"); //Przy tym zosta�my.
    AI_Output (self, other ,"DIA_Lou_WhatAboutCave_03_34"); //Mam par� spraw na g�owie.
    AI_Output (other, self ,"DIA_Lou_WhatAboutCave_15_35"); //Nie przeszkadzam. Do zobaczenia.
};

