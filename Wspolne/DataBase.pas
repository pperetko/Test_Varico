unit DataBase;

interface
uses classes, sysutils, db, adoDb, IniFiles;



type
  TTrybTransakcji = (DbRead, dbReadWrite, dbNone);

  TResultHandle = class(TADOQuery)
  public
    constructor CreateSQL(ASQL: string); overload;
    constructor CreateSQL(Asql: TStrings); overload;
    constructor create(AOwner: TComponent = nil); override;
    destructor Destroy; override;
    procedure InvokeSql;
    procedure ExecuteSql;
    procedure Clear;
    function ExecuteDDL(ADDL: string): Boolean;
    procedure Add(AString: WideString); overload;
    procedure Add(Alinie: TStrings); overload;
  end;

  TDataBase = class(TObject)
  private
    FSesjaId: string;
    FConnection: TADOConnection;
    Flist: TList; //Lista Result Handle
    FFolderEksport: string;
    procedure ZwolnijResultHandle;

  public
    czyTransakcja: boolean;
    constructor Create;
    destructor Destroy; override;
    function StartDataBase(Ahaslo: string): boolean;
    procedure BeginTransaction();
    procedure Rollback;
    procedure Commit;
    function MaxId(Tabela: string; AliczbaLock: integer = 1): integer;
    procedure RejestrujResultHandle(Aresult: TResultHandle);
    procedure WyrejestrujResultHandle(Aresult: TResultHandle);
    function InicjujKatalogEksportowy: boolean;
    property
      foldereksport: string read FFolderEksport;
  end;


  TConnectionString = class(TObject)
  private
    FIniFile: TIniFile;
    function GetDatabaseName: string;
    function GetServerName: string;
    function GetdatabaseUserPassword: string;
    function GetdatabaseUser: string;
    function GetProviderName:string;
  public
    constructor Create;
    destructor destroy; override;
    function GetConnectionString(AHaslo: string): string;
  end;



var
  GdataBase: TDataBase;
