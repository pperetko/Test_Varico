program DBSystem;
{$R 'VERSION.res' 'VERSION.RC'}
uses
  Forms,
  FormaMain in 'Formatki\FormaMain.pas' {Form1},
  DataBase in 'Wspolne\DataBase.pas',
  Funkcje in 'Wspolne\Funkcje.pas',
  Stale in 'Wspolne\Stale.pas',
  Zmienne in 'Wspolne\Zmienne.pas',
  ObslugaKomponentow in 'Wspolne\ObslugaKomponentow.pas',
  DMPrint in 'Formatki\DMPrint.pas' {DataModuleReport: TDataModule},
  WydrukZUS3 in 'Wydruki\WydrukZUS3.pas',
  Froma_AddEdit in 'Formatki\Froma_AddEdit.pas' {From_AddEdit},
  Forma_Files in 'Formatki\Forma_Files.pas' {Form_Files};

{$R *.res}

begin
  Application.Initialize;
  GDataBase := TDataBase.Create;
  GKomunikat := TKomunikat.Create;
  GDataModuleReport := TDataModuleReport.Create(nil);
  if GdataBase.InicjujKatalogEksportowy then begin
    if GDataBase.StartDataBase('') then begin
      Application.CreateForm(TForm_Main, Form_Main);
      Application.Run;
    end;
  end else begin
    GKomunikat.WyswietlKomunikat('Brak katalogu eksportowego. Skontaktuj siê z serwisem aplikacji.', 'Bl¹d');
  end;
  GDataBase.Free;
  GKomunikat.Free;
  GDataModuleReport.Free;
end.

