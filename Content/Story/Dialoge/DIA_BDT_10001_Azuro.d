//========================================
//-----------------> OPCJA *KONIEC* 
//========================================

INSTANCE DIA_Azuro_EXIT(C_INFO)
{
	npc             = BDT_10001_Azuro;
	nr              = 999;
	condition	= DIA_Azuro_EXIT_Condition;
	information	= DIA_Azuro_EXIT_Info;
	permanent	= TRUE;
	description     = "KONIEC";
};

FUNC INT DIA_Azuro_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Azuro_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

//========================================
//-----------------> WhoAreYou
//========================================

INSTANCE DIA_Azuro_WhoAreYou (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 1;
   condition    = DIA_Azuro_WhoAreYou_Condition;
   information  = DIA_Azuro_WhoAreYou_Info;
   permanent	= FALSE;
   description	= "Kim jeste�?";
};

FUNC INT DIA_Azuro_WhoAreYou_Condition()
{
    return TRUE;
};

FUNC VOID DIA_Azuro_WhoAreYou_Info()
{
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_01"); //Kim jeste�?
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_02"); //Em, zasch�o mi w gardle. Nie masz piwa przy sobie?
    if (Npc_HasItems (other, ItFo_Beer) >=1)
    {
        AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_03"); //Wypij nasze zdrowie.
        AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_04"); //Dzi�ki!
		B_GiveInvItems (other, self, ItFo_Beer, 1);
        B_UseItem (self, ItFo_Beer);
    }
    else
    {
        AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_05"); //Nie mam.
        AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_06"); //Dobra, niewa�ne.
    };
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_07"); //Jestem Azuro, przyszed�em tu wraz z Thorusem i reszt�. To by�a d�uga w�dr�wka, a by�o tu jeszcze gorzej.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_08"); //Pe�no szczur�w tu si� zal�g�o, a w dodatku przez par� dni musieli�my zabija� pe�zacze z kopalni.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_09"); //Przynajmniej dzi�ki tej zasranej kopalni nie ma cz�ci z nas.
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_10"); //Jak to?
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_11"); //Nie s�ysza�e�? Gdy cz�� ch�opak�w dowiedzia�a si�, �e jest tam z�oto, to zacz�li si� o nie zabija�.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_12"); //I wtedy Kruk zabi� paru z nich. Od teraz nie ma tam wst�pu. Ciesz si�, �e ci� tam nie by�o.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_13"); //A ty jak masz na imi�?
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_14"); //Jestem Vinc, niedawno mieszka�em w Khorinis.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_15"); //Aaa, przypominam sobie. To ty zabi�e� dw�ch �o�nierzy?
    AI_Output (other, self ,"DIA_Azuro_WhoAreYou_15_16"); //Tak. Eskortowali mnie do kolonii.
    AI_Output (self, other ,"DIA_Azuro_WhoAreYou_03_17"); //He he. Mieli przykr� niespodziank�.
};

//========================================
//-----------------> WereYouAGuard
//========================================

INSTANCE DIA_Azuro_WereYouAGuard (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 2;
   condition    = DIA_Azuro_WereYouAGuard_Condition;
   information  = DIA_Azuro_WereYouAGuard_Info;
   permanent	= FALSE;
   description	= "Sk�d taki pancerz? By�e� stra�nikiem?";
};

FUNC INT DIA_Azuro_WereYouAGuard_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_WereYouAGuard_Info()
{
    AI_Output (other, self ,"DIA_Azuro_WereYouAGuard_15_01"); //Sk�d taki pancerz? By�e� stra�nikiem?
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_02"); //Zgadza si�. Dosta�em awans od Thorusa po tym jak zabi�em szkodnika z Nowego Obozu.
    AI_Output (other, self ,"DIA_Azuro_WereYouAGuard_15_03"); //Nowy Ob�z?
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_04"); //W kolonii by�o kilka oboz�w. Najstarszym by� Stary Ob�z. Chocia� na pocz�tku to by� zamek jakiego� lorda Tymor... Tymer... Cholera, nie pami�tam.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_05"); //By� jeszcze Nowy Ob�z i Sekta.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_06"); //Nie ma to jak mieszka� na �mierdz�cym bagnie i pali� zielsko w�r�d komar�w i innego �miecia.
    AI_Output (other, self ,"DIA_Azuro_WereYouAGuard_15_07"); //Ciekawa ta kolonia...
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_08"); //Szybko by� zmieni� zdanie o niej. By�em w kolonii dwa lata. I pozna�em j� do�� dobrze.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_09"); //Ale je�li chcesz wi�cej opowiastek o kolonii, to id� do kucharza Snafa.
    AI_Output (self, other ,"DIA_Azuro_WereYouAGuard_03_10"); //Ten wie ca�kiem sporo.
};

//========================================
//-----------------> HowWasTheColony
//========================================

INSTANCE DIA_Azuro_HowWasTheColony (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 3;
   condition    = DIA_Azuro_HowWasTheColony_Condition;
   information  = DIA_Azuro_HowWasTheColony_Info;
   permanent	= FALSE;
   description	= "Jak zapami�ta�e� koloni�?";
};

