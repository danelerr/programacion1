object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Form1'
  ClientHeight = 672
  ClientWidth = 961
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDblClick = FormDblClick
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnPaint = FormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object TimerBarra: TTimer
    Interval = 10
    OnTimer = TimerBarraTimer
    Left = 712
    Top = 312
  end
  object TimerBola: TTimer
    Interval = 10
    OnTimer = TimerBolaTimer
    Left = 400
    Top = 360
  end
end
