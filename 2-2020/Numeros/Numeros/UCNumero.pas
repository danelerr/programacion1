unit UCNumero;

interface
uses Math,SysUtils, Vcl.Dialogs;

Type
    Numero = Class
      Private
             Valor : uint64;
      Public
             Function getValue: uint64;
             Procedure setValue(v: uint64);
             Procedure delDigit(p :byte);
             Function numDigit:Byte;
             Function getDigit(p :byte): byte;
             procedure insDigit(d, p: byte);
             procedure modDigit(p, d: byte);
             procedure invertir;
             procedure DecToBaseB(b: byte);
             procedure BaseBToDec(b: byte);
             function getNumEnHex: string;
             function HexToDec(h: string): string;
             function aRomano: string;
             function frecuencia(d: byte): byte; //funcion auxiliar
             procedure deldigitX(x: byte); //function auxiliar
             procedure ElimDigRepetido;
             function getMenor3Cifras: word;
             function DigEsPrimo(d: byte): boolean;
             procedure ordenarPrimoNoPrimo;
             procedure EliminarDigitoMayorRepetido;
             procedure ordenarAdentroAfuera;



End;

implementation

{ Numero }


function Numero.getValue: uint64;
begin
     Result:=Valor;
end;


procedure Numero.setValue(V: uint64);
begin
     Valor:=v;
end;


procedure Numero.delDigit(P: Byte);
var Pt,N1,N2: uint64;
begin
     if (P>0)And(P<=numDigit) then
     begin
          Pt:=Trunc(Power(10,P-1));
          N1:= Valor div Pt;
          N2:= Valor mod pt;
          N1:=N1 div 10;
          Valor:=N1*Pt+N2;
     end
     Else raise Exception.Create('Posicion fuera de rango');

end;


function Numero.getDigit(P: Byte): Byte;
var
  Pt,N1: uint64;
begin
     if (P>0)And(P<=numDigit) then
     begin
          Pt:=Trunc(Power(10,P-1));
          N1:= Valor div Pt;
          Result:=N1 mod 10;
     end
     Else raise Exception.Create('Posicion fuera de rango');
end;


function Numero.numDigit: Byte;
begin
   Result:=Trunc(Log10(Valor))+1;
end;

procedure Numero.insDigit(d, p: byte);
var a, b: longword;
begin
   if (P>0)and(d<10)And(P<=numDigit+1) then begin
   a := trunc(power(10, p-1));
   b := Valor mod a;
   Valor := Valor div a;
   Valor := Valor*10+d;
   Valor := Valor*a+b;
   end else raise Exception.Create('Posicion fuera de rango');
end;



procedure Numero.modDigit(p, d: byte);
var a, b: longword;
begin
  if (P>0)and(d<10)And(P<=numDigit+1) then begin
   a := ceil(power(10, p-1));
   b := Valor mod a;
   Valor := Valor div a;
   Valor := (Valor - Valor mod 10) + d;
   Valor := Valor*a+b;
  end else raise Exception.Create('Posicion fuera de rango');
end;


procedure Numero.invertir;
var ni: uint64;
d: byte;
begin
  ni:=0;
  while Valor<>0 do begin
    d := Valor mod 10;
    Valor := Valor div 10;
    ni := ni*10+d;
  end;
  Valor := ni;
end;


procedure Numero.DecToBaseB(b: byte);
var i, numbase: uint64;
d: byte;
begin
 if b<10 then begin
  numbase:=0; i:=1;
  while Valor<>0 do begin
    d := Valor mod b;
    Valor := Valor div b;
    numbase := d*i + numbase;
    i:=i*10;
  end;
 end else raise Exception.Create('B debe ser menor 10');
  Valor := numbase;
end;

procedure Numero.BasebToDec(b: byte);
var dec, i: uint64;
d: byte;
begin
 if b<10 then begin
  dec:=0; i:=1;
  while Valor<>0 do begin
   d := Valor mod 10;
   valor := Valor div 10;
   dec := d*i + dec;
   i:=i*b;
  end;
 end else raise Exception.Create('B debe ser menor 10');
  Valor := dec;
end;




function Numero.getNumEnHex: string;
var hex: string;
r: word;
begin
  hex := '';
  while Valor<>0 do begin
    r := Valor mod 16;
    Valor := Valor div 16;
    case r of
     10: hex := 'A' + hex;
     11: hex := 'B' + hex;
     12: hex := 'C' + hex;
     13: hex := 'D' + hex;
     14: hex := 'E' + hex;
     15: hex := 'F' + hex;
    else
     hex := IntToStr(r) + hex;
    end;
  end;
  result := hex;
end;


