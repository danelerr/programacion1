object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MATRIZ'
  ClientHeight = 501
  ClientWidth = 771
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object SGMatriz: TStringGrid
    Left = 144
    Top = 24
    Width = 489
    Height = 337
    ColCount = 1
    DefaultColWidth = 48
    DefaultRowHeight = 48
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Segoe UI'
    Font.Style = []
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing, goFixedRowDefAlign]
    ParentFont = False
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 144
    Top = 375
    Width = 481
    Height = 17
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object ScrollBar2: TScrollBar
    Left = 639
    Top = 24
    Width = 17
    Height = 368
    Kind = sbVertical
    Min = 1
    PageSize = 0
    Position = 1
    TabOrder = 2
    OnChange = ScrollBar2Change
  end
  object MainMenu1: TMainMenu
    Left = 56
    Top = 208
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
      object CargarAleatorio1: TMenuItem
        Caption = 'Cargar Aleatorio'
        OnClick = CargarAleatorio1Click
      end
      object Cargarserie1: TMenuItem
        Caption = 'Cargar serie '
        OnClick = Cargarserie1Click
      end
      object Obtenermayor1: TMenuItem
        Caption = 'Obtener mayor numero en fila colum'
        OnClick = Obtenermayor1Click
      end
      object Ordenarcolumna1: TMenuItem
        Caption = 'Ordenar columna'
        OnClick = Ordenarcolumna1Click
      end
    end
  end
end