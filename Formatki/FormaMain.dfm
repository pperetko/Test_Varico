object Form_Main: TForm_Main
  Left = 345
  Top = 146
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
    ButtonWidth = 50
    Caption = 'ToolBar_main'
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 0
    object ToolButton_Dodaj: TToolButton
      Left = 0
      Top = 2
      HelpType = htKeyword
      HelpKeyword = 'Dodanie danych do bazy'
      AutoSize = True
      Caption = '&Dodaj'
      OnClick = Action_DodajExecute
    end
    object ToolButton_Usun: TToolButton
      Left = 39
      Top = 2
      HelpType = htKeyword
      Action = Action_Usun
    end
    object ToolButton_Edytuj: TToolButton
      Left = 89
      Top = 2
      HelpType = htKeyword
      Action = Action_Edytuj
    end
    object ToolButton1: TToolButton
      Left = 139
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton_Wydruk: TToolButton
      Left = 147
      Top = 2
      HelpType = htKeyword
      Action = Action_Wydruk
    end
    object ToolButton_Eksport: TToolButton
      Left = 197
      Top = 2
      HelpType = htKeyword
      Action = Action_Eksport
    end
    object ToolButton_Pliki: TToolButton
      Left = 247
      Top = 2
      HelpType = htKeyword
      HelpKeyword = 'formatka z wyeksportowanymi plikami pdf'
      Caption = 'Pliki'
      ImageIndex = 3
      OnClick = ToolButton_PlikiClick
    end
    object ToolButton2: TToolButton
      Left = 297
      Top = 2
      Width = 8
      Caption = 'ToolButton2'
      ImageIndex = 5
      Style = tbsSeparator
    end
    object ToolButton_Odswiez: TToolButton
      Left = 305
      Top = 2
      Hint = 'Od'#347'wie'#380'enie listy danych do wydruku'
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
    PopupMenu = PopupMenu1
    TabOrder = 1
    ViewStyle = vsReport
    OnDblClick = ListViewMainDblClick
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
    object Action_Wydruk: TAction
      Caption = '&Wydruk'
      OnExecute = Action_WydrukExecute
      OnUpdate = Action_WydrukUpdate
    end
    object Action_Eksport: TAction
      Caption = '&Eksport'
      OnExecute = Action_EksportExecute
      OnUpdate = Action_EksportUpdate
    end
    object Action_Usun: TAction
      Caption = '&Usu'#324
      OnExecute = Action_UsunExecute
      OnUpdate = Action_UsunUpdate
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 656
    Top = 120
    object Eksport1: TMenuItem
      Action = Action_Eksport
    end
  end
end
