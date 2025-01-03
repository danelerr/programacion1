unit UCMatriz;

interface
Uses SysUtils;
Const
  MaxF = 128;
  MaxC = 128;
Type
    Matriz = Class
      Private
         NroFilas,
         NroColumnas : Word;
         Celdas : Array[1..MaxF,1..MaxC] Of Real;
      Public
         Function Rows:Word;
         Function Columns:Word;
         Function getElement(F,C:Word):Real;
         Procedure setValue(F,C:Word;E:Real);
         Procedure addRow;
         Procedure addColumn;
         Procedure delRow(f:Word);
         Procedure delColumn(c:Word);
         Procedure insRow(f:Word);
         Procedure insColumn(c:Word);
         Procedure redim(Nf,Nc:Word);
         Procedure cargarRandom;


         function obtenerMayorNum: real;

         {Series y patrones de llenado}
         {llenado de forma normal}
         procedure llenarFibo;
         {llenado en s, desde abajo}
         procedure llenarFibo2;
         {llenado a nivel de paredes}
         procedure llenarForma3;

         procedure ordernarColumna(col: word);

    End;

implementation

{ Matriz }

procedure Matriz.addColumn;
begin
    Inc(NroColumnas);
end;

procedure Matriz.addRow;
begin
    Inc(NroFilas);
end;

procedure Matriz.cargarRandom;
var
  I: Integer;
  J: Integer;
begin
     Randomize;
     for I := 1 to NroFilas do
      for J := 1 to NroColumnas do
        Celdas[I,j]:=Random(9);
end;

function Matriz.Columns: Word;
begin
     Result:=NroColumnas;
end;

procedure Matriz.delColumn(c: Word);
var
  i: Word;
  j: Integer;
begin
     if  (c>0)And(c<=NroColumnas) then
     Begin
     for i := c to NroColumnas-1 do
      for j := 1 to NroFilas do
        Celdas[j,i]:=Celdas[j,i+1];
     Dec(NroColumnas);
     End Else raise Exception.Create('Error Message');
end;

procedure Matriz.delRow(f: Word);
var
  i: Word;
  j: Integer;
begin
     if  (f>0)And(f<=Nrofilas) then
     Begin
     for i := f to NroFilas-1 do
      for j := 1 to NroColumnas do
        Celdas[i,j]:=Celdas[i+1,j];
     Dec(NroFilas);
     End Else raise Exception.Create('Error Message');

end;

function Matriz.getElement(F, C: Word): Real;
begin
     if (f>0)And(f<=NroFilas)and(c>0)and(c<=NroColumnas) then
        Result:=Celdas[f,c]
     Else raise Exception.Create('Error posicion fuera de rango');
end;

procedure Matriz.insColumn(c: Word);
var
  I: Word;
  j: Integer;
begin
     if  (c>0)And(c<=NroColumnas) then
     Begin
          Inc(NroColumnas);
          for I := NroColumnas downto c+1  do
            for j := 1 to NroFilas do
              Celdas[J,I]:=Celdas[J,I-1];
     End Else raise Exception.Create('Error Message');
end;

procedure Matriz.insRow(f: Word);
var
  I: Word;
  j: Integer;
begin
     if  (f>0)And(f<=Nrofilas) then
     Begin
          Inc(NroFilas);
          for I := NroFilas downto f+1  do
            for j := 1 to NroColumnas do
              Celdas[i,j]:=Celdas[i-1,j];
     End Else raise Exception.Create('Error Message');
end;


procedure Matriz.llenarFibo;
var i, j: word;
  a, b, c: real;
begin
  a := 1;
  b := 0;
  for i := 1 to NroFilas do begin
    for j := 1 to NroColumnas do begin
      c := a + b;
      a := b;
      b := c;
      celdas[i, j] := c;
    end;
  end;
end;

procedure Matriz.llenarFibo2;
var i, j: word;
  a, b, c: real;
  flag: boolean;
begin
  a := 1;
  b := 0;
  flag := true;
  for i := NroFilas downto 1 do begin

    if flag then begin
      for j := NroColumnas downto 1 do begin
        c := a + b;
        a := b;
        b := c;
        celdas[i, j] := c;
      end;
      flag := false;
    end else begin
      for j := 1 to NroColumnas do begin
        c := a + b;
        a := b;
        b := c;
        celdas[i, j] := c;
      end;
      flag := true;
    end;
  end;
end;

procedure Matriz.llenarForma3;
var i, j, i1, i2, j1, j2, a: word;
begin
  i1 := 1;
  i2 := NroFilas;
  j1 := 1;
  j2 := NroColumnas;
  a := 1;
  while (i1 <= i2) and (j1 <= j2) do begin
    for j := j1 to j2 do begin
      Celdas[i1, j] := a;
      Celdas[i2, j] := a;
    end;
    i1 := i1 + 1;
    i2 := i2 - 1;
    for i := i1 to i2 do begin
      Celdas[i, j1] := a;
      Celdas[i, j2] := a;
    end;
    j1 := j1 + 1;
    j2 := j2 - 1;
    a := a + 2;
  end;
end;

function Matriz.obtenerMayorNum: real;
var i, j: word;
num1, num2, may, k: real;
begin
  may := 0;
  {buscar en las filas}
  for i := 1 to NroFilas do begin
    k := 1;
    num1 := 0;
    num2 := 0;
    for j := 1 to NroColumnas do begin
      num1 := num1 * 10 + Celdas[i, j];
      num2 := celdas[i, j] * k + num2;
      k := k * 10;
    end;
    if num1 > may then may := num1;
    if num2 > may then may := num2;
  end;
  {buscar en las columas}
  for j := 1 to NroColumnas do begin
    k := 1;
    num1 := 0;
    num2 := 0;
    for i := 1 to NroFilas do begin
      num1 := num1 * 10 + Celdas[i, j];
      num2 := celdas[i, j] * k + num2;
      k := k * 10;
    end;
    if num1 > may then may := num1;
    if num2 > may then may := num2;
  end;
  result := may;
end;

procedure Matriz.ordernarColumna(col: word);
var i, j: word;
  a: real;
begin
  for i := 1 to NroFilas do begin
    for j := 1 to NroFilas-1 do begin
      if celdas[j, col] < celdas[j+1, col] then begin
        a := celdas[j, col];
        celdas[j, col] := celdas[j+1, col];
        celdas[j+1, col] := a;
      end;
    end;
  end;

end;

procedure Matriz.redim(Nf, Nc: Word);
begin
     NroFilas:=Nf;
     NroColumnas:=Nc;
end;

function Matriz.Rows: Word;
begin
     Result:=NroFilas;
end;

procedure Matriz.setValue(F, C: Word; E: Real);
begin
     if (f>0)And(f<=NroFilas)and(c>0)and(c<=NroColumnas) then
        Celdas[f,c]:=E
     Else raise Exception.Create('Error posicion fuera de rango');
end;

end.
