unit Froma_AddEdit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask;

type
  TFrom_AddEdit = class(TForm)
    Label_NIP: TLabel;
    Label_Regon: TLabel;
    Label_Pesel: TLabel;
    Label_RodzajDokumentu: TLabel;
    Label2: TLabel;
    Label_NazwaSkrocona: TLabel;
    Label3: TLabel;
    Label_Imie: TLabel;
    Label_AkodPocztowy: TLabel;
    Label_APoczta: TLabel;
    Label_AGminaDzielnica: TLabel;
    Label_Amiejscowosc: TLabel;
    Label_aUlica: TLabel;
    Label_ANrDomu: TLabel;
    Label_ANumerLokalu: TLabel;
    Label_ANumerTelefonu: TLabel;
    Label_SymbPanstwa: TLabel;
    LabelAZagrKodPoczt: TLabel;
    Label_ANazzwaPanstwa: TLabel;
    Label_AEmail: TLabel;
    Label_PPesel: TLabel;
    Label_PRodzajDokumentu: TLabel;
    Label_PSeriaNumer: TLabel;
    Label_PNazwisko: TLabel;
    Label_PImie: TLabel;
    Label_PDataUrodzenia: TLabel;
    MaskEdit_NIP: TMaskEdit;
    MaskEdit_Regon: TMaskEdit;
    MaskEdit_Pesel: TMaskEdit;
    ComboBox_RodzajDokumentu: TComboBox;
    Edit_SeriaNumerDokumentu: TEdit;
    Edit_NazwaSkrocona: TEdit;
    Edit_Nazwisko: TEdit;
    Edit_Imie: TEdit;
    Memo_Pomoc1: TMemo;
    MaskEdit_AKodPocztowy: TMaskEdit;
    Edit_APoczta: TEdit;
    Edit_AGminaDzielnica: TEdit;
    Edit_AMiejscowosc: TEdit;
    Edit_AUlica: TEdit;
    Edit_ANrDomu: TEdit;
    Edit_ANrLokalu: TEdit;
    MaskEdit_ANumerTelefonu: TMaskEdit;
    Edit_ASymbolPanstwa: TEdit;
    Edit_AZagrKodPocztowy: TEdit;
    Edit_ANazwaPanstwa: TEdit;
    Edit_AEmail: TEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    MaskEdit_PPesel: TMaskEdit;
    ComboBox_PRodzajDokumentu: TComboBox;
    Edit_PSeriaNumerDokumentu: TEdit;
    EditPNazwisko: TEdit;
    Edit_PIMie: TEdit;
    DateTimePicker_PDataUrodzenia: TDateTimePicker;
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
    FFormatka: TFrom_addEdit;
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

var
  From_AddEdit: TFrom_AddEdit;

implementation


uses Stale, DataBase, funkcje, DB;

const
  cTypDokDowodosobisty = 1;
  cTypDokumentuInny = 2;

resourcestring

  cTypDokumentuDowodStr = 'Dowód osobisty';
  cTypDokumentuInnyStr = 'Inny dokument';




{$R *.dfm}



