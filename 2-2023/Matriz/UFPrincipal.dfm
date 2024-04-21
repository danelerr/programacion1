object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MATRIZ'
  ClientHeight = 804
  ClientWidth = 1099
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 13
  object SGMatriz: TStringGrid
    Left = 48
    Top = 32
    Width = 969
    Height = 545
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 48
    Top = 576
    Width = 969
    Height = 73
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 1016
    Top = 32
    Width = 65
    Height = 617
    Kind = sbVertical
    Max = 128
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 2
    OnChange = ScrollBar2Change
  end
  object MainMenu1: TMainMenu
    Left = 416
    Top = 384
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Cargar Matriz'
        OnClick = Metodos2Click
      end
      object MostrarMatriz1: TMenuItem
        Caption = 'Mostrar Matriz'
        OnClick = MostrarMatriz1Click
      end
    end
  end
end
