unit UCEscenario;

interface
Uses SysUtils, graphics, UCPared;
Const

  Niveles: Array[1..2, 1..18] of String[30]= (

    //nivel 1
      ('111111111111111111111111111111',
       '100000000000000000000000000001',
       '101111111111111111111110111101',
       '100000000000000003000000000101',
       '101111111111110000000000000101',
       '101000000000010000000000000101',
       '101000000000010000000000000101',
       '101000010000010000000000111101',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '101111110000010000000000100001',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '102000000000010000000000100001',
       '100000000000011111111111100001',
       '100000000000000000000000000001',
       '111111111111111111111111111111'),

    //nivel 2
      ('111111111111111111111111111111',
       '100000000000000000000000000001',
       '101111111111111111111110111101',
       '100000000000000003000000000101',
       '101111111111110000000000000101',
       '101000000000010000000000000101',
       '101000000000010000000000000101',
       '101000010000010000000000111101',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '101111110000010000000000100001',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '102000000000010000000000100001',
       '100000000000011111111111100001',
       '111111111111111111111111110001',
       '000000000000000000000000000000')
    );

Type
    TEscenario = Class
      public
          limitX, limitY: word;
          CantidadParedes: word;
          paredes: array[1..1000] of TPared;
          constructor Create(limitX, limitY: word);
          procedure cargarNivel(n: word);
          procedure dibujar(pantalla: TCanvas);
    End;

implementation

{ Escenario }


{ Escenario }

procedure TEscenario.cargarNivel(n: word);
var
  I,J,X,Y,c : Integer;
begin
  Y:=0;
  c := 0;
  for I := 1 to 18 do Begin
    X:=0;
    for J := 1 to 30 do Begin
      if Niveles[n][i][j] = '1' then begin
        c := c + 1;
        paredes[c] := Tpared.create(x, y);
        paredes[c].cargarSkin('pared.bmp');
      end;
      X:=X+22;
    End;
    Y:=Y+22;
  End;
  CantidadParedes := c;
end;

constructor TEscenario.Create(limitX, limitY: word);
begin
  self.limitX := limitX;
  self.limitY	:= limitY;
end;


procedure TEscenario.dibujar(pantalla: TCanvas);
var i: word;
begin
    for i := 1 to CantidadParedes do begin
      if paredes[i] = nil then continue;
      paredes[i].dibujar(pantalla);
    end;
end;


end.
