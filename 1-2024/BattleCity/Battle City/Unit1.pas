unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, UCTanque, JPEG, UCPared,
  Vcl.StdCtrls, UCEscenario, AudioManager, Vcl.MPlayer;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Label2: TLabel;
    MediaPlayer1: TMediaPlayer;
    Timer2: TTimer;

    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure crearJuego(nivel: word);
    procedure Timer2Timer(Sender: TObject);
  private
    tanque, tanque2: TTanque;
    movTanque, movTanque2: word;
    fondo: TJPEGImage;
    nivelActual: word;
    escenario: TEscenario;

    audio: TAudioManager;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.crearJuego(nivel: word);
var i: word;
begin
  {creacion del tanque}
  tanque := TTanque.Create(42, 400);
  tanque.cargarSkin('HtankU.bmp');
  movTanque := 0;

  {creacion del tanque 2}
  tanque2 := TTanque.Create(200, 400);
  tanque2.cargarSkin('HtankU2.bmp');
  tanque2.setPlayer(2);
  movTanque2 := 0;



  {creacion del fondo}
  fondo := TJPEGImage.Create;
  fondo.LoadFromFile('screen.jpg');


  {creacion del escenario (paredes)}
  escenario := TEscenario.Create(Form1.Width, Form1.Height);

  //set del nivel
  escenario.cargarNivel(nivel);


  {Creacion del sonido}
  audio := TAudioManager.Create;
  audio.AddSound('sonidoDestruir.wav');
  audio.AddSound('sonidoPared.wav');


  {sonido de sonido}
  MediaPlayer1.FileName := 'fondo.mp3';
  MediaPlayer1.Visible := false;
  MediaPlayer1.Open;
  //mediaPlayer1.Play;
  mediaPlayer1.AutoRewind := true;

end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  nivelActual := 1;
  crearJuego(nivelActual);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {control de tecla para mover el tanque}
  if key in [37, 38, 39, 40] then
    movTanque := key;
  {control de espacio, para disparar}
  if key = 32 then tanque.disparar;


  {control de tecla para mover el tanque 2}
  if key in [65, 87, 68, 83] then
    movTanque2 := key;
  {control de espacio, para disparar tanque 2}
  if key = 88 then tanque2.disparar;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  {si suelto la tecla especifica, el tanque se detiene}
  if key = movTanque then movTanque	:= 0;
   if key = movTanque2 then movTanque2	:= 0;
end;

procedure TForm1.FormPaint(Sender: TObject);
var i: word;
begin
    {dibujo del fondo}
    Canvas.StretchDraw(Rect(0, 0, Form1.Width, Form1.Height), fondo);

    {dibujo del tanque}
    tanque.dibujar(canvas);

    {dibujo del tanque 2}
    tanque2.dibujar(canvas);

    {dibujo del escenario}
    escenario.dibujar(canvas);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i: word;
begin

  tanque.mover(movTanque, escenario);
  tanque2.mover(movTanque2, escenario);

  tanque.controlarDisparo(escenario, tanque2, audio);
  tanque2.controlarDisparo(escenario, tanque, audio);

  label1.Caption := 'Tanque 1: ' + IntToStr(tanque.vida);
  label2.Caption := 'Tanque 2: ' + IntToStr(tanque2.vida);
  //actualizar (repaint)



  //  Verificar si uno de los tanques ha muerto
  if (tanque.vida = 0) or (tanque2.vida = 0) then begin
    nivelActual := nivelActual + 1;
    if nivelActual > 2 then begin
      ShowMessage('el juego termino');
      Application.Terminate;
    end;
    crearJuego(nivelActual);
  end;




  invalidate;
  update;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
 var x: word;
begin
  randomize;
  x := random(3) + 1;
  case x of
    1: begin tanque2.mover(37, escenario); tanque2.mover(37, escenario);tanque2.mover(37, escenario); end;
    2: tanque2.mover(38, escenario);
    3: tanque2.mover(39, escenario);
    4: tanque2.mover(40, escenario);
  end;

end;

end.
