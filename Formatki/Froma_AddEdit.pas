unit Froma_AddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ComCtrls;

type
  TForm_addEdit = class(TForm)
    Label_NIP: TLabel;
    MaskEdit_NIP: TMaskEdit;
    Label_Regon: TLabel;
    MaskEdit_Regon: TMaskEdit;
    Label_Pesel: TLabel;
    MaskEdit_Pesel: TMaskEdit;
    Label_RodzajDokumentu: TLabel;
    ComboBox_RodzajDokumentu: TComboBox;
    Label2: TLabel;
    Edit_SeriaNumerDokumentu: TEdit;
    Label_NazwaSkrocona: TLabel;
    Edit_NazwaSkrocona: TEdit;
    Label3: TLabel;
    Edit_Nazwisko: TEdit;
    Label_Imie: TLabel;
    Edit_Imie: TEdit;
    Memo_Pomoc1: TMemo;
    Label_AkodPocztowy: TLabel;
    MaskEdit_AKodPocztowy: TMaskEdit;
    Label_APoczta: TLabel;
    Edit_APoczta: TEdit;
    Label_AGminaDzielnica: TLabel;
    Edit_AGminaDzielnica: TEdit;
    Label_Amiejscowosc: TLabel;
    Edit_AMiejscowosc: TEdit;
    Label_aUlica: TLabel;
    Edit_AUlica: TEdit;
    Label_ANrDomu: TLabel;
    Edit_ANrDomu: TEdit;
    Label_ANumerLokalu: TLabel;
    Edit_ANrLokalu: TEdit;
    Label_ANumerTelefonu: TLabel;
    MaskEdit_ANumerTelefonu: TMaskEdit;
    Label_SymbPanstwa: TLabel;
    Edit_ASymbolPanstwa: TEdit;
    LabelAZagrKodPoczt: TLabel;
    Edit_AZagrKodPocztowy: TEdit;
    Label_ANazzwaPanstwa: TLabel;
    Edit_ANazwaPanstwa: TEdit;
    Label_AEmail: TLabel;
    Edit_AEmail: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label_PPesel: TLabel;
    MaskEdit_PPesel: TMaskEdit;
    Label_PRodzajDokumentu: TLabel;
    ComboBox_PRodzajDokumentu: TComboBox;
    Label_PSeriaNumer: TLabel;
    Edit_PSeriaNumerDokumentu: TEdit;
    Label_PNazwisko: TLabel;
    EditPNazwisko: TEdit;
    Label_PImie: TLabel;
    Edit_PIMie: TEdit;
    DateTimePicker_PDataUrodzenia: TDateTimePicker;
    Label_PDataUrodzenia: TLabel;
    Button_Akceptuj: TButton;
    Button_Anuluj: TButton;
    MemoPomoc2: TMemo;
    MemoPOmoc3: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;




  TFormularzZus3 = class(TObject)
  private
    Fid: integer;
    FFormatka: TForm_addEdit;
    procedure InicjujFormatke();
    procedure WyborAkceptuj(Asender: Tobject);
    procedure WyborAnuluj(Asender: Tobject);
    procedure UstawWartosciCombo();
    procedure UstawEdytowaneDane();
    procedure WyczyscKomponenty;
    function SprawdzWprowadzoneDane: boolean;
    procedure AkceptujDodanie;
    procedure AkceptujEdycje;
  public
    constructor Create(aid: integer);
    destructor destroy; override;
    class function Pokaz(aid: Integer): boolean;
    function PokazFormatke: boolean;




  end;




implementation
uses Stale, DataBase, funkcje, DB;

const
  cTypDokDowodosobisty = 0;
  cTypDokumentuInny = 1;


resourcestring

  cTypDokumentuDowodStr = 'Dowód osobisty';
  cTypDokumentuInnyStr = 'Inny dokument';

{$R *.dfm}

{ TFormularzZus3 }



