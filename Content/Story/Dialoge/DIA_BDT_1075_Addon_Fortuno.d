///////////////////////////////////////////////////////////////////////
//	Info EXIT 
///////////////////////////////////////////////////////////////////////
INSTANCE DIA_Addon_Fortuno_EXIT   (C_INFO)
{
	npc         = BDT_1075_Addon_Fortuno;
	nr          = 999;
	condition   = DIA_Addon_Fortuno_EXIT_Condition;
	information = DIA_Addon_Fortuno_EXIT_Info;
	permanent   = TRUE;
	description = DIALOG_ENDE;
};
FUNC INT DIA_Addon_Fortuno_EXIT_Condition()
{
	return TRUE;
};
FUNC VOID DIA_Addon_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos (self);
};

//========================================
//-----------------> NiceArmour
//========================================

INSTANCE DIA_Addon_Fortuno_NiceArmour (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 1;
   condition    = DIA_Addon_Fortuno_NiceArmour_Condition;
   information  = DIA_Addon_Fortuno_NiceArmour_Info;
   permanent	= FALSE;
   description	= "Hmm, bardzo egzotyczny pancerz.";
};

FUNC INT DIA_Addon_Fortuno_NiceArmour_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Fletcher_GoodNews))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_NiceArmour_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_01"); //Hmm, bardzo egzotyczny pancerz.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_02"); //H�? To dawny pancerz nowicjusza.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_03"); //Nowicjusza? Co� jak tych z klasztoru ognia w Khorinis?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_04"); //Nigdy o nich nie s�ysza�em. Ja pochodz� z bractwa, kt�re od dawna ju� nie istnieje.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_05"); //Tam palili�my bagienne ziele. Taaak, ziele...
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_06"); //Mo�e wpadn� p�niej.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_07"); //Nie, zaczekaj. Nie mog� si� st�d ruszy�, bo reszta tych rzezimieszk�w mnie okradnie.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_08"); //Z czego?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_09"); //Nie widzisz? Mam tutaj fajki wodne i troch� ziela. Jak st�d p�jd� to nic z tego mi nie zostanie. Musisz mi pom�c.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_10"); //Jak mam ci niby pom�c?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_11"); //Zbierz dla mnie bagienne ziele. Na bagnach ro�nie tego bardzo du�o. Potrzebuj� dziesi�ciu sztuk. Sam bym to zrobi�, ale no wiesz.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_12"); //A co ja z tego b�d� mia�?
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_13"); //Hmm. Mam przy sobie pewien pier�cie� od jednego guru.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_14"); //Guru? By�e� w sekcie? (zdziwienie)
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_15"); //Nie by�e� tam, wi�c nie oceniaj.
    AI_Output (other, self ,"DIA_Addon_Fortuno_NiceArmour_15_16"); //Dobra. Mo�esz po�egna� si� z pier�cieniem, bo nied�ugo dostaniesz swoje ziele.
    AI_Output (self, other ,"DIA_Addon_Fortuno_NiceArmour_03_17"); //(podekscytowany) �wietnie!
    MIS_Swampweed = LOG_RUNNING;

    Log_CreateTopic            (TOPIC_Swampweed, LOG_MISSION);
    Log_SetTopicStatus       (TOPIC_Swampweed, LOG_RUNNING);
    B_LogEntry                     (TOPIC_Swampweed,"Dziwak o imieniu Fortuno powiedzia�, �e je�li przynios� mu bagienne ziele, to w zamian otrzymam pier�cie�. Nie s�dz�, aby m�g� mnie oszuka�. Zreszt�, ten go�� chyba bredzi� i my�la� o czym� innym. Bardzo ciekawe osoby s� w tym obozie...");
};

//========================================
//-----------------> HeresYourWeed
//========================================

INSTANCE DIA_Addon_Fortuno_HeresYourWeed (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 2;
   condition    = DIA_Addon_Fortuno_HeresYourWeed_Condition;
   information  = DIA_Addon_Fortuno_HeresYourWeed_Info;
   permanent	= FALSE;
   description	= "Mam twoje �odygi.";
};

