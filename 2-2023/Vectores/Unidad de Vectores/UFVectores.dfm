object VECTORES: TVECTORES
  Left = 334
  Top = 148
  Caption = 'VECTORES'
  ClientHeight = 468
  ClientWidth = 695
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = True
  Position = poDesigned
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 232
    Top = 208
    Width = 5
    Height = 25
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -21
    Font.Name = 'Arial Narrow'
    Font.Style = []
    ParentFont = False
  end
  object RCantidad: TLabel
    Left = 512
    Top = 187
    Width = 50
    Height = 13
    Caption = 'RCantidad'
  end
  object RInicio: TLabel
    Left = 529
    Top = 214
    Width = 32
    Height = 13
    Caption = 'RInicio'
  end
  object RFinal: TLabel
    Left = 529
    Top = 241
    Width = 29
    Height = 13
    Caption = 'RFinal'
  end
  object SGVector: TStringGrid
    AlignWithMargins = True
    Left = 24
    Top = 56
    Width = 649
    Height = 57
    Color = clHighlight
    ColCount = 1
    FixedColor = clBtnHighlight
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goEditing]
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 24
    Top = 135
    Width = 649
    Height = 17
    PageSize = 0
    TabOrder = 1
    OnChange = ScrollBar1Change
  end
  object Button1: TButton
    Left = 255
    Top = 8
    Width = 89
    Height = 42
    Caption = 'MOSTRAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 144
    Top = 8
    Width = 81
    Height = 42
    Caption = 'CARGAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object RCantidadText: TEdit
    Left = 566
    Top = 184
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '5'
  end
  object RInicioText: TEdit
    Left = 566
    Top = 211
    Width = 121
    Height = 21
    TabOrder = 5
    Text = '1'
  end
  object RFinalText: TEdit
    Left = 566
    Top = 238
    Width = 121
    Height = 21
    TabOrder = 6
    Text = '100'
  end
  object CheckBox1: TCheckBox
    Left = 606
    Top = 265
    Width = 97
    Height = 17
    Caption = 'Decimal'
    TabOrder = 7
  end
  object Button3: TButton
    Left = 525
    Top = 265
    Width = 75
    Height = 25
    Caption = 'Generar'
    TabOrder = 8
    OnClick = Button3Click
  end
  object MainMenu1: TMainMenu
    Left = 40
    Top = 8
    object Vectores1: TMenuItem
      Caption = 'Metodos'
      object Obtenerelemento1: TMenuItem
        Caption = 'Obtener elemento'
        OnClick = Obtenerelemento1Click
      end
      object Aadirelemento1: TMenuItem
        Caption = 'A'#241'adir elemento'
        OnClick = Aadirelemento1Click
      end
      object Insertarelemento1: TMenuItem
        Caption = 'Insertar elemento'
        OnClick = Insertarelemento1Click
      end
      object Modificarelemento1: TMenuItem
        Caption = 'Modificar elemento'
        OnClick = Modificarelemento1Click
      end
      object Eliminarelemento1: TMenuItem
        Caption = 'Eliminar elemento'
        OnClick = Eliminarelemento1Click
      end
      object Dimension1: TMenuItem
        Caption = 'Dimension'
        OnClick = Dimension1Click
      end
      object Sumarelementos1: TMenuItem
        Caption = 'Sumar elementos'
        OnClick = Sumarelementos1Click
      end
      object Encontrarelemento1: TMenuItem
        Caption = 'Encontrar elemento'
        OnClick = Encontrarelemento1Click
      end
      object Intercambiar1: TMenuItem
        Caption = 'Intercambiar'
        OnClick = Intercambiar1Click
      end
      object Elementomenor1: TMenuItem
        Caption = 'Elemento menor'
        OnClick = Elementomenor1Click
      end
    end
    object Busqueda1: TMenuItem
      Caption = 'Busqueda'
      object Busqueda2: TMenuItem
        Caption = 'Metodo Secuencial'
        OnClick = Busqueda2Click
      end
    end
    object Ordenacin1: TMenuItem
      Caption = 'Ordenaci'#243'n'
      object Ordenacnintercambio1: TMenuItem
        Caption = 'Ordenac'#243'n por intercambio'
        OnClick = Ordenacnintercambio1Click
      end
      object OrdenacinporSeleccin1: TMenuItem
        Caption = 'Ordenaci'#243'n por Selecci'#243'n'
        OnClick = OrdenacinporSeleccin1Click
      end
      object OrdenacinporBurbuja1: TMenuItem
        Caption = 'Ordenaci'#243'n por Burbuja'
        OnClick = OrdenacinporBurbuja1Click
      end
      object OrdenacinporShell1: TMenuItem
        Caption = 'Ordenaci'#243'n por Shell'
        OnClick = OrdenacinporShell1Click
      end
      object OrdenacionporQuickSort1: TMenuItem
        Caption = 'Ordenacion por QuickSort'
        OnClick = OrdenacionporQuickSort1Click
      end
    end
  end
end
