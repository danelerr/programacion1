object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 372
  ClientWidth = 770
  Color = clHighlight
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object vec: TStringGrid
    Left = 8
    Top = 89
    Width = 505
    Height = 225
    ColCount = 3
    DefaultColWidth = 150
    DefaultRowHeight = 30
    FixedCols = 0
    RowCount = 2
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object Button1: TButton
    Left = 16
    Top = 339
    Width = 75
    Height = 25
    Caption = 'adicionar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'cargar'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 16
    Top = 47
    Width = 75
    Height = 25
    Caption = 'mostrar'
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 104
    Top = 341
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 432
    Top = 341
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object MainMenu1: TMainMenu
    Left = 736
    Top = 8
    object Opciones1: TMenuItem
      Caption = 'Opciones '
      object Opciones2: TMenuItem
        Caption = 'mayor km'
        OnClick = Opciones2Click
      end
      object buscan1: TMenuItem
        Caption = 'busca n'
        OnClick = buscan1Click
      end
    end
  end
end
