object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'CADENA'
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
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object Label1: TLabel
    Left = 168
    Top = 112
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object Edit1: TEdit
    Left = 32
    Top = 24
    Width = 553
    Height = 23
    TabOrder = 0
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 328
    Top = 152
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object MainMenu1: TMainMenu
    Left = 304
    Top = 280
    object Metodos1: TMenuItem
      Caption = 'Metodos'
      object Metodos2: TMenuItem
        Caption = 'Mostrar Cadena'
        OnClick = Metodos2Click
      end
      object CargarCadena1: TMenuItem
        Caption = 'Cargar Cadena'
        OnClick = CargarCadena1Click
      end
      object CargarCadena2: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = CargarCadena2Click
      end
      object Palabramayor1: TMenuItem
        Caption = 'Palabra mayor'
        OnClick = Palabramayor1Click
      end
      object Examen1a1: TMenuItem
        Caption = 'Examen 1a'
        OnClick = Examen1a1Click
      end
      object Sinonimo1: TMenuItem
        Caption = 'Sinonimo'
        OnClick = Sinonimo1Click
      end
    end
  end
end
