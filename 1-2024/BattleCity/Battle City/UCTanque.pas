unit UCTanque;

interface

uses graphics, UCBala, UCPared, UCEscenario, AudioManager;

  type
    TTanque = class

    public
      x, y: word;
      w, h: word;
      ax, ay: word;
      skin: TBitMap;
      bala: TBala;
      direccion, jugador, vida: word;
      procedure rotarSkin(grados: word);
      constructor Create(x, y: word);
      procedure cargarSkin(rutaSkin: string);
      procedure dibujar(Pantalla: TCanvas);
      procedure mover(dir: word; escenario: TEscenario);
      procedure controlarDisparo(escenario: TEscenario; tank2: TTanque; audio: TAudioManager);
      procedure disparar;
      procedure detenerDisparo;
      function choquePared(p: TPared): boolean;
      function balaChoqueTanque(tank: TTanque): boolean;
      procedure setAntiguaPos;
      function disparoPared(p: TPared): boolean;
      procedure setPlayer(val: word);

  end;

implementation

{ TTanque }

 const
  ARRIBA = 1;
  ABAJO = 2;
  IZQUIERDA = 3;
  DERECHA = 4;

function TTanque.balaChoqueTanque(tank: TTanque): boolean;
var
  tx, ty, tw, th: word;
  px, py, pw, ph: word;
begin

  if bala = nil then exit(false);

  tx := bala.x;
  ty := bala.y;

  px := tank.x;
  py := tank.y;

  tw := bala.w + bala.x;
  th := bala.h + bala.y;

  pw := tank.x	+ tank.w;
  ph := tank.y + tank.h;
  result :=
    (pw > tx) and
    (ph > ty) and
    (tw-1 > px) and
    (th-1 > py);
end;

procedure TTanque.cargarSkin(rutaSkin: string);
begin
   skin := TBitMap.Create;
   skin.LoadFromFile(rutaSkin);

   {trasparencia}
   skin.Transparent	:= true;
   w := skin.Width;
   h := skin.Height;
   if (direccion = ARRIBA) or (direccion = IZQUiERDA) then begin
       skin.TransparentColor := skin.Canvas.Pixels[1, 1];
   end else begin
        skin.TransparentColor := skin.Canvas.Pixels[w - 1, h -1];
   end;
end;


function TTanque.choquePared(p: TPared): boolean;
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

procedure TTanque.controlarDisparo(escenario: TEscenario; tank2: TTanque; audio: TAudioManager);
var i: word;
choca: boolean;
begin

  {control de la bala del tanque}
  if bala <> nil then begin
    if bala.x < 10 then detenerDisparo
    else if bala.y < 10 then detenerDisparo
    else if bala.x + bala.w > escenario.limitX - 10	then detenerDisparo
    else if bala.y + bala.h > escenario.limitY - 10	then detenerDisparo;
  end;

  if bala = nil then exit;

  {control de la bala y las paredes}
  for i := 1 to escenario.CantidadParedes do begin
    if escenario.paredes[i] = nil then continue;
    if disparoPared(escenario.paredes[i]) then begin
      escenario.paredes[i] := nil;
      audio.PlaySound(1);
      detenerDisparo;
      exit;
    end;
  end;


  {destruir al tanque enemigo}
  if balaChoqueTanque(tank2) then begin
    if tank2.vida > 0 then tank2.vida  := tank2.vida - 1;
    audio.PlaySound(0);

    // Hacer respawn en un lugar que no es pared;
    choca := true;
    while choca do begin
      choca := false;
      randomize;
      tank2.x := random( escenario.limitX);
      randomize;
      tank2.y := random( escenario.limitY);
      for i := 1 to escenario.CantidadParedes do begin
        if escenario.paredes[i] = nil then continue;
        if tank2.choquePared(escenario.paredes[i]) then begin
          choca := true;
          break;
        end;
      end;
    end;
    detenerDisparo;
  end;

end;

constructor TTanque.Create(x, y: word);
begin
  {setear las posicion x y y del tanque}
  self.x := x;
  self.y := y;

  {establecer la direccion por defecto}
  direccion := ARRIBA;

  {antigua x y antigua y}
  ax := x;
  ay := y;

  {por defecto el tanque es player 1}
  jugador := 1;

  {por defecto, el tanque tiene 3 vidas}
  vida := 3;
end;

procedure TTanque.detenerDisparo;
begin
  bala := nil;
end;

procedure TTanque.dibujar(Pantalla: TCanvas);
begin
  pantalla.Draw(x, y, skin);
  if bala <> nil then begin
    bala.dibujar(pantalla);
    bala.mover;
  end;

end;

procedure TTanque.disparar;
var xb, yb: word;
begin
  if bala = nil then begin
    bala := TBala.create(direccion);
    bala.cargarSkin('bulletLU.bmp');
    xb := x + w div 2 - bala.w  div 2;
    yb := y + h div 2 - bala.h  div 2;
    bala.setXY(xb, yb);
  end;
end;


function TTanque.disparoPared(p: TPared): boolean;
begin
  if bala = nil then exit(false);
  result := bala.choquePared(p);
end;


{
  izquierda -> 37  o 65
  arriba -> 38  o 87
  derecha -> 39 o 68
  abajo -> 40  o 83
}
procedure TTanque.mover(dir: word; escenario: TEscenario);
var
  i: word;
  pla: string;
begin
  ax := x;
  ay := y;
  pla := '';
  if jugador = 2 then pla := '2';
  
  case dir of
    37, 65: if x > 0 then begin
          x	:= x - 2;
          direccion := IZQUIERDA;
          cargarSkin('HtankL' + pla + '.bmp');
        end;
    38, 87: if y > 0 then begin
          y := y - 2;
          direccion := ARRIBA;
          cargarSkin('HtankU' + pla +  '.bmp');
        end;
    39, 68: if x + w < escenario.limitX	- w then begin
          x	:= x	+ 2;
          direccion := DERECHA;
          cargarSkin('HtankR' + pla + '.bmp');
        end;
    40, 83: if y + h < escenario.limitY	- h then begin
          y := y + 2;
          direccion := ABAJO;
          cargarSkin('HtankD' + pla +  '.bmp');
        end;
  end;

  {choque del tanque con las paredes}


  {controles de los muros}
  for i := 1 to escenario.CantidadParedes do begin
    if escenario.paredes[i] = nil then continue;
    if choquePared(escenario.paredes[i]) then begin
      setAntiguaPos;
      break;
    end;
  end;

end;

procedure TTanque.rotarSkin(grados: word);
var
  tempBitmap: TBitMap;
  I, J: word;
begin
  tempBitmap := TBitMap.Create;
end;

procedure TTanque.setAntiguaPos;
begin
  x := ax;
  y := ay;
end;

procedure TTanque.setPlayer(val: word);
begin
  jugador := val;
end;

end.
