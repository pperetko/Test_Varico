unit Stale;

interface
uses Windows;
const
  CnazwaPlikuIni = 'DBSYSTEM.Ini';
  CsekcjaSystem = 'SYSTEM';
  CSekcjaConnect = 'DATABASE_CONNECT';
  CSerwerName = 'SERWERNAME';
  CBASENAME = 'BASENAME';
  CUSERNAME = 'USERNAME';
  CUSERPASS = 'USERPASS';
  CLASTLOGIN = 'LAST_LOGIN';
  CFormaNajemHeigh = 'FORMA_GLOWNA_HEIGH';
  CFormaNajemWidth = 'FORMA_GLOWNA_WIDTH';
  CFormaNajemLeft = 'FORMA_GLOWNA_LEFT';
  CFormaNajemTop = 'FORMA_GLOWNA_TOP';
  CRCNazwaWewnetrzna = 'InternalName';
  CRCWersjaProduktu = 'ProductVersion';
  CRCNazwaProduktu = 'ProductName';
  CKeyNill = high(integer);
  //-------------------- -----------------------------------
 //Instalator
 //Komunikat brak wpisu INS
  ABrakwpisu = 'Warto�� nie mo�e by� pusta: ';
 //Komunikat brak wpisu INS
  ABrakPliku = 'Brak pliku w katalogu roboczym: ';
  //KOmunikat Brak biblioteki NTX.dll INS
  ABrakBiblioteki = 'Brak biblioteki NTX.dll.' + #13 + 'Dalsza praca Instalatora jest niemo�liwa';
  //Komunikat podania z�ego numeru seryjnego Modu� INS
  AZlyNumer = 'Z�y numer seryjny aplikacji. Skontaktuj si� z sprzedawc�!';
  //Komunikat Peole nie mo0�e by� puste modu� INS
  APolePuste = 'Pole nie mo�e by� puste!';
  //Komunikat pytanie czy usun�� bie��c� instalacj� INS
  AczyUsunac = 'Czy usun�� aktualn� instalacj�';
  //Komunikat brak skryptu z opisem instalacji INS
  ABrakPlikuInstall = 'Brak pliku z opisem Instalacji.' + #13 + 'Deinstalacja nie mo�e by� kontynuowana !';
  //Komunikat czy wykona� uaktualnienie INS
  ACzyuaktualnienie = 'Czy wykona� uaktualnienie do nowej wersji ?';
  //Koniec Instalator
   //klucz w rejestrze  HKEY_CLASSES_ROOT  INS
  AHKEY = HKEY_CLASSES_ROOT;
  //klucz w rejestrze  HKEY_CURRENT_USER   INS
  BHKEY = HKEY_CURRENT_USER;
  //klucz w rejestrze  HKEY_LOCAL_MACHINE INS
  CHKEY = HKEY_LOCAL_MACHINE;
  //klucz w rejestrze  HKEY_USERS  INS
  DHKEY = HKEY_USERS;
  //klucz w rejestrze  HKEY_CURRENT_CONFIG  INS
  EHKEY = HKEY_CURRENT_CONFIG;
  //Podkucz w rejestrze INS
  regkey = 'Software\';
  //Nazwa skryptu instalacyjnego INS
  ASkrypt = 'Skrypt.azz';
  //Nazwa skrptu po instalacji INS
  AInstall = 'Install.azz';
  //Nazwa pliku licencji INS
  Alicencja = 'Licencja.txt';
  //Nazwa logu b��d�w INS
  AlogBledow = 'Bledy.log';
  //Warto�� zwr�cona przez wy�wietlony komunikat

  PooTak = 1;
  PooNie = -1;

   //Klucz w rejestrze pod kt�rym zapisane s� dane aplikacji
 /// CKlucz = HKEY_LOCAL_MACHINE;
  //Podklucz w kluczu g��wnym
 // CPodklucz = 'SOFTWARE\Przychodnia'; //podklucz w rejestrze

  //-----------KONFIGURACJA--------------------------------
 //Zapytanie zwracaj�ce list� baz modu� KONF
  SListaBaz = 'SELECT name AS nazwa FROM master..sysdatabases';
  //Zapytanie tworz�ce baz� modu� KONF
  SUtorzBaze = 'CREATE DATABASE %s ON (NAME = %s_DAT, FILENAME = ''%s_DAT.MDF'', SIZE = 16, MAXSIZE = UNLIMITED, FILEGROWTH = 4) LOG ON (NAME = %s_LOG, FILENAME = ''%s_LOG.LDF'', SIZE = 8, MAXSIZE = UNLIMITED, FILEGROWTH = 2)';
  //Zapytanie usuwaj�ce baz� modu� KONF
  SUsunBaze = 'DROP DATABASE %s';
  //Zapytanie tworz�ce bacup bazy Modu� konf
  cBackupDB = 'BACKUP DATABASE [%s] TO DISK = ''%s'' WITH INIT,NOUNLOAD,NAME = ''%s.bak'',NOSKIP,NOFORMAT';
  //Zapytanie ustawiaj�ce format daty w bazie SQL modu� KONF
  cSqlFormatDaty = 'SET DATEFORMAT %s';

  CNazwaPlikuIniKonf = 'Konfiguracja.ini';
  //KOMUNIKATY
  CKOM_POLE_NIE_MOZE_BYC_PUSTE = 1;
  CKOM_HASLA_TAKIE_SAME = 2;
  CKOM_CZY_USUNAC_UZYTKOWNIKA = 3;
  CKOM_LOGIN_MUSI_BYC_UNIKALNY = 4;
  CKOM_BLEDNY_LOGIN = 5;


type
  //Adres
  TNAZWAADRESU = string[40];
  TULICA = string[30];
  TKOD = string[6];
  TNRLOKALU = string[5];
  TNRDOMU = string[5];
  TMIASTO = string[30];
  TNAZWAKRAJU = string[60];
  TTELEFON = string[20];
  TNIP = string[20];
  TMAIL = string[20];
  TZNACZNIK = string[1];
  //Uzytkownik
  THASLO = string[20];
  TLOGIN = string[20];
  TIMIE = string[30];
  TNAZWISKO = string[40];
  //FunkcjaUzytkownika
  TNazwa = string[30];
  TString = string[255];


  //INSTALATOR czynno�ci wykonywane przez instalator

  Tczynnosc = (AInstalacja, AnowaInstalacja, Auaktualnienie, Ausuniecie);
  //Kierunek przewijanych zak�adek
  TKierunek = (AwPrawo, AWLewo);
  //Funkcja sprawdzaj�ca serial Numeber zawarty w bibliotece NTX.dll
  TsprawdzserialNumber = function(Anumer: string): boolean; stdcall;
  //KONIEC INSTALATOR
  TArrayOfStrings = array of string;
  //typ tablica integer�w
  TArrayOfInteger = array of integer;
  //rejestr INSTALATOR

  //Koniec instalator

implementation

end.


