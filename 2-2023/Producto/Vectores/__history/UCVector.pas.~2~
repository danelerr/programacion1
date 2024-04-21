unit UCVector;

interface
Uses Sysutils;
Const
    MaxP=128;
Type
  Producto=Record
    Codigo : Cardinal;
    Nombre : String;
    Stock  : Real;
    Precio : Real;
  End;

  Almacen = Class
    Private
        NroItems : Word;
        Productos: Array[1..MaxP] of Producto;
    Public
        Function Dim:Word;
        Procedure AddProducto(P:Producto);
        Function GetProducto(p:Word):Producto;
        Procedure Intercambiar(i,j:Word);
        Procedure Sort;
  End;

implementation

{ Almacen }

procedure Almacen.AddProducto(P: Producto);
begin
     Inc(NroItems);
     Productos[NroItems]:=P;
end;

function Almacen.Dim: Word;
begin
     Result:=NroItems;
end;

function Almacen.GetProducto(p: Word): Producto;
begin
     if (p>0)And (p<=NroItems) then
        Result:=Productos[p]
     Else raise Exception.Create('Error Posicion Invalida');
end;

procedure Almacen.Intercambiar(i, j: Word);
Var
   t:Producto;
begin
      t:=Productos[i];
      Productos[i]:=Productos[j];
      Productos[j]:=t;
end;

procedure Almacen.Sort;
var
  I,J: Integer;
begin
     for I := 1 to NroItems-1 do
        for J := i+1 to NroItems  do
           if Productos[i].Nombre>Productos[j].Nombre then
              Intercambiar(i,j);

end;

end.