FUNC INT DIA_Azuro_HowWasTheColony_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_HowWasTheColony_Info()
{
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_01"); //Jak zapami�ta�e� koloni�?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_02"); //Cholera, zadajesz du�o pyta�, ale ci odpowiem. Bo co mam lepszego do roboty?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_03"); //By�o par� os�b kt�re zapami�ta�em dobrze. Na przyk�ad Skorpiona.
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_04"); //Skorpiona?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_05"); //Uczy� ch�opak�w jak strzela� z kuszy. Przy okazji nauczy� i mnie.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_06"); //Ale pewnego dnia znikn��. A wraz z nim znikn�o par� cacuszek ze zbrojowni.
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_07"); //Dlaczego odszed�?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_08"); //Nasz ob�z mia� kopalni�. Paru kopaczy przybieg�o i zda�o relacj� z tego, co si� tam sta�o.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_09"); //Kopalnia si� zawali�a! Pono� Gomez si� nie�le wkurzy�.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_10"); //Bez rudy handel z kr�lem by� na straconej pozycji. Nie by�o bez niej jedzenia, picia i ca�ej reszty.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_11"); //Gomez postanowi� zaatakowa� kopalni� Nowego Obozu. A sprzeciwili si� temu magowie ognia.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_12"); //Banda arogant�w. No, mo�e nie licz�c jednego maga. By� m�ody, a przynajmniej wygl�da� na takiego.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_13"); //Jak mu tam by�o... Milto? Miltes? Nieee. Cholera, nie pami�tam.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_14"); //Ale wracaj�c. Wi�c ci magowie, nie licz�c tego m�odego, zabronili atakowa� mu kopalni Nowego Obozu.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_15"); //I oni wszyscy zgin�li. Potem jakie� dwa tuziny stra�nik�w na czele z Szakalem ruszy�y na kopalni�.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_16"); //I wtedy Skorpion si� jako� ulotni�.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_17"); //Pami�tam tak�e dobrze Skipa i Stone'a. Ten pierwszy handlowa� broni� na zamku, a Stone by� kowalem. To on wyku� ten pancerz.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_18"); //Cho� cz�� pancerzy pochodzi z cia� zabitych �o�nierzy. Podczas buntu, Gomez i reszta zdj�li z nich te zbroje.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_19"); //Stone bardzo szybko nauczy� si� wykonywa� te pancerze.
    AI_Output (other, self ,"DIA_Azuro_HowWasTheColony_15_20"); //A co z nimi si� sta�o?
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_21"); //Tak szczerze to nie wiem. Gdy wyruszy�em wraz z Thorusem i reszt�, nic o nich nie wspomnieli. I nie s�dz�, �eby zostali zabici.
    AI_Output (self, other ,"DIA_Azuro_HowWasTheColony_03_22"); //Wed�ug mnie uda�o im si� zbiec z kolonii.
};

//========================================
//-----------------> HowDidBecomeGuard
//========================================

INSTANCE DIA_Azuro_HowDidBecomeGuard (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 4;
   condition    = DIA_Azuro_HowDidBecomeGuard_Condition;
   information  = DIA_Azuro_HowDidBecomeGuard_Info;
   permanent	= FALSE;
   description	= "M�wi�e� o awansie od Thorusa. Jak go dosta�e�?";
};

FUNC INT DIA_Azuro_HowDidBecomeGuard_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WereYouAGuard))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_HowDidBecomeGuard_Info()
{
    AI_Output (other, self ,"DIA_Azuro_HowDidBecomeGuard_15_01"); //M�wi�e� o awansie od Thorusa. Jak go dosta�e�?
    AI_Output (self, other ,"DIA_Azuro_HowDidBecomeGuard_03_02"); //Ca�kiem prosto. Jako cie� dosta�em zadanie p�j�cia do kopalni i wtedy zobaczy�em jak jeden ze szkodnik�w okrada� skrzyni�.
    AI_Output (self, other ,"DIA_Azuro_HowDidBecomeGuard_03_03"); //Z�odziejaszek mia� przy sobie du�o cennych rzeczy. W tym pier�cie� szefa kopalni.
    AI_Output (self, other ,"DIA_Azuro_HowDidBecomeGuard_03_04"); //Wie�� o czynie szybko si� rozesz�a i Thorus da� mi szans� bycia stra�nikiem. Dosta�em pancerz i zacz��em s�u�b�.
};

//========================================
//-----------------> AnyNews
//========================================

INSTANCE DIA_Azuro_AnyNews (C_INFO)
{
   npc          = BDT_10001_Azuro;
   nr           = 5;
   condition    = DIA_Azuro_AnyNews_Condition;
   information  = DIA_Azuro_AnyNews_Info;
   permanent	= TRUE;
   description	= "Co� nowego?";
};

FUNC INT DIA_Azuro_AnyNews_Condition()
{
    if (Npc_KnowsInfo (other, DIA_Azuro_WhoAreYou))
    {
    return TRUE;
    };
};


FUNC VOID DIA_Azuro_AnyNews_Info()
{
    AI_Output (other, self ,"DIA_Azuro_AnyNews_15_01"); //Co� nowego?
    if (KAPITEL == 2)
    {
        AI_Output (self, other ,"DIA_Azuro_AnyNews_03_02"); //Nie, wszystko po staremu.
    }
    else if (KAPITEL == 3)
    {
        AI_Output (self, other ,"DIA_Azuro_AnyNews_03_03"); //Pono� otwarto jak�� krypt�. Cholera, dobrze, �e mnie tam nie by�o.
    };
};