implementation
uses Funkcje, stale, Zmienne, FormaMain;
const

  //Provider=PostgreSQL OLE DB Provider
  CconnectionString = '%s;Password=%s;User ID=%s;Data Source=%s;Location=%s;Extended Properties=''''';
  CLiczbaLP = 15000;
  CTimeOUT = 3600;

resourcestring

  cpdf = 'pdf';

//####################################################################################################################
{ TDataBase }
//####################################################################################################################

procedure TDataBase.BeginTransaction();
begin
  if not czyTransakcja then begin
    FConnection.BeginTrans;
    czyTransakcja := true;
  end else begin
    raise Exception.Create('Nie mo¿na otworzyæ wiêcej transakcji');
  end;
end;
//####################################################################################################################

procedure TDataBase.Commit;
begin
  try
    FConnection.CommitTrans;
    czyTransakcja := false;
  except
    raise Exception.Create('Nie mo¿na zapisaæ transakcji');
  end;
end;
//####################################################################################################################

constructor TDataBase.Create;
var
  xGuid: TGUID;
begin
  FConnection := TADOConnection.Create(nil);
  czyTransakcja := false;
  Flist := TList.Create;
  CreateGUID(xGuid);
  FSesjaId := GUIDToString(xGuid);
  FSesjaId := StringReplace(FSesjaId, '{', '', [rfIgnoreCase, rfReplaceAll]);
  FSesjaId := StringReplace(FSesjaId, '}', '', [rfIgnoreCase, rfReplaceAll]);
  FSesjaId := StringReplace(FSesjaId, '-', '', [rfIgnoreCase, rfReplaceAll]);
  FSesjaId := format('1x%s', [FSesjaId]);
end;
//####################################################################################################################

destructor TDataBase.Destroy;
begin
  FConnection.Close;
  FConnection.Free;
  ZwolnijResultHandle;
  Flist.Free;
  inherited;
end;
//####################################################################################################################
//cpdf

function TDataBase.InicjujKatalogEksportowy: boolean;
begin
  result := true;
  try
    FFolderEksport := IncludeTrailingPathDelimiter(PodajkatalogMojeDokumenty(0)) + cpdf;
    if not DirectoryExists(FFolderEksport) then begin
      result := CreateDir(FFolderEksport);
    end;
  except
    result := false;
  end;
end;

function TDataBase.MaxId(Tabela: string; AliczbaLock: integer): integer;
var
  xZapytanie: string;
  xDataSet: TResultHandle;
  id: integer;
begin
  xDataSet := TResultHandle.Create;
  xZapytanie := 'Select IDMAX as id  from IDMAX where NazwaTabeli=' + QuotedStr(Tabela);
  xDataSet.Add(xZapytanie);
  xDataSet.InvokeSQL;
  id := xDataSet.fieldbyname('id').AsInteger;
  if id = 0 then begin
    xDataSet.Clear;
    xZapytanie := 'Select MAX(' + 'id' + Tabela + ') as IDMAX from ' + Tabela + ' ';
    xDataSet.Add(xZapytanie);
    xDataSet.InvokeSQL;
    id := xDataSet.fieldByName('IDMAX').AsInteger;
  end;
  if ((id = 0) or (id < CLiczbaLP)) then begin
    id := CLiczbaLP;
  end else begin
    inc(id);
  end;
  result := id;
  xZapytanie := 'Delete from IDMAX where NazwaTabeli=' + QuotedStr(Tabela);
  xDataSet.Clear;
  xDataSet.Add(xZapytanie);
  xDataSet.ExecuteSQL;
  dec(AliczbaLock);
  xZapytanie := 'Insert into IDMAX(NazwaTabeli,IDMAX) values (' + QuotedStr(Tabela) + ',' + IntToStr(id + AliczbaLock) + ')';
  xDataSet.Clear;
  xDataSet.Add(xZapytanie);
  xDataSet.ExecuteSQL;
  xDataSet.Free;
end;
//####################################################################################################################



procedure TDataBase.RejestrujResultHandle(Aresult: TResultHandle);
begin
  Flist.Add(Aresult);
end;
//####################################################################################################################

procedure TDataBase.Rollback;
begin
  try
    FConnection.RollbackTrans;
    czyTransakcja := false;
  except
    raise Exception.Create('Nie mo¿na zamkn¹æ transakcji');
  end;
end;
//####################################################################################################################

function TDataBase.StartDataBase(Ahaslo: string): boolean;
var
  xCS: TConnectionString;
  xWersjaOK: Boolean;
begin
  with FConnection do begin
    xCS := TConnectionString.Create;
    ConnectionString := xCS.GetConnectionString(AHaslo);
    CommandTimeout := CTimeOUT;
    //DefaultDataBase := xCS.GetDatabaseName;
    xCS.Free;
    LoginPrompt := false;
    //IsolationLevel := ilReadCommitted;
    //Mode := cmReadWrite;
    CursorLocation := clUseServer;
    try
      Open;
      Result := True;
    except
      raise Exception.Create('Brak po³¹czenia z baz¹ danych.');
    end;
    if (Result) then begin
      with TResultHandle.CreateSQL('select ltrim(Rtrim(wersjaBazy)) from System') do begin
        InvokeSQL;
        if recordCount > 0 then begin

          xWersjaOK := (Fields[0].AsString = PodajWersjeBazy);
        end else begin
          xWersjaOK := false;
        end;
        Close;
        Free;
      end;
      if (not xWersjaOK) then begin
        Close;
        raise Exception.Create(Format('B³êdna wersja bazy danych! Wymagana jest wersja: %s.', [PodajWersjeBazy]));
      end;
    end;
  end;
end;
//####################################################################################################################

procedure TDataBase.WyrejestrujResultHandle(Aresult: TResultHandle);
begin
  Flist.Remove(Aresult);
  Flist.Pack;
end;
//####################################################################################################################

procedure TDataBase.ZwolnijResultHandle;
var
  i: integer;
begin
  for I := Flist.Count - 1 downto 0 do begin
    try
      TResultHandle(Flist.items[i]).Free;
    except
    end;
  end;
end;
//####################################################################################################################
{ TResultHandle }
//####################################################################################################################

procedure TResultHandle.Add(AString: WideString);
begin
  Self.SQL.Add(AString);
end;
//####################################################################################################################

procedure TResultHandle.Add(Alinie: TStrings);
begin
  self.SQL.AddStrings(Alinie);
end;
//####################################################################################################################

procedure TResultHandle.Clear;
begin
  if self.Active then self.Close;
  self.SQL.Clear;
end;
//####################################################################################################################

constructor TResultHandle.Create;
begin
  inherited;
  self.Connection := GDataBase.FConnection;
end;
//####################################################################################################################

constructor TResultHandle.CreateSQL(Asql: TStrings);
begin
  create;
  self.Add(Asql);
  self.Connection := GDataBase.FConnection;
end;
//####################################################################################################################

constructor TResultHandle.CreateSQL(ASQL: string);
begin
  create;
  Self.Add(ASQL);
  self.Connection := GDataBase.FConnection;
end;
//####################################################################################################################

destructor TResultHandle.Destroy;
begin
  GDataBase.WyrejestrujResultHandle(self);
  inherited;
end;
//####################################################################################################################

function TResultHandle.ExecuteDDL(ADDL: string): Boolean;
begin
  Result := True;
  try
    with self do begin
      Clear;
      self.Prepared := False;
      self.SQL.Text := ADDL;
      self.ExecSQL;
      Self.Close;
    end;
  except
    Result := False;
  end;
end;
//####################################################################################################################

procedure TResultHandle.ExecuteSql;
begin
  try
    self.ExecSQL;
  except
    raise Exception.Create('B³¹d wykonania zapytania !');
  end;
end;
//####################################################################################################################

procedure TResultHandle.InvokeSql;
begin
  try
    self.CursorType := ctOpenForwardOnly;
    self.Prepared := True;
    self.Open;
  except
    raise Exception.Create('B³¹d wykonania zapytania !');
  end;
end;
//####################################################################################################################
{ TConnectionString }
//####################################################################################################################
//CconnectionString ='Provider=PostgreSQL OLE DB Provider;Password=%s;User ID=%s;Data Source=%s;Location=%s;Extended Properties=''''';

