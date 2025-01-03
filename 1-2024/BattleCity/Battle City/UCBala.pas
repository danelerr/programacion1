unit UCBala;

interface
    uses graphics, UCPared;
type
  TBala = class
    public
        x, y: word;
        w, h: word;
        direccion: word;
        skin: TBitMap;
      constructor create(direccion: word);
      procedure cargarSkin(rutaSkin: string);
      procedure dibujar(pantalla: TCanvas);
      procedure setXY(x, y: word);
      procedure mover;
      function choquePared(p: TPared): boolean;

end;


implementation

{ TBala }
const
  ARRIBA = 1;
  ABAJO = 2;
  IZQUIERDA = 3;
  DERECHA = 4;

procedure TBala.cargarSkin(rutaSkin: string);
begin
   skin := TBitMap.Create;
   skin.LoadFromFile(rutaSkin);

   {trasparencia}
   skin.Transparent	:= true;
   skin.TransparentColor := skin.Canvas.Pixels[1, 1];

   w := skin.Width;
   h := skin.Height;
end;

function TBala.choquePared(p: TPared): boolean;
var
  tx, ty, tw, th: word;
  px, py, pw, ph: word;
begin
  tx := x;
  ty := y;

  px := p.x;
  py := p.y;

  tw := w + x;
  th := h + y;

  pw := p.x	+ p.w;
  ph := p.y + p.h;
  result :=
    (pw > tx) and
    (ph > ty) and
    (tw-1 > px) and
    (th-1 > py);
end;

constructor TBala.Create(direccion: word);
begin
  self.direccion := direccion;
end;

procedure TBala.dibujar(pantalla: TCanvas);
begin
  pantalla.Draw(x, y, skin);
end;

procedure TBala.mover;
begin
  case direccion of
    ARRIBA: y := y - 10;
    ABAJO:  y := y + 10;
    IZQUIERDA: x := x - 10;
    DERECHA: x := x + 10;
  end;
end;

procedure TBala.setXY(x, y: word);
begin
  self.x := x;
  self.y := y;
end;

end.
