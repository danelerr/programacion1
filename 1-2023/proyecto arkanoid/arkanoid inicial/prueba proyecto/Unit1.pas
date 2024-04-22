unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ExtCtrls, JPEG, Vcl.StdCtrls,
  UBarra, UBola, AudioManager, Vcl.MPlayer;

type
  TForm1 = class(TForm)
    TimerBarra: TTimer;
    TimerBola: TTimer;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TimerBarraTimer(Sender: TObject);
    procedure FormDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure TimerBolaTimer(Sender: TObject);
  private
    izq, der, movbola: boolean;
    fondo: TJPEGImage;
    barra: TBarra;
    bola: TBola;
    Bx, By: Integer; //bx = bola x, By = bola y
    audio: TAudioManager;

  public
    MAXx, MAXy: word;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


const
  CHOQUE_PARED = 0;
  CHOQUE_BARRA = 1;

procedure TForm1.FormCreate(Sender: TObject);
begin
  MAXx := Screen.Width;
  MAXy := Screen.Height;

  {Creacion del fondo}
  fondo := TJPEGImage.Create;
  fondo.LoadFromFile('fondo.jpg');

  {Creacion de la barra}
  barra := TBarra.Create;
  barra.cargarSkin('barra.bmp');
  barra.x := (MAXx div 2) - (barra.w div 2);
  barra.y := MAXy - 100;

  {Cracion de la bola}
  bola := TBola.Create;
  bola.cargarSkin('bola.bmp');
  bola.x := (MAXx div 2) - (bola.w div 2);
  bola.y := MAXy - 100 - barra.h;
  Bx := 10;
  By := -10;
  movbola := false;

  {Creacion del gestor de sonido}
  audio := TAudioManager.Create;
  audio.AddSound('sonidos\choque_pared.wav');
  audio.AddSound('sonidos\choque_barra.wav');
end;

procedure TForm1.FormDblClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case key of
    37: izq := true;
    39: der := true;
    else movbola := true;
  end;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  case key of
    37: izq := false;
    39: der := false;
  end;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
  {Dibujado del fondo}
  Canvas.StretchDraw(Rect(0, 0, Screen.Width, Screen.Height), fondo);
  {Dibujo de la barra}
  Canvas.Draw(barra.x, barra.y, barra.skin);
  {Dibujo de la bola}
  Canvas.Draw(bola.x, bola.y, bola.skin);
end;

procedure TForm1.TimerBarraTimer(Sender: TObject);
begin
    if izq and (barra.x > 10) then barra.x := barra.x - 10;
    if der and (barra.x + barra.w < MAXx-10) then barra.x := barra.x + 10;
    repaint;
end;

procedure TForm1.TimerBolaTimer(Sender: TObject);
begin
  {Movimiento de la bola}
  if movbola then begin
    if (bola.x < 0) or (bola.x > MAXx-bola.w) then begin
      Bx:=Bx*-1;
      audio.PlaySound(CHOQUE_PARED);
    end;
    if (bola.y < 0) or (bola.y > MAXy) then begin
      By:=By*-1;
      audio.PlaySound(CHOQUE_PARED);
    end;
    if (bola.y = MAXy) then begin
      movbola := false;
      bola.x := barra.x + (barra.w div 2) - (bola.w div 2);
      bola.y := MAXy - 100 - barra.h;
      Bx := 10;
      By := -10;
    end else begin
      bola.x := bola.x+Bx;
      bola.y := bola.y+By;
      {Colicion de la bola con la barra}
      if (barra.x <= bola.x + bola.w)
      and (barra.x + barra.w >= bola.x)
      and (barra.y <= bola.y + bola.h)
      and (barra.y + barra.h >= bola.y)
      then begin
          By:=By*-1;
          if izq then Bx := -10;
          if der then Bx := 10;
          audio.PlaySound(CHOQUE_BARRA);
      end;
    end;
  end else begin
    if izq  then bola.x := bola.x - 10;
    if der  then bola.x := bola.x + 10;

  end;


end;

end.
