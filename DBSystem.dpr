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
  Forma_Settings in 'Formatki\Forma_Settings.pas' {Form_Settings},
  DMPrint in 'Formatki\DMPrint.pas' {DataModuleReport: TDataModule},
  WydrukZUS3 in 'Wydruki\WydrukZUS3.pas',
  Froma_AddEdit in 'Formatki\Froma_AddEdit.pas' {From_AddEdit};

{$R *.res}

begin
  Application.Initialize;
  GDataBase := TDataBase.Create;
  GKomunikat := TKomunikat.Create;
  GDataModuleReport := TDataModuleReport.Create(nil);
  if GDataBase.StartDataBase('') then begin
    Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TFrom_AddEdit, From_AddEdit);
  Application.Run;
  end;
  GDataBase.Free;
  GKomunikat.Free;
  GDataModuleReport.Free;
end.

