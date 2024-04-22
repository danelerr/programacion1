unit UCMatriz;

interface
Uses SysUtils, math;
const
     Nf = 128;
     Nc = 128;
Type

    Matriz = Class
      Private
             NroFilas,
             NroColumnas : Word;
             Celdas: Array[1..Nf,1..Nc] Of Real;
      Public
            Procedure Redimensionar(NF,NC:Word);
            Function Filas : Word;
            Function Columnas : Word;
            Function ObtElement(F,C:Word):Real;
            Procedure ModElement(F,C:Word; E:Real);
            Procedure AddFila;
            Procedure AddColumna;
            Procedure InsFila(F:Word);
            Procedure InsColumna(C:Word);
            Procedure DelFila(F:Word);
            Procedure DelColumna(C:Word);
            Function SumarElementos:Real;
            function VectorPosF(p: word): word;
            function VectorPosC(p: word): word;
            function VectorPos(f, c: word): word;
            procedure intercambiar(i, j, k, l: word);
End;

implementation

{ Matriz }



procedure Matriz.AddColumna;
begin
     Inc(NroColumnas);

end;

procedure Matriz.AddFila;
begin
     Inc(NroFilas);

end;

function Matriz.Columnas: Word;
begin
     Result:=NroColumnas;
end;

procedure Matriz.DelColumna(C: Word);
begin
  //implementar
end;

procedure Matriz.DelFila(F: Word);
var
  I: Word;
  j: Integer;
begin
     if (F>0)And(F<=NroFilas) then
     Begin
      for I := F to NroFilas-1 do
        for j := 1 to NroColumnas do
          Celdas[i,j]:=Celdas[i+1,j];
      Dec(NroFilas);
     End
     Else raise Exception.Create('Fila Invalida');
end;

function Matriz.Filas: Word;
begin
     Result:=NroFilas;
end;

procedure Matriz.InsColumna(C: Word);
begin
   //implementar
end;

procedure Matriz.InsFila(F: Word);
var
  I: Word;
  J: Integer;
begin
      if (F>0)And(F<=NroFilas) then
     Begin
          Inc(NroFilas);
          for I := NroFilas downto F+1 do
             for J := 1 to NroColumnas do
                 Celdas[I,J]:=Celdas[I-1,J];
     End
     Else raise Exception.Create('Columna Invalida');

end;

procedure Matriz.ModElement(F, C: Word; E: Real);
begin
     if (F>0)And(F<=NroFilas) And(C>0)And(C<=NroColumnas) then
         Celdas[F,C]:=E
     Else raise Exception.Create('Posicion Invalida');
end;

function Matriz.ObtElement(F, C: Word): Real;
begin
     if (F>0)And(F<=NroFilas) And(C>0)And(C<=NroColumnas) then
         Result:=Celdas[F,C]
     Else raise Exception.Create('Posicion Invalida');
end;

procedure Matriz.Redimensionar(NF, NC: Word);
begin
     NroFilas:=NF;
     NroColumnas:=NC;
end;

function Matriz.SumarElementos: Real;
var
  I,J: Integer;
  Suma : Real;
begin
    Suma:=0;
     for I := 1 to NroFilas do
        for J := 1 to NroColumnas do
            Suma:=Suma+Celdas[i,j];
     Result:=Suma;
end;


//para trabajar con ordenamiento vector
function Matriz.VectorPos(f, c: word): word;
begin
  result := (f-1)*NroColumnas+c;
end;

function Matriz.VectorPosC(p: word): word;
begin
  result:=((p-1) mod NroColumnas)+1;
end;

function Matriz.VectorPosF(p: word): word;
begin
  result := ((p-1) div NroColumnas)+1;
end;



procedure Matriz.intercambiar(i, j, k, l: word);
var x: real;
begin
  x:=Celdas[i, j];
  Celdas[i, j]:=Celdas[k, l];
  Celdas[k, l]:=x;
end;

end.

