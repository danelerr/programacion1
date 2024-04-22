unit UBola;

interface

uses VCL.Graphics;

type
  TBola = class
  private

  public
  x, y: word;
  w, h: word;
  skin: TBitMap;
  constructor Create;
  procedure cargarSkin(rutaBmp: string);
end;

implementation
  constructor TBola.Create;
  begin

  end;
  procedure TBola.cargarSkin(rutaBmp: string);
  begin
    skin := TBitMap.Create;
    skin.LoadFromFile(rutaBmp);
    {Transparencia}
   // skin.transparent := true;
   // skin.TransparentColor := skin.Canvas.Pixels[1,1];
   // skin.TransparentMode := tmAuto;
    w := skin.Width;
    h := skin.Height;
  end;
end.
