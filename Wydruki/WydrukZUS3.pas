unit WydrukZUS3;

interface

Type



 TosWydrukZUS3=class(TObject)
 private
  Fid:Integer;
  procedure PrzygotujRaport;
 public
  constructor Create(Aid:Integer);
  procedure PokazWydruk;
  procedure EksportujWydruk;
 end;

implementation
uses DMPrint,Database,frxClass;
{ TosWydrukZUS3 }

constructor TosWydrukZUS3.Create(Aid: Integer);
begin
 Fid:=Aid;
end;

procedure TosWydrukZUS3.EksportujWydruk;
begin

end;

procedure TosWydrukZUS3.PokazWydruk;
begin
  PrzygotujRaport;
  GDataModuleReport.frxReport.ShowPreparedReport;
end;

procedure TosWydrukZUS3.PrzygotujRaport;
var
 xResultHandle:TResultHandle;
begin
 xResultHandle:= TResultHandle.CreateSQL('Select * from public.platnik');
 xResultHandle.InvokeSql;
 GDataModuleReport.frxReport.LoadFromFile('Zus3.fr3');
 GDataModuleReport.frxUserDataSet.LoadFromStream(xResultHandle.DataSource)     DataSets.Add(TFrxDataSet(xResultHandle));
end;

end.
