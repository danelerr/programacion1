object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'NUMEROS'
  ClientHeight = 440
  ClientWidth = 766
  Color = clWhite
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 376
    Top = 88
    Width = 8
    Height = 32
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Algerian'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 224
    Top = 8
    Width = 265
    Height = 23
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 232
    Top = 80
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Obtener Valor'
        OnClick = Metodos2Click
      end
      object CambiarValor1: TMenuItem
        Caption = 'Cambiar Valor'
        OnClick = CambiarValor1Click
      end
      object CambiarValor2: TMenuItem
        Caption = 'Adicionar digito'
        OnClick = CambiarValor2Click
      end
      object Insertardigito1: TMenuItem
        Caption = 'Insertar digito'
      end
      object Insertardigito2: TMenuItem
        Caption = 'Cantidad de digitos'
        OnClick = Insertardigito2Click
      end
      object Adddigizq1: TMenuItem
        Caption = 'Add dig izq'
        OnClick = Adddigizq1Click
      end
      object obtenerenbasen1: TMenuItem
        Caption = 'obtener en base n'
        OnClick = obtenerenbasen1Click
      end
      object Romano1: TMenuItem
        Caption = 'Romano'
        OnClick = Romano1Click
      end
      object Obtenerenbase101: TMenuItem
        Caption = 'Obtener en base 10'
        OnClick = Obtenerenbase101Click
      end
      object Delposicionesprimas1: TMenuItem
        Caption = 'Del posiciones primas'
        OnClick = Delposicionesprimas1Click
      end
      object Ordenardescendente1: TMenuItem
        Caption = 'Ordenar descendente'
        OnClick = Ordenardescendente1Click
      end
      object eliminardigitosalladodepar1: TMenuItem
        Caption = 'eliminar digitos al lado de par'
        OnClick = eliminardigitosalladodepar1Click
      end
      object Getmenorcombinacion1: TMenuItem
        Caption = 'Get menor combinacion'
        OnClick = Getmenorcombinacion1Click
      end
      object EncontrarCombinacion1: TMenuItem
        Caption = 'Encontrar Combinacion'
        OnClick = EncontrarCombinacion1Click
      end
    end
  end
end
