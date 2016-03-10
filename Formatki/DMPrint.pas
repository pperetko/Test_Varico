unit DMPrint;

interface

uses
  SysUtils, Classes, frxClass, frxExportPDF, DB, frxADOComponents, frxDBSet;

type
  TDataModuleReport = class(TDataModule)
    frxReport: TfrxReport;
    frxPDFExport: TfrxPDFExport;
    DataSource1: TDataSource;
    frxDBDataset1: TfrxDBDataset;
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
