unit DMPrint;

interface

uses
  SysUtils, Classes, frxClass, frxExportPDF;

type
  TDataModuleReport = class(TDataModule)
    frxReport: TfrxReport;
    frxUserDataSet: TfrxUserDataSet;
    frxPDFExport: TfrxPDFExport;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GDataModuleReport: TDataModuleReport;

implementation

{$R *.dfm}

end.
