object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 461
  ClientWidth = 869
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Label1: TLabel
    Left = 384
    Top = 232
    Width = 69
    Height = 32
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 304
    Top = 96
    Width = 241
    Height = 38
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -22
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    Text = 'Edit1'
  end
  object MainMenu1: TMainMenu
    Left = 680
    Top = 208
    object Numero1: TMenuItem
      Caption = 'Numero'
      object Cambiarvalor1: TMenuItem
        Caption = 'Cambiar valor'
        OnClick = Cambiarvalor1Click
      end
      object Obtenervalor1: TMenuItem
        Caption = 'Obtener valor'
        OnClick = Obtenervalor1Click
      end
      object Cantidaddedigitos1: TMenuItem
        Caption = 'Cantidad de digitos'
        OnClick = Cantidaddedigitos1Click
      end
      object Moddigit1: TMenuItem
        Caption = 'Mod digit'
        OnClick = Moddigit1Click
      end
      object Insdigit1: TMenuItem
        Caption = 'Ins digit'
        OnClick = Insdigit1Click
      end
      object Deldigit1: TMenuItem
        Caption = 'Del digit'
        OnClick = Deldigit1Click
      end
      object Ontenerenbasen1: TMenuItem
        Caption = 'Ontener en base n'
        OnClick = Ontenerenbasen1Click
      end
      object Obtenerenbase101: TMenuItem
        Caption = 'Obtener en base 10'
        OnClick = Obtenerenbase101Click
      end
      object Genmenor3cifras1: TMenuItem
        Caption = 'Gen menor 3 cifras'
        OnClick = Genmenor3cifras1Click
      end
      object Ordenar1: TMenuItem
        Caption = 'Ordenar '
        OnClick = Ordenar1Click
      end
      object Ordenarparimparord1: TMenuItem
        Caption = 'Ordenar par impar ord'
        OnClick = Ordenarparimparord1Click
      end
    end
  end
end
