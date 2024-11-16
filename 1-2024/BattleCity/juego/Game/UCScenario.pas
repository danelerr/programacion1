unit UCScenario;

interface
Uses SysUtils;
Const
      Etapa : Array[1..18] of String[30]=
      ('111111111111111111111111111111',
       '100000000000000000000000000001',
       '101111111111111111111110111101',
       '100000000000000003000000000101',
       '101111111111110000000000000101',
       '101000000000010000000000000101',
       '101000000000010000000000000101',
       '101000010000010000000000111101',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '101111110000010000000000100001',
       '100000010000010003000000100001',
       '100000010000010000000000100001',
       '100000010000010000000000100001',
       '102000000000010000000000100001',
       '100000000000011111111111100001',
       '100000000000000000000000000001',
       '111111111111111111111111111111');
Type
    Escenario = Class
      Private
          NroFilas, NroColumnas : Word;
          Calles : Array[1..18,1..30] of Integer;
      Public
          Function Filas : Word;
          Function Columnas : Word;
          Function GetCelda(F,C:Word):Integer;
          Procedure CargarNivel( N: Byte);
          Procedure Dimensionar( Nf,Nc : Word);
    End;

implementation

{ Escenario }

procedure Escenario.CargarNivel(N: Byte);
var
  I: Integer;
  J: Integer;
begin
     for I := 1 to NroFilas do
       for J := 1 to NroColumnas do
          Calles[I,J]:=StrToInt(Etapa[I][J]);
end;

function Escenario.Columnas: Word;
begin
     Result:=NroColumnas;
end;

procedure Escenario.Dimensionar(Nf, Nc: Word);
begin
     NroFilas:=Nf;
     NroColumnas:=Nc;
end;

function Escenario.Filas: Word;
begin
     Result:=NroFilas;
end;

function Escenario.GetCelda(F, C: Word): Integer;
begin
     Result:=Calles[F,C];
end;

end.
