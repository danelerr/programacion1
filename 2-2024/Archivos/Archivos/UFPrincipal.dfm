object frmPrincipal: TfrmPrincipal
  Left = 936
  Top = 374
  Caption = 'MyEditor'
  ClientHeight = 580
  ClientWidth = 926
  Color = clBtnFace
  CustomTitleBar.CaptionAlignment = taCenter
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Menu = MainMenu1
  Position = poDesigned
  OnCreate = FormCreate
  TextHeight = 15
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 926
    Height = 557
    Align = alTop
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object ScrollBar1: TScrollBar
    Left = 0
    Top = 563
    Width = 926
    Height = 17
    Align = alBottom
    Min = 16
    PageSize = 0
    Position = 16
    TabOrder = 1
    OnChange = ScrollBar1Change
    ExplicitLeft = 256
    ExplicitTop = 555
    ExplicitWidth = 409
  end
  object MainMenu1: TMainMenu
    Left = 312
    Top = 200
    object Archivo1: TMenuItem
      Caption = 'Archivo'
      object Archivo2: TMenuItem
        Caption = 'Abrir'
        OnClick = Archivo2Click
      end
      object Guardar1: TMenuItem
        Caption = 'Guardar'
        OnClick = Guardar1Click
      end
      object BuscarPalabra1: TMenuItem
        Caption = 'Buscar Palabra'
        OnClick = BuscarPalabra1Click
      end
      object BorrarPalabra1: TMenuItem
        Caption = 'Borrar Palabra'
        OnClick = BorrarPalabra1Click
      end
      object Input1: TMenuItem
        Caption = 'Contar Palabras'
        OnClick = Input1Click
      end
      object Convertirmayusculas1: TMenuItem
        Caption = 'Convertir mayusculas'
        OnClick = Convertirmayusculas1Click
      end
      object Sumarnumeros1: TMenuItem
        Caption = 'Sumar numeros'
        OnClick = Sumarnumeros1Click
      end
      object EliminarPalabrasconsub1: TMenuItem
        Caption = 'Eliminar Palabras con sub'
        OnClick = EliminarPalabrasconsub1Click
      end
      object Eliminarpalabrasvocalrepetida1: TMenuItem
        Caption = 'Eliminar palabras vocal repetida'
        OnClick = Eliminarpalabrasvocalrepetida1Click
      end
    end
  end
  object OpenDialog1: TOpenDialog
    FileName = 
      'C:\Users\danie\OneDrive\Desktop\11b3b9603339c1c7de4026fd57429a52' +
      '2d847ace.jpg'
    Left = 304
    Top = 128
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Archivos Texto|*.txt|Todos los Archivos|*.*'
    Left = 400
    Top = 128
  end
end