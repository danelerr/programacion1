unit UCNumero;

interface
Uses Math,SysUtils;
Type
    Numero = Class
      Private
            Valor:Cardinal;
      Public
            Function getValue:Cardinal;
            Function getDigit(p:Byte):Byte;
            Function getNumDigit:Byte;
            Function toRoman:String;
            Function toLiteral2D(n : Word):String;
            Procedure setValue(v:Cardinal);
            Procedure addDigitFirst(d:Byte);
            Procedure addDigitLast(d:Byte);
            Procedure insDigit(p:Byte;d:Byte);
            Procedure delDigit(p:Byte);
            Procedure modDigit(p:Byte;d:Byte);
            Procedure invertir;
            Function findDidit(d:Byte):Byte;

    End;

implementation

{ Numero }

procedure Numero.addDigitFirst(d: Byte);
begin
     Valor:=Valor*10+d;
end;

procedure Numero.addDigitLast(d: Byte);
Var
  k : Cardinal;
begin
     k:=Trunc(Power(10,getNumDigit));
     Valor:=d*k+Valor;
end;

procedure Numero.delDigit(p: Byte);
Var
  k : Cardinal;
begin
     k:=Trunc(Power(10,p-1));
     Valor:=((Valor div k) div 10)*k+(Valor mod k);
end;

function Numero.findDidit(d: Byte): Byte;
var
  I,C: Integer;
begin
    c:=0;
    for I := 1 to getNumDigit do
       if getDigit(i)=d then C:=c+1;
    Result:=C;
end;

function Numero.getDigit(p: Byte): Byte;
begin
     if (p>0) and (p<=getNumDigit) then
         Result:=(Valor div (Trunc(Power(10,p-1)))) mod 10
     Else raise Exception.Create('Posicion fuera de rango');
end;

function Numero.getNumDigit: Byte;
begin
     if Valor=0 then Result:=1
     Else
     Result:=Trunc(Log10(Valor))+1;;
end;

function Numero.getValue: Cardinal;
begin
     Result:=Valor;
end;

procedure Numero.insDigit(p, d: Byte);
begin

end;

procedure Numero.invertir;
Var
  d,i,f: Byte;
begin
     i:=1; f:=getNumDigit;
     while i<f do
     Begin
          d:=getDigit(i);
          modDigit(i,getDigit(f));
          modDigit(f,d);
          i:=i+1;f:=f-1;
     End;
end;

procedure Numero.modDigit(p, d: Byte);
Var
  k,n1,n2 : Cardinal;
begin
     k:=Trunc(Power(10,p-1));
     n1:= ((Valor div k) div 10)*10+d;
     n2:= Valor mod k;
     Valor:=n1*k+n2;
end;

procedure Numero.setValue(v: Cardinal);
begin
     Valor:=v;
end;

function Numero.toLiteral2D(n : Word) : String;
Const
     Un : Array[1..15] of String=('UNO','DOS','TRES','CUATRO','CINCO','SEIS','SIETE','OCHO','NUEVE','DIEZ','ONCE','DOCE','TRECE','CATORCE','QUINCE');
     Dec: Array[1..9] of String=('DIEZ','VEINTE','TREINTA','CUARENTA','CINCUENTA','SECENTA','SETENTA','OCHENTA','NOVENTA');
begin
     if (n>0)and(n<=15) then
         Result:=Un[n]
     Else Result:=Dec[n div 10]+' y '+Un[n mod 10];

end;

function Numero.toRoman: String;
Const
    Dig : Array[1..4,0..9] of String=
          (('','I','II','III','IV','V','VI','VII','VIII','IX'),
           ('','X','XX','XXX','XL','L','LX','LXX','LXXX','XC'),
           ('','C','CC','CCC','CD','D','DC','DCC','DCCC','CM'),
           ('','M','MM','MMM','Mv','v','vM','vMM','vMMM','Ml'));
var
  I: Integer;
  s : String;
begin
     s:='';
     for I := 1 to getNumDigit do
      s:=Dig[i,getDigit(i)]+s;

     Result:=s;
end;

end.
