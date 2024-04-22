unit UCCadena;

interface
Uses SysUtils, Vcl.Dialogs, Math;

Const
     MaxC = 1024;
     Separador =[' ',',',';'];
     letras = ['A'..'Z', 'a'..'z'];
     vocales = ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u', 'á'..'ü', 'À'..'Ü'];
     Thora:array[1..59] of string= ('uno','dos','tres','cuatro','cinco','seis','siete','ocho','nueve','diez','once','doce','trece','catorce','quince','dieciseis','diecisiete','dieciocho','diecinueve','veinte','veintiuno','veintidos','veintitres','veinticuatro','veinticinco','veintiseis','veintisiete','veintiocho','veintinueve','treinta','treinta y uno','treinta y dos','treinta y tres','treinta y cuatro','treinta y cinco','treinta y seis','treinta y siete','treinta y ocho','treinta y nueve','cuarenta','cuarenta y uno','cuarenta y dos','cuarenta y tres','cuarenta y cuatro','cuarenta y cinco','cuarenta y seis','cuarenta y siete','cuarenta y ocho','cuarenta y nueve','cincuenta','cincuenta y uno','cincuenta y dos','cincuenta y tres','cincuenta y cuatro','cincuenta y cinco','cincuenta y seis','cincuenta y siete','cincuenta y ocho','cincuenta y nueve');
     consonantes = letras - vocales;
     numeros = ['0'..'9'];
Type
    Cadena = Class
      Private
             Longitud : Word;
             Caracteres : Array[1..MaxC] of Char;
      Public
             Function getLong : Word;
             Procedure AddChar(c:Char);
             Function getChar(p:Word):Char;
             Procedure modChar(p:Word;c:Char);
             Procedure delChar(p:Word);
             Procedure insChar(p:Word;c:Char);
             Procedure invChars;
             Function getStr:String;
             Procedure AddStr(s:String);

             Procedure upperCase;
             Procedure lowerCase1;
             function StrToEntero: word;


             Function countWord:Word;
             function nWord(p:Word):String;
             Function nextWord(var i:word):String;
             procedure delWord(p: word);


             function variadDeVocales(s: string): word;
             function contarPalabrasMas2Voc: word;

             function compararHora(h1, h2: string): boolean;
             function devolverHoraMenor: string;
             procedure eliminarComienzaTeriminaConsonante;
             function buscarPalabraEnVector(pal: string; var index: string): boolean;
             function FormatearHora: string;
             function FormatearHora2: string;
             function TieneVocalRepetida(pal: string): boolean;
             procedure ElimPalConVocRepetidas;
             procedure eliminarPalabraSub(sub: string);
             function SumarReales(cd: byte): real;
end;

implementation

{ Cadena }


procedure Cadena.eliminarPalabraSub(sub: string);
var i: word;
pal: string;
begin
  i:=1;
  while i<=CountWord do begin
    pal := nWord(i);
    if Pos(sub, pal)>0 then delWord(i)
    else i:=i+1;
  end;
end;

function Cadena.StrToEntero: word;
var i, res: word;
begin
  res := 0;
  for i := 1 to Longitud do
    res := res*10 + (ord(Caracteres[i]) - 48);
  result := res;
end;

procedure Cadena.AddChar(c: Char);
begin
      Longitud := Longitud + 1;
      Caracteres[Longitud]:=c;

end;


function Cadena.variadDeVocales(s: string): Word;
var aux: string;
  i: Integer;
  voc: set of char;
begin
   aux := '';
   voc := ['A', 'E', 'I', 'O', 'U', 'a', 'e', 'i', 'o', 'u', 'á'..'ü', 'À'..'Ü'];
   for i := 1 to length(s) do begin
    if (s[i] in voc) and (Pos(s[i], aux) = 0) then aux:=aux+s[i];
   end;
   result := length(aux);
end;

function Cadena.contarPalabrasMas2Voc: Word;
var i, count: word;
  s: string;
begin
   i := 1;
   count := 0;
   while i<=Longitud do begin
    s:= nextWord(i);
    if variadDeVocales(s) > 2 then count:=count+1;
   end;
   result := count;
end;
procedure Cadena.AddStr(s: String);
var
  I: Integer;
begin
     Longitud:=Length(s);
     for I := 1 to Longitud do
        Caracteres[i]:=s[i];
end;





function Cadena.countWord: Word;
Var
   i,c : Word;
