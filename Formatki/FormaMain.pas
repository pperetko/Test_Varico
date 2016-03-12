unit FormaMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, ComCtrls, ToolWin, ActnList, Menus;

type
  TForm_Main = class(TForm)
    ToolBar_main: TToolBar;
    ToolButton_Dodaj: TToolButton;
    ToolButton_Usun: TToolButton;
    ToolButton_Edytuj: TToolButton;
    ToolButton_Pliki: TToolButton;
    ListViewMain: TListView;
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    ToolButton_Odswiez: TToolButton;
    Action_Edytuj: TAction;
    ToolButton_Wydruk: TToolButton;
    Action_Wydruk: TAction;
    ToolButton_Eksport: TToolButton;
    Action_Eksport: TAction;
    PopupMenu1: TPopupMenu;
    Eksport1: TMenuItem;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    Action_Usun: TAction;
    procedure Action_DodajExecute(Sender: TObject);
    procedure ToolButton_OdswiezClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Action_EdytujExecute(Sender: TObject);
    procedure Action_EdytujUpdate(Sender: TObject);
    procedure Action_WydrukExecute(Sender: TObject);
    procedure Action_WydrukUpdate(Sender: TObject);
    procedure Action_EksportExecute(Sender: TObject);
    procedure Action_EksportUpdate(Sender: TObject);
    procedure ToolButton_PlikiClick(Sender: TObject);
    procedure Action_UsunExecute(Sender: TObject);
    procedure Action_UsunUpdate(Sender: TObject);
    procedure ListViewMainDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure OdswiezListe();
    procedure WyczyscListe();
  end;

var
  Form_Main: TForm_Main;

implementation
uses Froma_AddEdit, Zmienne, stale, DataBase, funkcje, WydrukZUS3, Forma_Files;
{$R *.dfm}

procedure TForm_Main.Action_DodajExecute(Sender: TObject);
begin
  if TFormularzZus3.Pokaz(CKeyNill) then begin
    OdswiezListe;
  end;
end;

procedure TForm_Main.OdswiezListe;
var
  xResultHandle: TResultHandle;
  i: integer;
  xItem: TListItem;
  xid: Tid;
begin
  WyczyscListe;
  xResultHandle := TResultHandle.CreateSQL('Select idPlatnik, Nazwisko, Imie, Pesel from public.Platnik');
  xResultHandle.InvokeSql;
  xResultHandle.First;
  for i := 0 to xResultHandle.RecordCount - 1 do begin
    xid := Tid.Create;
    xid.Fid := xResultHandle.fieldbyname('IdPlatnik').AsInteger;
    xItem := ListViewMain.Items.Add;
    xItem.Caption := xResultHandle.fieldbyname('Imie').AsString;
    xItem.SubItems.Add(xResultHandle.fieldbyname('Nazwisko').AsString);
    xItem.SubItems.AddObject(xResultHandle.fieldbyname('Pesel').AsString, xid);
    xResultHandle.next;
  end;
  xResultHandle.Clear;
  xResultHandle.free;
end;

procedure TForm_Main.ToolButton_OdswiezClick(Sender: TObject);
begin
  OdswiezListe();
end;

procedure TForm_Main.FormDestroy(Sender: TObject);
begin
  WyczyscListe();
end;

procedure TForm_Main.WyczyscListe;
var
  i, j: integer;
  xItem: TListItem;
begin

  for i := 0 to ListViewMain.Items.Count - 1 do begin
    xItem := ListViewMain.Items.Item[i];
    for j := 0 to xItem.SubItems.Count - 1 do begin
      if Assigned(xItem.SubItems.Objects[j]) then begin
        xItem.SubItems.Objects[j].Free;
      end;
    end;
  end;
  ListViewMain.Clear;
end;

procedure TForm_Main.Action_EdytujExecute(Sender: TObject);
var
  xItem: TListItem;
  xObject: Tid;
begin
  if ListViewMain.ItemIndex <> -1 then begin
    xItem := ListViewMain.ItemFocused;
    xObject := Tid(xItem.SubItems.Objects[1]);
    if Assigned(xObject) then begin
      if TFormularzZus3.Pokaz(xObject.Fid) then begin
        OdswiezListe;
      end;
    end;
  end;
end;

procedure TForm_Main.Action_EdytujUpdate(Sender: TObject);
begin
  ToolButton_Edytuj.Enabled := ListViewMain.ItemIndex <> -1;
end;

procedure TForm_Main.Action_WydrukExecute(Sender: TObject);
var
  xObject: TosWydrukZUS3;
  xItem: TListItem;
  xid: Tid;
begin
  xItem := ListViewMain.Items.Item[ListViewMain.ItemIndex];
  xid := Tid(xItem.SubItems.Objects[1]);
  if Assigned(xid) then begin
    xObject := TosWydrukZUS3.Create(xid.Fid);
    xObject.PokazWydruk;
    xObject.Free;
  end;
end;

procedure TForm_Main.Action_WydrukUpdate(Sender: TObject);
begin
  ToolButton_Wydruk.Enabled := ListViewMain.ItemIndex <> -1;
end;

procedure TForm_Main.Action_EksportExecute(Sender: TObject);
var
  xObject: TosWydrukZUS3;
  xItem: TListItem;
  xid: Tid;
begin
  xItem := ListViewMain.Items.Item[ListViewMain.ItemIndex];
  xid := Tid(xItem.SubItems.Objects[1]);
  if Assigned(xid) then begin
    xObject := TosWydrukZUS3.Create(xid.Fid);
    xObject.EksportujWydruk;
    xObject.Free;
  end;
end;

procedure TForm_Main.Action_EksportUpdate(Sender: TObject);
begin
  ToolButton_Eksport.Enabled := ListViewMain.ItemIndex <> -1;
  Eksport1.Enabled := ToolButton_Eksport.Enabled;
end;

procedure TForm_Main.ToolButton_PlikiClick(Sender: TObject);
begin
  TFilesViver.show();
end;

procedure TForm_Main.Action_UsunExecute(Sender: TObject);
var
  xResultHandle: TResultHandle;
  xItem: TListItem;
  xid: Tid;
begin
  xItem := ListViewMain.Items.Item[ListViewMain.ItemIndex];
  xid := Tid(xItem.SubItems.Objects[1]);
  if Assigned(xid) then begin
    xResultHandle := TResultHandle.CreateSQL(format('Delete from public.platnik where idPlatnik=%s', [IntTostr(xid.Fid)]));
    xResultHandle.ExecuteSql;
    xResultHandle.Free;
    OdswiezListe;
    ShowMessage('Dane zosta³y usuniête.');
  end;
end;

procedure TForm_Main.Action_UsunUpdate(Sender: TObject);
begin
  ToolButton_Usun.Enabled := ListViewMain.ItemIndex <> -1;
end;

procedure TForm_Main.ListViewMainDblClick(Sender: TObject);
begin
  if ListViewMain.ItemIndex <> -1 then begin
    Action_Edytuj.Execute;
  end;
end;

end.

