unit Forma_Files;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, ToolWin, StdCtrls, Menus;

type
  TForm_Files = class(TForm)
    ToolBar: TToolBar;
    Panel_dolny: TPanel;
    ListView_Files: TListView;
    ToolButton_Odswiez: TToolButton;
    DateTimePicker: TDateTimePicker;
    Button_Zamknij: TButton;
    PopupMenu1: TPopupMenu;
    Uruchom: TMenuItem;
  private
    { Private declarations }
  public
    { Public declarations }
  end;


  TFilesViver = class(TObject)
  private
    FFormatka: TForm_Files;
    procedure OdswiezListe;
    procedure WyczyscListe();
    procedure InicjujFormatke;
    procedure WyborOdswiez(Asender: TObject);

    procedure WyborZamknij(Asender: TObject);
    procedure WyborUruchmomPlik(asender: TObject);
    procedure DblClickLista(Asender: TObject);
  public
    constructor Create();
    destructor destroy; override;
    class procedure Show();
    procedure PokazFormatke;
  end;



implementation
uses DataBase, Funkcje, DateUtils;
{$R *.dfm}

{ TFilesViver }

constructor TFilesViver.Create;
begin
  Application.CreateForm(TForm_Files, FFormatka);
  with FFormatka do begin
    InicjujFormatke;
  end;
end;

procedure TFilesViver.DblClickLista(Asender: TObject);
begin
  with FFormatka do begin
    WyborUruchmomPlik(asender);
  end;
end;

destructor TFilesViver.destroy;
begin
  WyczyscListe;
  if Assigned(FFormatka) then begin
    FFormatka.Free;
  end;
  inherited;
end;

procedure TFilesViver.InicjujFormatke;
begin
  with FFormatka do begin
    Button_Zamknij.OnClick := WyborZamknij;
    Caption := 'Folder wydruków: ' + GdataBase.foldereksport;
    DateTimePicker.DateTime := now();
    ToolButton_Odswiez.OnClick := WyborOdswiez;
    Uruchom.OnClick := WyborUruchmomPlik;
    ListView_Files.OnDblClick:= DblClickLista;
  end;
end;

procedure TFilesViver.OdswiezListe;
begin
  with FFormatka do begin
    OdswiezListe;
  end;
end;

procedure TFilesViver.PokazFormatke;
begin
  with FFormatka do begin
    ShowModal;
  end;
end;

class procedure TFilesViver.Show;
var
  xObject: TFilesViver;
begin
  xObject := TFilesViver.Create;
  xObject.PokazFormatke;
  xObject.Free;
end;

procedure TFilesViver.WyborOdswiez(Asender: TObject);
var
  xResultHandle: TResultHandle;
  i: integer;
  xItem: TListItem;
  xid: Tid;
begin
  WyczyscListe;
  with FFormatka do begin
    xResultHandle := TResultHandle.CreateSQL(format('Select * from public.plik where cast(dataUtworzenia as date)=''%s'''
      , [DateToStr(DateTimePicker.Date)]));
    xResultHandle.InvokeSql;
    xResultHandle.First;
    for i := 0 to xResultHandle.RecordCount - 1 do begin
      xid := Tid.Create;
      xid.Fid := xResultHandle.fieldbyname('Idm').AsInteger;
      xItem := ListView_Files.Items.Add;
      xItem.Caption := xResultHandle.fieldbyname('DataUtworzenia').AsString;
      xItem.SubItems.AddObject(xResultHandle.fieldbyname('Nazwa').AsString, xid);
      xResultHandle.next;
    end;
    xResultHandle.Clear;
    xResultHandle.free;
  end;
end;

procedure TFilesViver.WyborUruchmomPlik(asender: TObject);
var
  xNazwa: string;
  xItem: TListItem;
begin
  with FFormatka do begin
    if ListView_Files.ItemIndex <> -1 then begin
      xItem := ListView_Files.Items.Item[ListView_Files.ItemIndex];
      if Assigned(xItem) then begin
        xNazwa := IncludeTrailingPathDelimiter(GdataBase.foldereksport) +
          xItem.SubItems.Strings[0];
        UruchamiajProgramy(xNazwa);
      end;
    end;
  end;
end;

procedure TFilesViver.WyborZamknij(Asender: TObject);
begin
  with FFormatka do begin
    close;
  end;
end;

procedure TFilesViver.WyczyscListe;
var
  i, j: integer;
  xItem: TListItem;
begin
  with FFormatka do begin
    for i := 0 to ListView_Files.Items.Count - 1 do begin
      xItem := ListView_Files.Items.Item[i];
      for j := 0 to xItem.SubItems.Count - 1 do begin
        if Assigned(xItem.SubItems.Objects[j]) then begin
          xItem.SubItems.Objects[j].Free;
        end;
      end;
    end;
    ListView_Files.Clear;
  end;
end;

end.

