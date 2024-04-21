unit UCVector;

interface
uses Sysutils;
Const
    MaxE=1024;
Type
     Vector= Class
      Private
          Dimension : Word;
          Elementos : Array[1..MaxE] Of Real;
          Procedure QSort(i,f:Word);
      Public
          Function Dim : Word;
          Procedure Redimensionar(d:Word);
          Procedure modElemento(p:Word;e:Real);
          Function getElemento(p:Word):Real;
          Procedure Intercambiar(i,j : Word);
          Procedure quickSort;
    End;

implementation

{  }

function Vector.Dim: Word;
begin
     Result:=Dimension;
end;

function Vector.getElemento(p: Word): Real;
begin
     if (p>0) and (p<=Dimension) then
        Result:=Elementos[p]
     Else raise Exception.Create('Error Message');
end;

procedure Vector.Intercambiar(i, j: Word);
Var
  a : Real;
begin
      a:=Elementos[i];
      Elementos[i]:=Elementos[j];
      Elementos[j]:=a;
end;

procedure Vector.modElemento(p: Word; e: Real);
begin
     if (p>0) and (p<=Dimension) then
        Elementos[p]:=e
     Else raise Exception.Create('Error Message');
end;

procedure Vector.QSort(i, f: Word);
Var
  Izq,Der : Word;
  m : Real;
begin
     Izq:=i;Der:=f;
     m:=(Elementos[i]+Elementos[f]) / 2;
     Repeat
         while Elementos[i]<m do
          i:=i+1;
         while Elementos[f]>m do
          f:=f-1;
         if i<=f then
         Begin
              Intercambiar(i,f);
              i:=i+1;
              f:=f-1;
         End;
     Until i>f;
     if Izq<f then QSort(Izq,f);
     if i<Der then QSort(i,Der);

end;


procedure Vector.quickSort;
begin
     QSort(1,Dimension);
end;

procedure Vector.Redimensionar(d: Word);
begin
     Dimension:=d;
end;

end.
