object Form_AddEdit: TForm_AddEdit
  Left = 305
  Top = 107
  Width = 873
  Height = 644
  Caption = 'Formularz ZUS 3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label_NIP: TLabel
    Left = 16
    Top = 16
    Width = 70
    Height = 13
    Caption = '01. Numer NIP'
  end
  object Label_Regon: TLabel
    Left = 224
    Top = 16
    Width = 106
    Height = 13
    Caption = '02. Numer REGON (1)'
  end
  object Label_Pesel: TLabel
    Left = 464
    Top = 16
    Width = 86
    Height = 13
    Caption = '03. Numer PESEL'
  end
  object Label_RodzajDokumentu: TLabel
    Left = 3
    Top = 48
    Width = 107
    Height = 13
    Caption = '04. Rodzaj dokumentu'
  end
  object Label2: TLabel
    Left = 272
    Top = 48
    Width = 135
    Height = 13
    Caption = '05. Seria i numer dokumentu'
  end
  object Label_NazwaSkrocona: TLabel
    Left = 12
    Top = 79
    Width = 98
    Height = 13
    Caption = '06. Nazwa skr'#243'cona'
  end
  object Label3: TLabel
    Left = 46
    Top = 111
    Width = 64
    Height = 13
    Caption = '07. Nazwisko'
  end
  object Label_Imie: TLabel
    Left = 73
    Top = 143
    Width = 37
    Height = 13
    Caption = '08. Imi'#281
  end
  object Label_AkodPocztowy: TLabel
    Left = 20
    Top = 185
    Width = 85
    Height = 13
    Caption = '01. Kod pocztowy'
  end
  object Label_APoczta: TLabel
    Left = 208
    Top = 185
    Width = 51
    Height = 13
    Caption = '02. Poczta'
  end
  object Label_AGminaDzielnica: TLabel
    Left = 9
    Top = 208
    Width = 96
    Height = 13
    Caption = '03. Gmina/Dzielnica'
  end
  object Label_Amiejscowosc: TLabel
    Left = 26
    Top = 232
    Width = 79
    Height = 13
    Caption = '04. Miejscowo'#347#263
  end
  object Label_aUlica: TLabel
    Left = 63
    Top = 258
    Width = 42
    Height = 13
    Caption = '05. Ulica'
  end
  object Label_ANrDomu: TLabel
    Left = 27
    Top = 283
    Width = 78
    Height = 13
    Caption = '06. Numer domu'
  end
  object Label_ANumerLokalu: TLabel
    Left = 226
    Top = 283
    Width = 80
    Height = 13
    Caption = '07. Numer lokalu'
  end
  object Label_ANumerTelefonu: TLabel
    Left = 424
    Top = 283
    Width = 105
    Height = 13
    Caption = '08. Numer telefonu (1)'
  end
  object Label_SymbPanstwa: TLabel
    Left = 1
    Top = 307
    Width = 122
    Height = 13
    Caption = '09. Symbol pa'#324'stwa (2)(3)'
  end
  object LabelAZagrKodPoczt: TLabel
    Left = 232
    Top = 307
    Width = 160
    Height = 13
    Caption = '10. Zagraniczny kod pocztowy (2)'
  end
  object Label_ANazzwaPanstwa: TLabel
    Left = 14
    Top = 336
    Width = 109
    Height = 13
    Caption = '11. Nazwa pa'#324'stwa (2)'
  end
  object Label_AEmail: TLabel
    Left = 0
    Top = 368
    Width = 162
    Height = 13
    Caption = '12. Adres poczty elektronicznej (1)'
  end
  object Label_PPesel: TLabel
    Left = 8
    Top = 408
    Width = 101
    Height = 13
    Caption = '01. Numer PESEL (1)'
  end
  object Label_PRodzajDokumentu: TLabel
    Left = 245
    Top = 408
    Width = 107
    Height = 13
    Caption = '02. Rodzaj dokumentu'
  end
  object Label_PSeriaNumer: TLabel
    Left = 8
    Top = 432
    Width = 135
    Height = 13
    Caption = '03. Seria i numer dokumentu'
  end
  object Label_PNazwisko: TLabel
    Left = 39
    Top = 455
    Width = 64
    Height = 13
    Caption = '04. Nazwisko'
  end
  object Label_PImie: TLabel
    Left = 66
    Top = 479
    Width = 37
    Height = 13
    Caption = '05. Imi'#281
  end
  object Label_PDataUrodzenia: TLabel
    Left = 8
    Top = 504
    Width = 149
    Height = 13
    Caption = '06. Data urodzenia (dd/mm/rrrr)'
  end
  object MaskEdit_NIP: TMaskEdit
    Left = 96
    Top = 12
    Width = 116
    Height = 21
    EditMask = '9999999999;1;_'
    MaxLength = 10
    TabOrder = 0
    Text = '          '
  end
  object MaskEdit_Regon: TMaskEdit
    Left = 336
    Top = 12
    Width = 116
    Height = 21
    EditMask = '99999999999999;1;_'
    MaxLength = 14
    TabOrder = 1
    Text = '              '
  end
  object MaskEdit_Pesel: TMaskEdit
    Left = 560
    Top = 12
    Width = 117
    Height = 21
    EditMask = '99999999999;1;_'
    MaxLength = 11
    TabOrder = 2
    Text = '           '
  end
  object ComboBox_RodzajDokumentu: TComboBox
    Left = 112
    Top = 44
    Width = 142
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
  end
  object Edit_SeriaNumerDokumentu: TEdit
    Left = 416
    Top = 44
    Width = 262
    Height = 21
    MaxLength = 15
    TabOrder = 4
  end
  object Edit_NazwaSkrocona: TEdit
    Left = 112
    Top = 75
    Width = 566
    Height = 21
    TabOrder = 5
  end
  object Edit_Nazwisko: TEdit
    Left = 112
    Top = 107
    Width = 566
    Height = 21
    MaxLength = 31
    TabOrder = 6
  end
  object Edit_Imie: TEdit
    Left = 112
    Top = 139
    Width = 566
    Height = 21
    MaxLength = 31
    TabOrder = 7
  end
  object Memo_Pomoc1: TMemo
    Left = 685
    Top = 7
    Width = 166
    Height = 153
    Color = clBtnFace
    Lines.Strings = (
      '(1) Nale'#380'y wpisa'#263' numery NIP i '
      'REGON, a je'#380'eli nie nadano tych '
      'numer'#243'w albo jednego z nich, '
      'nale'#380'y wpisa'#263' numer PESEL lub '
      'seri'#281' i numer dowodu'
      'osobistego albo innego '
      'dokumentu potwierdzaj'#261'cego '
      'to'#380'samo'#347#263'.')
    TabOrder = 8
  end
  object MaskEdit_AKodPocztowy: TMaskEdit
    Left = 112
    Top = 181
    Width = 79
    Height = 21
    EditMask = '99-999;1;_'
    MaxLength = 6
    TabOrder = 9
    Text = '  -   '
  end
  object Edit_APoczta: TEdit
    Left = 266
    Top = 181
    Width = 415
    Height = 21
    MaxLength = 24
    TabOrder = 10
  end
  object Edit_AGminaDzielnica: TEdit
    Left = 112
    Top = 204
    Width = 415
    Height = 21
    MaxLength = 26
    TabOrder = 11
  end
  object Edit_AMiejscowosc: TEdit
    Left = 112
    Top = 228
    Width = 415
    Height = 21
    MaxLength = 26
    TabOrder = 12
  end
  object Edit_AUlica: TEdit
    Left = 112
    Top = 254
    Width = 415
    Height = 21
    MaxLength = 26
    TabOrder = 13
  end
  object Edit_ANrDomu: TEdit
    Left = 112
    Top = 279
    Width = 103
    Height = 21
    MaxLength = 7
    TabOrder = 14
  end
  object Edit_ANrLokalu: TEdit
    Left = 312
    Top = 279
    Width = 103
    Height = 21
    MaxLength = 7
    TabOrder = 15
  end
  object MaskEdit_ANumerTelefonu: TMaskEdit
    Left = 536
    Top = 279
    Width = 151
    Height = 21
    EditMask = '9999999999;1;_'
    MaxLength = 10
    TabOrder = 16
    Text = '          '
  end
  object Edit_ASymbolPanstwa: TEdit
    Left = 128
    Top = 303
    Width = 85
    Height = 21
    MaxLength = 2
    TabOrder = 17
  end
  object Edit_AZagrKodPocztowy: TEdit
    Left = 400
    Top = 303
    Width = 288
    Height = 21
    MaxLength = 12
    TabOrder = 18
  end
  object Edit_ANazwaPanstwa: TEdit
    Left = 128
    Top = 332
    Width = 272
    Height = 21
    MaxLength = 22
    TabOrder = 19
  end
  object Edit_AEmail: TEdit
    Left = 168
    Top = 360
    Width = 520
    Height = 21
    MaxLength = 26
    TabOrder = 20
  end
  object Panel1: TPanel
    Left = 0
    Top = 160
    Width = 856
    Height = 17
    BevelOuter = bvNone
    Caption = 'DANE ADRESOWE P'#321'ATNIKA SK'#321'ADEK '#8211' ADRES SIEDZIBY'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 21
  end
  object Panel2: TPanel
    Left = -1
    Top = 382
    Width = 864
    Height = 19
    Caption = 'DANE IDENTYFIKACYJNE PRACOWNIKA'
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 22
  end
  object MaskEdit_PPesel: TMaskEdit
    Left = 114
    Top = 404
    Width = 120
    Height = 21
    EditMask = '99999999999;1;_'
    MaxLength = 11
    TabOrder = 23
    Text = '           '
  end
  object ComboBox_PRodzajDokumentu: TComboBox
    Left = 358
    Top = 404
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 24
  end
  object Edit_PSeriaNumerDokumentu: TEdit
    Left = 152
    Top = 428
    Width = 265
    Height = 21
    MaxLength = 15
    TabOrder = 25
  end
  object EditPNazwisko: TEdit
    Left = 112
    Top = 451
    Width = 569
    Height = 21
    MaxLength = 31
    TabOrder = 26
  end
  object Edit_PIMie: TEdit
    Left = 111
    Top = 475
    Width = 569
    Height = 21
    MaxLength = 31
    TabOrder = 27
  end
  object DateTimePicker_PDataUrodzenia: TDateTimePicker
    Left = 168
    Top = 500
    Width = 186
    Height = 21
    Date = 42427.549729027780000000
    Time = 42427.549729027780000000
    TabOrder = 28
  end
  object Button_Akceptuj: TButton
    Left = 328
    Top = 584
    Width = 75
    Height = 25
    Caption = '&Akceptuj'
    TabOrder = 29
  end
  object Button_Anuluj: TButton
    Left = 416
    Top = 584
    Width = 75
    Height = 25
    Caption = 'A&nuluj'
    TabOrder = 30
  end
  object MemoPomoc2: TMemo
    Left = 688
    Top = 184
    Width = 169
    Height = 193
    Color = clBtnFace
    Lines.Strings = (
      '(1) Podanie numeru telefonu i '
      'adresu poczty elektronicznej nie '
      'jest obowi'#261'zkowe.'
      '(2) Wype'#322'ni'#263' w przypadku, gdy '
      'adres jest inny ni'#380' polski.'
      '(3) Podanie symbolu pa'#324'stwa nie '
      'jest konieczne, je'#380'eli wniosek jest '
      'zg'#322'aszany w formie papierowej.')
    TabOrder = 31
  end
  object MemoPOmoc3: TMemo
    Left = 693
    Top = 400
    Width = 169
    Height = 193
    Color = clBtnFace
    Lines.Strings = (
      '(1) Nale'#380'y wpisa'#263' numer PESEL, '
      'a je'#380'eli nie nadano tego numeru, '
      'nale'#380'y wpisa'#263' seri'#281' i numer '
      'dowodu osobistego albo innego '
      'dokumentu potwierdzaj'#261'cego'
      'to'#380'samo'#347#263)
    TabOrder = 32
  end
end
