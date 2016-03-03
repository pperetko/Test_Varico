object Form_Main: TForm_Main
  Left = 244
  Top = 191
  Width = 870
  Height = 640
  Caption = 'Wydruk formularzy ZUS-3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar_main: TToolBar
    Left = 0
    Top = 0
    Width = 862
    Height = 49
    ButtonHeight = 21
    ButtonWidth = 41
    Caption = 'ToolBar_main'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton_Dodaj: TToolButton
      Left = 0
      Top = 2
      Action = Action_Dodaj
      AutoSize = True
    end
    object ToolButton_Usun: TToolButton
      Left = 39
      Top = 2
      Caption = 'Usu'#324
      ImageIndex = 1
    end
    object ToolButton_Edytuj: TToolButton
      Left = 80
      Top = 2
      Caption = 'Edytuj'
      ImageIndex = 2
    end
    object ToolButton_Pliki: TToolButton
      Left = 121
      Top = 2
      Caption = 'Pliki'
      ImageIndex = 3
    end
  end
  object ListView1: TListView
    Left = 0
    Top = 49
    Width = 862
    Height = 545
    Align = alClient
    Columns = <>
    TabOrder = 1
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 594
    Width = 862
    Height = 19
    Panels = <>
  end
  object ActionList1: TActionList
    Left = 672
    Top = 16
    object Action_Dodaj: TAction
      Caption = '&Dodaj'
      OnExecute = Action_DodajExecute
    end
  end
  object ADOConnection1: TADOConnection
    Provider = 'PostgreSQL OLE DB Provider'
    Left = 352
    Top = 192
  end
end