constructor TFormularzZus3.Create(aid: integer);
begin
  Fid := aid;
  Application.CreateForm(TFrom_addEdit, FFormatka);
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
    UstawEdytowaneDane;
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
    xZapytanie := format(
      ' Select Platnik.nip as platnik_nip, Platnik.regon as platnik_regon, Platnik.pesel as platnik_pesel, ' +
      ' Platnik.rodzajdokumentu as platnik_rodzajDok, Platnik.serianumerdok  as platnik_seriaDok, ' +
      ' Platnik.nazwaskrocona as platnik_nazwaSkr,platnik.nazwisko as platnik_nazwisko, ' +
      ' Platnik.imie as platnik_imie,Pracownik.Pesel as prac_pesel, Pracownik.rodzajdokumentu as prac_rodzajDok, Pracownik.serianumerdokumentu as prac_seriaDok,' +
      ' Pracownik.nazwisko as prac_nazwisko, Pracownik.imie as prac_imie,  Pracownik.dataurodzenia as prac_dataUrodzenia,' +
      ' Adres.kodpocztowy as adres_kodPocztowy, Adres.poczta  as adres_poczta, Adres.gmina as adres_gmina, ' +
      ' Adres.miejscowosc as adres_miejscowosc, Adres.ulica as adres_ulica, Adres.numerdomu as adres_numerdomu ,' +
      ' Adres.numerlokalu as adres_numerLokalu, Adres.numertelefonu as adres_numertelefonu , Adres.symbolpanstwa as adres_symbolpanstwa,' +
      ' Adres.kodpocztowyzagr as adres_kodPocztowyzagr, Adres.nazwapanstwa as adres_nazwaPanstwa, Adres.email as adres_email ' +
      ' from public.Platnik ' +
      ' join public.Adres on Adres.idAdres=platnik.idAdresSiedziby ' +
      ' join public.Pracownik on Pracownik.idPracownik=Platnik.idPracownik ' +
      ' where Platnik.idPlatnik=%s', [intToStr(Fid)]);
    xResultHandle := TResultHandle.CreateSQL(xZapytanie);
    xResultHandle.InvokeSql;
    if xResultHandle.RecordCount = 1 then begin
      WyczyscKomponenty; //Adres
      MaskEdit_AKodPocztowy.Text := copy(xResultHandle.fieldbyname('adres_kodPocztowy').AsString, 1, 2) + '-' +
        copy(xResultHandle.fieldbyname('adres_kodPocztowy').AsString, 3,
        length(xResultHandle.fieldbyname('adres_kodPocztowy').AsString));
      Edit_APoczta.Text := xResultHandle.fieldbyname('adres_poczta').AsString;
      Edit_AGminaDzielnica.Text := xResultHandle.fieldbyname('adres_gmina').AsString;
      Edit_AMiejscowosc.Text := xResultHandle.fieldbyname('adres_miejscowosc').AsString;
      Edit_AUlica.Text := xResultHandle.fieldbyname('adres_ulica').AsString;
      Edit_ANrDomu.Text := xResultHandle.fieldbyname('adres_numerdomu').AsString;
      Edit_ANrLokalu.Text := xResultHandle.fieldbyname('adres_numerLokalu').AsString;
      MaskEdit_ANumerTelefonu.Text := xResultHandle.fieldbyname('adres_numertelefonu').AsString;
      Edit_ASymbolPanstwa.Text := xResultHandle.fieldbyname('adres_symbolpanstwa').AsString;
      Edit_AZagrKodPocztowy.Text := xResultHandle.fieldbyname('adres_kodPocztowyzagr').AsString;
      Edit_ANazwaPanstwa.Text := xResultHandle.fieldbyname('adres_nazwaPanstwa').AsString;
      Edit_AEmail.Text := xResultHandle.fieldbyname('adres_email').AsString;
       //Pracownik;
      MaskEdit_PPesel.Text:= xResultHandle.fieldbyname('prac_pesel').AsString;
      if xResultHandle.FieldByName('prac_rodzajDok').AsInteger = cTypDokDowodOsobisty then begin
        ComboBox_PRodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuDowodStr);
      end else begin
        ComboBox_PRodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuInnyStr);
      end;
      Edit_PSeriaNumerDokumentu.Text := xResultHandle.Fieldbyname('prac_seriaDok').AsString;
      EditPNazwisko.Text := xResultHandle.Fieldbyname('prac_nazwisko').AsString;
      Edit_PIMie.Text := xResultHandle.Fieldbyname('prac_imie').AsString;
      try
        DateTimePicker_PDataUrodzenia.DateTime := StrToDateTime(xResultHandle.fieldbyname('prac_dataUrodzenia').AsString);
      except
        DateTimePicker_PDataUrodzenia.DateTime := 0;
      end;
      //Platnik
      MaskEdit_NIP.text := xResultHandle.fieldbyname('platnik_nip').AsString;
      MaskEdit_Regon.text := xResultHandle.fieldbyname('platnik_regon').AsString;
      MaskEdit_Pesel.Text := xResultHandle.fieldbyname('platnik_pesel').AsString;
      if xResultHandle.FieldByName('platnik_rodzajDok').AsInteger = cTypDokDowodOsobisty then begin
        ComboBox_RodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuDowodStr);
      end else begin
        ComboBox_RodzajDokumentu.ItemIndex := ComboBox_PRodzajDokumentu.Items.IndexOf(cTypDokumentuInnyStr);
      end;
      Edit_SeriaNumerDokumentu.Text := xResultHandle.fieldbyname('platnik_seriaDok').AsString;
      Edit_NazwaSkrocona.Text := xResultHandle.fieldbyname('platnik_nazwaSkr').asString;
      Edit_Nazwisko.Text := xResultHandle.fieldbyname('platnik_nazwisko').AsString;
      Edit_Imie.Text := xResultHandle.fieldbyname('platnik_imie').AsString;

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

      if ComboBox_PRodzajDokumentu.Text = cTypDokumentuDowodStr then begin
        xRodzajDok := cTypDokDowodosobisty;
      end else begin
        xRodzajDok := cTypDokumentuInny;
      end;
      xZapytanie := format('Insert into public.Pracownik( idpracownik, rodzajdokumentu, serianumerdokumentu, ' +
        ' nazwisko, imie, dataurodzenia, pesel ) values(%s, %s,''%s'',''%s'',''%s'',''%s'',''%s'')',
        [intToStr(xKluczPracownik), inttoStr(xRodzajDok),
        PodajWartosc(Edit_PSeriaNumerDokumentu.Text), PodajWartosc(EditPNazwisko.Text), PodajWartosc(Edit_PIMie.Text),
          DateTimeToStr(DateTimePicker_PDataUrodzenia.DateTime), PodajWartosc(MaskEdit_PPesel.Text)]

        );

      xResultHandle.Add(xZapytanie);
      xResultHandle.ExecuteSql;
      xResultHandle.Clear;

      xidPlatnik := GdataBase.MaxId('Platnik');

      if ComboBox_RodzajDokumentu.Text = cTypDokumentuDowodStr then begin
        xRodzajDok := cTypDokDowodosobisty;
      end else begin
        xRodzajDok := cTypDokumentuInny;
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
begin
  with FFormatka do begin
    if SprawdzWprowadzoneDane then begin
      try
        GdataBase.BeginTransaction;
        xZapytanie := format(' Select idAdresSiedziby, idPracownik from public.Platnik where idPlatnik=%s ',
          [intToStr(Fid)]);
        xResultHandle := TResultHandle.CreateSQL(xZapytanie);
        xResultHandle.InvokeSql;
        xKluczAdres := xResultHandle.fieldbyname('idAdresSiedziby').AsInteger;
        xKluczPracownik := xResultHandle.fieldbyname('idPracownik').AsInteger;


        xZapytanie := format('Update public.Adres set kodpocztowy=' +
          QuotedStr(PodajWartosc(StringReplace(MaskEdit_AKodPocztowy.Text, '-', '', [rfReplaceAll]))) + ',' +
          ' poczta=' + QuotedStr(PodajWartosc(Edit_APoczta.Text)) + ',' +
          ' gmina=' + QuotedStr(PodajWartosc(Edit_AGminaDzielnica.Text)) + ',' +
          ' miejscowosc=' + QuotedStr(PodajWartosc(Edit_AMiejscowosc.Text)) + ',' +
          ' ulica= ' + QuotedStr(PodajWartosc(Edit_AUlica.Text)) + ',' +
          ' numerdomu=' + QuotedStr(PodajWartosc(Edit_ANrDomu.Text)) + ',' +
          ' numerlokalu=' + QuotedStr(PodajWartosc(Edit_ANrLokalu.Text)) + ',' +
          ' numertelefonu=' + QuotedStr(PodajWartosc(MaskEdit_ANumerTelefonu.Text)) + ',' +
          ' symbolpanstwa=' + QuotedStr(PodajWartosc(Edit_ASymbolPanstwa.Text)) + ',' +
          ' kodpocztowyzagr=' + QuotedStr(PodajWartosc(Edit_AZagrKodPocztowy.Text)) + ',' +
          ' nazwapanstwa=' + PodajWartosc(Edit_ANazwaPanstwa.Text) + ',' +
          ' email=' + QuotedStr(PodajWartosc(Edit_AEmail.Text)) +
          ' where idAdres=%s ', [intToStr(xKluczAdres)]);

        xResultHandle.Clear;
        xResultHandle.Add(xZapytanie);
        xResultHandle.ExecuteSql;


        if ComboBox_RodzajDokumentu.Text = cTypDokumentuDowodStr then begin
          xRodzajDok := cTypDokDowodosobisty;
        end else begin
          xRodzajDok := cTypDokumentuInny;
        end;

        xZapytanie := format(' Update public.Pracownik set rodzajdokumentu= '
          + inttoStr(xRodzajDok) + ',' +
          ' serianumerdokumentu = ' + QuotedStr(PodajWartosc(Edit_PSeriaNumerDokumentu.Text)) + ',' +
          ' nazwisko=' + QuotedStr(PodajWartosc(EditPNazwisko.Text)) + ',' +
          ' imie= ' + QuotedStr(PodajWartosc(Edit_PIMie.Text)) + ',' +
          ' pesel= '+ QuotedStr(MaskEdit_PPesel.Text)+','+
          ' dataurodzenia =' + QuotedStr(DateTimeToStr(DateTimePicker_PDataUrodzenia.DateTime)) +
          ' where idPracownik=%s ', [IntToStr(xKluczPracownik)]);

        xResultHandle.Clear;
        xResultHandle.Add(xZapytanie);
        xResultHandle.ExecuteSql;


        if ComboBox_PRodzajDokumentu.Text = cTypDokumentuDowodStr then begin
          xRodzajDok := cTypDokDowodosobisty;
        end else begin
          xRodzajDok := cTypDokumentuInny;
        end;

        xZapytanie := format(' Update  public.Platnik set nip =' + QuotedStr(PodajWartosc(MaskEdit_NIP.text)) + ',' +
          ' regon=' + QuotedStr(PodajWartosc(MaskEdit_Regon.text)) + ',' +
          ' pesel=' + QuotedStr(PodajWartosc(MaskEdit_Pesel.Text)) + ',' +
          ' rodzajdokumentu=' + IntToStr(xRodzajDok) + ',' +
          ' serianumerdok=' + QuotedStr(PodajWartosc(Edit_SeriaNumerDokumentu.Text)) + ',' +
          ' nazwaskrocona=' + QuotedStr(PodajWartosc(Edit_NazwaSkrocona.Text)) + ',' +
          ' nazwisko=' + QuotedStr(PodajWartosc(Edit_Nazwisko.Text)) + ',' +
          ' imie= ' + QuotedStr(PodajWartosc(Edit_Imie.Text)) +
          ' where idPlatnik=%s', [IntTostr(Fid)]);

        xResultHandle.Clear;
        xResultHandle.Add(xZapytanie);
        xResultHandle.ExecuteSql;


        GdataBase.Commit;
      except
        GdataBase.Rollback;
      end;
    end;
  end;
end;




end.
