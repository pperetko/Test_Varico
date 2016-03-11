unit Funkcje;

interface
uses
  SysUtils, Stale, Math, Windows, Types, Classes, StrUtils, ShellApi, SHFolder, ShlObj, ActiveX, WinSvc, Forms, Dialogs, Grids, DataBase;


function PodajPathSystem: string;
function PodajPathIniFile: string;
function GetGuid: string;
function PodajNazweSystemu: string;
function PodajWersjeSystemu: string;
function PodajNazweBazy: string;
function PodajWersjeBazy: string;
procedure WyczyscStringGrida(AStringGrid: TStringGrid);
function PodajListePlikowWKatalogu(Akatalog: string; var Alista: TStringList): integer;
function IsDirNotation(ADirName: string): Boolean;
function PodajNazwePlikuKataloguZeSciezki(ANapis: string): string;
//Funkcja podaje nazwê stacji roboczej
function PodajZWersionRC(AString: string): string;
function DateTimeToSql(Avalue: TDateTime): string;
function PodajWartosc(Astring: string): string;


type

//Obiekt tej klasy bêdzie odpowiedzialny za wyœwietlanie komunikatów. Komunikaty bêd¹ trzymane w bazie danych
  TKomunikat = class
  public
    procedure WyswietlKomunikat(AKomunikat: string; ANaglowek: string; Anapisydodatkowe: TArrayOfStrings); overload;
    //Wyœwietla komunikat z przyciskami Tak anuluj
    function WyswietlKomunikatF(AKomunikat: string; ANaglowek: string; Anapisydodatkowe: TArrayOfStrings): integer;

    procedure WyswietlKomunikat(AKomunikat: string; ANaglowek: string); overload;
  end;


  Tid = class
  public
    Fid: integer;
    Findex: integer;
  end;

var
  GKomunikat: TKomunikat;
  
implementation
//####################################################################################################################

function PodajPathSystem: string;
begin
  result := ExpandUNCFileName(IncludeTrailingPathDelimiter (ExtractFilePath(ParamStr(0))));
end;

//####################################################################################################################

function PodajPathIniFile: string;
begin
  result := ExpandUNCFileName(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)))) + CNazwaPlikuIni;
end;
//####################################################################################################################

function GetGuid: string;
var
  Guid: TGUID;
begin
  Result := '';
  if CreateGUID(Guid) = S_OK then begin
    Result := GUIDToString(Guid);
  end;
end;
//####################################################################################################################

function PodajWersjeBazy: string;
begin
  result := copy(PodajWersjeSystemu, 1, 4);
end;
//####################################################################################################################

function PodajNazweBazy: string;
var
  xNazwaSystemu: string;
  xWersja: string;
begin
  xNazwaSystemu := PodajNazweSystemu;
  xWersja := copy(PodajWersjeSystemu, 1, 4);
  while Pos('.', xWersja) <> 0 do begin
    Delete(xWersja, Pos('.', xWersja), 1);
  end;
  result := xNazwaSystemu + '_' + xWersja;
end;
//####################################################################################################################

//####################################################################################################################

function PodajNazweSystemu: string;
begin
  result := PodajZWersionRC(CRCNazwaWewnetrzna)
end;
//####################################################################################################################

function PodajWersjeSystemu: string;
begin
  result := PodajZWersionRC(CRCWersjaProduktu)
end;
//####################################################################################################################

procedure WyczyscStringGrida(AStringGrid: TStringGrid);
var
  i: integer;
begin
  for i := 0 to AStringGrid.RowCount - 1 do begin
    AStringGrid.Rows[i].Clear;
  end;
  AStringGrid.RowCount := 2;
  AStringGrid.FixedRows := 1;
end;
//####################################################################################################################

{ TKomunikat }

procedure TKomunikat.WyswietlKomunikat(AKomunikat: string; ANaglowek: string; Anapisydodatkowe: TArrayOfStrings);
var
  xTresc: string;
  i: integer;
