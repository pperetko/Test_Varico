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
  CPROVIDER = 'PROVIDER';
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
  //Nazwa logu b³êdów INS
  AlogBledow = 'Bledy.log';
  //Wartoœæ zwrócona przez wyœwietlony komunikat

  PooTak = 1;
  PooNie = -1;

type
  TArrayOfStrings = array of string;  




implementation

end.