constructor TFormularzZus3.Create(aid: integer);
begin
  Fid := aid;
  Application.CreateForm(TForm_addEdit, FFormatka);
  with FFormatka do begin
    InicjujFormatke;
  end;
end;

destructor TFormularzZus3.destroy;
begin
  inherited;
end;

procedure TFormularzZus3.InicjujFormatke;
begin
  with FFormatka do begin
    WyczyscKomponenty;
    UstawWartosciCombo;
    Button_Akceptuj.OnClick := WyborAkceptuj;
    Button_Anuluj.OnClick := WyborAnuluj;
  end;
end;

class function TFormularzZus3.Pokaz(aid: Integer): boolean;
var
  xObject: TFormularzZus3;
begin
  xObject := TFormularzZus3.Create(aid);
  result := xObject.PokazFormatke;
  xObject.Free;
end;

function TFormularzZus3.PokazFormatke: boolean;
begin
  result := false;
  with FFormatka do begin
    ShowModal;
    if ModalResult = mrOk then begin
      result := true;
    end;
    free;
  end;
end;

function TFormularzZus3.SprawdzWprowadzoneDane: boolean;
begin
  result := true;
end;

procedure TFormularzZus3.UstawEdytowaneDane;
var
  xZapytanie: string;
  xResultHandle: TResultHandle;
begin
  with FFormatka do begin
    xZapytanie := format('Select * from public.Platnik ' +
      ' join public.Adres on Adres.idAdres=platnik.idAdresSiedziby ' +
      ' join public.Pracownik on Pracownik.idPracownik=Platnik.idPracownik ' +
      ' where Platnik.idPlatnik=%s', [intToStr(Fid)]);
    xResultHandle := TResultHandle.CreateSQL(xZapytanie);
    xResultHandle.InvokeSql;
    if xResultHandle.RecordCount = 1 then begin
      WyczyscKomponenty; //Adres
      Edit_APoczta.Text := xResultHandle.fieldbyname('poczta').AsString;
      Edit_AGminaDzielnica.Text := xResultHandle.fieldbyname('gmina').AsString;
      Edit_AMiejscowosc.Text := xResultHandle.fieldbyname('miejscowosc').AsString;
      Edit_AUlica.Text := xResultHandle.fieldbyname('ulica').AsString;
      Edit_ANrDomu.Text := xResultHandle.fieldbyname('numerdomu').AsString;
      Edit_ANrLokalu.Text := xResultHandle.fieldbyname('numerlokalu').AsString;
      MaskEdit_ANumerTelefonu.Text := xResultHandle.fieldbyname('numertelefonu').AsString;
      Edit_ASymbolPanstwa.Text := xResultHandle.fieldbyname('symbolpanstwa').AsString;
      Edit_AZagrKodPocztowy.Text := xResultHandle.fieldbyname('kodpocztowyzagr').AsString;
      Edit_ANazwaPanstwa.Text := xResultHandle.fieldbyname('nazwapanstwa').AsString;
      Edit_AEmail.Text := xResultHandle.fieldbyname('email').AsString;
       //Pracownik;
      if xResultHandle.FieldByName('rodzajdokumentu').AsInteger = cTypDokDowodOsobisty then begin
        ComboBox_PRodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuDowodStr);
      end else begin
        ComboBox_PRodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuInnyStr);
      end;
      Edit_PSeriaNumerDokumentu.Text := xResultHandle.Fieldbyname('serianumerdokumentu').AsString;
      EditPNazwisko.Text := xResultHandle.Fieldbyname('nazwisko').AsString;
      Edit_PIMie.Text := xResultHandle.Fieldbyname('imie').AsString;
      try
        DateTimePicker_PDataUrodzenia.DateTime := StrToDateTime(xResultHandle.fieldbyname('dataurodzenia').AsString);
      except
        DateTimePicker_PDataUrodzenia.DateTime := 0;
      end;
      //Platnik
      MaskEdit_NIP.text := xResultHandle.fieldbyname('nip').AsString;
      MaskEdit_Regon.text := xResultHandle.fieldbyname('regon').AsString;
      MaskEdit_Pesel.Text := xResultHandle.fieldbyname('pesel').AsString;
      if xResultHandle.FieldByName('rodzajdokumentu').AsInteger = cTypDokDowodOsobisty then begin
        ComboBox_RodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuDowodStr);
      end else begin
        ComboBox_RodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuInnyStr);
      end;
      Edit_SeriaNumerDokumentu.Text := xResultHandle.fieldbyname('serianumerdok').AsString;
      Edit_NazwaSkrocona.Text := xResultHandle.fieldbyname('nazwaskrocona').asString;
      Edit_Nazwisko.Text := xResultHandle.fieldbyname('nazwisko').AsString;
      Edit_Imie.Text := xResultHandle.fieldbyname('imie').AsString;

    end;
    xResultHandle.Clear;
    xResultHandle.Free;
  end;