begin
  xTresc := AKomunikat;
  for i := 1 to length(Anapisydodatkowe) do begin
    xTresc := SysUtils.format(xTresc, [Anapisydodatkowe[i - 1]]);
  end;
  with Application do begin
    MessageBox(PChar(xTresc), PChar(ANaglowek), mb_OK or mb_IconInformation or mb_ApplModal);
  end;
end;
//####################################################################################################################

procedure TKomunikat.WyswietlKomunikat(AKomunikat, ANaglowek: string);
begin
  with Application do begin
    MessageBox(PChar(AKomunikat), PChar(ANaglowek), mb_OK or mb_IconInformation or mb_ApplModal);
  end;
end;

function TKomunikat.WyswietlKomunikatF(AKomunikat: string; ANaglowek: string; Anapisydodatkowe: TArrayOfStrings): integer;
var
  xTresc: string;
  i: integer;
begin
  result := -1;
  xTresc := AKomunikat;
  for i := 1 to length(Anapisydodatkowe) do begin
    xTresc := SysUtils.format(xTresc, [Anapisydodatkowe[i - 1]]);
  end;
  with Application do begin
    if MessageBox(Pchar(xTresc), PChar(ANaglowek), MB_YESNO or MB_ICONWARNING)
      = id_Yes then
      result := 1;
  end;
end;
//####################################################################################################################

function PodajListePlikowWKatalogu(Akatalog: string; var Alista: TStringList): integer;
var
  c: TsearchRec;
begin
  result := 1;
  if SysUtils.FindFirst(Akatalog + '\*.*', FaAnyFile, c) = 0 then begin
    if not IsDirNotation(c.Name) then begin
      if SysUtils.fileExists(Akatalog + '\' + c.name) then
        Alista.Add(Akatalog + '\' + c.name);
    end;
    while SysUtils.FindNext(c) = 0 do
      if not IsDirNotation(c.Name) then begin
        if SysUtils.fileExists(Akatalog + '\' + c.name) then
          ALista.Add(Akatalog + '\' + c.name);
      end;
  end;
  SysUtils.FindClose(c);
end;
//####################################################################################################################

function IsDirNotation(ADirName: string): Boolean;
begin
  Result := (ADirName = '.') or (ADirName = '..');
end;
//####################################################################################################################

function PodajNazwePlikuKataloguZeSciezki(ANapis: string): string;
begin
  while pos('\', Anapis) <> 0 do
    delete(Anapis, 1, pos('\', Anapis));
  result := ANapis;
end;
//####################################################################################################################


//####################################################################################################################

function DateTimeToSql(Avalue: TDateTime): string;
var
  OldDecimalSeparator: char;
begin
  OldDecimalSeparator := DecimalSeparator;
  DecimalSeparator := '.';
  result := FloatToStrF(AValue - 2, ffFixed, 15, 8);
  DecimalSeparator := OldDecimalSeparator;
end;



//####################################################################################################################

function PodajWartosc(Astring: string): string;
var
  xResult: string;
begin
  xResult := StringReplace(Astring, '''', '', [rfReplaceAll]);
  result := trim(xResult);
end;
//####################################################################################################################

function PodajZWersionRC(AString: string): string;
var
  InfoSize, Wnd, VerSize: DWORD;
  VerBuf: Pointer;
  FI: PVSFixedFileInfo;
  p: array[byte] of char;
begin
  Result := '';
  if (trim(AString) <> '') then begin
    InfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Wnd);
    if (InfoSize <> 0) then begin
      GetMem(VerBuf, InfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), Wnd, InfoSize, VerBuf) then
          if VerQueryValue(VerBuf, PAnsiChar('\\StringFileInfo\\041504E2\\' + Trim(AString)), Pointer(FI), VerSize) then begin
            strCopy(PChar(@p[0]), PChar(FI));
            Result := StrPas(p);
          end;
      finally
        FreeMem(VerBuf);
      end;
    end;
  end;
end;
end.

