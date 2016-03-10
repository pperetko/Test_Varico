object DataModuleReport: TDataModuleReport
  OldCreateOrder = False
  Left = 680
  Top = 643
  Height = 274
  Width = 563
  object frxReport: TfrxReport
    Version = '4.15'
    DataSet = frxDBDataset1
    DataSetName = 'frxDBDataset1'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42436.598467916700000000
    ReportOptions.LastChange = 42439.800160092600000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'procedure Memo26OnBeforePrint(Sender: TfrxComponent);'
      'begin'
      '   if (trim(<frxDBDataset1."adres_kodPocztowy">)<>'#39#39') then'
      
        '    Memo26.text:= copy(<frxDBDataset1."adres_kodPocztowy">,1,2)+' +
        #39'-'#39'+'
      '    copy(<frxDBDataset1."adres_kodPocztowy">,3,5);'
      '  '
      'end;'
      ''
      'begin'
      ''
      ''
      ''
      'end.          ')
    Left = 40
    Top = 16
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      object ReportTitle1: TfrxReportTitle
        Height = 185.196970000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 7.559060000000000000
          Top = 3.000000000000000000
          Width = 264.567100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            'ZAK'#313#129'AD UBEZPIECZE'#313#131' SPO'#313#129'ECZNYCH')
        end
        object Line1: TfrxLineView
          Top = 22.677180000000000000
          Width = 721.890230000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          Left = 34.015770000000000000
          Top = 79.370130000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            
              ' . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .' +
              ' . . . .')
        end
        object Memo4: TfrxMemoView
          Left = 7.559060000000000000
          Top = 98.267780000000000000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            'Piecz'#196#8230'tka p'#313#8218'atnika sk'#313#8218'adek [1]')
        end
        object Memo5: TfrxMemoView
          Left = 173.858380000000000000
          Top = 124.724490000000000000
          Width = 370.393940000000000000
          Height = 52.913420000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          HAlign = haCenter
          Memo.UTF8 = (
            'ZA'#313#353'WIADCZENIE P'#313#129'ATNIKA SK'#313#129'ADEK'
            'Przed wype'#313#8218'nieniem nale'#313#317'y zapozna'#196#8225' si'#196#8482' z pouczeniem'
            '(wype'#313#8218'nia p'#313#8218'atnik sk'#313#8218'adek)')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 646.299630000000000000
          Top = 2.779530000000001000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'ZUS Z-3')
          ParentFont = False
        end
      end
      object PageHeader1: TfrxPageHeader
        Height = 230.551330000000000000
        Top = 226.771800000000000000
        Width = 718.110700000000000000
        Child = frxReport.Child1
        object Memo6: TfrxMemoView
          Left = 3.779530000000000000
          Top = 42.354360000000010000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_nip"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 4.000000000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'DANE IDENTYFIKACYJNE P'#313#129'ATNIKA SK'#313#129'ADEK')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 234.330860000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '01. Numer NIP (wpisa'#196#8225' bez kresek) (1)')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 260.787570000000000000
          Top = 18.897650000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8 = (
            '02. Numer REGON (1) ')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 260.787570000000000000
          Top = 42.354360000000010000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_regon"]')
          ParentFont = False
        end
        object Line2: TfrxLineView
          Top = 18.897479129999990000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo11: TfrxMemoView
          Left = 3.779530000000000000
          Top = 64.252010000000010000
          Width = 117.165430000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '03. Numer PESEL')
        end
        object Memo12: TfrxMemoView
          Left = 154.960730000000000000
          Top = 64.252010000000010000
          Width = 147.401670000000000000
          Height = 64.252010000000000000
          ShowHint = False
          Memo.UTF8 = (
            '04. Rodzaj dokumentu '
            'to'#313#317'samo'#313#8250'ci: je'#313#8250'li dow'#258#322'd'
            'osobisty, wpisa'#196#8225' 1, je'#313#8250'li'
            'inny dokument '#226#8364#8220' 2')
        end
        object Memo13: TfrxMemoView
          Left = 3.779530000000000000
          Top = 83.149660000000010000
          Width = 147.401670000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'platnik_pesel'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_pesel"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 325.039580000000000000
          Top = 83.149660000000010000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          ShowHint = False
          DataField = 'platnik_rodzajDok'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_rodzajDok"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          Left = 366.614410000000000000
          Top = 64.252010000000010000
          Width = 188.976500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '05. Seria i numer dokumentu')
        end
        object Memo16: TfrxMemoView
          Left = 366.614410000000000000
          Top = 83.149660000000010000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_seriaDok"]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          Left = 3.779530000000000000
          Top = 109.385900000000000000
          Width = 132.283550000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '06. Nazwa skr'#258#322'cona')
        end
        object Memo18: TfrxMemoView
          Left = 3.779530000000000000
          Top = 128.504020000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_nazwaSkr"]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          Left = 3.779530000000000000
          Top = 149.181200000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '07. Nazwisko')
        end
        object Memo20: TfrxMemoView
          Left = 3.779530000000000000
          Top = 170.078850000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_nazwisko"]')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          Left = 3.779530000000000000
          Top = 188.976500000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '08. Imi'#196#8482)
        end
        object Memo22: TfrxMemoView
          Left = 3.779530000000000000
          Top = 207.874150000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."platnik_imie"]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          Left = 578.268090000000000000
          Top = 34.015770000000010000
          Width = 136.063080000000000000
          Height = 192.756030000000000000
          ShowHint = False
          Memo.UTF8 = (
            
              '(1) Nale'#313#317'y wpisa'#196#8225' numery NIP i REGON, a je'#313#317'eli nie nadano tyc' +
              'h numer'#258#322'w albo jednego z nich, nale'#313#317'y wpisa'#196#8225' numer PESEL lub ' +
              'seri'#196#8482' i numer dowodu'
            'osobistego albo innego dokumentu potwierdzaj'#196#8230'cego to'#313#317'samo'#313#8250#196#8225'.')
        end
      end
      object Child1: TfrxChild
        Height = 298.582870000000000000
        Top = 480.000310000000000000
        Width = 718.110700000000000000
        Child = frxReport.Child2
        object Memo24: TfrxMemoView
          Left = 3.779530000000000000
          Width = 313.700990000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'DANE ADRESOWE P'#313#129'ATNIKA SK'#313#129'ADEK '#226#8364#8220' ADRES SIEDZIBY')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          Left = 3.779530000000000000
          Top = 18.897650000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '01. Kod pocztowy')
        end
        object Line3: TfrxLineView
          Left = -3.779530000000000000
          Top = 15.118119999999980000
          Width = 718.110700000000000000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo26: TfrxMemoView
          Left = 3.779530000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 18.897650000000000000
          OnBeforePrint = 'Memo26OnBeforePrint'
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_kodPocztowy"]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          Left = 128.504020000000000000
          Top = 18.897650000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '02. Poczta')
        end
        object Memo28: TfrxMemoView
          Left = 128.504020000000000000
          Top = 37.795300000000000000
          Width = 442.205010000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_poczta"]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          Left = 3.779530000000000000
          Top = 60.472480000000010000
          Width = 185.196970000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '03. Gmina/Dzielnica')
        end
        object Memo30: TfrxMemoView
          Left = 3.779530000000000000
          Top = 79.370130000000010000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_gmina"]')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          Left = 3.779530000000000000
          Top = 98.267780000000010000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '04. Miejscowo'#313#8250#196#8225)
        end
        object Memo32: TfrxMemoView
          Left = 3.779530000000000000
          Top = 120.944960000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_miejscowosc"]')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          Left = 3.779530000000000000
          Top = 143.622140000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '05. Ulica')
        end
        object Memo34: TfrxMemoView
          Left = 3.779530000000000000
          Top = 166.299320000000000000
          Width = 566.929500000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_ulica"]')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          Left = 3.779530000000000000
          Top = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '06. Numer domu')
        end
        object Memo36: TfrxMemoView
          Left = 124.724490000000000000
          Top = 185.196970000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '07. Numer lokalu')
        end
        object Memo37: TfrxMemoView
          Left = 241.889920000000000000
          Top = 185.196970000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '08. Numer telefonu (1)')
        end
        object Memo38: TfrxMemoView
          Left = 408.189240000000000000
          Top = 185.196970000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            ' 09. Symbol pa'#313#8222'stwa (2)(3)')
        end
        object Memo39: TfrxMemoView
          Left = 3.779530000000000000
          Top = 204.094620000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_numerdomu"]')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          Left = 124.724490000000000000
          Top = 204.094620000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_numerlokalu"]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          Left = 241.889920000000000000
          Top = 204.094620000000000000
          Width = 158.740260000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_numertelefonu"]')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          Left = 408.189240000000000000
          Top = 204.094620000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_symbolpanstwa"]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          Left = 3.779530000000000000
          Top = 222.992270000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '10. Zagraniczny kod pocztowy (2)')
        end
        object Memo44: TfrxMemoView
          Left = 241.889920000000000000
          Top = 222.992270000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '11. Nazwa pa'#313#8222'stwa (2)')
        end
        object Memo45: TfrxMemoView
          Left = 3.779530000000000000
          Top = 241.889920000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_kodPocztowyzagr"]')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          Left = 245.669450000000000000
          Top = 241.889920000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_nazwapanstwa"]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          Left = 3.779530000000000000
          Top = 260.787570000000000000
          Width = 109.606370000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '12. Adres poczty elektronicznej (1)')
        end
        object Memo48: TfrxMemoView
          Left = 3.779530000000000000
          Top = 279.685220000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."adres_email"]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          Left = 578.268090000000000000
          Top = 37.795300000000000000
          Width = 124.724490000000000000
          Height = 249.448980000000000000
          ShowHint = False
          Memo.UTF8 = (
            
              '(1) Podanie numeru telefonu i adresu poczty elektronicznej nie j' +
              'est obowi'#196#8230'zkowe.'
            '(2) Wype'#313#8218'ni'#196#8225' w przypadku, gdy adres jest inny ni'#313#317' polski.'
            
              '(3) Podanie symbolu pa'#313#8222'stwa nie jest konieczne, je'#313#317'eli wniosek' +
              ' jest zg'#313#8218'aszany w formie papierowej.')
        end
      end
      object Child2: TfrxChild
        Height = 245.669450000000000000
        Top = 801.260360000000000000
        Width = 718.110700000000000000
        object Memo50: TfrxMemoView
          Left = 3.779530000000000000
          Top = 3.779530000000022000
          Width = 215.433210000000000000
          Height = 15.118120000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            'DANE IDENTYFIKACYJNE PRACOWNIKA')
          ParentFont = False
        end
        object Line4: TfrxLineView
          Top = 22.677180000000020000
          Width = 721.890230000001200000
          ShowHint = False
          Frame.Typ = [ftTop]
        end
        object Memo51: TfrxMemoView
          Left = 3.779530000000000000
          Top = 22.677180000000020000
          Width = 136.063080000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '01. Numer PESEL (1)')
        end
        object Memo52: TfrxMemoView
          Left = 181.417440000000000000
          Top = 24.236239999999950000
          Width = 154.960730000000000000
          Height = 60.472480000000000000
          ShowHint = False
          Memo.UTF8 = (
            '02. Rodzaj dokumentu'
            'to'#313#317'samo'#313#8250'ci: je'#313#8250'li dow'#258#322'd'
            'osobisty, wpisa'#196#8225' 1, je'#313#8250'li'
            'inny dokument '#226#8364#8220' 2')
        end
        object Memo53: TfrxMemoView
          Left = 381.732530000000000000
          Top = 22.677180000000020000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '03. Seria i numer dokumentu')
        end
        object Memo54: TfrxMemoView
          Left = 3.779530000000000000
          Top = 45.354360000000040000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."Prac_Pesel"]')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          Left = 328.819110000000000000
          Top = 45.354360000000040000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."prac_rodzajDok"]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          Left = 381.732530000000000000
          Top = 45.354360000000040000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."prac_seriaDok"]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          Left = 3.779530000000000000
          Top = 68.031539999999950000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '04. Nazwisko')
        end
        object Memo58: TfrxMemoView
          Left = 3.779530000000000000
          Top = 94.488250000000000000
          Width = 566.929499999999900000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."prac_nazwisko"]')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          Left = 3.779530000000000000
          Top = 117.165430000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '05. Imi'#196#8482)
        end
        object Memo60: TfrxMemoView
          Left = 3.779530000000000000
          Top = 136.063080000000000000
          Width = 355.275820000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."prac_imie"]')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          Left = 366.614410000000000000
          Top = 117.165430000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            '06. Data urodzenia (dd/mm/rrrr)')
        end
        object Memo62: TfrxMemoView
          Left = 366.614410000000000000
          Top = 136.063080000000000000
          Width = 238.110390000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8 = (
            '[frxDBDataset1."prac_dataUrodzenia"]')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          Top = 170.078850000000000000
          Width = 642.520100000000000000
          Height = 18.897650000000000000
          ShowHint = False
          Memo.UTF8 = (
            
              '(1) Nale'#313#317'y wpisa'#196#8225' numer PESEL, a je'#313#317'eli nie nadano tego numer' +
              'u, nale'#313#317'y wpisa'#196#8225' seri'#196#8482' i numer dowodu osobistego albo innego ' +
              'dokumentu potwierdzaj'#196#8230'cego'
            'to'#313#317'samo'#313#8250#196#8225)
        end
      end
    end
  end
  object frxPDFExport: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    Left = 232
    Top = 16
  end
  object DataSource1: TDataSource
    Left = 160
    Top = 80
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSource = DataSource1
    BCDToCurrency = False
    Left = 96
    Top = 24
  end
end
