object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CADENAS'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 72
    Top = 296
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object Label2: TLabel
    Left = 224
    Top = 96
    Width = 45
    Height = 15
    Caption = 'Posicion'
  end
  object Label3: TLabel
    Left = 224
    Top = 136
    Width = 44
    Height = 15
    Caption = 'Caracter'
  end
  object Edit1: TEdit
    Left = 288
    Top = 40
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 288
    Top = 96
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 288
    Top = 128
    Width = 121
    Height = 23
    TabOrder = 2
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 288
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Longitud de la cadena'
        OnClick = Metodos2Click
      end
      object Adicionarstring1: TMenuItem
        Caption = 'Adicionar string '
        OnClick = Adicionarstring1Click
      end
      object Mostrarcadena1: TMenuItem
        Caption = 'Mostrar cadena'
        OnClick = Mostrarcadena1Click
      end
      object Adicionarcaracter1: TMenuItem
        Caption = 'Modificar Caracter'
      end
      object AdcionarCaracter1: TMenuItem
        Caption = 'Adcionar Caracter'
      end
      object InstertarCaracter1: TMenuItem
        Caption = 'Instertar Caracter'
        OnClick = InstertarCaracter1Click
      end
      object EliminarCaracter1: TMenuItem
        Caption = 'Eliminar Caracter'
      end
      object ObtenerCaracter1: TMenuItem
        Caption = 'Obtener Caracter'
      end
      object Invertircaracteres1: TMenuItem
        Caption = 'Invertir caracteres'
        OnClick = Invertircaracteres1Click
      end
      object Contarpalabras1: TMenuItem
        Caption = 'Contar palabras'
        OnClick = Contarpalabras1Click
      end
      object Palabrasdeinicianyterminarenvocal1: TMenuItem
        Caption = 'Palabras de inician y terminar en vocal'
      end
      object Sumarnumeros1: TMenuItem
        Caption = 'Sumar numeros'
        OnClick = Sumarnumeros1Click
      end
    end
  end
end
