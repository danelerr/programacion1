object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Numeros'
  ClientHeight = 423
  ClientWidth = 567
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
    Left = 296
    Top = 56
    Width = 8
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 33
    Height = 13
    Caption = 'VALOR'
  end
  object Edit1: TEdit
    Left = 80
    Top = 53
    Width = 177
    Height = 41
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 160
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object ObtenerValor1: TMenuItem
        Caption = 'Mostrar Valor'
        OnClick = ObtenerValor1Click
      end
      object CambiarValor1: TMenuItem
        Caption = 'Obtener Valor'
        OnClick = CambiarValor1Click
      end
      object CamtidaddeDigitos1: TMenuItem
        Caption = 'Camtidad de Digitos'
        OnClick = CamtidaddeDigitos1Click
      end
      object EliminarDigito1: TMenuItem
        Caption = 'Eliminar Digito'
        OnClick = EliminarDigito1Click
      end
      object InsertarDigito1: TMenuItem
        Caption = 'Insertar Digito'
        OnClick = InsertarDigito1Click
      end
      object ObtenerDigito1: TMenuItem
        Caption = 'Obtener Digito'
        OnClick = ObtenerDigito1Click
      end
      object ModificarDigito1: TMenuItem
        Caption = 'Modificar Digito'
        OnClick = ModificarDigito1Click
      end
      object LlevaraBaseB1: TMenuItem
        Caption = 'Llevar a Base B'
        OnClick = LlevaraBaseB1Click
      end
      object Binarioadecimal1: TMenuItem
        Caption = 'De base B a decimal'
        OnClick = Binarioadecimal1Click
      end
      object Obtenerenhexadecimal1: TMenuItem
        Caption = 'Obtener en hexadecimal'
        OnClick = Obtenerenhexadecimal1Click
      end
      object Hexadecimaladecimal1: TMenuItem
        Caption = 'Hexadecimal a decimal'
        OnClick = Hexadecimaladecimal1Click
      end
      object oromano1: TMenuItem
        Caption = 'Convertir a romano'
        OnClick = oromano1Click
      end
      object Eliminardigitosrepetidso1: TMenuItem
        Caption = 'Eliminar digitos repetidso'
        OnClick = Eliminardigitosrepetidso1Click
      end
      object Mostrarmenorde3cifras1: TMenuItem
        Caption = 'Mostrar menor de 3 cifras'
        OnClick = Mostrarmenorde3cifras1Click
      end
    end
    object Parcial1: TMenuItem
      Caption = 'Parcial'
      object Intercalarprimonoprimo1: TMenuItem
        Caption = 'Intercalar primo no primo'
        OnClick = Intercalarprimonoprimo1Click
      end
      object Eliminarmayorrepetido1: TMenuItem
        Caption = 'Eliminar mayor repetido'
        OnClick = Eliminarmayorrepetido1Click
      end
      object Adentroafuera1: TMenuItem
        Caption = 'Adentro afuera'
        OnClick = Adentroafuera1Click
      end
    end
  end
end