end;

procedure TFormularzZus3.UstawWartosciCombo;
begin
  with FFormatka do begin
    ComboBox_RodzajDokumentu.Items.Add(cTypDokumentuDowodStr);
    ComboBox_RodzajDokumentu.Items.Add(ctypDokumentuInnyStr);
    ComboBox_RodzajDokumentu.ItemIndex := 0;
    ComboBox_PRodzajDokumentu.Items.Add(cTypDokumentuDowodStr);
    ComboBox_PRodzajDokumentu.Items.Add(ctypDokumentuInnyStr);
    ComboBox_PRodzajDokumentu.ItemIndex := 0;
  end;
end;

procedure TFormularzZus3.WyborAkceptuj;
begin
  with FFormatka do begin
    if SprawdzWprowadzoneDane then begin
      if Fid = CKeyNill then begin
        AkceptujDodanie;
      end else begin
        AkceptujEdycje();
      end;
      ModalResult := mrOk;
    end;
  end;
end;

procedure TFormularzZus3.WyborAnuluj;
begin
  with FFormatka do begin
    ModalResult := mrCancel;
  end;
end;

procedure TFormularzZus3.WyczyscKomponenty;
begin
  with FFormatka do begin
    MaskEdit_NIP.Text := EmptyStr;
    MaskEdit_Regon.Text := EmptyStr;
    MaskEdit_Pesel.Text := EmptyStr;
    ComboBox_RodzajDokumentu.ItemIndex := -1;
    Edit_SeriaNumerDokumentu.Text := EmptyStr;
    Edit_NazwaSkrocona.Text := EmptyStr;
    Edit_Nazwisko.Text := EmptyStr;
    Edit_Imie.Text := EmptyStr;
    MaskEdit_AKodPocztowy.Text := EmptyStr;
    Edit_APoczta.Text := EmptyStr;
    Edit_AGminaDzielnica.Text := EmptyStr;
    Edit_AMiejscowosc.Text := EmptyStr;
    Edit_AUlica.Text := EmptyStr;
    Edit_ANrDomu.Text := EmptyStr;
    Edit_ANrLokalu.Text := EmptyStr;
    MaskEdit_ANumerTelefonu.Text := EmptyStr;
    Edit_ASymbolPanstwa.Text := EmptyStr;
    Edit_AZagrKodPocztowy.Text := EmptyStr;
    Edit_ANazwaPanstwa.Text := EmptyStr;
    Edit_AEmail.Text := EmptyStr;
    MaskEdit_PPesel.Text := EmptyStr;
    ComboBox_PRodzajDokumentu.ItemIndex := -1;
    Edit_PSeriaNumerDokumentu.Text := EmptyStr;
    EditPNazwisko.Text := EmptyStr;
    Edit_PIMie.Text := EmptyStr;
    DateTimePicker_PDataUrodzenia.DateTime := now();
  end;
end;

procedure TFormularzZus3.AkceptujDodanie;
var
  xZapytanie: string;
  xKluczAdres: integer;
  xKluczPracownik: integer;
  xResultHandle: TResultHandle;
  xRodzajDok: byte;
  xidPlatnik: integer;
