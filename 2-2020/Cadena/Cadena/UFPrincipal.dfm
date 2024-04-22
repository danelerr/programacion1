object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CADENAS'
  ClientHeight = 443
  ClientWidth = 629
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
  object Label1: TLabel
    Left = 48
    Top = 200
    Width = 7
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 48
    Top = 32
    Width = 177
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 352
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 248
    Top = 360
    Width = 89
    Height = 41
    Caption = 'Button1'
    TabOrder = 2
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 192
    Top = 216
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Cargar1: TMenuItem
        Caption = 'Cargar cadena'
        OnClick = Cargar1Click
      end
      object Mostrarcadena1: TMenuItem
        Caption = 'Mostrar cadena'
        OnClick = Mostrarcadena1Click
      end
      object InsertarCaracter1: TMenuItem
        Caption = 'Insertar Caracter'
        OnClick = InsertarCaracter1Click
      end
      object Invertircaracteres1: TMenuItem
        Caption = 'Invertir caracteres'
        OnClick = Invertircaracteres1Click
      end
      object Longitud1: TMenuItem
        Caption = 'Longitud'
        OnClick = Longitud1Click
      end
      object ContarPalabras1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = ContarPalabras1Click
      end
      object SiguientePalabra1: TMenuItem
        Caption = 'Siguiente Palabra'
        OnClick = SiguientePalabra1Click
      end
      object nPalabra1: TMenuItem
        Caption = 'n'#39'Palabra'
        OnClick = nPalabra1Click
      end
      object Obtenerhoramenor1: TMenuItem
        Caption = 'Obtener hora menor'
        OnClick = Obtenerhoramenor1Click
      end
      object Eliminarcomienzaconsonante1: TMenuItem
        Caption = 'Eliminar comienza consonante'
        OnClick = Eliminarcomienzaconsonante1Click
      end
      object FormatearHora1: TMenuItem
        Caption = 'Formatear Hora'
        OnClick = FormatearHora1Click
      end
      object Eliminarpalabrasconvocalrepetida1: TMenuItem
        Caption = 'Eliminar palabras con vocal repetida'
        OnClick = Eliminarpalabrasconvocalrepetida1Click
      end
      object Eliminarpalabrasub1: TMenuItem
        Caption = 'Eliminar palabra sub'
        OnClick = Eliminarpalabrasub1Click
      end
      object Sumarrealesyredondear1: TMenuItem
        Caption = 'Sumar reales y redondear'
        OnClick = Sumarrealesyredondear1Click
      end
    end
  end
end
