unit UBarra;

interface

uses VCL.Graphics;

type
  TBarra = class
  private

  public
  x, y: word;
  w, h: word;
  skin: TBitMap;
  constructor Create;
  procedure cargarSkin(rutaBmp: string);
end;

implementation
  constructor TBarra.Create;
  begin

  end;
  procedure TBarra.cargarSkin(rutaBmp: string);
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