begin
  with FFormatka do begin
    try
      GdataBase.BeginTransaction();
      xKluczAdres := GdataBase.MaxId('Adres');
      xZapytanie := Format('Insert into public.Adres(idAdres,kodpocztowy,poczta,gmina,  ' +
        ' miejscowosc, ulica, numerdomu, numerlokalu, numertelefonu, symbolpanstwa,' +
        ' kodpocztowyzagr, nazwapanstwa, email) values(%s,''%s'',''%s'',''%s'',' +
        ' ''%s'',''%s'', ''%s'',''%s'',''%s'', ''%s'',' +
        ' ''%s'',''%s'', ''%s'')',
        [IntToStr(xKluczAdres), PodajWartosc(StringReplace(MaskEdit_AKodPocztowy.Text, '-', '', [rfReplaceAll])),
        PodajWartosc(Edit_APoczta.Text), PodajWartosc(Edit_AGminaDzielnica.Text),
          PodajWartosc(Edit_AMiejscowosc.Text), PodajWartosc(Edit_AUlica.Text), PodajWartosc(Edit_ANrDomu.Text), PodajWartosc(Edit_ANrLokalu.Text),
          PodajWartosc(MaskEdit_ANumerTelefonu.Text), PodajWartosc(Edit_ASymbolPanstwa.Text),
          PodajWartosc(Edit_AZagrKodPocztowy.Text), PodajWartosc(Edit_ANazwaPanstwa.Text), PodajWartosc(Edit_AEmail.Text)]);

      xResultHandle := TResultHandle.createSQL(xZapytanie);
      xResultHandle.ExecuteSql;
      xResultHandle.Clear;

      xKluczPracownik := GdataBase.MaxId('Pracownik');
      xRodzajDok := 0;
      if ComboBox_PRodzajDokumentu.Text = cTypDokumentuDowodStr then begin
        xRodzajDok := cTypDokDowodosobisty;
      end;
      xZapytanie := format('Insert into public.Pracownik( idpracownik, rodzajdokumentu, serianumerdokumentu, ' +
        ' nazwisko, imie, dataurodzenia ) values(%s, %s,''%s'',''%s'',''%s'',''%s'')',
        [intToStr(xKluczPracownik), inttoStr(xRodzajDok),
        PodajWartosc(Edit_PSeriaNumerDokumentu.Text), PodajWartosc(EditPNazwisko.Text), PodajWartosc(Edit_PIMie.Text),
          DateTimeToStr(DateTimePicker_PDataUrodzenia.DateTime)]

        );

      xResultHandle.Add(xZapytanie);
      xResultHandle.ExecuteSql;
      xResultHandle.Clear;

      xidPlatnik := GdataBase.MaxId('Platnik');
      xRodzajDok := 0;
      if ComboBox_RodzajDokumentu.Text = cTypDokumentuDowodStr then begin
        xRodzajDok := cTypDokDowodosobisty;
      end;
      xZapytanie := format('Insert into public.Platnik(idPlatnik, nip,regon, pesel, rodzajdokumentu,' +
        ' serianumerdok, nazwaskrocona, nazwisko, imie, idadressiedziby, idpracownik  ) values' +
        '(%s,''%s'',''%s'', ''%s'',%s,' +
        ' ''%s'',''%s'', ''%s'',''%s'',%s,%s)', [IntToStr(xidPlatnik), PodajWartosc(MaskEdit_NIP.text),
        PodajWartosc(MaskEdit_Regon.text),
          PodajWartosc(MaskEdit_Pesel.Text), IntToStr(xRodzajDok), PodajWartosc(Edit_SeriaNumerDokumentu.Text),
          PodajWartosc(Edit_NazwaSkrocona.Text), PodajWartosc(Edit_Nazwisko.Text),
          PodajWartosc(Edit_Imie.Text), IntToStr(xKluczAdres),
          IntToStr(xKluczPracownik)]);

      xResultHandle.Add(xZapytanie);
      xResultHandle.ExecuteSql;
      xResultHandle.Free;

      GdataBase.Commit;
    except
      GdataBase.Rollback;
      GKomunikat.WyswietlKomunikat('Blad wykonania zapytania', 'Bl¹d');
    end;
  end;
