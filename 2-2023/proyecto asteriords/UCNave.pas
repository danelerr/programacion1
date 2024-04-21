unit UCNave;

interface
uses classes, System.Types, graphics;

type
  nave = class
    private
      tamanio: integer;
      velocidad: integer;
      aceleracion: integer;
    public
      angulo: integer;
      enMovimiento: boolean;
      centro: TPoint;
      p1, p2, p3: TPoint;
      constructor Create(x, y, tam: integer);
      procedure dibujar(canvas: TCanvas);
      procedure mover;
      procedure rotar(a: integer);
      procedure acelerar;
      procedure desacelerar;
  end;

implementation

const MAX_SPEED = 15;
{ nave }


{mueve el punto p, respecto al punto t}
procedure trasladar(var p: tpoint; t: tpoint);
begin
  p.X := p.X + t.X;
  p.Y := p.Y + t.Y;
end;

{rota el punto p, desde el orgen (0, 0) "a" angulos}
{"a" un angulo en radianes}
procedure rotacion(var p: tpoint; a: real);
var t: Tpoint;
begin
  t := p;
  p.X := trunc(t.X*cos(a)-t.Y*sin(a));
  p.Y := trunc(t.X*sin(a)+t.Y*cos(a));
end;

procedure nave.acelerar;
begin
  if velocidad < 5 then velocidad := 5;
  if enMovimiento then begin
    if velocidad < MAX_SPEED then BEGIN
      velocidad := velocidad + aceleracion;
    END;
  end;
  enMovimiento := true;
end;

constructor nave.Create(x, y, tam: integer);
begin
   centro := Point(x, y);
   tamanio := tam;
   velocidad := 5;
   angulo := 0;
   aceleracion := 1;
   enMovimiento := false;
end;

procedure nave.desacelerar;
begin
   if enMovimiento then begin
      if velocidad > 1 then velocidad := velocidad - aceleracion
      else enMovimiento := false;
   end else velocidad := 5;
end;

procedure nave.dibujar(canvas: TCanvas);
var w: integer;
  a: real;
begin
  a := angulo*pi/180.0;
  w := tamanio div 2;
  p1 := point(0, -w-20);
  p2 := point(-w, +w);
  p3 := point(+w, +w);
  rotacion(p1, a);
  rotacion(p2, a);
  rotacion(p3, a);
  trasladar(p1, centro);
  trasladar(p2, centro);
  trasladar(p3, centro);
  canvas.Pen.Width := 3;
  canvas.Pen.Color := clBlack;
  canvas.Polygon([p1, p2, p3, p1]);
end;

procedure nave.mover;
var moverPunto: Tpoint;
begin
  moverPunto.X := trunc(velocidad * sin(angulo*pi/180));
  moverPunto.Y := -trunc(velocidad * cos(angulo*pi/180));
  trasladar(p1, moverPunto);
  trasladar(p2, moverPunto);
  trasladar(p3, moverPunto);

  trasladar(centro, moverPunto);
end;

procedure nave.rotar(a: integer);
begin
  angulo := angulo + a;
 // if velocidad - aceleracion > 5
//  then velocidad := velocidad - aceleracion;
end;

end.
