object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Numeros'
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
    Left = 320
    Top = 96
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object edValor: TEdit
    Left = 168
    Top = 16
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 224
    Top = 104
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Obtenervalor1: TMenuItem
        Caption = 'Obtener valor'
        OnClick = Obtenervalor1Click
      end
      object Cambiarvalor1: TMenuItem
        Caption = 'Cambiar valor'
        OnClick = Cambiarvalor1Click
      end
      object Metodos2: TMenuItem
        Caption = 'Cantidad de digitos'
        OnClick = Metodos2Click
      end
      object Obtenerndigito1: TMenuItem
        Caption = 'Obtener n'#39' digito'
      end
      object Adicionardigitoinicio1: TMenuItem
        Caption = 'Adicionar digito inicio'
        OnClick = Adicionardigitoinicio1Click
      end
      object Adicionardigitofin1: TMenuItem
        Caption = 'Adicionar digito fin'
      end
      object Adicionardigitofin2: TMenuItem
        Caption = 'Eliminar digito'
      end
      object Invertir1: TMenuItem
        Caption = 'Invertir'
        OnClick = Invertir1Click
      end
      object aRomano1: TMenuItem
        Caption = 'a Romano'
        OnClick = aRomano1Click
      end
      object Dosdigitos1: TMenuItem
        Caption = 'Dos digitos'
        OnClick = Dosdigitos1Click
      end
    end
  end
end