function Numero.HexToDec(h: string): string;
var k, dec: uint64;
i, d: byte;
begin
  k:=1; dec := 0;
  for i:=length(h) downto 1 do begin
     case h[i] of
      'A': dec := 10*k + dec;
      'B': dec := 11*k + dec;
      'C': dec := 12*k + dec;
      'D': dec := 13*k + dec;
      'E': dec := 14*k + dec;
      'F': dec := 15*k + dec;
     else
      d := StrToInt(h[i]);
      dec := d*k + dec;
     end;
     k:=k*16;
  end;

 result := IntToStr(dec);
end;


function Numero.aRomano: string;
var k, n, d: uint64;
rom, g: string;
begin
  k := 1; rom := '';
  n:= Valor;
  while n<>0 do begin
    d := n mod 10;
    n := n div 10;
    d := d*k;
    k := k*10;
    case d of
      1: g := 'I';
      2: g := 'II';
      3: g := 'III';
      4: g := 'IV';
      5: g := 'V';
      6: g := 'VI';
      7: g := 'VII';
      8: g := 'VIII';
      9: g := 'IX';
      10: g := 'X';
      20: g := 'XX';
      30: g := 'XXX';
      40: g := 'XL';
      50: g := 'L';
      60: g := 'LX';
      70: g := 'LXX';
      80: g := 'LXXX';
      90: g := 'XC';
      100: g := 'C';
      200: g := 'CC';
      300: g := 'CCC';
      400: g := 'CD';
      500: g := 'D';
      600: g := 'DC';
      700: g := 'DCC';
      800: g := 'DCCC';
      900: g := 'CM';
      1000: g := 'M';
      2000: g := 'MM';
      3000: g := 'MMM';
    end;
    rom := g + rom;
  end;
  result := rom;
end;



function Numero.frecuencia(d: byte): byte;
var r, frec: byte;
num: uint64;
begin
  num := Valor; frec:=0;
  while num<>0 do begin
    r := num mod 10;
    num := num div 10;
    if r=d then frec:=frec+1;
  end;
  result := frec;
end;



procedure Numero.deldigitX(x: byte);
var d, p: byte;
begin
  p := 1;
  while p<=numDigit do begin
    d := getdigit(p);
    if d=x then deldigit(p)
    else p:=p+1;
  end;
end;



procedure Numero.ElimDigRepetido;
var d, p: byte;
begin
  p := 1;
  while p<=numDigit do begin
    d := getdigit(p);
    if frecuencia(d)>1 then deldigitX(d)
    else p:=p+1;
  end;
end;



function Numero.getMenor3Cifras: word;
var num: uint64;
men, aux: word;
begin
  num := Valor;
  men := 999;
  while num<>0 do begin
    aux := num mod 1000;
    num := num div 10;
    if (aux>=100) and (aux<men) then men := aux;
  end;
  result := men;
end;


function Numero.DigEsPrimo(d: byte): boolean;
begin
  if d in [2, 3, 5, 7] then result := true
  else result := false;
end;


procedure Numero.ordenarPrimoNoPrimo;
var tocaPrimo: boolean;  //true le toca a un digito primo | false le toca a un no primo
i, d, j: byte;
begin
  tocaPrimo := true;
  i := numDigit;
  j := i+1;
  while i>=1 do begin
    d := getDigit(i);
    if DigEsPrimo(d) and tocaPrimo then begin
       insDigit(d, j);
       delDigit(i);
       j:=j-1; i:=j-1;
       tocaPrimo := false;
    end else if not DigEsPrimo(d) and not tocaPrimo then begin
       insDigit(d, j);
       delDigit(i);
       j:=j-1; i:=j-1;
       tocaPrimo := true;
    end else i := i-1;
  end;
end;


procedure Numero.EliminarDigitoMayorRepetido;
var mr, d: byte;
cp: uint64;
begin
   cp := Valor;
   mr := 0;
   while cp<>0 do begin
    d := cp mod 10;
    cp := cp div 10;
    if (frecuencia(d)>1) and (d>mr) then mr := d;
   end;
   deldigitX(mr);
end;


procedure Numero.ordenarAdentroAfuera;
var
  newNum, a: uint64;
  d, i: byte;
  b: boolean;
begin
  newNum := 0;
  for i := 9 downto 0 do begin
    a := valor;
    while a <> 0 do begin
      d := a mod 10;
      a := a div 10;
      if d = i then newNum := newNum * 10 + d;
    end;
  end;
  a := 1;
  b := true;
  if Numdigit mod 2 = 0 then b := false;
  Valor := 0;
  while newNum <> 0 do begin
    d := newNum mod 10;
    newNum := newNum div 10;
    if b then valor := d*a + valor
    else valor := valor*10 + d;
    a := a*10;
    b := not b;
  end;
end;


end.


