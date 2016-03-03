unit FormaMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, ToolWin, ActnList;

type
  TForm_Main = class(TForm)
    ToolBar_main: TToolBar;
    ToolButton_Dodaj: TToolButton;
    ToolButton_Usun: TToolButton;
    ToolButton_Edytuj: TToolButton;
    ToolButton_Pliki: TToolButton;
    ListView1: TListView;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    Action_Dodaj: TAction;
    ADOConnection1: TADOConnection;
    procedure Action_DodajExecute(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OdswiezListe();
  end;

var
  Form_Main: TForm_Main;

implementation
uses Froma_AddEdit, Zmienne, stale, DataBase;
{$R *.dfm}

procedure TForm_Main.Action_DodajExecute(Sender: TObject);
begin
  if TFormularzZus3.Pokaz(CKeyNill) then begin

  end;
end;

procedure TForm_Main.OdswiezListe;
begin

end;

end.

