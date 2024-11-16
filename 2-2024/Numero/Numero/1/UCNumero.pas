unit UCNumero;

interface
Uses Math;

Type
    Numero = Class
      Private
        Valor:Cardinal;
      Public
        function obtenerValor: cardinal;
        procedure cambiarValor(v: cardinal);
        Function getDigit(p:Byte):Byte;
        Function getNumDigit:Byte;
        Procedure addDigitFirst(d:Byte);
        Procedure addDigitLast(d:Byte);
        Procedure insDigit(p:Byte; d:Byte);
        Procedure delDigit(p:Byte);
        Procedure modDigit(p:Byte; d:Byte);
        function obtenerEnBaseN(b: byte): cardinal;
        function obtenerEnBase10(b: byte): cardinal;

        //ejericicios
        function obtenerMen3Cifras: cardinal;
        procedure ordenarDigDescente;
        procedure ordenarDigAscendente;
        procedure ordenarParOrdImparOrd;
  End;
implementation

{ Numero }

procedure Numero.addDigitFirst(d: Byte);
begin
     Valor:=Valor*10+d;
end;

procedure Numero.addDigitLast(d: Byte);
var
    k : Cardinal;
begin
     k:=Trunc(Power(10,getNumDigit));
     Valor:=d*k+Valor;
end;

procedure Numero.cambiarValor(v: cardinal);
begin
  valor := v;
end;

procedure Numero.delDigit(p: Byte);
var k: cardinal;
begin
  k := trunc(power(10, p-1));
  valor := (((valor div k) div 10) * k) + (valor mod k);
end;

function Numero.getDigit(p: Byte): Byte;
begin
     Result:=((Valor div (Trunc(Power(10,p-1)))) mod 10);
end;

function Numero.getNumDigit: Byte;
begin
     Result:=Trunc(Log10(Valor))+1;
end;

procedure Numero.insDigit(p, d: Byte);
var k: cardinal;
begin
  k := trunc(power(10, p-1));
  valor := (((valor div k)*10 + d) * k) + (valor mod k);
end;

procedure Numero.modDigit(p, d: Byte);
Var
k,n1,n2 : Cardinal;
begin
     k:=Trunc(Power(10,p-1));
     n1:=((Valor div k) div 10)*10+d;
     n2:=Valor mod k;
     Valor:=n1*k+n2;

end;

function Numero.obtenerEnBase10(b: byte): cardinal;
var n, res, d, k: cardinal;
begin
  n := valor;
  k := 1;
  res := 0;
  while n > 0 do begin
    d := n mod 10;
    n := n div 10;
    res := d*k + res;
    k := k * b;
  end;
  result := res;
end;

function Numero.obtenerEnBaseN(b: byte): cardinal;
var n, res, d, k: cardinal;
begin
  n := valor;
  k := 1;
  res := 0;
  while n > 0 do begin
    d := n mod b;
    n := n div b;
    res := d*k + res;
    k := k * 10;
  end;
  result := res;
end;

function Numero.obtenerMen3Cifras: cardinal;
var n, num, men: cardinal;
begin
  n := valor;
  men := n mod 1000;
  while n > 99 do begin
    num := n mod 1000;
    if (num < men) and (num > 99) then men := num;
    n := n div 10;
  end;
  result := men;
end;

function Numero.obtenerValor: cardinal;
begin
  result := valor;
end;

procedure Numero.ordenarDigAscendente;
var n, i, res: cardinal;
  d: byte;
begin
  res := 0;
  for i := 0 to 9 do begin
    n := valor;
    while n > 0 do begin
      d := n mod 10;
      n := n div 10;
      if d = i then res := res * 10 + d;
    end;
  end;
  valor := res;
end;


procedure Numero.ordenarDigDescente;
var n, i, res: cardinal;
  d: byte;
begin
  res := 0;
  for i := 9 downto 0 do begin
    n := valor;
    while n > 0 do begin
      d := n mod 10;
      n := n div 10;
      if d = i then res := res * 10 + d;
    end;
  end;
  valor := res;
end;

procedure Numero.ordenarParOrdImparOrd;
var par, impar, ccero: cardinal;
  d: byte;
begin
  par := 0;
  impar := 0;
  ccero := 0;
  while valor > 0 do begin
    d := valor mod 10;
    valor := valor div 10;
    if d = 0 then begin
      ccero := ccero + 1;
    end else if d mod 2 = 0 then begin
      par := par * 10 + d;
    end else begin
      impar := impar * 10 + d;
    end;
  end;
  valor := par;
  ordenarDigDescente;
  par := valor;
  valor := impar;
  ordenarDigDescente;
  par := par * trunc(power(10, getNumDigit)) + impar;
  valor := par;
  valor := par * trunc(power(10, ccero));
end;

end.
