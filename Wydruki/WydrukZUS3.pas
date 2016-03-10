unit WydrukZUS3;

interface

uses Database, dialogs, classes, sysUtils;
type
  TosWydrukZUS3 = class(TObject)
  private
    Fid: Integer;
    function PrzygotujRaport: TresultHandle;
  public
    constructor Create(Aid: Integer);
    procedure PokazWydruk;
    procedure EksportujWydruk;
  end;

implementation
uses DMPrint, frxClass, frxADOComponents, funkcje;
{ TosWydrukZUS3 }

constructor TosWydrukZUS3.Create(Aid: Integer);
begin
  Fid := Aid;
end;

procedure TosWydrukZUS3.EksportujWydruk;
begin

end;

procedure TosWydrukZUS3.PokazWydruk;
var
  xResultHandle: TResultHandle;
begin
  xResultHandle := PrzygotujRaport;
  try
   if xResultHandle.RecordCount>0 then begin
    GDataModuleReport.frxReport.PrepareReport(false);
    GDataModuleReport.frxReport.ShowPreparedReport;
    xResultHandle.free;
   end else begin
     ShowMessage('Brak danych do wydruku.');
   end;
  except
    ShowMessage('Nieprawidlowy wydruk.');
  end;
end;

function TosWydrukZUS3.PrzygotujRaport: TresultHandle;
var
  xPath: string;
  xQuery:string;
begin
   xQuery := format(
      ' Select Platnik.nip as platnik_nip, Platnik.regon as platnik_regon, Platnik.pesel as platnik_pesel, '+
      ' Platnik.rodzajdokumentu as platnik_rodzajDok, Platnik.serianumerdok  as platnik_seriaDok, ' +
      ' Platnik.nazwaskrocona as platnik_nazwaSkr,platnik.nazwisko as platnik_nazwisko, ' +
      ' Platnik.imie as platnik_imie, '+
      ' Pracownik.Pesel as prac_pesel, Pracownik.rodzajdokumentu as prac_rodzajDok, Pracownik.serianumerdokumentu as prac_seriaDok,' +
      ' Pracownik.nazwisko as prac_nazwisko, Pracownik.imie as prac_imie,  Pracownik.dataurodzenia as prac_dataUrodzenia,' +
      ' Adres.kodpocztowy as adres_kodPocztowy, Adres.poczta  as adres_poczta, Adres.gmina as adres_gmina, ' +
      ' Adres.miejscowosc as adres_miejscowosc, Adres.ulica as adres_ulica, Adres.numerdomu as adres_numerdomu ,' +
      ' Adres.numerlokalu as adres_numerLokalu, Adres.numertelefonu as adres_numertelefonu , Adres.symbolpanstwa as adres_symbolpanstwa,' +
      ' Adres.kodpocztowyzagr as adres_kodPocztowyzagr, Adres.nazwapanstwa as adres_nazwaPanstwa, Adres.email as adres_email ' +
      ' from public.Platnik ' +
      ' join public.Adres on Adres.idAdres=platnik.idAdresSiedziby ' +
      ' join public.Pracownik on Pracownik.idPracownik=Platnik.idPracownik ' +
      ' where Platnik.idPlatnik=%s', [intToStr(Fid)]);
  result := TResultHandle.CreateSQL(xQuery);
  result.InvokeSql;
  xPath := PodajPathSystem + 'Zus3.fr3';
  GDataModuleReport.frxReport.LoadFromFile(xPath);
  GDataModuleReport.DataSource1.DataSet := result;
end;

end.

