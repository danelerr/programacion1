object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 415
  ClientWidth = 682
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object StringGrid1: TStringGrid
    Left = 24
    Top = 32
    Width = 633
    Height = 41
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    GridLineWidth = 5
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 24
    Top = 112
    Width = 625
    Height = 17
    Max = 1024
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object MainMenu1: TMainMenu
    Left = 264
    Top = 232
    object Vector1: TMenuItem
      Caption = 'Vector'
      object Vector2: TMenuItem
        Caption = 'Cargar Aleatorio'
        OnClick = Vector2Click
      end
      object Mostrarvector1: TMenuItem
        Caption = 'Mostrar vector'
        OnClick = Mostrarvector1Click
      end
      object QuickSort1: TMenuItem
        Caption = 'Quick Sort'
        OnClick = QuickSort1Click
      end
      object MergeSort1: TMenuItem
        Caption = 'Merge Sort'
        OnClick = MergeSort1Click
      end
    end
  end
end