FUNC INT DIA_Addon_Fortuno_HeresYourWeed_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Fortuno_NiceArmour))
    && (Npc_HasItems (other, ItPl_SwampHerb) >=10)
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_HeresYourWeed_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_HeresYourWeed_15_01"); //Mam twoje �odygi.
    AI_Output (self, other ,"DIA_Addon_Fortuno_HeresYourWeed_03_02"); //Doskonale. Dzi�ki temu skupi� swoj� magiczn� moc tak jak robili to guru.
    AI_Output (other, self ,"DIA_Addon_Fortuno_HeresYourWeed_15_03"); //Do czego skupisz swoje magiczne moce?
    AI_Output (self, other ,"DIA_Addon_Fortuno_HeresYourWeed_03_04"); //Ahh, niewa�ne. Prosz�, oto pier�cie�.
    AI_Output (other, self ,"DIA_Addon_Fortuno_HeresYourWeed_15_05"); //Dzi�ki.
	B_GiveInvItems (other, self, ItPl_SwampHerb, 10);
    CreateInvItems (self, ItRi_Protection, 1);
    B_GiveInvItems (self, other, ItRi_Protection, 1);
    B_LogEntry                     (TOPIC_Swampweed,"Fortuno otrzyma� ode mnie zielsko. Gada� co� o magicznej mocy, skupieniu i o guru. Dziwny cz�owiek i jeszcze dziwniejsza sekta. Ale w zamian otrzyma�em cenny pier�cie�.");
    Log_SetTopicStatus       (TOPIC_Swampweed, LOG_SUCCESS);
    MIS_Swampweed = LOG_SUCCESS;
};

//========================================
//-----------------> Brainwashed
//========================================

INSTANCE DIA_Addon_Fortuno_Brainwashed (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 1;
   condition    = DIA_Addon_Fortuno_Brainwashed_Condition;
   information  = DIA_Addon_Fortuno_Brainwashed_Info;
   permanent	= FALSE;
   Important    = TRUE;
};

FUNC INT DIA_Addon_Fortuno_Brainwashed_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Miguel_AreYouOkay))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_Brainwashed_Info()
{
    AI_Output (self, other ,"DIA_Addon_Fortuno_Brainwashed_03_01"); //Zielony... Nowicjusz...
    AI_Output (other, self ,"DIA_Addon_Fortuno_Brainwashed_15_02"); //Fortuno, wiesz co� w sprawie mojego zatrucia?
    AI_Output (self, other ,"DIA_Addon_Fortuno_Brainwashed_03_03"); //On... Pojawi� si� znik�d... 
    AI_Output (self, other ,"DIA_Addon_Fortuno_Brainwashed_03_04"); //Krypta... Nowicjusz...
    AI_Output (other, self ,"DIA_Addon_Fortuno_Brainwashed_15_05"); //(do siebie) Chyba mu odbi�o.
    B_LogEntry                     (TOPIC_Illness,"Fortuno nie by� w stanie ze mn� rozmawia�. Nie pomo�e mi w �aden spos�b.");
};

//========================================
//-----------------> Hello
//========================================

INSTANCE DIA_Addon_Fortuno_Hello (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 1;
   condition    = DIA_Addon_Fortuno_Hello_Condition;
   information  = DIA_Addon_Fortuno_Hello_Info;
   permanent	= FALSE;
   description	= "Witaj.";
};

FUNC INT DIA_Addon_Fortuno_Hello_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Addon_Fortuno_Hello_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_Hello_15_01"); //Witaj.
    AI_Output (self, other ,"DIA_Addon_Fortuno_Hello_03_02"); //Witaj nieznajomy. Jestem Fortuno.
    AI_Output (other, self ,"DIA_Addon_Fortuno_Hello_15_03"); //Vinc.
    AI_Output (self, other ,"DIA_Addon_Fortuno_Hello_03_04"); //Je�li chcesz sobie zapali� to podejd� do tamtej fajki.
    AI_Output (self, other ,"DIA_Addon_Fortuno_Hello_03_05"); //Ale oczywi�cie musisz mie� sw�j tyto�.
    AI_Output (other, self ,"DIA_Addon_Fortuno_Hello_15_06"); //Jasna sprawa.
};

