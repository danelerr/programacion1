object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'MyEditor'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  OnCreate = FormCreate
  TextHeight = 15
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 545
    Height = 321
    TabOrder = 0
  end
  object MainMenu1: TMainMenu
    Left = 296
    Top = 208
    object Archvio1: TMenuItem
      Caption = 'Archvio'
      object Archvio2: TMenuItem
        Caption = 'Abrir'
        OnClick = Archvio2Click
      end
      object Guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = Guardar1Click
      end
      object amayuscula1: TMenuItem
        Caption = 'a mayuscula'
        OnClick = amayuscula1Click
      end
      object buscaryremplazar1: TMenuItem
        Caption = 'buscar y remplazar'
        OnClick = buscaryremplazar1Click
      end
      object getminpeso1: TMenuItem
        Caption = 'get min peso'
        OnClick = getminpeso1Click
      end
      object getsinonimo1: TMenuItem
        Caption = 'get sinonimo'
        OnClick = getsinonimo1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Archivo Texto|*.txt|Todos los archivos|*.*'
    Left = 432
    Top = 176
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Archivo Texto|*.txt|Todos los archivos|*.*'
    Left = 304
    Top = 72
  end
end
