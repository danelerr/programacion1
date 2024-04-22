unit UCVectores;

interface
  Uses
  SysUtils,Vcl.Dialogs;

  Const
  MaxE = 2048;
  type
    Vector = Class

      Private
        Dimension : Word;
        Elementos : Array [1..MaxE] of real;

      Public
        Procedure ReDimensionar(d:Cardinal);
        Constructor create;
        Procedure AddElemnt(E:Real);
        Procedure InsElement(P:word;E:Real);
        Procedure ModElement(P:word;E:Real);
        Procedure DelElement (P:Word);
        Function GetElement (P:word):Real;
        Function Dim:word;
        Function SumElements:Real;
        Function FindElement(E:real):string;
        Function MenorElement:real;
        Function BusquedaSecuencial(E:real):word;
        Procedure ARandom(c,ri,rf:cardinal;V:boolean);
        Procedure Intercambiar(p1,p2:Integer);
        Procedure OrdInter;
        Procedure OrdSelec;
        Procedure OrdBurbuja;
        Procedure OrdShell;
        //metodos para el QuickSort
        function pivote(i, f: word): word;
        procedure QSort(i, f: word);
        procedure QuickSort;

    End;

implementation

{ Vextor }

procedure Vector.AddElemnt(E: Real);
begin
  Dimension := Dimension + 1;
  Elementos[Dimension] := E;
end;

function Vector.BusquedaSecuencial(E: real): word;
var
    i:integer; p: word;
begin
  i:= 1; p:= 0;
  while (i<=Dimension) and (p=0) do
  begin
      if E=Elementos[i] then
          p:= i;
      inc(i);
  end;
  Result:= p;
end;

constructor Vector.create;
begin

end;

procedure Vector.DelElement(P: Word);
var
  I: Integer;
begin
  if (p>0) and (p<=Dimension) then
  begin
    for I := p to Dimension-1 do
    begin
      Elementos[i] := Elementos[i+1];
    end;
    Dec(dimension);
  end
  else raise Exception.Create('Posición fuera de rango');
end;

function Vector.Dim: word;
begin
  Result:= Dimension;
end;

function Vector.FindElement(E: real): string;
var
  I: Integer; p:string;
begin
  p:= '';
  for I := 1 to Dimension do
  begin
    if E = Elementos[i] then
      p:= p + InttoStr(i) + ' ';
  end;
  if p>'' then result:= p
  else raise Exception.Create('No existe el elemento ' + FloatToStr(e) +' en el vector');

end;



procedure Vector.InsElement(P: word; E: Real);
var
  I: Integer;
begin
  if (p>0) and (p<=Dimension) then
  begin
    Inc(dimension);
    for I := Dimension downto p do
      Elementos[i]:= Elementos [i-1];
    Elementos[p]:= E;
  end
  else raise Exception.Create('Posición fuera de rango');
end;

procedure Vector.Intercambiar(p1, p2: Integer);
var aux:real;
begin
        Aux:= Elementos[p2];
        Elementos[p2]:= Elementos[p1];
        Elementos[p1]:= aux;
end;

function Vector.MenorElement: real;
var
  I: Integer;  menor:real;
begin
  menor:= MaxE;
  for I := 1 to Dimension do
  begin
    if Elementos[i] < menor then menor:= Elementos[i];
  end;
  Result:= menor;
end;

procedure Vector.ModElement(P: word; E: Real);
begin
  if (p>0) and (p<=Dimension) then
  begin
    Elementos[p]:= E;
  end
  else raise Exception.Create('Posición fuera de rango');
end;

procedure Vector.OrdBurbuja;
var
  I: Word;     Aux:real;
  J: Integer;
begin
  for I := Dimension Downto 1 do
  begin
    for J := 1 to I do
    begin
      if Elementos[j] > Elementos[j+1] then
      begin
        Aux:= Elementos[j+1];
        Elementos[j+1]:= Elementos[j];
        Elementos[j]:= aux;
      end;
    end;
  end;
end;

procedure Vector.OrdInter;
var
  I: Integer;  Aux:real;
  U: Integer;
begin
  for I := 1 to dimension - 1 do
  begin
    for U := I + 1 to Dimension do
    begin
      aux:= elementos[i];
      if Elementos[u] < Elementos[i] then
      begin
        Elementos[i]:= Elementos[u];
        Elementos[u]:= Aux;
      end;
    end;
  end;
end;

procedure Vector.OrdSelec;
var
  I,k,j: Integer;  Aux:real;
begin
  for I := 1 to Dimension do
  begin
    k:= i;
    for J := I+1 to Dimension do
    begin
      if Elementos[j] < Elementos[k] then
      begin
        k:= j;
      end;
    end;
    Aux:= Elementos[i];
    if Elementos[k] <> Elementos[i] then
      begin
        Elementos[i]:= Elementos[k];
        Elementos[k]:= Aux;
      end;
  end;
end;

procedure Vector.OrdShell;
var Fact,i:integer; aux:real; t:boolean;
begin
  fact:= Dimension div 2;
  repeat
      i:=1; t:= false;
      while i<=(Dimension-Fact) do
      begin
        if Elementos[i] > Elementos[i+fact] then
        begin
          Aux:= Elementos[i];
          Elementos[i]:= Elementos[i+fact];
          Elementos[i+fact]:= aux;
          t:= True;
        end;
        if not(t) then
        begin
          Fact:= Fact div 2;
        end;
        inc(I);
      end;
  until fact = 0 ;
end;




function Vector.pivote(i, f: word): word;
var t: boolean;
begin
  t := true;
  repeat
    if Elementos[i]>Elementos[f] then begin
       intercambiar(i, f);
       t := not t;
    end;
    if t=true then i:=i+1
    else f := f-1;
  until f = i;
  result := f;
end;

procedure Vector.QSort(i, f: word);
var n, p: word;
begin
  n := f - i + 1;
  if n>1 then begin
    p := pivote(i, f);
    QSort(i, p-1);
    QSort(p+1, f);
  end;
end;

procedure Vector.QuickSort;
begin
  QSort(1, Dimension);
end;

procedure Vector.ARandom(c, ri, rf: cardinal;V:boolean);
var
  I: Integer; Nro:real;
begin
    Randomize;
    Dimension:= 0;
    for I := 1 to c do
    begin
      Nro:= Random(rf);
      if (random(rf) mod 2=1) and (V=true) then
          Nro:= Nro + (Random(rf)/1000);

      if BusquedaSecuencial(nro)=0 then
          self.AddElemnt(nro);
    end;
end;

procedure Vector.ReDimensionar(d:cardinal);
begin
  Dimension:= d;
end;

function Vector.GetElement(P: word): Real;
begin
  if (p>0) and (p<=dimension) then
  begin
    Result:= Elementos[p];
  end else raise Exception.Create('Posición fuera de rango');
end;



function Vector.SumElements: Real;
var
  I: Integer; sum:real;
begin
  Sum:= 0;
  for I := 1 to Dimension do
    Sum:= Sum + Elementos[i];
  Result:=sum;
end;

end.