//========================================
//-----------------> SwampCamp
//========================================

INSTANCE DIA_Addon_Fortuno_SwampCamp (C_INFO)
{
   npc          = BDT_1075_Addon_Fortuno;
   nr           = 2;
   condition    = DIA_Addon_Fortuno_SwampCamp_Condition;
   information  = DIA_Addon_Fortuno_SwampCamp_Info;
   permanent	= FALSE;
   description	= "Wi�c jeste� z obozu na bagnie.";
};

FUNC INT DIA_Addon_Fortuno_SwampCamp_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Addon_Snaf_YoureFromTheColony))
    {
		return TRUE;
    };
};


FUNC VOID DIA_Addon_Fortuno_SwampCamp_Info()
{
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_01"); //Wi�c jeste� z obozu na bagnie.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_02"); //Tak. To by� wspania�y ob�z.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_03"); //Opowiesz mi co� o nim?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_04"); //Naszym duchowym przyw�dc� by� Y'berion. By� to najwy�szy i najpot�niejszy guru.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_05"); //Opr�cz niego by�o tak�e kilku innych guru. Baal Cadar zajmowa� si� nauczaniem magii.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_06"); //Baal Tondral naucza� nowicjuszy o �ni�cym, Baal Tyon wyg�asza� opowie�ci o jego pot�dze...
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_07"); //Dobrze. A reszta obozu?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_08"); //Cor Angar by� dow�dc� stra�nik�w �wi�tynnych. To by�a nasza stra�.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_09"); //Dyscyplin� dor�wnywali kr�lewskiej armii, a nawet j� przewy�szali...
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_10"); //I byli�my my, czyli nowicjusze.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_11"); //W obozie zajmowa�em si� sprzeda�� bagiennego ziela.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_12"); //Gdzie reszta twoich pobratymc�w?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_13"); //Niestety, pad�a czarna godzina dla naszego zgromadzenia. Dowiedzieli�my si�, �e �ni�cy to demon.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_14"); //Rzeczywi�cie to by�a sekta. (do siebie)
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_15"); //Odwr�cili�my si� od niego i przestali�my w niego wierzy�.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_16"); //Po paru dniach ogarn�a nas ciemno��. B�l g�owy nie da� nam spokoju.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_17"); //A� wszyscy uciekli w r�ne strony... Nikogo wi�cej nie zobaczy�em.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_18"); //A co z tob�?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_19"); //Nie mam poj�cia co si� dok�adnie sta�o.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_20"); //Obudzi�em si� przy prze��czy, a nade mn� sta� Snaf i Scatty. Zabrali mnie ze sob�.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_21"); //B�le g�owy usta�y, cho� mia�em koszmary.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_22"); //Co ci si� �ni�o?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_23"); //Wielki cie� i ludzie w kapturach. Oni patrzyli i wskazywali na mnie r�k�.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_24"); //(ze strachem) To by�o tak rzeczywiste...
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_25"); //I wtedy pojawi�o si� �wiat�o.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_26"); //�wiat�o?
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_27"); //Zakapturzone postacie uciek�y, a cie� znikn��. Us�ysza�em: wiara w spok�j ci� uratuje.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_28"); //To m�g� by� Adanos.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_29"); //Uzna�em to za �ask�, drug� szans� od samego boga r�wnowagi.
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_30"); //Jak trwoga to do boga... (do siebie)
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_31"); //H�?
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_32"); //Nie, nic.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_33"); //Jednak �a�uj�, �e nie ma ju� obozu. Przepad�a wiedza i badania guru...
    AI_Output (other, self ,"DIA_Addon_Fortuno_SwampCamp_15_34"); //Musz� lecie�.
    AI_Output (self, other ,"DIA_Addon_Fortuno_SwampCamp_03_35"); //Dzi�ki za rozmow�.
};

