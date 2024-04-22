unit UCVector;

interface

uses sysutils;
const MaxE = 1024;

type
  Vector = class
  private
   Dimension: word;
   Elementos: array[1..MaxE] of Real;
  public
    Function Dim : Word;
    Procedure Dimensionar(D:Word);
    Procedure AddElement(e:Real);
    Procedure InsElement(p:word;e:Real);
    Procedure DelElement(p:word);
    Function getElement(p:word):Real;
    procedure ModElement(p: word; e: Real);
    procedure intercambiar(i, j: word);

    //quick sort
    function pivote(i, f: word): word;
    procedure qsort(i, f: word);//poner private
    procedure quickSort;

    //merge sort
    Procedure MergeSort;
    Procedure MSort(i,f:Word); //poner private
    Procedure Mezclar(i,m,f:Word);
end;

implementation
 procedure Vector.intercambiar(i, j: word);
 var t: real;
 begin
    t := Elementos[i];
    Elementos[i] := Elementos[j];
    Elementos[j] := t;
 end;


function Vector.pivote(i, f: word): word;
var t: boolean;
p: word;
begin
  t := true;
  repeat
    if Elementos[i]>Elementos[f] then begin
      intercambiar(i, f);
      t := not t;
    end;
    if t then i:=i+1
    else f := f-1;
  until i = f;
  p := i;
  result := p;
end;


procedure Vector.qsort(i, f: word);
var n, p: word;
begin
   n := f - i + 1;
   if n>1 then begin
      p := pivote(i, f);
      qsort(i, p-1);
      qsort(p+1, f);
   end;
end;
procedure Vector.quickSort;
begin
   qsort(1, Dimension);
end;




procedure Vector.MergeSort;
begin
     MSort(1,Dimension);
end;

procedure Vector.Mezclar(i, m, f: Word);
Var
  k,l,t : Word;
  VT  : Array[1..MaxE] of Real;
  x: Word;
begin
     k:=i;l:=m+1; t:=1;
     While(k<=m)And(L<=f) do
     Begin
          if Elementos[k]<Elementos[l] then
          begin
             VT[t]:=Elementos[k];
             k:=k+1;
          end
          Else Begin
             VT[t]:=Elementos[l];
             l:=l+1;
          End;
          t:=t+1;
     End;
     While(k<=m)do
     Begin
         VT[t]:=Elementos[k];
         k:=k+1;
         t:=t+1;
     End;
     While(l<=f)do
     Begin
         VT[t]:=Elementos[l];
         l:=l+1;
         t:=t+1;
     End;
     t:=1;
     for x := i to f do
     begin
       Elementos[x]:=VT[t];
       t:=t+1;
     end;
end;

procedure Vector.MSort(i, f: Word);
Var
  m : Word;
begin
     if i<f then
     begin
          m:=(i+f) div 2;
          MSort(i,m);
          MSort(m+1,f);
          Mezclar(i,m,f);
     end;
end;



function Vector.Dim: Word;
begin
   Result:=Dimension;
end;


procedure Vector.Dimensionar(D: Word);
begin
   Dimension:=D;
end;


procedure Vector.AddElement(e: Real);
begin
   Inc(Dimension);
   Elementos[Dimension]:=e;
end;


procedure Vector.DelElement(p: word);
var
  I: Word;
begin
   if (p>0) and (p<=Dimension) then
   begin
     for I := P to Dimension-1 do
        Elementos[I]:=Elementos[I+1];
        Dec(Dimension);
   End
   Else raise Exception.Create('Error posicion fuera de rango');
end;


function Vector.getElement(p: word): Real;
begin
    if (p>0) and (p<=Dimension) then
    Begin
     Result:=Elementos[p];
    End
    else raise Exception.Create('Error posicion fuera de rango');
end;

procedure Vector.ModElement(p: word; e: Real);
begin
     if (p>0) and (p<=Dimension) then
     Begin
          Elementos[p]:=e;
     End
     Else raise Exception.Create('Error posicion fuera de rango');
end;


procedure Vector.InsElement(p: word; e: Real);
var
  I: Word;
begin
      if (p>0) and (p<=Dimension) then
     Begin
          Inc(Dimension);
          for I := Dimension downto p+1 do
              Elementos[I]:=Elementos[I-1];
          Elementos[p]:=e;
     End
     Else raise Exception.Create('Error posicion fuera de rango');
end;


end.
