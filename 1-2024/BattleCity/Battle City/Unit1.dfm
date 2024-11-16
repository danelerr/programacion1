object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 637
  ClientWidth = 885
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  TextHeight = 15
  object Label1: TLabel
    Left = 56
    Top = 600
    Width = 34
    Height = 15
    Caption = 'Label1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 736
    Top = 600
    Width = 34
    Height = 15
    Caption = 'Label2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 320
    Top = 248
    Width = 253
    Height = 30
    AutoRewind = False
    TabOrder = 0
  end
  object Timer1: TTimer
    Interval = 10
    OnTimer = Timer1Timer
    Left = 664
    Top = 336
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 584
    Top = 352
  end
end
