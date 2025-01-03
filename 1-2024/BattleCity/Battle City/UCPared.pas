unit UCPared;

interface

uses graphics;

type
  TPared = class
    public
      x, y: word;
      w, h: word;
      skin: TBitMap;
      constructor create(x, y: word);
      procedure cargarSkin(rutaSkin: string);
      procedure dibujar(pantalla: TCanvas);
end;

implementation

{ TPared }

procedure TPared.cargarSkin(rutaSkin: string);
begin
   skin := TBitMap.Create;
   skin.LoadFromFile(rutaSkin);

   w := skin.Width;
   h := skin.Height;
end;

constructor TPared.create(x, y: word);
begin
  self.x := x;
  self.y := y;
end;

procedure TPared.dibujar(pantalla: TCanvas);
begin
  pantalla.Draw(x, y, skin);
end;

end.