constructor TConnectionString.Create;
var
  xPath: string;
begin
  xPath := PodajPathIniFile();
  FIniFile := TIniFile.Create(xPath);
end;

//####################################################################################################################

destructor TConnectionString.destroy;
begin
  FIniFile.Free;
  inherited;
end;

//####################################################################################################################
//  Provider=PostgreSQL OLE DB Provider;Password=sql;User ID=postgres;Data Source=localhost;Location=test;Extended Properties=""

function TConnectionString.GetConnectionString(AHaslo: string): string;
var
  xDatabaseName: string;
  xServerName: string;
  xUserName: string;
  xUserPass: string;
  xConnectionString: string;
begin
  xConnectionString := EmptyStr;
  xDatabaseName := GetDatabaseName;
  xServerName := GetServerName;
  xUserName := GetdatabaseUser;
  xUserPass := GetdatabaseUserPassword;
  if (xDatabaseName <> EmptyStr) and (xServerName <> EmptyStr) and (xUserName <> EmptyStr) and (xUserPass <> EmptyStr) then begin
    if trim(AHaslo) = '' then begin
      xConnectionString := Format(CconnectionString, [GetProviderName, xUserPass, xUserName, xServerName, xDatabaseName]);
    end else begin
      xConnectionString := Format(CconnectionString, [GetProviderName, AHaslo, xUserName, xServerName, xDatabaseName]);
    end;
  end;
  result := xConnectionString;
end;
//####################################################################################################################

function TConnectionString.GetDatabaseName: string;
begin
  result := FIniFile.ReadString(CSekcjaConnect, CBASENAME, '');
end;
//####################################################################################################################

function TConnectionString.GetdatabaseUser: string;
begin
  result := FIniFile.ReadString(CSekcjaConnect, CUSERNAME, '');
end;
//####################################################################################################################

function TConnectionString.GetdatabaseUserPassword: string;
begin
  result := FIniFile.ReadString(CSekcjaConnect, CUSERPASS, '');
end;
//####################################################################################################################

function TConnectionString.GetProviderName: string;
begin
  result := FIniFile.ReadString(CSekcjaConnect, CPROVIDER, 'Provider=PostgreSQL OLE DB Provider');
end;

//####################################################################################################################

function TConnectionString.GetServerName: string;
var
  xIniFile: TIniFile;
  xNazwa: string;
begin
  xIniFile := TIniFile.Create(PodajPathIniFile);
  xNazwa := xIniFile.ReadString(CSekcjaConnect, CSerwerName, '');
  xIniFile.Free;
  if Trim(xNazwa) = '' then begin
    xNazwa := 'localhost';
  end;
  result := xNazwa;
end;
//####################################################################################################################

end.

