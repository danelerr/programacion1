object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Productos'
  ClientHeight = 474
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 32
    Width = 33
    Height = 13
    Caption = 'Codigo'
  end
  object Label2: TLabel
    Left = 40
    Top = 64
    Width = 37
    Height = 13
    Caption = 'Nombre'
  end
  object Label3: TLabel
    Left = 40
    Top = 104
    Width = 26
    Height = 13
    Caption = 'Stock'
  end
  object Label4: TLabel
    Left = 40
    Top = 133
    Width = 29
    Height = 13
    Caption = 'Precio'
  end
  object Edit1: TEdit
    Left = 96
    Top = 32
    Width = 73
    Height = 21
    TabOrder = 0
  end
  object Edit2: TEdit
    Left = 96
    Top = 59
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object Edit3: TEdit
    Left = 96
    Top = 106
    Width = 49
    Height = 21
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 96
    Top = 133
    Width = 73
    Height = 21
    TabOrder = 3
  end
  object SGProductos: TStringGrid
    Left = 40
    Top = 176
    Width = 440
    Height = 145
    ColCount = 4
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 4
    ColWidths = (
      71
      207
      64
      72)
  end
  object Button1: TButton
    Left = 405
    Top = 145
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 568
    Top = 416
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 6
    OnClick = Button2Click
  end
end
