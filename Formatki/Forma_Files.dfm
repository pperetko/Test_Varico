object Form_Files: TForm_Files
  Left = 338
  Top = 107
  BorderStyle = bsSingle
  Caption = 'Form_Files'
  ClientHeight = 554
  ClientWidth = 862
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar: TToolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 29
    ButtonHeight = 21
    ButtonWidth = 56
    Caption = 'ToolBar'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton_Odswiez: TToolButton
      Left = 0
      Top = 2
      Caption = '&Odswierz'
      ImageIndex = 0
    end
    object DateTimePicker: TDateTimePicker
      Left = 56
      Top = 2
      Width = 186
      Height = 21
      Date = 42441.656864513890000000
      Time = 42441.656864513890000000
      TabOrder = 0
    end
  end
  object Panel_dolny: TPanel
    Left = 0
    Top = 513
    Width = 862
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object Button_Zamknij: TButton
      Left = 768
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Zamknij'
      TabOrder = 0
    end
  end
  object ListView_Files: TListView
    Left = 0
    Top = 29
    Width = 862
    Height = 484
    Align = alClient
    Columns = <
      item
        Caption = 'Data utworzenia'
        Width = 150
      end
      item
        Caption = 'Nazwa'
        Width = 300
      end>
    GridLines = True
    ReadOnly = True
    RowSelect = True
    PopupMenu = PopupMenu1
    TabOrder = 2
    ViewStyle = vsReport
  end
  object PopupMenu1: TPopupMenu
    Left = 280
    Top = 192
    object Uruchom: TMenuItem
      Caption = 'Uruchom'
    end
  end
end