end;

procedure TFormularzZus3.AkceptujEdycje;
var
  xZapytanie: string;
  xKluczAdres: integer;
  xKluczPracownik: integer;
  xResultHandle: TResultHandle;
  xRodzajDok: byte;
  xidPlatnik: integer;
begin
  with FFormatka do begin
    if SprawdzWprowadzoneDane then begin
      xZapytanie := format('Update public.Adres set kodpocztowy=' + PodajWartosc(StringReplace(MaskEdit_AKodPocztowy.Text, '-', '', [rfReplaceAll])) + ',' +
        ' poczta=' + PodajWartosc(Edit_APoczta.Text) + ',' +
        ' gmina=' + PodajWartosc(Edit_AGminaDzielnica.Text) + ',' +
        ' miejscowosc=' + PodajWartosc(Edit_AMiejscowosc.Text) + ',' +
        ' ulica= ' + PodajWartosc(Edit_AUlica.Text) + ',' +
        ' numerdomu=' + PodajWartosc(Edit_ANrDomu.Text) + ',' +
        ' numerlokalu=' + PodajWartosc(Edit_ANrLokalu.Text) + ',' +
        ' numertelefonu=' + PodajWartosc(MaskEdit_ANumerTelefonu.Text) + ',' +
        ' symbolpanstwa=' + PodajWartosc(Edit_ASymbolPanstwa.Text) + ',' +
        ' kodpocztowyzagr=' + PodajWartosc(Edit_AZagrKodPocztowy.Text) + ',' +
        ' nazwapanstwa=' + PodajWartosc(Edit_ANazwaPanstwa.Text) + ',' +
        ' email=' + PodajWartosc(Edit_AEmail.Text) +
        ' where idAdres=%s ', []);


      xRodzajDok := 0;
      if ComboBox_RodzajDokumentu.Text = cTypDokumentuDowodStr then begin
        xRodzajDok := cTypDokDowodosobisty;
      end;

      xZapytanie := format(' Update public.Pracownik set rodzajdokumentu= ' + inttoStr(xRodzajDok) + ',' +
        ' serianumerdokumentu = ' + PodajWartosc(Edit_PSeriaNumerDokumentu.Text) + ',' +
        ' nazwisko=' + PodajWartosc(EditPNazwisko.Text) + ',' +
        ' imie= ' + PodajWartosc(Edit_PIMie.Text) + ',' +
        ' dataurodzenia =' + DateTimeToStr(DateTimePicker_PDataUrodzenia.DateTime) +
        ' where idPracownik=%s ', []);


      xRodzajDok := 0;
      if ComboBox_RodzajDokumentu.Text = cTypDokumentuDowodStr then begin
        xRodzajDok := cTypDokDowodosobisty;
      end;

      xZapytanie := format(' Update  public.Platnik set nip =' + PodajWartosc(MaskEdit_NIP.text) + ',' +
        ' regon=' + PodajWartosc(MaskEdit_Regon.text) + '.' +
        ' pesel=' + PodajWartosc(MaskEdit_Pesel.Text) + ',' +
        ' rodzajdokumentu=' + IntToStr(xRodzajDok) + ',' +
        ' serianumerdok=' + PodajWartosc(Edit_SeriaNumerDokumentu.Text) + ',' +
        ' nazwaskrocona=' + PodajWartosc(Edit_NazwaSkrocona.Text) + ',' +
        ' nazwisko=' + PodajWartosc(Edit_Nazwisko.Text) + ',' +
        ' imie= ' + PodajWartosc(Edit_Imie.Text) +
        ' where idPlatnik=%s', []);




    end;
  end;
end;



end.