begin
     i:=1; c:=0;
     while i<Longitud do
     Begin
          if not (Caracteres[i] in Separador) And (Caracteres[i+1] in Separador) then
             c:=c+1;
          i:=i+1;
     End;
     if not (Caracteres[i] in Separador) Then c:=c+1;
     Result:=c;
end;

procedure Cadena.delChar(p: Word);
Var
   i : Word;
begin
     if (p>0) And (p<=Longitud) then
     begin
         for I :=p  to Longitud-1 do
              Caracteres[i]:=Caracteres[i+1];
         Dec(Longitud);
     end
     Else raise Exception.Create('Error posicion fuera de rango');
end;

function Cadena.getChar(p: Word): Char;
begin
     if (p>0) And (p<=Longitud) then
     begin
          Result:=Caracteres[p];
     end
     Else raise Exception.Create('Error posicion fuera de rango');
end;

function Cadena.getLong: Word;
begin
     Result:=Longitud;
end;

function Cadena.getStr: String;
Var
   s: String;
   i : Word;
begin
      s:='';
      for I := 1 to Longitud do
          s:=s+Caracteres[i];
      Result:=s;
end;

procedure Cadena.insChar(p: Word; c: Char);
var
  I: Word;
begin
     if (p>0) And (p<=Longitud) then
     begin
          inc(Longitud);
          for I :=Longitud downto p+1 do
          begin
                Caracteres[I]:=Caracteres[i-1];
          end;
          Caracteres[p]:=c;
     end
     Else raise Exception.Create('Error posicion fuera de rango');


end;

procedure Cadena.invChars;
Var
    i,f : Word;
    a : Char;
begin
      i:=1;
      f:=Longitud;
      while i<f do
      begin
           a:=Caracteres[i];
           Caracteres[i]:=Caracteres[f];
           Caracteres[f]:=a;
           i:=i+1;
           f:=f-1;
      end;
end;

procedure Cadena.lowerCase1;
var
  I: Integer;
begin
     for I := 1 to Longitud do
       if Caracteres[i] in ['A'..'Z', 'À'..'Ü'] then
          Caracteres[i]:=Chr(ord(Caracteres[i])+32);
end;

procedure Cadena.modChar(p: Word; c: Char);
begin
     if (p>0) And (p<=Longitud) then
     begin
          Caracteres[p]:=C;
     end
     Else raise Exception.Create('Error posicion fuera de rango');
end;

function Cadena.nextWord(var i: word): String;
var
    p: String;
begin
     while (i<=Longitud) and (Caracteres[i] in Separador) do
         i:=i+1;
     p:='';
     while (i<=Longitud) and not (Caracteres[i] in Separador) do
     begin
          p:=p+Caracteres[i];
          i:=i+1;
     end;
     Result:=p;
end;

function Cadena.nWord(p: Word): String;
Var
   k,c: Word;
   pal : String;
begin
     if (p>0) and (p<=countWord) then
     Begin
          k:=1;
          while p>0 do
          begin
               Pal:=nextWord(k);
               p:=p-1;
           end;
           result:=Pal;
     End
     Else raise Exception.Create('La posicion no es valida');
end;


procedure Cadena.delWord(p: word);
var i, c: word;
pal: string;
begin
  if (p>0) and (p<=countWord) then begin
   i:=1; c:=1;
   while c<>p do begin
      if not (Caracteres[i] in Separador) And (Caracteres[i+1] in Separador)  then c:=c+1;
      i:=i+1;
   end;
   while Caracteres[i] in Separador do i:=i+1;
   while not (Caracteres[i] in Separador) and (i<=Longitud)do
    delChar(i);
  end else raise Exception.Create('Error: posicion no valida');
end;

procedure Cadena.upperCase;
var
  I: Integer;
begin
     for I := 1 to Longitud do
       if Caracteres[i] in ['a'..'z', 'á'..'ü'] then
         Caracteres[i]:=Chr(ord(Caracteres[i])-32);
end;



function Cadena.compararHora(h1, h2: string): boolean;
var res: boolean;
begin
  res := true;
  if length(h1)>length(h2) then res := true
  else if length(h2)>length(h1) then res := false
  else if StrToInt(h1[1]+h1[2])>StrToInt(h2[1]+h2[2]) then res:=true
  else if StrToInt(h2[1]+h2[2])>StrToInt(h1[1]+h1[2]) then res:=false
  else if StrToInt(h1[4]+h1[5])>StrToInt(h2[4]+h2[5]) then res:=true
  else if StrToInt(h2[4]+h2[5])>StrToInt(h1[4]+h1[5]) then res:=false
  else if StrToInt(h1[7]+h1[8])>StrToInt(h2[7]+h2[8]) then res:=true
  else if StrToInt(h2[7]+h2[8])>StrToInt(h1[7]+h1[8]) then res:=false;
  result := res;
