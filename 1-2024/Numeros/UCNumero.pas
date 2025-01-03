unit UCNumero;
interface
Uses Math,Sysutils;
Type
    Numero = Class
      Private
         Valor : Cardinal;
      Public
         Function getValue:Cardinal;
         Procedure setValue(v:Cardinal);
         Procedure addDigit(d:Byte);
         Procedure addDigitIzq(d: byte);
         Function getDigit(p:Byte):Byte;
         Procedure modDigit(p:Byte;d:Byte);
         Procedure delDigit(p:Byte);
         Procedure insDigit(p:Byte;d:Byte);
         Function Size:Byte;
         function toBaseN(b: byte): cardinal;
         function toBase10(b: byte): cardinal;
         function toRomano: string;
         procedure delPosPrimo;

         procedure ordernarDesc;
         procedure ordernarAsc;


         procedure getMenorCombinacion;

    End;

implementation

{ Numero }

procedure Numero.addDigit(d: Byte);
begin
     Valor:=Valor*10+d;
end;

procedure Numero.addDigitIzq(d: byte);
begin
    Valor := d*Trunc(power(10,Size)) + valor;
end;

procedure Numero.delDigit(p: Byte);
Var
    t,n1,n2 : Cardinal;
begin
     if (p>0)And(p<=Size) then
     Begin
       t:=Trunc(power(10,p-1));
       n1:=(Valor div t) div 10;
       n2:=Valor mod t;
       Valor:=n1*t+n2;
     End
     Else raise Exception.Create('Error Message');
end;

procedure Numero.delPosPrimo;
var i, n, p: byte;
begin
  n := size; p:=1;
  for i:=1 to n do begin
    if i in [2, 3, 5, 7, 11, 13, 17, 19] then begin
      delDigit(p);
    end else begin
      p := p + 1;
    end;
  end;
end;



function Numero.getDigit(p: Byte): Byte;
Var
    t: Cardinal;
begin
     if (p>0) and (p<=Size) then
     Begin
      t:=Trunc(power(10,p-1));
      Result:=(Valor div t) mod 10;
     End
     Else raise Exception.Create('Posicion fuera de rango');
end;

procedure Numero.getMenorCombinacion;
var i, p, n, men, d: byte;
begin
  n := size;
  men := 9;
  for i := 1 to n do  begin
    d := getDigit(i);
    if (d < men) and (d > 0) then begin
      p := i; //salvamos la pos del menor
      men := d;
    end;
  end;
  delDigit(p);
  ordernarAsc;
  valor := men*trunc(power(10, n-1)) + valor
end;

function Numero.getValue: Cardinal;
begin
     Result:=Valor;
end;



procedure Numero.insDigit(p :Byte; d: Byte);
Var
    t,n1,n2 : Cardinal;
begin
     if (p>0)And(p<=Size+1) then
     Begin
       t:=Trunc(power(10,p-1));
       n1:=(Valor div t)*10+d;
       n2:=Valor mod t;
       Valor:=n1*t+n2;
     End
     Else raise Exception.Create('Error Message');
end;

procedure Numero.modDigit(p, d: Byte);
Var
    t,n1,n2 : Cardinal;
begin
     if (p>0)And(p<=Size) then
     Begin
       t:=Trunc(power(10,p-1));
       n1:=((Valor div t) div 10)*10+d;
       n2:=Valor mod t;
       Valor:=n1*t+n2;
     End
     Else raise Exception.Create('Error Message');
end;

procedure Numero.ordernarDesc;
var i, d: integer;
  n, res: cardinal;
begin
  res := 0;
  for i := 9 downto 0 do begin
    n := valor;
    while n<>0 do begin
      d := n mod 10;
      n := n div 10;
      if d = i then res := res * 10 + d;
    end;
  end;
  valor := res;
end;





procedure Numero.ordernarAsc;
var i, d: integer;
  n, res: cardinal;
begin
  res := 0;
  for i := 0 to 9 do begin
    n := valor;
    while n<>0 do begin
      d := n mod 10;
      n := n div 10;
      if d = i then res := res * 10 + d;
    end;
  end;
  valor := res;
end;
procedure Numero.setValue(v: Cardinal);
begin
    Valor:=v;
end;

function Numero.Size: Byte;
begin
     if Valor =0 then exit(1);
     Result:=Trunc(Log10(Valor))+1;
end;

function Numero.toBase10(b: byte): cardinal;
var n, aux, res: cardinal;
    d: byte;
begin
  res := 0;
  aux := 1;
  n := valor;
  while n > 0 do begin
    d := n mod 10;
    n := n div 10;
    res := res + d*aux;
    aux := aux * b;
  end;
  result := res;
end;

function Numero.toBaseN(b: byte): cardinal;
var n, res, aux: cardinal;
    d: byte;
begin
  n := valor;
  res := 0;
  aux := 1;
  while n > 0 do begin
    d := n mod b;
    n := n div b;
    res := d * aux + res;
    aux := aux * 10;
  end;
  result := res;
end;


function Numero.toRomano: String;
Const
    Dig:Array[1..4,1..9]of String=(
    ('I','II','III','IV','V','VI','VII','VIII','IX'),
    ('X','XX','XXX','XL','L','LX','LXX','LXXX','XC'),
    ('C','CC','CCC','CD','D','DC','DCC','DCCC','CM'),
    ('M','MM','MMM','MV','V','VI','VII','VIII','IX'));
Var
  p,d:Byte;
  n:Cardinal;
  R: String;
begin
    R:='';p:=1;
    n:=Valor;
    while n>0 do
    Begin
        d:=n mod 10;
        R:=Dig[p,d] + R;
        n:= n div 10;
        inc(p);
    End;
    Result:=R;
end;

end.
