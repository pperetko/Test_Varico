object Form_Main: TForm_Main
  Left = 291
  Top = 148
  Width = 937
  Height = 680
  Caption = 'Wydruk formularzy ZUS-3'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object ToolBar_main: TToolBar
    Left = 0
    Top = 0
    Width = 929
    Height = 49
    ButtonHeight = 21
    ButtonWidth = 47
    Caption = 'ToolBar_main'
    ShowCaptions = True
    TabOrder = 0
    object ToolButton_Dodaj: TToolButton
      Left = 0
      Top = 2
      AutoSize = True
      Caption = '&Dodaj'
      OnClick = Action_DodajExecute
    end
    object ToolButton_Usun: TToolButton
      Left = 39
      Top = 2
      Caption = 'Usu'#324
      ImageIndex = 1
    end
    object ToolButton_Edytuj: TToolButton
      Left = 86
      Top = 2
      Action = Action_Edytuj
    end
    object ToolButton_Pliki: TToolButton
      Left = 133
      Top = 2
      Caption = 'Pliki'
      ImageIndex = 3
    end
    object ToolButton_Odswiez: TToolButton
      Left = 180
      Top = 2
      Caption = 'Odswie'#380
      ImageIndex = 4
      OnClick = ToolButton_OdswiezClick
    end
  end
  object ListViewMain: TListView
    Left = 0
    Top = 49
    Width = 929
    Height = 585
    Align = alClient
    Columns = <
      item
        Caption = 'Imi'#281
        Width = 100
      end
      item
        Caption = 'Nazwisko'
        Width = 250
      end
      item
        Caption = 'Pesel'
        Width = 100
      end>
    GridLines = True
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 1
    ViewStyle = vsReport
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 634
    Width = 929
    Height = 19
    Panels = <>
  end
  object ActionList1: TActionList
    Left = 672
    Top = 16
    object Action_Edytuj: TAction
      Caption = '&Edytuj'
      OnExecute = Action_EdytujExecute
      OnUpdate = Action_EdytujUpdate
    end
  end
end
