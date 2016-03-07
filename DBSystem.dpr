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
  Froma_AddEdit in 'Formatki\Froma_AddEdit.pas' {Form_AddEdit},
  forma_print in 'Formatki\forma_print.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  GDataBase := TDataBase.Create;
  GKomunikat := TKomunikat.Create;
  if GDataBase.StartDataBase('') then begin
    Application.CreateForm(TForm_Main, Form_Main);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
  end;
  GDataBase.Free;
  GKomunikat.Free;
end.