end;

function Cadena.devolverHoraMenor: string;
var i: word;
h, hmen: string;
begin
  i:=1;
  hmen:='60:60:60';
  while i<=Longitud do begin
    h:=NextWord(i);
    if compararHora(hmen, h) then hmen:=h;
 end;
  result := hmen;
end;



procedure Cadena.eliminarComienzaTeriminaConsonante;
var i: Word;
cad, x: string;
begin
  i:=1;  x:='';
  while i<=Longitud do begin
    cad := nextWord(i);
    if not(cad[1] in Consonantes) or not(cad[Length(cad)] in Consonantes) then
      x:=x+cad;
  end;
  AddStr(x);
end;


function Cadena.buscarPalabraEnVector(pal: string; var index: string): boolean;
var i: byte;
res: boolean;
begin
  i:=1; index := '';
  pal := LowerCase(pal);
  while (i<=59) and (Thora[i]<>pal) do i:=i+1;
  if i<=59 then begin
   if i<9 then index := '0';
   index := index + IntToStr(i);
   res := true;
  end else begin
   res := false;
  end;
  result := res;
end;


function Cadena.FormatearHora: string;
var i: word;
aux, hora, num: string;
begin
  i:=1; hora := '';
  while i<=Longitud do begin
   aux := NextWord(i);
   if ((aux='treinta') or (aux='cuarenta') or (aux='cincuenta')) and (NextWord(i)='y') then begin
    aux := aux + ' y ' + nextWord(i);
    ShowMessage(aux);
   end;
   if buscarPalabraEnVector(aux, num) then hora := hora + num + ':'
  end;
  result := hora;
end;


function Cadena.FormatearHora2: string;
var i: word;
aux, hora: string;
h, m, s: string;
begin
  i:=1; hora := '';
  while i<=Longitud do begin
   aux := NextWord(i);
   if aux[1] in Numeros then begin
     if StrToInt(aux)<10 then aux := '0'+aux;
     hora := hora + aux + ':';
   end;
  end;

  h:=hora[1]+hora[2];
  m:=hora[4]+hora[5];
  s:=hora[7]+hora[8];
  if StrToInt(s)>59 then begin
    s := IntToStr(StrToInt(s)-60);
    if StrToInt(s)<10 then s := '0'+s;
    m := IntToStr(StrToInt(m)+1);
  end;
  if StrToInt(m)>59 then begin
    m := IntToStr(StrToInt(m)-60);
    if StrToInt(m)<10 then m := '0'+m;
    h := IntToStr(StrToInt(h)+1);
  end;
  if StrToInt(h)>99 then hora := 'Eror: hora no valida'
  else hora := h+':'+m+':'+s;
  result := hora;
end;



function Cadena.TieneVocalRepetida(pal: string): boolean;
var voc: string;
i, j: word;
res: boolean;
begin
  voc := ''; i:=1; res:=false;
  while i<=Length(pal) do begin
    if pal[i] in vocales then voc := voc +pal[i];
    i:=i+1;
  end;
  voc := LowerCase(voc);
  for j:=1 to Length(voc) do begin
    i:=j+1;
    while (voc[j]<>voc[i]) and (i<=Length(voc)) do i:=i+1;
    if i<=Length(voc) then begin
      res := true;
      break;
    end;
  end;
  result := res;
end;


procedure Cadena.ElimPalConVocRepetidas;
var i: word;
newCad, pal: string;
begin
  newCad:=''; i:=1;
  while i<=Longitud do begin
   pal := nextWord(i);
   if not TieneVocalRepetida(pal) then newCad := newCad + pal + ' ';
  end;
  AddStr(newCad);
end;



function Cadena.SumarReales(cd: byte): real;
var i, j: Word;
pal: string;
aux: real;
begin
  i:=1;
  aux := 0;
  while i<=Longitud do begin
    pal := nextWord(i);
    j := Pos('.', pal);
    Delete(pal, j, 1);
    Insert(',', pal, j);
    aux := aux + StrToFloat(pal);
  end;
  aux := RoundTo(aux, cd*(-1));
  result := aux;
end;





end.




