unit UCMatriz;

interface
uses SysUtils;
Const
    MaxF=128;
    MaxC=128;
Type
    Matriz = Class
      Private
          NroFilas,
          NroColumnas : Word;
          Celdas: Array[1..MaxF,1..MaxC] of Real;
      Public
          Function Filas:Word;
          Function Columnas:Word;
          Procedure Dimensionar(Nf,Nc:Word);
          Function getCelda(F,C:Word):Real;
          Procedure setCelda(F,C:Word; E:Real);
          Procedure addFila;
          Procedure AddColumna;
          Procedure InsFila(f:Word);
          Procedure InsColumna(c:Word);
          Procedure delFila(f:Word);
          Procedure delColumna(c:Word);
    End;

implementation

{ Matriz }

procedure Matriz.AddColumna;
begin
     Inc(NroColumnas);
end;

procedure Matriz.addFila;
begin
     Inc(NroFilas);
end;

function Matriz.Columnas: Word;
begin
     Result:=NroColumnas;
end;

procedure Matriz.delColumna(c: Word);
var
  I: Word;
  J: Integer;
begin
     for I := C to NroColumnas-1 do
        for J := 1 to NroFilas do
          Celdas[J,I]:=Celdas[J,I+1];
     Dec(NroColumnas);
end;

procedure Matriz.delFila(f: Word);
var
  I: Word;
  J: Integer;
begin
     for I := F to NroFilas-1 do
        for J := 1 to NroColumnas do
          Celdas[I,J]:=Celdas[I+1,J];
     Dec(NroFilas);
end;

procedure Matriz.Dimensionar(Nf, Nc: Word);
begin
     NroFilas:=Nf;
     NroColumnas:=Nc;
end;

function Matriz.Filas: Word;
begin
     Result:=NroFilas;
end;

function Matriz.getCelda(F, C: Word): Real;
begin
     if (F>0)And(F<=NroFilas)And(C>0)And(C<=NroColumnas) then
          Result:=Celdas[F,C]
     else raise Exception.Create('Error Message');
end;

procedure Matriz.InsColumna(c: Word);
var
  I: Word;
  J: Integer;
begin
     Inc(NroColumnas);
     for I := NroColumnas to c+1 do
        for J := 1 to NroFilas do
          Celdas[J,I]:=Celdas[J,I-1];
end;

procedure Matriz.InsFila(f: Word);
var
  I: Word;
  J: Integer;
begin
     Inc(NroColumnas);
     for I := NroFilas to f+1 do
        for J := 1 to NroColumnas do
          Celdas[I,J]:=Celdas[I-1,J];
end;

procedure Matriz.setCelda(F, C: Word; E: Real);
begin
     if (F>0)And(F<=NroFilas)And(C>0)And(C<=NroColumnas) then
         Celdas[F,C]:=E
     Else raise Exception.Create('Error Message');
end;

end.
